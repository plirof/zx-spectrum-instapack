/**************************************************************************

����� � �����

**************************************************************************/

extern "C" int MouseX;
extern "C" int MouseY;
extern "C" int MouseK;

extern "C" unsigned MouseRateX;
extern "C" unsigned MouseRateY;

extern "C" unsigned char MouseKempX;
extern "C" unsigned char MouseKempY;

/* �஢�ઠ ������ � ���樠������ ��� */
extern "C" void MouseInit();

/* ��⠭���� ��ࢮ��砫쭮� ᪮��� */
extern "C" void MouseSetSpdDef();

/* ��⠭���� ����樨 ����� */
extern "C" void MouseSet(unsigned CoorX,unsigned CoorY);
#pragma aux MouseSet parm [eax][ebx]

/* ����祭�� ����� ��� */
extern "C" void MouseOn();

/* �몫�祭�� ����� ��� */
extern "C" void MouseOff();

/* ���� ��� */
extern "C" void Mouse();

extern "C" void MouseSetSpec();
