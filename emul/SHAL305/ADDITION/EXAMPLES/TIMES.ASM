;*********************************************************************
;
;������ ⠪⮢
;
;*********************************************************************

;������ ⠪⮢ ������ � �� ���⨦���� ��������� �᫠ ⠪⮢
;��४��祭�� � ०�� ��������. �᫨ ��⠭������ ���� "�ய�� ���뢠���",
;� �⬥�� ���뢠���, �᫨ �� ���⨣��� �������� ������⢮ ⠪⮢.

IDEAL
P386
MODEL USE32 SMALL
ASSUME cs:@code,ds:@data,es:@data
INCLUDE "EMUDATA.INC"

DATASEG

;������� ⠪⮢. �᫨ ����� F0h, � ����஫�� ��� ��� ��䨪��� ������
;� ������, ����� �믮������� ������������ ������⢮ ⠪⮢.
TblTime	DB 004h,00Ah,007h,006h,004h,004h,007h,004h ;00h-07h
	DB 004h,00Bh,007h,006h,004h,004h,007h,004h ;08h-0Fh
	DB 0FFh,00Ah,007h,006h,004h,004h,007h,004h ;10h-17h
	DB 00Ch,00Bh,007h,006h,004h,004h,007h,004h ;18h-1Fh
	DB 0FFh,00Ah,010h,006h,004h,004h,007h,004h ;20h-27h
	DB 0FFh,00Bh,010h,006h,004h,004h,007h,004h ;28h-2Fh
	DB 0FFh,00Ah,00Dh,006h,00Bh,00Bh,00Ah,004h ;30h-37h
	DB 0FFh,00Bh,00Dh,006h,004h,004h,007h,004h ;38h-3Fh
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;40h-47h
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;48h-4Fh
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;50h-57h
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;58h-5Fh
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;60h-67h
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;68h-6Fh
	DB 007h,007h,007h,007h,007h,007h,004h,007h ;70h-77h
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;78h-7Fh
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;80h-87h
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;88h-8Fh
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;90h-97h
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;98h-9Fh
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;A0h-A7h
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;A8h-AFh
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;B0h-B7h
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;B8h-BFh
	DB 0FFh,00Ah,00Ah,00Ah,0FFh,00Bh,007h,00Bh ;C0h-C7h
	DB 0FFh,00Ah,00Ah,0F1h,0FFh,011h,007h,00Bh ;C8h-CFh
	DB 0FFh,00Ah,00Ah,00Bh,0FFh,00Bh,007h,00Bh ;D0h-D7h
	DB 0FFh,004h,00Ah,00Bh,0FFh,0F3h,007h,00Bh ;D8h-DFh
	DB 0FFh,00Ah,00Ah,013h,0FFh,00Bh,007h,00Bh ;E0h-E7h
	DB 0FFh,004h,00Ah,004h,0FFh,0F2h,007h,00Bh ;E8h-EFh
	DB 0FFh,00Ah,00Ah,004h,0FFh,00Bh,007h,00Bh ;F0h-F7h
	DB 0FFh,006h,00Ah,004h,0FFh,0F3h,007h,00Bh ;F8h-FFh
;CB
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;00h-07h
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;08h-0Fh
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;10h-17h
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;18h-1Fh
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;20h-27h
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;28h-2Fh
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;30h-37h
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;38h-3Fh
	DB 004h,004h,004h,004h,004h,004h,008h,004h ;40h-47h
	DB 004h,004h,004h,004h,004h,004h,008h,004h ;48h-4Fh
	DB 004h,004h,004h,004h,004h,004h,008h,004h ;50h-57h
	DB 004h,004h,004h,004h,004h,004h,008h,004h ;58h-5Fh
	DB 004h,004h,004h,004h,004h,004h,008h,004h ;60h-67h
	DB 004h,004h,004h,004h,004h,004h,008h,004h ;68h-6Fh
	DB 004h,004h,004h,004h,004h,004h,008h,004h ;70h-77h
	DB 004h,004h,004h,004h,004h,004h,008h,004h ;78h-7Fh
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;80h-87h
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;88h-8Fh
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;90h-97h
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;98h-9Fh
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;A0h-A7h
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;A8h-AFh
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;B0h-B7h
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;B8h-BFh
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;C0h-C7h
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;C8h-CFh
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;D0h-D7h
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;D8h-DFh
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;E0h-E7h
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;E8h-EFh
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;F0h-F7h
	DB 004h,004h,004h,004h,004h,004h,00Bh,004h ;F8h-FFh
