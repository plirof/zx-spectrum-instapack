/**************************************************************************

������� ��� ���㫥� ������ ZX-Spectrum

**************************************************************************/

#ifndef EMUDATA_INCLUDED
#define EMUDATA_INCLUDED

/* ��p�������� �⠭��p��� ⨯�� */
typedef unsigned long dword;
typedef unsigned short word;
typedef unsigned char byte;

/* ��।������ ����⠭� */
enum {
	AY_REG0,AY_REG1,AY_REG2,AY_REG3,AY_REG4,AY_REG5,AY_REG6,AY_REG7,
	AY_REG8,AY_REG9,AY_REGA,AY_REGB,AY_REGC,AY_REGD,
	AY_ON,AY_OFF,AY_RESET,AY_INIT,AY_ENVELOPE
};

enum {
	DC_READSTATUS,DC_WRITECOMMAND,DC_READTRACK,DC_WRITETRACK,
	DC_READSECTOR,DC_WRITESECTOR,DC_READDATA,DC_WRITEDATA,
	DC_READDRQINTRQ,DC_WRITESYSTEM,DC_INIT,DC_UNINIT,DC_RESET
};

enum Typ {TTxt,TTbl,TNum,TAdd,TAdO};

/* ����� ���䨣��樨 */
struct CnTxt {
	char *Dst; // ���� ��ப�
	unsigned Siz; // ���ᨬ��쭠� ����� ��ப�
};

struct CnTbl {
	unsigned *Dst; // ���� ���祭��
	const char **Val; // ���� ⠡����, ᮤ�ঠ騩 ���� ⥪�⮢�� ���祭��
	unsigned ValN; // ������⢮ ���祭��
};

struct CnNum {
	unsigned *Dst; // ���� ���祭��
	unsigned Min; // �������쭮� ���祭��
	unsigned Max; // ���ᨬ��쭮� ���祭��
};

struct CfgS {
	unsigned char Type; // ��� ������� ���䨣��樨
	const char *Txt; // ���� ��ப� ��� ��樨
	union {
		void *C;
		CnTxt *CTxt; // ���� ⠡���� ������ ��� ��ப�
		CnTbl *CTbl; // ���� ⠡���� ������ ��� ��४���⥫�
		CnNum *CNum; // ���� ⠡���� ������ ��� �᫠
	};
};

struct CfgDat {
	CfgS *Cfg; // ���� ⠡���� ������ ���䨣��樨
	unsigned Num; // ������⢮ ������⮢
};

/* ����� ������ */
struct DatCPU {
	dword RegPC; // ������� PC
	dword RegSP; // ������� SP
	dword RegIX; // ������� IX
	dword RegIY; // ������� IY
	union {dword RegAF;struct {byte RegF;byte RegA;};}; // �������� AF
	union {dword RegBC;struct {byte RegC;byte RegB;};}; // �������� BC
	union {dword RegDE;struct {byte RegE;byte RegD;};}; // �������� DE
	union {dword RegHL;struct {byte RegL;byte RegH;};}; // �������� HL
	union {dword RegAFa;struct {byte RegFa;byte RegAa;};}; // �������� AF'
	union {dword RegBCa;struct {byte RegCa;byte RegBa;};}; // �������� BC'
	union {dword RegDEa;struct {byte RegEa;byte RegDa;};}; // �������� DE'
	union {dword RegHLa;struct {byte RegLa;byte RegHa;};}; // �������� HL'
	byte RegR; // ������� R
	byte RegI; // ������� I
	word Halt; // ���� ������� HALT: 000h - ���; 001h - ����
	union {dword IFF;struct {byte IFF2;byte IFF1;};}; // �ਣ���� ���뢠���
	byte IM; // ����� ���뢠���
	byte reserved[3];
};

/* ����� AY */
struct DatAY {
	byte RegData[0x10]; // �������� AY
	dword RegIndex; // ��࠭�� ॣ���� AY
	dword EnvCurrent; // ����饥 ���祭�� ������饩
	int EnvDelta; // ��������� ���祭�� ������饩 ����� ���뢠��ﬨ
	byte EnvStatus; // ��������: 0-���������, 1-�����⠭��, 2-�뢠���
	byte reserved[3];
};

/* ����� ����஫��� ��᪮���� */
struct DatVG {
	byte DataIO; // ���祭��, ���஥ ��।����� �१ ����
	byte OperIO; // ������ ��
	byte RegStatus; // ������� ���ﭨ� ��
	byte RegCom; // ������� ������
	signed char RegTrack; // ������� ��஦��
	byte RegSect; // ������� ᥪ��
	byte RegData; // ������� ������
	byte System; // ���⥬�� ॣ���� ����஫��� ��᪮����
	signed char StepDirect; // ���ࠢ����� 蠣�: -01 - �����; 01 - ���।
	byte TrackReal[4]; // ��������� ������� ��᪮�����
	byte reserved[3];
};

