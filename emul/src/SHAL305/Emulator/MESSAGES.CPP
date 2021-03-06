#include "main.hpp"
#include "messages.hpp"

char TxtNul[]="";
char TxtROM[]="\1ROM";
char TxtBeep[]="\1Beeper";

#ifdef Rus

char ButtOK[]="\1��";
char PrMes[]="������ ZX-Spectrum  " Ver "\n(c) 1995-1999 ������� ������\n";
char ProgName[]="������ ZX-Spectrum";
char ButtStart[]="\1����";
char TxtConfig[]="\1���䨣����";
char TxtCfg[]="\1����ன��";
char TxtUtil[]="\1�⨫���";
char TxtUtilDiskToFile[]="����஢���� ��᪠ � 䠩�";
char TxtUtilFileToDisk[]="����⠭������� ��᪠ �� 䠩��";
char TxtCont[]="\1�த�������";
char TxtInfo[]="\1���ଠ��";
char TxtExit[]="�\1�室";
char TxtPath[]="\1���";
char TxtFileCh[]="�롮� 䠩��";
char TxtFileName[]="��� 䠩��";
char TxtDisks[]="��᪨";
char TxtSave[]="\1���࠭����";
char TxtOpSuc[]="������ �����襭� �ᯥ譮";
char ButtCanc[]="�\1⬥��";
char ButtYes[]="\1��";
char ButtNo[]="\1���";
char TxtWrPr[]="���� �����";
char TxtSure[]="�� 㢥७�?";
char TxtErPth[]="���� �� ������: ";
char TxtErDisk[]="�訡�� ��᪠";
char TxtErNoFile[]="��� 䠩��: ";
char TxtErFOpen[]="�訡�� �� ����⨨ 䠩��: ";
char TxtErFRead[]="�訡�� �� �⥭�� 䠩��: ";
char TxtErFSave[]="�訡�� �� ����� 䠩��: ";
char TxtErAdLib[]="�訡�� ���樠����樨 Ad Lib";
char TxtErSndBl[]="�訡�� ���樠����樨 Sound Blaster";
char TxtErNotCorF[]="�����४�� 䠩�: ";
char TxtErBadVer[]="�������ন������ ����� 䠩��: ";
char TxtErNoMem[]="�������筮 ����� ��� ����㧪�: ";
char TxtRetry[]="\1�������";
char TxtAbort[]="�\1⬥����";
char TxtIgnore[]="\1�����஢���";
char TxtJoyK[]="\1Kempston �����⨪";
char TxtJoyS[]="\1Sinclair �����⨪";
char TxtHlp[]="������";
char TxtHlpSw[]="\n�ᯮ�짮�����: SPECTRUM [-<����>...] [<��� A> <��� B>...]\n�ਬ��: SPECTRUM -S DISK.TRD\n��樨:\n H - ������\n S - ������ ����";
char TxtHlpMain[]="��� ��ࢮ�� ����᪠, � ⠪�� ��� ��᫥����� ����᪮� ������ ��� ��࠭���� ⥪��� ������ �ᯮ���� ������ \1\"����\".\1 ��� ����୮�� ����᪠ ������ � ��࠭����� ����㦥���� �ணࠬ�� � ⥪��� ������ ZX-Spectrum (�⮡� �த������ ࠡ��� � ������ �� ⮬ ����, ��� ��� �뫠 ��ࢠ��) �ᯮ���� ������ \1\"�த�������\"\1. �� ������ ������ ��᫥ ��ࢮ�� ����᪠ ������. ��������� ����஥� ������ �� ����� �ந����� ��᫥ ������ ������ \1\"���䨣����\"\1 � ᮮ⢥�����饩 ������ �������. "
	"�᫨ �� ����᪠�� ������ �����, �, ᪮॥ �ᥣ�, ��� ����������� ����� 䠩�� ROM � ��ࠧ� ��᪮� TR-DOS. "
	"����饥 ���祭�� ��᪮� TR-DOS ��ࠦ��� � �⮬ ���� (\1\"��� A\"\1, \1\"��� B\"\1...). "
	"� ������� ��᪮��� �⨫��, ����� ������ �ந�������� ������� \1\"�⨫���\"\1, ����� ᪮��஢��� ��� � 䠩� (ᮧ���� ��ࠧ ��᪠, � ����� ������ ࠡ�⠥� ��� � ��᪮� TR-DOS) � ����⠭����� ��� �� 䠩��. "
	"\1\"���㫨\"\1 - ������祭�� � ���䨣��஢���� �������⥫��� ���㫥�. "
	"\1\"���ଠ��\"\1 - ���ଠ�� � �ணࠬ��. ��� ��室� �� �ணࠬ�� �ᯮ���� ������ \1\"��室\"\1.";