;ED
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;00h-07h
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;08h-0Fh
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;10h-17h
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;18h-1Fh
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;20h-27h
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;28h-2Fh
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;30h-37h
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;38h-3Fh
	DB 008h,008h,00Bh,010h,004h,00Ah,004h,005h ;40h-47h
	DB 008h,008h,00Bh,010h,004h,00Ah,004h,005h ;48h-4Fh
	DB 008h,008h,00Bh,010h,004h,00Ah,004h,005h ;50h-57h
	DB 008h,008h,00Bh,010h,004h,00Ah,004h,005h ;58h-5Fh
	DB 008h,008h,00Bh,010h,004h,00Ah,004h,00Eh ;60h-67h
	DB 008h,008h,00Bh,010h,004h,00Ah,004h,00Eh ;68h-6Fh
	DB 008h,008h,00Bh,010h,004h,00Ah,004h,004h ;70h-77h
	DB 008h,008h,00Bh,010h,004h,00Ah,004h,004h ;78h-7Fh
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;80h-87h
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;88h-8Fh
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;90h-97h
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;98h-9Fh
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;A0h-A7h
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;A8h-AFh
	DB 0FFh,0FFh,0FFh,0FFh,004h,004h,004h,004h ;B0h-B7h
	DB 0FFh,0FFh,0FFh,0FFh,004h,004h,004h,004h ;B8h-BFh
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;C0h-C7h
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;C8h-CFh
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;D0h-D7h
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;D8h-DFh
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;E0h-E7h
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;E8h-EFh
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;F0h-F7h
	DB 004h,004h,004h,004h,004h,004h,004h,004h ;F8h-FFh
;DD � FD
	DB 004h,00Ah,007h,006h,004h,004h,007h,004h ;00h-07h
	DB 004h,00Bh,007h,006h,004h,004h,007h,004h ;08h-0Fh
	DB 0FFh,00Ah,007h,006h,004h,004h,007h,004h ;10h-17h
	DB 00Ch,00Bh,007h,006h,004h,004h,007h,004h ;18h-1Fh
	DB 0FFh,00Ah,010h,006h,004h,004h,007h,004h ;20h-27h
	DB 0FFh,00Bh,010h,006h,004h,004h,007h,004h ;28h-2Fh
	DB 0FFh,00Ah,00Dh,006h,013h,013h,00Ah,004h ;30h-37h
	DB 0FFh,00Bh,00Dh,006h,004h,004h,00Fh,004h ;38h-3Fh
	DB 004h,004h,004h,004h,004h,004h,00Fh,004h ;40h-47h
	DB 004h,004h,004h,004h,004h,004h,00Fh,004h ;48h-4Fh
	DB 004h,004h,004h,004h,004h,004h,00Fh,004h ;50h-57h
	DB 004h,004h,004h,004h,004h,004h,00Fh,004h ;58h-5Fh
	DB 004h,004h,004h,004h,004h,004h,00Fh,004h ;60h-67h
	DB 004h,004h,004h,004h,004h,004h,00Fh,004h ;68h-6Fh
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,004h,00Fh ;70h-77h
	DB 004h,004h,004h,004h,004h,004h,00Fh,004h ;78h-7Fh
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;80h-87h
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;88h-8Fh
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;90h-97h
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;98h-9Fh
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;A0h-A7h
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;A8h-AFh
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;B0h-B7h
	DB 004h,004h,004h,004h,004h,004h,007h,004h ;B8h-BFh
	DB 0FFh,00Ah,00Ah,00Ah,0FFh,00Bh,00Fh,00Bh ;C0h-C7h
	DB 0FFh,00Ah,00Ah,0F4h,0FFh,011h,00Fh,00Bh ;C8h-CFh
	DB 0FFh,00Ah,00Ah,00Bh,0FFh,00Bh,00Fh,00Bh ;D0h-D7h
	DB 0FFh,004h,00Ah,00Bh,0FFh,0F3h,00Fh,00Bh ;D8h-DFh
	DB 0FFh,00Ah,00Ah,013h,0FFh,00Bh,00Fh,00Bh ;E0h-E7h
	DB 0FFh,004h,00Ah,004h,0FFh,0F2h,00Fh,00Bh ;E8h-EFh
	DB 0FFh,00Ah,00Ah,004h,0FFh,00Bh,00Fh,00Bh ;F0h-F7h
	DB 0FFh,006h,00Ah,004h,0FFh,0F3h,00Fh,00Bh ;F8h-FFh
;DDCB � FDCB
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;00h-07h
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;08h-0Fh
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;10h-17h
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;18h-1Fh
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;20h-27h
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;28h-2Fh
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;30h-37h
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;38h-3Fh
	DB 00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch ;40h-47h
	DB 00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch ;48h-4Fh
	DB 00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch ;50h-57h
	DB 00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch ;58h-5Fh
	DB 00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch ;60h-67h
	DB 00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch ;68h-6Fh
	DB 00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch ;70h-77h
	DB 00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch,00Ch ;78h-7Fh
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;80h-87h
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;88h-8Fh
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;90h-97h
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;98h-9Fh
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;A0h-A7h
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;A8h-AFh
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;B0h-B7h
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;B8h-BFh
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;C0h-C7h
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;C8h-CFh
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;D0h-D7h
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;D8h-DFh
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;E0h-E7h
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;E8h-EFh
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;F0h-F7h
	DB 00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh,00Fh ;F8h-FFh