/* ����� ������ */
#pragma aux _new parm [eax] value [eax]
#pragma aux _del parm [eax]
#pragma aux TraceProc parm [ebx]
#pragma aux WinCreate parm [eax][ebx][ecx][edx][esi] value [eax]
#pragma aux WinRemove parm [eax]
#pragma aux WinTitle parm [eax][ebx][ecx]
#pragma aux WinHelp parm [eax][ebx][ecx][edx]
#pragma aux WinText parm [eax][ebx][ecx][edx]
#pragma aux WinExe parm [eax] value [eax]
#pragma aux WinResult parm [eax]
#pragma aux SetButton parm [eax][ebx][ecx][edx][esi][edi] value [eax]
#pragma aux SetCheckBox parm [eax][ebx][ecx][edx][edi] value [eax]
#pragma aux SetRadio parm [eax][ebx][ecx][edx][edi] value [eax]
#pragma aux SetInputTxt parm [eax][ebx][ecx][esi][edx][edi] value [eax]
#pragma aux SetInputNum parm [eax][ebx][ecx][edx][edi] value [eax]
#pragma aux FileBox parm [eax][ebx][ecx]
#pragma aux MesBox parm [eax][ebx][edx]
#pragma aux VidByte parm [ebx] modify [eax ebx ebp]
#pragma aux ProcVG parm [ebx]
#pragma aux ProcIn parm [ebx] value [eax] modify [ebx]
#pragma aux ProcOut parm [ebx][eax] modify [eax ebx]

struct EmuData {
	DatCPU DataCPU; // ������ ������ CPU
	DatAY AY; // ������ ������ AY
	DatVG VG; // ������ ������ ����஫��� ��᪮����
	byte *SpecRAM; // RAM Spectrum
	byte *SpecROM; // ROM Spectrum
	byte *SpecSeg[0x4]; // ������ ᥣ���⮢ Spectrum
	dword TimerRate; // ���祭�� ���稪� ⠩���
	void (**OpCPU)(); // ���� ����ணࠬ� ��ࠡ�⪨ ������ ������
	void *(__pragma("_new") *MemAlloc)(unsigned); // �뤥����� �����
	void (__pragma("_del") *MemFree)(void*); // �᢮�������� �����
	void (*TextMode)(); // ����祭�� ⥪�⮢��� �����०���
	void (*SpecMode)(); // ����祭�� �����०��� Spectrum
	void (*SetSpec)(); // ����祭�� ����樨 Spectrum
	void (__pragma("TraceProc") *CPUTraceOn)(unsigned Id); // ����祭�� ����஢�� ������
	void (__pragma("TraceProc") *CPUTraceOff)(unsigned Id); // �몫�祭�� ����஢�� ������
	void *(__pragma("WinCreate") *WinCreate)(int X,int Y,int dX,int dY,unsigned char C); // �������� ����
	void (__pragma("WinRemove") *WinRemove)(void *Pnt); // �������� ����
	void (__pragma("WinTitle") *WinTitle)(void *Pnt,char *Txt,unsigned char C); // �������� ��������� ����
	void (__pragma("WinHelp") *WinHelp)(void *Pnt,int dX,int dY,char *Txt); // ��⠭���� ����� ��� ����
	void (__pragma("WinText") *WinText)(void *Pnt,int X,int Y,char *Txt); // ����� ⥪�� � ����
	int (__pragma("WinExe") *WinExe)(void *Pnt); // ����� ����䥩�
	void (__pragma("WinResult") *WinResult)(void *Pnt); // ��⠭���� १���⮢
	void *(__pragma("SetButton") *SetButton)(void *Pnt,int X,int Y,char *Txt,int dX,int Id); // ������
	void *(__pragma("SetCheckBox") *SetCheckBox)(void *Pnt,int X,int Y,char *Txt,unsigned *Dst); // ������
	void *(__pragma("SetRadio") *SetRadio)(void *Pnt,int X,int Y,char *Txt,CnTbl *Dst); // ��४���⥫�
	void *(__pragma("SetInputTxt") *SetInputTxt)(void *Pnt,int X,int Y,int dX,char *Txt,CnTxt *Dst); // ��ப� �����
	void *(__pragma("SetInputNum") *SetInputNum)(void *Pnt,int X,int Y,char *Txt,CnNum *Dst); // ��ப� ��� �᫠
	void (__pragma("FileBox") *FileBox)(void *Pnt,char *Mask,char *Path); // �롮� 䠩�� � ��ப� �����
	void (__pragma("MesBox") *MessageBox)(const unsigned char C,const char *Txt0,const char *Txt1); // ����饭��
	void (__pragma("VidByte") *VidByte)(unsigned Adr); // ������ � ����������� ZX-Spectrum
	byte *Keys; // ��������� ������
	byte Port7FFD; // ���祭�� ���� 7FFD
	unsigned IntWait:0x1; // �������� ���뢠���
	unsigned Trace:0x1; // ����஢��
	unsigned IntLast:0x1; // ��᫥���� �맮� _INT � �⮬ ���뢠���
	unsigned Lang:0x1; // ���
	byte PortFE; // ���祭�� ���� FE
	byte VerMinor; // �������� ������
	byte VerMajor; // ����� ������
	void (__pragma("ProcVG") *ProcVG)(byte); // �맮� ����樨 ����஫��� ��᪮����
	char *Disks[4]; // �����⥫� �� ����� 䠩��� ��ࠧ� ��᪠
	int ArgC; // ������⢮ ��ࠬ��஢ ��������� ��ப�
	char **ArgV; // ���� ���ᨢ� 㪠��⥫�� �� ��ࠬ���� ��������� ��ப�
	byte (__pragma("ProcIn") *PortIn)(unsigned); // �⥭�� �� ����
	void (__pragma("ProcOut") *PortOut)(unsigned,byte); // ������ � ����
	void (__pragma("VidByte") *VidByteAdv)(unsigned Adr); // ������ � ����������� ZX-Spectrum � �஢�મ� ���������
};

