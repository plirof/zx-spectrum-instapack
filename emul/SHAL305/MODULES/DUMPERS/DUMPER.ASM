;Begin

IDEAL
P386
MODEL USE32 SMALL
ASSUME cs:@code,ds:@data,es:@data
INCLUDE "..\EMUDATA.INC"

DATASEG
LABEL _DSC BYTE ;���ᠭ��
                db "128K RAM Dumper ["
KeyPreview      db "F7] ",0

;��ப� ��� ���䨣��樨
TxtCfgFile      db "DumpName=",0
TxtCfgKey       db "DumpKey=",0
TxtCfgF7        db "F7",0
TxtCfgF8        db "F8",0
TxtCfgF9        db "F9",0
TxtCfgF10       db "F10",0
TxtCfgF11       db "F11",0
TxtCfgF12       db "F12",0
TxtCfgKeys      db "F7] F8] F9] F10]F11]F12]"
TxtHelp         db 'RAM Dumper for Spectrum 128. Compiled on ',??date,'.',10,10,'Vova Hex, 2:469/32.7@Fidonet',0
MemAdr          dd 0
Key             dd ?
Hobeta          dd 0

;����� � ���䨣��樨
_CFG            CfgDat <OFFSET CfgTable,2>
CfgTable        CfgS <TTxt,OFFSET TxtCfgFile,OFFSET CfgScr>
                CfgS <TTbl,OFFSET TxtCfgKey,OFFSET CfgKey>
CfgKey          CnTbl <OFFSET Key,OFFSET TblTCKey,6>
TblTCKey        DD OFFSET TxtCfgF7,OFFSET TxtCfgF8,OFFSET TxtCfgF9
                DD OFFSET TxtCfgF10,OFFSET TxtCfgF11,OFFSET TxtCfgF12
CfgScr          CnTxt <OFFSET ParamSav,20>

InpHelp         db "File to dump in:",0
ParamSav        db "pages.bin           ",0

;��ப� ��� ����䥩�
TxtTitle        DB "128K RAM Dumper",0
TxtKey          DB 1,"Key",0Ah,"F7",0Ah,"F8",0Ah,"F9",0Ah,"F10",0Ah,"F11",0Ah,"F12",0
TxtOk           DB "OK",0
TxtCancel       DB "Cancel",0

UDATASEG
TblData         DD ? ;���� ⠡���� ������ ������
PortPENT        DB ?

CODESEG


;���樠������ (��࠭���� ���� ������ ������)
PROC _INI
        mov     [TblData],eax
        ret

_INS:   mov     ax,[WORD Key]
        mov     ebx,OFFSET TxtCfgKeys
        add     ax,ax
        add     ax,ax
        add     bx,ax
        mov     ecx,OFFSET KeyPreview
        mov     ah,4
_INS1:  mov     al,[ebx]
        mov     [ecx],al
        inc     ebx
        inc     ecx
        dec     ah
        jnz     _INS1
        ret
ENDP


;���䨣��஢����
UDATASEG
WinPnt          DD ? ;���� ������ ������ �������
CODESEG


;��ࠡ�⪠ ������
MACRO KeyProc KeyP,Num
PROC KeyP
        cmp     [Key],Num ;�஢�ઠ: �� �� ������ ��࠭� ?
        jz      Action
        ret
ENDP
ENDM
        KeyProc _F7_,000h
        KeyProc _F8_,001h
        KeyProc _F9_,002h
        KeyProc _F10,003h
        KeyProc _F11,004h
        KeyProc _F12,005h

PROC _SET
        push    ebp

        ;�������� ����
        mov ebp,[TblData]
        MWinCreate ebp,27,6,17,15,01Fh
        mov [WinPnt],eax

        ;��⠭���� ��������� ����
        MWinTitle  ebp,eax,<OFFSET TxtTitle>,0F0h

        MWinHelp ebp,[WinPnt],40,7,<OFFSET TxtHelp>

        ;��⠭���� ������ "�⬥��"
        mov eax,[WinPnt]
        MSetButton ebp,eax,3,12,10,<OFFSET TxtCancel>,0

        ;��⠭���� ������ "OK"
        mov eax,[WinPnt]
        MSetButton ebp,eax,3,10,10,<OFFSET TxtOk>,1

        MSetRadio ebp,[WinPnt],4,2,<OFFSET TxtKey>,<OFFSET CfgKey>

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
Action:
        push    ebp
        mov     ebp,[TblData]
        call    [ebp+EmuData.TextMode]

        ;�������� ����
        mov ebp,[TblData]
        MWinCreate ebp,24,5,26,8,31
        mov [WinPnt],eax

        ;��⠭���� ��������� ����
        MWinTitle  ebp,eax,<OFFSET TxtTitle>,0F0h

        ;��⠭���� ������ "�⬥��"
        MSetButton ebp,[WinPnt],13,5,10,<OFFSET TxtCancel>,0

        ;��⠭���� ������ "OK"
        MSetButton ebp,[WinPnt],2,5,10,<OFFSET TxtOk>,1

        ;��⠭���� ��ப� input
        MSetInputTxt ebp,[WinPnt],2,2,21,<OFFSET InpHelp>,<OFFSET CfgScr>
        mov [MemAdr],eax

        ;��ࠡ�⪠ ����
        MWinExe ebp,[WinPnt]

        ;�஢�ઠ १���� ����
        test    eax,eax
        jz      @@Exit

        ;���࠭���� १���� ����
        MWinResult ebp,[WinPnt]

@@Dump: mov     ah,3ch
        xor     cx,cx
        mov     edx,OFFSET ParamSav
        int     21h
;       push    ax
        mov     ebx,[TblData]
        mov     edx,[ebp+EmuData.SpecRAM]
        mov     ecx,20000h
;       pop     bx
;       push    bx
        mov     bx,ax
        mov     ah,40h
        int     21h

;       pop     bx
        mov     ah,3eh
        int     21h                             ;�����⨥ 䠩��

;�������� ����
@@Exit: mov     eax,[WinPnt]
        call    [ebp+EmuData.WinRemove]
        mov     ebp,[TblData]
        call    [ebp+EmuData.SpecMode]
        mov     ebp,[TblData]
        call    [ebp+EmuData.SetSpec]
        pop     ebp
        ret
ENDP

END
