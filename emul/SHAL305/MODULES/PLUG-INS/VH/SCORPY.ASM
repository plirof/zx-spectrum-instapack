;*********************************************************************
;
; �����প� ���७��� ����� ���௨���.
;
;*********************************************************************

IDEAL
P386
MODEL USE32 SMALL
ASSUME cs:@code,ds:@data,es:@data
INCLUDE "..\EMUDATA.INC"

DATASEG
LABEL _DSC BYTE
                db "Scorpion Support",0
hlpText         db "Scorpion Support Addition",10
                db "(c) Hexman/BYTEX, 2:469/32.7@Fidonet.",0

Mem             dd 1                        ;���祭�� ���䨣��樨
Installed       db 0

TblMem          db 00h,10h,10h              ;��᪨ ��� ����� ��⮢ ����

;��ப� ��� ���䨣��樨
TxtCfgMem       db "ScorpRAM=",0
TxtCfgPrn       db "ScorpPRN=",0
TxtCfgUse       db "ScorpUsePRN=",0
TxtCfg128       db "128K",0
TxtCfg256       db "256K",0
TxtCfg1024      db "1024K",0
TxtCfgUse0      db "0",0
TxtCfgUse1      db "1",0

PrntLog         db "scorpion.prn",0             ;"�ਭ��"
                db 8 dup (0)


;����� � ���䨣��樨
_CFG            CfgDat <OFFSET CfgTable,3> ;���� ⠡����, �-�� ������⮢

;������ ���䨣��樨
CfgTable        CfgS <TTbl,OFFSET TxtCfgMem,OFFSET CfgMem> ;⨯, ���� ������, ���� ⠡���� ������
                CfgS <TTxt,OFFSET TxtCfgPrn,OFFSET CfgPrn>
                CfgS <TNum,OFFSET TxtCfgUse,OFFSET CfgUse>

CfgMem          CnTbl <OFFSET Mem,OFFSET TblTCMem,3>
CfgPrn          CnTxt <OFFSET PrntLog, 20>
CfgUse          CnNum <OFFSET UsePrinter, 0, 1>

TblTCMem        dd OFFSET TxtCfg128, OFFSET TxtCfg256, OFFSET TxtCfg1024

;��ப� ��� ����䥩�
TxtTitle        db "Scorpion Support",0
TxtMem          db "RAM ",1,"size",0Ah,"128K",0Ah,"256K",0Ah,"1024K",0
TxtUse          db 1,"Use printer",0
TxtPrn          db 1,"Printer output:",0
TxtOk           db 1,"OK",0
TxtCancel       db 1,"Cancel",0

UDATASEG
TblData         dd ? ;���� ⠡���� ������ ������
PortSCORPION    db ? ;����� ���� 1FFD
PrntData        db ? ;����, ����ᠭ� � �ਭ��
FileHandle      dw ?
strPrinter      dd ?
UsePrinter      dd ?

CODESEG

;���樠������ 䠩�� �ਭ��
PROC _INS
        mov     al,[Installed]
        test    al,al
        jnz     @@IRet
        mov     al,1
        mov     [Installed],al

        ;����⨥ 䠩��
        mov     ah,3dh
        mov     al,1 ;write
        mov     edx,OFFSET PrntLog
        int     21h
        mov     [FileHandle],ax
        jc      @@ICrt

        mov     bx,ax
        mov     al,2
        mov     ah,42h
        mov     cx,0
        mov     dx,0
        int     21h ;���室 � ����� 䠩��

        jmp     @@IRet

@@ICrt: mov     ah,3ch
        mov     cx,00
        mov     edx,OFFSET PrntLog
        int     21h
        mov     [FileHandle],ax

        ;mov     ah,6ch
        ;mov     bx,1
        ;mov     cx,0   ;file attrs
        ;mov     dx,11h ;action
        ;mov     esi,OFFSET PrntLog


@@IRet: ret
ENDP

;Reset (��⠭���� �㫥���� ���祭�� ����)
PROC _RES
        mov     [PortSCORPION],000h
        ret
ENDP


;�⥭�� �� ���� BX
;��室: AH=0 - ���� �� ��ࠡ�⠭. AH<>0 - ���� ��ࠡ�⠭, AL=���祭��

PROC _IN_
        cmp     bx,0FFFEh                       ;���� ᪮௮�᪮�� ����
        jnz     @@Ret1
        push    ebx
        mov     ebx,[UsePrinter]
        test    ebx,ebx
        pop     ebx
        jz      @@Ret1
        mov     ah,0ffh                         ;<>0 - ���� ��ࠡ�⠭
        mov     al,000h                         ;��⠭�� ���祭��
@@Ret1: ret
ENDP


;������ � ����
PROC _OUT
        cmp     bx,0FFDDh                       ;���� ᪮௮�᪮�� ����
        jnz     _OUTM

        ;�஢�ઠ 䫠��� '�ਭ��..'
        push    ebx
        mov     ebx,[UsePrinter]
        test    ebx,ebx
        pop     ebx
        jz      _OUTM

        mov     [PrntData],al
        push    ebp
        mov     edx,OFFSET PrntData             ;adr
        mov     ecx,1                           ;len
        mov     bx,[FileHandle]                 ;handle
        mov     ah,40h
        int     21h
        pop     ebp
        mov     ah,1 ;���� ��ࠡ�⠭
        jp      @@Ret