/* ��।������ ����ணࠬ�, ��뢠���� �����஬ */
#pragma aux ProgIni parm [eax][ebx] modify [eax ebx ecx edx esi edi]
#pragma aux ProgVG value [ah] modify [eax ebx ecx edx esi edi]
#pragma aux Progs modify [eax ebx ecx edx esi edi]

extern char _DSC[];
#pragma aux _DSC "_DSC"
extern struct CfgDat _CFG;
#pragma aux _CFG "_CFG"
extern void _SET();
#pragma aux (Progs) _SET "_SET"
extern void _INI(EmuData*,unsigned);
#pragma aux (ProgIni) _INI "_INI"
extern void _UNI();
#pragma aux (Progs) _UNI "_UNI"
extern void _ON_();
#pragma aux (Progs) _ON_ "_ON_"
extern void _OFF();
#pragma aux (Progs) _OFF "_OFF"
extern void _RES();
#pragma aux (Progs) _RES "_RES"
extern unsigned _CPU(unsigned);
#pragma aux _CPU "_CPU" parm [eax] value [eax]
extern unsigned char _INT(unsigned,unsigned,unsigned,unsigned);
#pragma aux _INT "_INT" parm [edi][esi][edx][ecx] value [ah]
extern void _ITP(unsigned,unsigned,unsigned,unsigned);
#pragma aux _ITP "_ITP" parm [edi][esi][edx][ecx]
extern unsigned _IN_(word);
#pragma aux _IN_ "_IN_" parm [ebx] value [eax] modify [ebx ecx edx esi edi]
extern unsigned char _INP(word,byte);
#pragma aux _INP "_INP" parm [ebx][eax] value [al] modify [ebx ecx edx esi edi]
extern unsigned char _OUT(word,byte);
#pragma aux _OUT "_OUT" parm [ebx][eax] value [ah] modify [eax ebx ecx edx esi edi]
extern void _OUP(word,byte);
#pragma aux _OUP "_OUP" parm [ebx][eax] modify [eax ebx ecx edx esi edi]
extern void _MEM();
#pragma aux (Progs) _MEM "_MEM"
extern unsigned char _AY_(unsigned,unsigned char);
#pragma aux _AY_ "_AY_" parm [ebx][eax] value [ah] modify [eax ebx ecx edx esi edi]
extern unsigned char _VG_();
#pragma aux (ProgVG) _VG_ "_VG_"
extern void _VGP();
#pragma aux (Progs) _VGP "_VGP"
extern void _F7_();
#pragma aux (Progs) _F7_ "_F7_"
extern void _F8_();
#pragma aux (Progs) _F8_ "_F8_"
extern void _F9_();
#pragma aux (Progs) _F9_ "_F9_"
extern void _F10();
#pragma aux (Progs) _F10 "_F10"
extern void _F11();
#pragma aux (Progs) _F11 "_F11"
extern void _F12();
#pragma aux (Progs) _F12 "_F12"
extern void _INS();
#pragma aux (Progs) _INS "_INS"

#endif
