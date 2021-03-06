;----------------------------------------------------------------------------
; ����� ����樨 CMOS � RTC ��� ������ �.������� v3.0 ��� ���
;----------------------------------------------------------------------------

                ideal
                p386
                model use32 small
                assume cs:@code, ds:@data, es:@data
                include "..\emudata.inc"

;----------------------------------------------------------------------------
; �����
;----------------------------------------------------------------------------

DATASEG

LABEL _DSC BYTE
                db "CMOS emulator"      ;��������� ����� � ������
Preview         db " [direct]",0        ;� ��砫� ��ப� �㤥� ��⠢���� 0
TxtHelp         db "CMOS emulation module",10,"(c) Hexman/BYTEX, 2:469/32.7@Fidonet",0

;��ப� ��� ���䨣��樨
TxtCfgFile      db "CmosFileName=",0    ;��� 䠩��-cmos'�
TxtCfgRead      db "CmosWrite=",0       ;ࠧ���� ������?

;����� � ���䨣��樨
_CFG            CfgDat <OFFSET CfgTable,2>;�� ����� CfgTable ����� 2 �����.

CfgTable        CfgS <TTxt, OFFSET TxtCfgFile, OFFSET CfgFile>
                CfgS <TNum, OFFSET TxtCfgRead, OFFSET CfgRead>

CfgFile         CnTxt <OFFSET CmosFile, 20>
CfgRead         CnNum <OFFSET ReadOnly, 0, 1>

InpHelp         db 1,"CMOS file:",0
CmosFile        db "cmos.dat", 13 dup (0)

TxtTitle        db "CMOS Emulator",0            ;��������� ����
TxtRead         db 1,"Direct to 00h..0dh",0
TxtOk           db 1,"OK",0
TxtCancel       db 1,"Cancel",0

FileHandle      dw 0
ReadOnly        dd 0 ;1=����� ����� � 00...0d
InpAdr          dd 0 ;���� ������ � ��ப� �����
TblData         dd 0 ;���� ⠡���� ������ ������
PortPENT        db 0
WinPnt          dd 0 ;���� ������ ������ �������

;ᮤ�ন��� ���⮢
PortEFF7        db 0
PortDFF7        db 0
PortBFF7        db 0

CODESEG



;----------------------------------------------------------------------------
; ����㧪� � ���樠������ �����
;----------------------------------------------------------------------------

_INI:           mov     [TblData],eax   ;���� ⠡���� ������ ������
                ret

;���⠫���� �����

_INS:           mov     eax,[ReadOnly]  ;����� �����..
                test    eax,eax         ;��⠭�����?
                mov     al," "          ;�᫨ ��� - al = �஡��,
                jnz     ins_01
                xor     al,al           ;al = ����� ��ப�
ins_01:         mov     [Preview],al    ;��������� ���������

                mov     ax,3d02h        ;0=read,1=write,2=both
                mov     edx,offset CmosFile
                int     21h             ;���뢠�� 䠩� �� ������
                mov     [FileHandle],ax
                jc      ins_02          ;�訡��! ���� ᮧ���� 䠩�
                ret                     ;��室�� �� ��楤���

ins_02:         mov     ah,3ch
                xor     cx,cx
                mov     edx,offset CmosFile
                int     21h             ;ᮧ��� 䠩�
                mov     [FileHandle],ax

                mov     bx,ax
                xor     al,al
ins_03:         pusha
                mov     edx,OFFSET PortBFF7
                mov     ecx,1
                mov     ah,40h
                int     21h             ;�����뢠�� 256 ����
                popa
                dec     al
                jnz     ins_03
                ret

_UNI:           mov     ah,3eh
                mov     bx,[FileHandle]
                int     21h             ;����뢠�� 䠩�
                ret


;----------------------------------------------------------------------------
; ������ � ����
;----------------------------------------------------------------------------

_OUT:           cmp     bx,0EFF7h
                jnz     out_01
                mov     [PortEFF7],al   ;��࠭���� ���祭�� ����
                mov     ah,1
                jmp     out_xx

out_01:         cmp     bx,0dff7h
                jnz     out_02
                xor     ah,ah
                mov     bl,al
                mov     al,[PortEFF7]
                and     al,80h
                jz      out_xx
                mov     [PortDFF7],bl   ;��࠭���� ���祭�� ����
                mov     ah,1
                jmp     out_xx