char TxtHlpCfg[]="����� 䠩��� ��ࠧ� ��᪠ �� ����� ����� � ��ப�� \1\""
	"��� A\"\1, \1\"��� B\"\1... ��� �롮� 䠩�� �� ᯨ᪠ �ᯮ���� ������ \1\"�஫�����\"\1. "
	"\1\"���\"\1 - �롮� ��४�਩ ��� �ᯮ������� 䠩��� ��ࠧ� ��᪠, ROM � ���㫥�. "
	"\1\"ROM\"\1 - ����ன�� ROM: �롮� 䠩��� ROM � ��� � ���. \1\"���\"\1 - ��⠭���� ��㪮��� ���� ��� ����樨 ��몠�쭮�� ᨭ⥧��� AY, ����ன�� ��ࠬ��஢ ��㪮��� ����, ����祭�� � �몫�祭�� ����樨 Beeper �� PC-Speaker. \1\"��ࠢ�����\"\1 - ��⠭���� �����⨪� � ���, � ⠪�� �� ����ன��. \1\"�������\"\1 - ��⠭���� ᪮����� ��ࠬ��஢ ������. \1\"�������⥫쭮\"\1 - ����祭�� � �몫�祭�� �����࠭���� ���䨣��樨, �롮� ०��� �����, ����ன�� ���뢠��� � ���� ०����, �易���� � �ᮡ������ﬨ ����樨 Spectrum. �� ����� ������ \1\"���࠭����\"\1 �� ����� ��࠭��� ��⠭�������� ���䨣���� � 䠩�� \"SPECTRUM.INI\". ��᫥ ��१���᪠ ������ �㤥� ᪮�䨣��஢�� � ᮮ⢥��⢨� � �⨬ 䠩���.";
char TxtHlpUtil[]="������ ࠡ�⠥� � 䠩���� ��ࠧ� ��᪠ TR-DOS, ����� ����� ����ﬨ �ਣ������� ��᪮�. ��᪮�� �⨫��� �।�����祭� ��� ����஢���� ᮤ�ন���� ॠ�쭮�� ��᪠ TR-DOS � 䠩� � �ଠ� ������ � �����. \1\"��� � 䠩�\"\1 - ����஢���� ��᪠ � 䠩� (ᮧ����� 䠩�� ��ࠧ� ��᪠ �� �᭮�� ॠ�쭮�� ��᪠ TR-DOS). \1\"���� �� ���\"\1 - ����⠭������� ��᪠ �� 䠩��. � ������� ��ப� \1\"��� 䠩�� ��� ��᪠\"\1 ����� ����� ��� 䠩��, � ����� ���� ࠡ���� �⨫���. ��� �롮� 䠩�� �� ᯨ᪠ �ᯮ���� ������ \1\"�஫�����\"\1. �롮� ��᪮���� ��� ࠡ��� � ��᪠�� TR-DOS �����⢫���� � ������� ��४���⥫� \1\"��᪮��� ��� �⨫��\"\1. �᫨ ����祭� \1\"��ଠ�஢����\"\1 ��� �㤥� ���ଠ�஢�� ��। ����⠭��������.";
char TxtHlpPath[]="\1\"���� ��� ��᪮�\"\1 - ��४���, ����� �ᯮ������ �����஬ � ��᪮�묨 �⨫�⠬� ��� ���⮯�������� 䠩��� ��ࠧ� ��᪠. "
	"\1\"���� ��� ROM\"\1 - ��४���, � ���ன ��室���� 䠩�� ROM. "
	"\1\"���� ��� ���㫥�\"\1 - ��४���, � ���ன ��室���� �������� ���㫨 � �������. "
	"��� �롮� ⥪�饩 ��४�ਨ ������: \".\" (�窠).";
