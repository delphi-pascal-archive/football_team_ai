unit uShinnik;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  MMSystem;
  Const
    MaxTeam = 32;  {���������� ������}
    MaxPlayer = 63 ; {���������� �����������}
    {������ ���������� 1-glk 2-def 3-mid 4-forv}
    PlKind : array [1..MaxPlayer] of byte =
        (1,2,2,2,2,2,3,3,3,4,4,4,2,3,4,
         4,4,3,1,2,2,2,4,1,1,4,4,4,4,3,3,3,2,4,3,4,4,3,3,
         4,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3,4,4,4,4,4,4,4);

type
    z = record
          Kubok      : array[1..31,1..4] of byte; // ����� ������� � ��� ������ � �����
                       //  1 - 16  1/16 ������ (16 ���)
                       // 17 - 24  1/8  ������ (8 ���)
                       // 25 - 28  1/4  ������ (4 ����)
                       // 29 - 30  1/2  ������ (2 ����)
                       // 31 - ����� (1 ����)
                       // 1 - ����� �������-�������, 2 - ����� �������-�����
                       // 3 - ����, ������� ��������, 4 - ����, ������� ������
                       // ���� ����� ���������� � 6, 11, 16, 21 � 26 �����
          YearTeams  : array[1..MaxTeam,1..2] of Byte; // ����� ������� ������ � ����� ��������� � ���� ����
          Tur        : byte;                      { ����� ���� }
          SkillTeam  : array [1..MaxTeam,1..4] of Integer;{ ������� ���� ������� }
          MyPlayer   : array [1..15] of byte;     { ������ ����� ������� }
          Money      : integer;                   { ���������� ����� ����� }
          ItIsShinnik : Boolean; // ������ �� ������ ��� �� ������ �������
          My         : byte; // ����� ���� �������
          SkillPlayer: array [1..MaxPlayer] of byte;    { ������� ���� ���������� }
          Player     : array [1..MaxPlayer,1..3] of byte;
                             { 1-���������� ��������� ���
                               2-���������� ������� �����
                               3-���������� ������������ ��� ��-�� ������}
          TeamTactic : array [1..MaxTeam] of byte; // ������� ������
          TeamVs : array [2..MaxTeam,1..5] of byte; {����������}
                             { 1-����� ���� ���� : 0-�������, 1-����, 2-�_������, 3-���
                               2-������� ���� ����
                               3-����������� ���� ����
                               4-������� ���� � ������
                               5-����������� ���� � ������ }
          Year : Integer; // ������� ���
        end;
  TfmMainMenu = class(TForm)
  private
  public
     procedure PlayWav(Name :string; Flag:boolean);
  end;

var
  fmMainMenu: TfmMainMenu;
  a,b            : z;
  f              : file of z;
  AlienTeam      : byte;       {����� �������-���������}
  Play           : boolean;

  {=====}
  Stop           : boolean;
  Key            : Char;
  i,j,NumOfKey   : integer;
  GameAnimation : Boolean; // ���� �� �������� � ����

  ff : text;
  ErrorConfig : Boolean;
  procedure GetGameResult(Ht, NoHt: integer; var rH, NorH : integer);

implementation

{$R *.DFM}

procedure TfmMainMenu.PlayWav(Name :string; Flag:boolean);
begin
end;

procedure GetGameResult(Ht, NoHt: integer; var rH, NorH : integer);
var
  tempH, tempNoH : real;
begin
  // � ��������� ����������� ��������� ���� ����� ����� ���������
  tempH := 0;
  tempNoH := 0;
  rH := Round(TempH);
  NorH := Round(TempNoH);
end;

end.