out_02:         cmp     bx,0BFF7h
                jnz     out_xx
                xor     ah,ah
                mov     bl,al
                mov     al,[PortEFF7]
                and     al,80h
                jz      out_xx
                mov     [PortBFF7],bl           ;��࠭���� ���祭�� ����

                mov     al,[PortDFF7]
                cmp     al,0eh
                jnc     out_03
                mov     ebx,[ReadOnly]
                test    ebx,ebx
                jz      out_03

                out     70h,al  ;���� � CMOS
                mov     al,[PortBFF7]
                out     71h,al  ;��⠫� ���祭��
;               mov     ah,1

out_03:         mov     dl,[PortDFF7]
                call    MovPtr

                mov     edx,OFFSET PortBFF7
                mov     ecx,1
                mov     bx,[FileHandle]
                mov     ah,40h
                int     21h             ;�����뢠�� 1 ����

                mov     ah,1

out_xx:         ret



;----------------------------------------------------------------------------
; �⥭�� �� ����
;----------------------------------------------------------------------------

_IN_:           cmp     bx,0eff7h
                jnz     _IN_1
                mov     al,[PortEFF7]
                mov     ah,1
                ret

_IN_1:          cmp     bx,0dff7h
                jnz     _IN_2
                mov     al,[PortDFF7]
                mov     ah,1
                ret

_IN_2:          mov     ah,0
                cmp     bx,0bff7h
                jnz     out_xx
                mov     al,[PortEFF7]
                and     al,80h
                jz      out_xx

                mov     al,[PortDFF7]
                cmp     al,0eh
                jnc     _IN_21

                out     70h,al  ;���� � CMOS
                jmp     $+2     ;��㧠
                in      al,71h  ;��⠫� ���祭��
                mov     ah,1
                ret

_IN_21:         mov     dl,[PortDFF7]
                call    MovPtr                  ;�㦭�� ᬥ饭��
                mov     edx,OFFSET PortBFF7
                mov     ecx,1
                mov     bx,[FileHandle]
                mov     ah,3fh
                int     21h                     ;���뢠�� 1 ����

                jnc     _IN_22
                xor     ah,ah
                ret

_IN_22:         mov     al,[PortBFF7]
                mov     ah,1
                mov     bx,0BFF7h
                ret


;dl=position
MovPtr: mov     bx,[FileHandle]
        xor     cx,cx
        xor     dh,dh
        mov     ax,4200h
        int     21h
        ret

;��������������������������ķ
;� ���䨣��஢���� �����  �
;��������������������������ͼ

_SET:
        push    ebp

        ;�������� ����
        mov ebp,[TblData]
        MWinCreate ebp,27,7,26,10,31 ;Reg,X,Y,dX,dY,C
        mov [WinPnt],eax

        ;��⠭���� ��������� ����
        MWinTitle  ebp,eax,<OFFSET TxtTitle>,0F0h

        MWinHelp ebp,[WinPnt],48,7,<OFFSET TxtHelp>

        ;��⠭���� ������ "�⬥��"
        mov eax,[WinPnt]
        MSetButton ebp,eax,14,7,10,<OFFSET TxtCancel>,0

        ;��⠭���� ������ "OK"
        mov eax,[WinPnt]
        MSetButton ebp,eax,2,7,10,<OFFSET TxtOk>,1

        ;��⠭���� 䫠��� 'Read Only'
        MSetCheckBox ebp,[WinPnt],2,5,<OFFSET TxtRead>,<OFFSET ReadOnly>

        ;��⠭���� ��ப� input
        MSetInputTxt ebp,[WinPnt],2,2,22,<OFFSET InpHelp>,<OFFSET CfgFile>
        mov [InpAdr],eax

        ;��ࠡ�⪠ ����
        MWinExe ebp,[WinPnt]

        ;�஢�ઠ १���� ����
        test    eax,eax
        jz      @@Sxt

        ;���࠭���� १���� ����
        MWinResult ebp,[WinPnt]
@@Sxt:  mov eax,[WinPnt]
        call [ebp+EmuData.WinRemove]
        pop ebp
        ret

END