char TxtHlpROM[]="��� ࠡ��� ������ ����室��� 䠩�� ROM, ����� ����� ����ﬨ �ਣ������� ROM. � ������ �� ��ப: \1\"���� ROM 48\"\1, \1\"���� ROM 128\"\1 � \1\"���� ROM TR-DOS\"\1 ������ ��� 䠩��, ᮮ⢥�����饣� ������ ��ப�. ��� �롮� 䠩�� �� ᯨ᪠ �ᯮ���� ������ \1\"�஫�����\"\1.";
char TxtHlpSound[]="�᫨ 䫠��� \1\"Beeper\"\1 ��⠭�����, � ������ Beeper ����祭� (��� ���ந�������� �� PC-Speaker). "
	"��㪮��� ����� ��� ����樨 ��몠�쭮�� ᨭ⥧��� AY ����� �����, ��⠭���� ᮮ⢥�����騩 �㭪� ��४���⥫� \1\"��㪮��� ����\"\1. "
	"�᫨ ��࠭ Sound Blaster, � ����室��� ��⠭����� ��� ��ࠬ����: ���� ���� � �஬�����. "
	"\1\"���� SB\"\1 - ������ ���� Sound Blaster. "
	"\1\"�஬�����\"\1 - �஬����� ��஢��� ��㪠. "
	"��� �㦭� ��� ��������� �஬���� ��஢��� ��㪠 �� �⭮襭�� � �஬���� FM-ᨭ⥧� (����� �ਭ����� ���祭�� �� 0 �� 128, �� 㬮�砭�� - 80). "
	"�᫨ ��࠭ Ad Lib ��� Sound Blaster, � ��⠭����� ��ࠬ��� \1\"����� �������� Ad Lib\"\1 �� ����� 㬥����� ���� �६��� �� ���饭�� � ��㪮��� ����. "
	"��� ����� ���祭�� �⮣� ��ࠬ���, ⥬ ����॥ ࠡ�⠥� ������. "
	"\1\"��������\"\1 - ࠧ����� ᯮᮡ����� ������� ������饩 �� �६���. "
	"��� ��� �� ���祭��, ⥬ �筥� ��㫨����� ��������, �� ⥬ �������� ࠡ�⠥� ������.";