_OUTM:  cmp     bx,01FFDh
        jnz     @@Ret
        mov     [PortSCORPION],al

;��⠭���� ᥣ���⮢ �����
_MEM:   push    ecx
        push    ebp
        push    ebx
        mov     ebx,[TblData]                   ;���� ������ ������
        mov     eax,[Mem]                       ;���祭�� ���䨣��樨

        ;᪮௮�᪠� ������
        mov     ah,[TblMem+eax]
        mov     al,[PortSCORPION]
        and     al,ah
        shr     al,1
        push    eax

        mov     eax,[Mem]
        cmp     eax,2
        jnz     @@Just

        ;���⠣����᪠� ������
        pop     eax
        mov     ah,[ebx+EmuData.Port7FFD]
        shr     ah,3
        and     ah,24
        or      al,ah
        push    eax

@@Just: pop     eax
        mov     ah,[ebx+EmuData.Port7FFD]       ;�⥭�� ᮤ�ন���� ����
        and     ah,007h                         ;�뤥����� ������ ��⮢
        or      al,ah
        xor     ah,ah
        shl     eax,0Eh                         ;����� ���� ��࠭���
        add     eax,[ebx+EmuData.SpecRAM]
        mov     [(ebx+EmuData.SpecSeg)+0Ch],eax ;��⠭���� ��࠭��� �����


;���饭�� +0000h - ROM 128,
;���饭�� +4000h - ROM 48,
;���饭�� +8000h - ROM TR-DOS,
;���饭�� +C000h - �� ���짮��⥫�᪮� ���.

        ;��⠭���� ���誨
        mov     ecx,[ebx+EmuData.SpecROM]

        mov     al,[PortSCORPION]
        and     al,2                ;��� 1 ��⠭�����
        jz      @@Real
        add     ecx,0C000h
        jmp     @@Rom

@@Real: mov     ah,[ebx+EmuData.Port7FFD]
        and     ah,16
        cmp     ah,0
        jz      @@Rom
        add     ecx,04000h

@@Rom:  mov     [ebx+EmuData.SpecSeg],ecx

        mov     al,[PortSCORPION]
        and     al,1
        jz      @@Fin
        mov     eax,[ebx+EmuData.SpecRAM]
        mov     [ebx+EmuData.SpecSeg],eax

@@Fin:  pop     ebx
        pop     ebp
        pop     ecx
        mov     ah,001h
@@Ret:  ret
ENDP

;�������������������������Ŀ
;� ���䨣��஢���� ����� �
;���������������������������

UDATASEG
WinPnt          DD ? ;���� ������ ������ �������
CODESEG

PROC _INI
        mov     [TblData],eax
        ret

_UNI:   mov     al,2
        mov     cx,0
        mov     dx,0
        mov     bx,[FileHandle]
        mov     ah,42h
        int     21h ;to the end of file
        jc      @@UniX
        or      ax,dx ;AX:DX = file size
        test    ax,ax
        jnz     @@UniX

        mov     ah,41h
        mov     edx,OFFSET PrntLog
        int     21h ;delete file

@@UniX: mov     ah,3eh
        mov     bx,[FileHandle]
        int     21h ;close file
        ret

_SET:   push    ebp

        ;�������� ����
        mov ebp,[TblData]
        MWinCreate ebp,24,7,31,10,01Fh
        mov [WinPnt],eax

        ;��⠭���� ��������� ����
        MWinTitle ebp,eax,<OFFSET TxtTitle>,0F0h

        ;��⠭���� �����
        MWinHelp ebp,[WinPnt],48,6,<OFFSET hlpText>

        ;��⠭���� ������ "�⬥��"
        MSetButton ebp,[WinPnt],17,7,00Ah,<OFFSET TxtCancel>,0

        ;��⠭���� ������ "OK"
        MSetButton ebp,[WinPnt],4,7,00Ah,<OFFSET TxtOk>,1

        ;��⠭���� ��ப� "�ਭ��"
        MSetInputTxt ebp,[WinPnt],14,4,15,<OFFSET TxtPrn>,<OFFSET CfgPrn>
        mov [strPrinter],eax

        ;��⠭���� 䫠��� '�ਭ��'
        MSetCheckBox ebp,[WinPnt],14,2,<OFFSET TxtUse>,<OFFSET UsePrinter>

        ;��⠭���� ��४���⥫� "��ꥬ"
        MSetRadio ebp,[WinPnt],2,2,<OFFSET TxtMem>,<OFFSET CfgMem>


        MWinExe ebp,[WinPnt]            ;��ࠡ�⪠ ����
        test    eax,eax                 ;�஢�ઠ १���� ����
        jz      @@Exit                  ;
        MWinResult ebp,[WinPnt]         ;���࠭���� १���� ����

;�������� ����
@@Exit: mov     eax,[WinPnt]
        call    [ebp+EmuData.WinRemove]
        pop     ebp
        ret

ENDP

END