;������ ����ணࠬ�, �����뢠��� ⠪�� ����⠪⮢�� ������
TblProc	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD OFFSET P10,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD OFFSET P20,000,000,000,000,000,000,000
	DD OFFSET P28,000,000,000,000,000,000,000
	DD OFFSET P30,000,000,000,000,000,000,000
	DD OFFSET P38,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD 000,000,000,000,000,000,000,000
	DD OFFSET PB0,OFFSET PB1,OFFSET PB1,OFFSET PB3,000,000,000,000
	DD OFFSET PB0,OFFSET PB1,OFFSET PB1,OFFSET PB3,000,000,000,000
	DD OFFSET PC0,000,000,000,OFFSET PC4,000,000,000
	DD OFFSET PC8,000,000,000,OFFSET PCC,000,000,000
	DD OFFSET PD0,000,000,000,OFFSET PD4,000,000,000
	DD OFFSET PD8,000,000,000,OFFSET PDC,000,000,000
	DD OFFSET PE0,000,000,000,OFFSET PE4,000,000,000
	DD OFFSET PE8,000,000,000,OFFSET PEC,000,000,000
	DD OFFSET PF0,000,000,000,OFFSET PF4,000,000,000
	DD OFFSET PF8,000,000,000,OFFSET PFC,000,000,000

TimeNum		DD 69865 ;������⢮ ⠪⮢

LABEL _DSC BYTE ;���ᠭ��
	DB "������ ������⢠ ⠪⮢",0

;��ப� ��� ���䨣��樨
TxtCfgIntPass	DB "InterruptPass=",0
TxtCfgTimeNum	DB "TimeNumber=",0
TxtCfgOff	DB "Off",0
TxtCfgOn	DB "On",0

;����� ���䨣��樨
TblTCIntPass	DD OFFSET TxtCfgOff,OFFSET TxtCfgOn

CfgIntPass	CnTbl <OFFSET IntPass,OFFSET TblTCIntPass,2>
CfgTimeNum	CnNum <OFFSET TimeNum,20000,90000>

;������ ���䨣��樨
CfgTable	CfgS <TTbl,OFFSET TxtCfgIntPass,OFFSET CfgIntPass>
		CfgS <TNum,OFFSET TxtCfgTimeNum,OFFSET CfgTimeNum>

;����� � ���䨣��樨
_CFG		CfgDat <OFFSET CfgTable,2>

;��ப� ��� ����䥩�
TxtTitle	DB "�����",0
TxtInt		DB 1,"�ய�� ���뢠���",0
TxtNum		DB 1,"������⢮ ⠪⮢",0
TxtOk		DB 1,"OK",0
TxtCancel	DB "�",1,"⬥��",0

UDATASEG

IntPass		DD ? ;�ய�� ���뢠���
TblData		DD ? ;���� ⠡���� ������ ������
Id		DD ? ;�����䨪�樮�� �����
TimeCount	DD ? ;���稪 ⠪⮢

CODESEG

;���樠������ (��࠭���� ���� ������ ������, �����䨪�樮�����
;�����) � ����祭�� ����஢��
PROC _INI
	mov	[TblData],eax
	mov	[Id],ebx
	call	[eax+EmuData.CPUTraceOn]
	mov	[TimeCount],0
	ret
ENDP

;�몫�祭�� ����஢��
PROC _UNI
	mov	eax,[TblData]
	and	[eax+EmuData.Flags],NOT MASK IntWait
	mov	ebx,[Id]
	call	[eax+EmuData.CPUTraceOff]
	ret
ENDP

;��ࠡ�⪠ �맮�� �� ������ (������ ⠪⮢)
PROC _CPU
	push	eax ebx ecx edi
	mov	ebp,[TblData]
	xor	ecx,ecx
@@Cicle:
	mov	al,[TblTime+ecx+eax]
	cmp	al,0F0h
	jnc	@@Advanced
AddNum:	add	[TimeCount],eax
@@Exit:	mov	eax,[TimeNum]
	cmp	[TimeCount],eax
	jc	@@Ret
	or	[ebp+EmuData.Flags],MASK IntWait
@@Ret:	pop	edi ecx ebx eax
	ret
@@Advanced:
	sub	al,0F0h
	cmp	al,005h
	jc	@@Prefix
	mov	ebx,edi
	mov	eax,edi
	and	bh,03Fh
	shr	eax,0Eh
	add	ebx,[ebp+eax*4+EmuData.SpecSeg]
	mov	al,[ebx]
	jmp	[TblProc+eax*4]