char TxtHlpInput[]="������ ����� �����প� ����������� �����⨪� � ���. �᫨ ��⠭����� 䫠��� \1\"Kempston �����⨪\"\1, � �����⨪ ������祭 ��� Kempston Interface I � II. �� ��⠭���� 䫠��� \1\"Sinclair �����⨪\"\1 �����⨪ ���訢����� ��� Sinclair �����⨪ (Interface II). ����� ⨯ ������祭��� ��� ����� ��⠭���� ��४���⥫� \1\"��� ���\"\1. � �㭪�� \1\"������� ��� �� X\"\1 � \1\"������� ��� �� Y\"\1 ����� ��⠭����� ᪮��� ��६�饭�� ��� �� ��� � ��業�� (��⠭���������� ����稭� ����� �ਭ����� ���祭�� �� 10 �� 200, �� 㬮�砭�� - 100). �⮡� �������� ���⠬� ����� � �ࠢ�� ������ ���, ��⠭���� 䫠��� \1\"����� ������ ���\"\1.";
char TxtHlpSpeed[]="� �⮩ ������ ������� ����� ����ந�� ᪮���� ��ࠬ���� ������. ��४���⥫� \1\"�������\"\1 ����� �ਭ����� ���祭��: \"��ଠ�쭠�\" - ᪮���� ������ � ᪮��� ॠ�쭮�� Spectrum; \"���ᨬ��쭠�\" - ���ᨬ��쭮 ��������� ᪮����; \"�᪮७���\" - �ਬ�୮ �� 1/8 ����॥ ��ଠ�쭮�; \"�����������\" - �ਬ�୮ �� 1/8 ��������� ��ଠ�쭮�; \"�롮�筠�\" - ᪮���� ������ �� ��⠭�������� ���祭�� \1\"��ࠬ���� ᪮���\"\1. \1\"�᭮����\"\1 - ��ࠬ���, �����騩 �� ᪮���� � 楫��: 祬 ����� ���祭�� �⮣� ��ࠬ���, ⥬ �������� ࠡ�⠥� ������. \1\"���ᥫ�\"\1 � \1\"��ਡ���\"\1 - ᪮���� ��ࠬ���� ��࠭�. ��� ����� �� ��ࠬ����, ⥬ ����॥ �ந�室�� ������ � ����������� (�� �⥭�� �� ���������� �� ������). �� ��⠭���� 䫠��� \1\"���ᨬ��쭠� ᪮���� � TR-DOS\"\1 ᪮���� �� ࠡ�� TR-DOS �㤥� ���ᨬ��쭮� ������ᨬ� �� ��⠭���� ��ࠬ��� \"�������\".";
char TxtHlpAdv[]=	"��ࠬ��� \1\"����� ���஢\"\1 ��।���� ����� ���஢ ����������� (�⠭���⭮� ��� ZX-Spectrum ���祭�� - 50 Hz). "
	"� ��樨 \1\"���筨� ���뢠���\"\1 �� ����� ����� ���ன�⢮, ���஥ �㤥� ��뢠�� ���஢�� ���뢠��� � ������. "
	"�᫨ �� ��ࠫ� \"���뢠��� VGA\", � ��� �㦭� ��⠭����� ����室���� ���祭�� ��ࠬ��� \1\"IRQ VGA\"\1. "
	"�� �롮� ���祭�� \"������\" ���� ���஢�� ���뢠��� ������ �� ���祭�� (�� 20 �� 100, �� 㬮�砭�� - 50) ��ࠬ��� \1\"����� ���뢠���\"\1. "
	"\1\"���⥫쭮��� ���뢠���\"\1 - ������⢮ ������ ������, � �祭�� ������ ��⨢�� ������ ���뢠��� (���祭�� �� 1 �� 100, �� 㬮�砭�� - 1). \1\"����� ������ �ଠ�஢����\"\1 - ������⢮ ����, ���஥ �ਭ����� ��93 �� ������� \"������ ��஦��\" (���祭�� �� 1 �� 16384, �� 㬮�砭�� - 1). "
	"��४���⥫� \1\"����� �����\"\1 ����� �� ०�� ������ ��᫥ ����᪠. "
	"������ \1\"����ﭭ�� ��⮢����� ��᪠\"\1 ��⠭�������� ०�� ࠡ��� ��93, �� ���஬ ࠡ�� � ��᪮� �ந�室�� ����॥, � ᮢ���⨬���� � �ਣ������ ����. "
	"\1\"�����஬�� ०��\"\1 - �୮-���� ०��. "
	"�� ����祭�� ��樨 \1\"�����࠭���� ���䨣��樨\"\1 ������ ��⮬���᪨ ��࠭�� ⥪���� ���䨣����.";
