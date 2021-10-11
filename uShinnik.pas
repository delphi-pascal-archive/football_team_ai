unit uShinnik;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  MMSystem;
  Const
    MaxTeam = 32;  {Количество команд}
    MaxPlayer = 63 ; {Количество футболистов}
    {Амплуа футболиста 1-glk 2-def 3-mid 4-forv}
    PlKind : array [1..MaxPlayer] of byte =
        (1,2,2,2,2,2,3,3,3,4,4,4,2,3,4,
         4,4,3,1,2,2,2,4,1,1,4,4,4,4,3,3,3,2,4,3,4,4,3,3,
         4,1,1,1,2,2,2,2,2,2,3,3,3,3,3,3,3,4,4,4,4,4,4,4);

type
    z = record
          Kubok      : array[1..31,1..4] of byte; // Какие команды и как играют в кубок
                       //  1 - 16  1/16 финала (16 игр)
                       // 17 - 24  1/8  финала (8 игр)
                       // 25 - 28  1/4  финала (4 игры)
                       // 29 - 30  1/2  финала (2 игры)
                       // 31 - финал (1 игра)
                       // 1 - номер команды-хозяина, 2 - номер команды-гостя
                       // 3 - голы, забитые хозяином, 4 - голы, забитые гостем
                       // Игры кубка проводятся в 6, 11, 16, 21 и 26 турах
          YearTeams  : array[1..MaxTeam,1..2] of Byte; // Какие команды входят в какие дивизионы в этом году
          Tur        : byte;                      { номер тура }
          SkillTeam  : array [1..MaxTeam,1..4] of Integer;{ уровень игра команды }
          MyPlayer   : array [1..15] of byte;     { номера своих игроков }
          Money      : integer;                   { количество своих денег }
          ItIsShinnik : Boolean; // Играем за шинник или за другую команду
          My         : byte; // Номер моей команды
          SkillPlayer: array [1..MaxPlayer] of byte;    { уровень игра футболиста }
          Player     : array [1..MaxPlayer,1..3] of byte;
                             { 1-количество сыгранных игр
                               2-количество забитых голов
                               3-количество пропускаемых игр из-за травмы}
          TeamTactic : array [1..MaxTeam] of byte; // тактика команд
          TeamVs : array [2..MaxTeam,1..5] of byte; {статистика}
                             { 1-какая была игра : 0-никакая, 1-дома, 2-в_гостях, 3-обе
                               2-Забитые мячи дома
                               3-пропущенные мячи дома
                               4-Забитые мячи в гостях
                               5-пропущенные мячи в гостях }
          Year : Integer; // Текущий год
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
  AlienTeam      : byte;       {номер команды-соперницы}
  Play           : boolean;

  {=====}
  Stop           : boolean;
  Key            : Char;
  i,j,NumOfKey   : integer;
  GameAnimation : Boolean; // Есть ли анимация в игре

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
  // В процедуре вычисляется результат игры между двумя командами
  tempH := 0;
  tempNoH := 0;
  rH := Round(TempH);
  NorH := Round(TempNoH);
end;

end.