@@Prefix:
	add	[TimeCount],004h
	inc	di
	mov	ch,al
	cmp	al,004h
	jz	@@NewByte
	inc	di
@@NewByte:
	mov	ebx,edi
	mov	eax,edi
	and	bh,03Fh
	shr	eax,0Eh
	add	ebx,[ebp+eax*4+EmuData.SpecSeg]
	mov	al,[ebx]
	jmp	@@Cicle
ENDP

MACRO DjnzIO IfEnd,IfNoEnd
	mov	al,IfEnd
	cmp	[ebp+EmuData.DataCPU.RegB],001h
	jz	AddNum
	mov	al,IfNoEnd
	jmp	AddNum
ENDM

P10:	DjnzIO 008h,00Dh
PB1:	DjnzIO 00Ch,011h

MACRO FlT IfOn,IfOff,Flag
	mov	al,IfOn
	test	dl,Flag
	jnz	AddNum
	mov	al,IfOff
	jmp	AddNum
ENDM

P20:	FlT 007h,00Ch,040h
P28:	FlT 00Ch,007h,040h
P30:	FlT 007h,00Ch,001h
P38:	FlT 00Ch,007h,001h
PC0:	FlT 005h,00Bh,040h
PC8:	FlT 00Bh,005h,040h
PD0:	FlT 005h,00Bh,001h
PD8:	FlT 00Bh,005h,001h
PE0:	FlT 005h,00Bh,004h
PE8:	FlT 00Bh,005h,004h
PF0:	FlT 005h,00Bh,080h
PF8:	FlT 00Bh,005h,080h
PC4:	FlT 00Ah,011h,040h
PCC:	FlT 011h,00Ah,040h
PD4:	FlT 00Ah,011h,001h
PDC:	FlT 011h,00Ah,001h
PE4:	FlT 00Ah,011h,004h
PEC:	FlT 011h,00Ah,004h
PF4:	FlT 00Ah,011h,080h
PFC:	FlT 011h,00Ah,080h

PB0:	mov	al,00Ch
	cmp	[ebp+EmuData.DataCPU.RegBC],00001h
	jz	AddNum
	mov	al,011h
	jmp	AddNum

PB3:	mov	al,00Ch
	cmp	[ebp+EmuData.DataCPU.RegBC],00001h
	jz	AddNum
	mov	ebx,[ebp+EmuData.DataCPU.RegHL]
	mov	ecx,ebx
	and	bh,03Fh
	shr	ecx,0Eh
	add	ebx,[ebp+ecx*4+EmuData.SpecSeg]
	cmp	dl,[ebx]
	jz	AddNum
	mov	al,011h
	jmp	AddNum

;��ࠡ�⪠ ���뢠���
PROC _INT
	mov	eax,[TblData]
	cmp	[IntPass],000h
	jz	@@IntOk
	test	[eax+EmuData.Flags],MASK IntWait
	jz	@@ExitNoInt
@@IntOk:and	[eax+EmuData.Flags],NOT MASK IntWait
	test	[eax+EmuData.Flags],MASK IntLast
	jz	@@ExitInt
	mov	[TimeCount],0
@@ExitInt:
	xor	ah,ah
	ret
@@ExitNoInt:
	mov	ah,001h
	ret
ENDP

;���䨣��஢����
UDATASEG
WinPnt		DD ? ;���� ������ ������ �������
CODESEG

PROC _SET
	push	ebp

;�������� ����
	mov	ebp,[TblData]
	MWinCreate ebp,016h,007h,023h,009h,01Fh
	mov	[WinPnt],eax ;���࠭���� ���� ������ ����

;��⠭���� ��������� ����
	MWinTitle ebp,eax,<OFFSET TxtTitle>,0F0h

;��⠭���� 䫠��� "�ய�� ���뢠���"
	MSetCheckBox ebp,[WinPnt],004h,004h,<OFFSET TxtInt>,<OFFSET IntPass>

;��⠭���� ��ப� ����� ���� "������⢮ ���뢠���"
	MSetInputNum ebp,[WinPnt],004h,002h,<OFFSET TxtNum>,<OFFSET CfgTimeNum>

;��⠭���� ������ "�⬥��"
	MSetButton ebp,[WinPnt],013h,006h,00Ch,<OFFSET TxtCancel>,0

;��⠭���� ������ "OK"
	MSetButton ebp,[WinPnt],004h,006h,00Ch,<OFFSET TxtOk>,1

;��ࠡ�⪠ ����
	MWinExe ebp,[WinPnt]

;�஢�ઠ १���� ����
	test	eax,eax
	jz	@@Exit

;���࠭���� ��⠭���� ����
	MWinResult ebp,[WinPnt]

;�������� ����
@@Exit:	MWinRemove ebp,[WinPnt]

	pop	ebp
	ret
ENDP

END