char TxtHlpDisks[]="� �⮩ ������ ������� �� ����� �������� 䠩�� ��ࠧ� ��᪠ TR-DOS ��� ࠡ��� � ���� � ������ � ��⠭����� ���祭�� ��ਡ�� \"���� �����\" ��� ��� �� ������祭��� 䠩���. ����� 䠩��� ����� ����� � ��ப�� \1\"��� A\"\1, \1\"��� B\"\1... ��� �롮� 䠩�� �� ᯨ᪠ �ᯮ���� ������ \1\"�஫�����\"\1. �⮡� ������� ��� ��� ���饭�� �� ����� ��� ࠧ�襭�� ��� �����, ��⠭���� ��� ᭨���, ᮮ⢥��⢥���, 䫠��� � �㭪� \1\"���� �����\"\1 ����⨢ ᮮ⢥�����饣� ��᪠. �᫨ ���� 䠩� ��ࠧ� ��᪠ ������祭 � ��᪮�쪨� ��᪮�����, � �����筮 ��⠭����� (����) 䫠��� ����⨢ ⮫쪮 ������ �� ��᪮�����, � ����� �� ������祭. �� ��������� ������ � ᨫ� �ࠧ� ��᫥ ������ � ������ ZX-Spectrum.";
char TxtThanks[]="�ᮡ�� �������୮���:\n������ �����ﭮ�� (AvE), ����� ����ᮢ�,\n��ࣥ� �ਭ�, ����ᠭ��� ����異�, � ⠪��\n�ᥬ, �� ��ࠧ�� ᢮� ��������� � ����砭��.\n\nE-mail:   nshal@usa.net\nFidoNet:  2:5020/378.40";
char TxtROM4[]="���� ROM \00148";
char TxtROM2[]="���� ROM \001128";
char TxtROMT[]="���� ROM \1TR-DOS";
char TxtROMU[]="���� ROM \1���짮��⥫�";
char TxtDskA[]="��� \1A";
char TxtDskB[]="��� \1B";
char TxtDskC[]="��� \1C";
char TxtDskD[]="��� \1D";
char TxtDskWrA[]="��� A";
char TxtDskWrB[]="��� B";
char TxtDskWrC[]="��� C";
char TxtDskWrD[]="��� D";
char TxtDskCpy[]="\1��� 䠩�� ��� ��᪠";
char TxtDrv[]="���\1����� ��� �⨫��\n��᪮��� A\n��᪮��� B";
char TxtBr[]="�஫�����";
char TxtDskPath[]="���� ��� \1��᪮�";
char TxtROMPath[]="���� ��� \1ROM";
char TxtAddPath[]="���� ��� \1���㫥�";
char TxtSound[]="\1���";
char TxtSndC[]="\1��㪮��� ����\n��� �����\nAd Lib\nSound Blaster";
char TxtSndDg[]="\1���஢�� ���";
char TxtSBAdr[]="\1���� SB\n210\n220\n230\n240\n250\n260\n280";
char TxtAdLibWS[]="��\1��� �������� Ad Lib";
char TxtSBVol[]="\1�஬�����";
char TxtEnvMul[]="���\1�����\nx1\nx2\nx4\nx8\nx16\nx32\nx64\nx128\nx256\nx512";
char TxtFormat[]="��\1ଠ�஢����";
char TxtInput[]="\1��ࠢ�����";
char TxtMTyp[]="��\1� ���\n��� ���\nKempston";
char TxtMRatX[]="������� ��� �� \1X";
char TxtMRatY[]="������� ��� �� \1Y";
char TxtMXChg[]="����� \1������ ���";
char TxtMLim[]="�\1�࠭�祭�� ��६�饭�� ���";
char TxtSpd[]="�\1������";
char TxtSpdCfg[]="\1�������\n��ଠ�쭠�\n���ᨬ��쭠�\n�᪮७���\n�����������\n�롮�筠�";
char TxtSpdPar[]="��ࠬ����:\n�᭮����  ���ᥫ�   ��ਡ���";
char TxtSpdMaxTR[]="\1���ᨬ��쭠� ᪮���� � TR-DOS";
char TxtAdv[]="\1�������⥫쭮";
char TxtFilToDsk[]="\1���� �� ���";
char TxtDskToFil[]="\1��� � 䠩�";
char TxtAutSave[]="\1�����࠭���� ���䨣��樨";
char TxtExitConf[]="\1���⢥ত���� ��室�";
char TxtDblKeyKemp[]="\1������ ������ � Kempston �����⨪";
char TxtResT[]="�\1���� �����\n128K\n48K\nTR-DOS";
char TxtIntS[]="\1���筨� ���뢠���\n������\n���뢠��� VGA\n����� 室 ���";
char TxtVerR[]="\1����� ���஢\n50 Hz\n55 Hz\n60 Hz\n75 Hz";
char TxtReady[]="����ﭭ�� \1��⮢����� ��᪠";
char TxtReadIndTr[]="�⥭�� \1����� ��஦��";
char TxtGrayMode[]="\1�����஬�� ०��";
char TxtIntLen[]="�\1��⥫쭮��� ���뢠���";
char TxtFrInt[]="����� �\1��뢠���";
char TxtFormLen[]="����� ������ \1�ଠ�஢����";
char TxtVidIRQ[]="\1IRQ VGA\n9\n10\n11\n12";
char TxtAddition[]="\1���㫨";
char TxtAdd[]="\1��������";
char TxtRemove[]="\1�����";
char TxtErLineMuch[]="���誮� ������� ��ப�: ";
char TxtErUnknownVal[]="�������⨬�� ���祭�� ��樨: ";
char TxtErValSmall[]="���誮� �����쪮� ���祭��: ";
char TxtErValLarge[]="���誮� ����讥 ���祭��: ";
char TxtErUnknownOpt[]="�������⨬�� ����: ";
char TxtErValMuch[]="���誮� ������� ���祭�� ��樨: ";
char TxtErNoAdd[]="��� ����� ��� ��ப�: ";
char TxtErSaveCfg[]="�訡�� �� ��࠭���� ���䨣��樨";
char TxtErVGA[]="�ணࠬ�� ����室��� VGA-ᮢ���⨬�� ���������";
char TxtErAllocMem[]="�訡�� �뤥����� �����";
char TxtErFreeMem[]="�訡�� �᢮�������� �����";

#else

char ButtOK[]="\1OK";
char PrMes[]="ZX-Spectrum Emulator  " Ver "\n(c) 1995-1999 Nikolay Shalaev\n";
char ProgName[]="ZX-Spectrum Emulator";
char ButtStart[]="\1Start";
char TxtConfig[]="\1Configuration";
char TxtCfg[]="\1Configure";
char TxtUtil[]="\1Utility";
char TxtUtilDiskToFile[]="Copy disk to file";
char TxtUtilFileToDisk[]="Restore disk from file";
char TxtCont[]="\1Continue";
char TxtInfo[]="\1Information";
char TxtExit[]="E\1xit";
char TxtPath[]="\1Paths";
char TxtFileCh[]="Change file";
char TxtFileName[]="Filename";
char TxtDisks[]="Disks";
char TxtSave[]="\1Save";
char TxtOpSuc[]="Operation completed successfully";////?
char ButtCanc[]="Ca\1ncel";
char ButtYes[]="\1Yes";
char ButtNo[]="\1No";
char TxtWrPr[]="Write protect";
char TxtSure[]="Are you sure?";
char TxtErPth[]="Path not found: ";
char TxtErDisk[]="Disk Error";
char TxtErNoFile[]="No file: ";
char TxtErFOpen[]="Can't open file: ";
char TxtErFRead[]="Can't read file: ";
char TxtErFSave[]="Can't write file: ";
char TxtErAdLib[]="Error: Ad Lib initialization";///?
char TxtErSndBl[]="Error: Sound Blaster initialization";
char TxtErNotCorF[]="Not correct file: ";
char TxtErBadVer[]="Not supported version of file: ";
char TxtErNoMem[]="Not enough memory for loading: ";
char TxtRetry[]="\1Retry";
char TxtAbort[]="\1Abort";
char TxtIgnore[]="\1Ignore";
char TxtJoyK[]="\1Kempston Joystick";
char TxtJoyS[]="\1Sinclair Joystick";
char TxtHlp[]="Help";
char TxtHlpSw[]="\nUsage: SPECTRUM [-<Option>...] [<Disk A> <Disk B>...]\nExample: SPECTRUM -S DISK.TRD\nOptions:\n H - help\n S - quick start";
char TxtHlpMain[]="";//////
char TxtHlpCfg[]="";///////
char TxtHlpUtil[]="";//////
char TxtHlpROM[]="";///////
char TxtHlpSound[]="";/////
char TxtHlpInput[]="";/////
char TxtHlpSpeed[]="";/////
char TxtHlpAdv[]="";///////
char TxtHlpDisks[]="";/////
char TxtHlpPath[]="";//////
char TxtThanks[]="Special Thanks to Alexey Emelyanov (AvE),\nAndrey Zamesov, Sergey Yurin, Alexander Miklyaev\nand everybody who sent his comments and suggestions about the emulator.\n\nE-mail:   nshal@usa.net\nFidoNet:  2:5020/378.40";////?
char TxtROM4[]="\00148 ROM";
char TxtROM2[]="\001128 ROM";
char TxtROMT[]="\1TR-DOS ROM";
char TxtROMU[]="\1User ROM";
char TxtDskA[]="Disk \1A";
char TxtDskB[]="Disk \1B";
char TxtDskC[]="Disk \1C";
char TxtDskD[]="Disk \1D";
char TxtDskWrA[]="Disk A";
char TxtDskWrB[]="Disk B";
char TxtDskWrC[]="Disk C";
char TxtDskWrD[]="Disk D";
char TxtDskCpy[]="File\1name for disk";
char TxtDrv[]="Dri\1ve for utility\nDrive A\nDrive B";
char TxtBr[]="Browse";
char TxtDskPath[]="Path for \1disks";
char TxtROMPath[]="Path for \1ROM";
char TxtAddPath[]="Path for \1modules";
char TxtSound[]="S\1ound";
char TxtSndC[]="Sound \1card\nNone\nAd Lib\nSound Blaster";
char TxtSndDg[]="\1Digital sound";
char TxtSBAdr[]="SB \1adress\n210\n220\n230\n240\n250\n260\n280";
char TxtAdLibWS[]="Ad Lib \1wait cycles";
char TxtSBVol[]="\1Volume";
char TxtEnvMul[]="\1Envelope\nx1\nx2\nx4\nx8\nx16\nx32\nx64\nx128\nx256\nx512";
char TxtFormat[]="Fo\1rmat";
char TxtInput[]="Con\1trol";
char TxtMTyp[]="Mouse \1type\nNo mouse\nKempston";
char TxtMRatX[]="Mouse Rate \1X";
char TxtMRatY[]="Mouse Rate \1Y";////
char TxtMXChg[]="Mouse \1buttons xchange";
char TxtMLim[]="Mouse move \1limit";
char TxtSpd[]="Sp\1eed";
char TxtSpdCfg[]="\1Speed\nNormal\nMaximal\nAccelerated\nReduced\nUser";
char TxtSpdPar[]="Parameters:\nMain      Pixel     Attributes";
char TxtSpdMaxTR[]="Ma\1ximal speed in TR-DOS";
char TxtAdv[]="Ad\1vanced";
char TxtFilToDsk[]="\1File to Disk";
char TxtDskToFil[]="\1Disk to File";
char TxtAutSave[]="\1Autosave Config";
char TxtDblKeyKemp[]="\1Double key and Kempston joystick";
char TxtExitConf[]="Exit \1confirm";
char TxtResT[]="Restart \1mode\n128K\n48K\nTR-DOS";
char TxtVidIRQ[]="VGA \1IRQ\n9\n10\n11\n12";
char TxtIntS[]="Int \1source\nTimer\nVGA interrupt\nVertical retrace";
char TxtVerR[]="\1Vertical rate\n50 Hz\n55 Hz\n60 Hz\n75 Hz";
char TxtReady[]="Constant Disk R\1eady";////?
char TxtReadIndTr[]="Read \1Track Number";
char TxtGrayMode[]="\1Gray mode";
char TxtIntLen[]="Interrupt \1Lenght";
char TxtFrInt[]="I\1nterrupt Frequency";
char TxtFormLen[]="\1Format Data Lenght";///?
char TxtAddition[]="\1Modules";
char TxtAdd[]="\1Add";
char TxtRemove[]="\1Remove";
char TxtErLineMuch[]="Configure line is too long: ";
char TxtErUnknownVal[]="Unknown value options: ";
char TxtErValSmall[]="Value is too small: ";
char TxtErValLarge[]="Value is too large: ";
char TxtErUnknownOpt[]="Unknown option: ";
char TxtErValMuch[]="Line size is too long: ";
char TxtErNoAdd[]="The module for line is absent: ";
char TxtErSaveCfg[]="Can't save configuration";
char TxtErVGA[]="Program requires VGA-compatible videocard";
char TxtErAllocMem[]="Allocating memory block error";
char TxtErFreeMem[]="Free memory block error";

#endif
