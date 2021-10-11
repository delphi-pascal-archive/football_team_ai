unit Var_3D;
// В этом модуле находятся процедуры для обработки графики
interface
Uses
  Graphics; 

Const
  PH = 13;
// Значения для массивов
//    0 - прозрачный цвет
//    1 - цвет формы
//    2 - цвет тела
//    3 - белый
//    4 - черный
  ManG1 : array[1..ph,1..ph] of integer = // Вратарь 1
           ((0,0,0,2,2,2,0,0 ,0,0,0,0,0 ),
            (0,0,0,2,2,2,0,0 ,0,0,0,0,0 ),
            (0,1,1,1,2,2,0,0 ,0,0,0,0,0 ),
            (1,0,0,1,1,1,0,0 ,0,0,0,0,0 ),
            (1,0,0,1,1,1,1,0 ,0,0,0,0,0 ),
            (0,0,0,1,1,0,0,1 ,0,0,0,0,0 ),
            (0,0,0,1,1,0,0,1 ,0,0,0,0,0 ),
            (0,0,1,1,1,1,0,0 ,0,0,0,0,0 ),
            (0,1,1,0,1,1,0,0 ,0,0,0,0,0 ),
            (1,1,0,0,1,1,0,0 ,0,0,0,0,0 ),
            (0,1,1,0,1,1,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,1,1,0,0 ,0,0,0,0,0 ),
            (0,0,0,1,1,1,0,0 ,0,0,0,0,0 ));
  ManG2 : array[1..ph,1..ph] of integer = // Вратарь 2
           ((0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ));

  ManP1 : array[1..ph,1..ph] of integer = // Игрок 1
           ((0,0,0,2,2,2,0,0 ,0,0,0,0,0 ),
            (0,0,0,2,2,2,0,0 ,0,0,0,0,0 ),
            (0,0,0,2,2,2,0,0 ,0,0,0,0,0 ),
            (0,0,0,1,1,1,0,0 ,0,0,0,0,0 ),
            (0,0,1,1,1,1,1,0 ,0,0,0,0,0 ),
            (0,1,0,1,1,1,0,1 ,0,0,0,0,0 ),
            (1,0,0,1,1,1,0,1 ,0,0,0,0,0 ),
            (1,0,0,1,1,0,1,0 ,0,0,0,0,0 ),
            (0,0,0,1,1,1,0,0 ,0,0,0,0,0 ),
            (0,0,1,1,1,1,0,0 ,0,0,0,0,0 ),
            (0,0,1,0,0,0,1,1 ,0,0,0,0,0 ),
            (0,0,1,0,0,0,1,0 ,0,0,0,0,0 ),
            (1,1,0,0,0,1,0,0 ,0,0,0,0,0 ));

  ManP2 : array[1..ph,1..ph] of integer = // Игрок 2
           ((0,0,0,2,2,2,0,0 ,0,0,0,0,0 ),
            (0,0,0,2,2,2,0,0 ,0,0,0,0,0 ),
            (0,0,0,2,2,2,0,0 ,0,0,0,0,0 ),
            (0,0,0,1,1,1,0,0 ,0,0,0,0,0 ),
            (1,0,1,1,1,1,1,0 ,0,0,0,0,0 ),
            (1,1,0,1,1,1,0,1 ,0,0,0,0,0 ),
            (0,0,0,1,1,1,0,1 ,0,0,0,0,0 ),
            (0,0,0,1,1,0,0,0 ,1,0,0,0,0 ),
            (0,0,0,1,1,1,0,0 ,0,0,0,0,0 ),
            (0,1,1,1,1,1,1,1 ,0,0,0,0,0 ),
            (1,1,0,0,0,0,0,1 ,1,0,0,0,0 ),
            (1,1,0,0,0,0,0,0 ,1,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ));

  Ball1 : array[1..ph,1..ph] of integer = // Мяч
           ((0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,0,0,0,0,0,0 ,0,0,0,0,0 ),
            (0,0,3,3,0,0,0,0 ,0,0,0,0,0 ),
            (0,3,3,3,3,0,0,0 ,0,0,0,0,0 ),
            (0,3,3,3,3,0,0,0 ,0,0,0,0,0 ),
            (0,0,3,3,0,0,0,0 ,0,0,0,0,0 ));

  GS_None = 0;      // ничего интересного не происходит
  GS_penaltiR = 1;  // пенальти в правые ворота
  GS_penaltiL = 2;  // пенальти в левые ворота
  GS_shtraf1L = 3;  // 1-й вид штрафного в левую сторону
  GS_shtraf2L = 4;  // 2-й вид штрафного в левую сторону
  GS_shtraf1R = 5;  // 1-й вид штрафного в правую сторону
  GS_shtraf2R = 6;  // 2-й вид штрафного в правую сторону
  GS_changeOut = 7; // уход с поля игрока
  GS_changeIn = 8;  // выход на поле игрока
  GS_uglovoiR = 9;
  GS_uglovoiL = 10;
  GS_FreeL = 11;
  GS_FreeR = 12;
  GS_AllIn = 20;  // Все выходят на поле
  GS_AllOut = 21; // Все уходят с поля

Var
  tHome, tNoHome : integer; {номера команд}
  rHome, rNoHome : integer; {результат игры}
  manVisual : array[1..23, 1..6, 1..ph, 1..ph] of byte; // кадры для спрайтов
{          1)   1-23 Игроки и мячик  2-3) матрица для объекта}

// Совершенно новый массив с данными о игроках (03.01.2001 -> Евгений Шаров)
  ManF : array [1..23] of Record       // 1..22 - игроки, 23 - мячик
                X, Y : Integer;        // Координаты игрока
                Xold, Yold :  Integer; // Старые координаты игрока
                HaveBall : Boolean;    // Имеет ли объект мячик (да -> другая тактика)
                Vx, Vy : Real;         // Вектор движения игрока
                Tactic : Integer;      // Текущая тактика игрока
                T_Sub  : Integer;      // Подтип направления движения
                Tx, Ty : Integer;      // Координаты предположительной цели для объекта
                Count  : Integer;      // Используется как счетчик чего-то
                Inj_Count : Integer;   // Сколько раз игрока сбивали с ног
                Kick_Inj_Count : Integer; // Склько раз игрок сбивал кого-то
               end;

  CountTicks : Integer; // Необходим для определения действий во время игры;
  GameTimer : Integer;
  GameSituation : Integer; // Используется при пенальти и штрафных и заменах
  GameSubSituation : Integer; // дополнительная информация для ситуации на поле

  homePenalti,
  GuestPenalti,
  homePenaltiGoal,
  GuestPenaltiGoal,
  homeKickGoal,
  GuestKickGoal,
  HomeTimer,
  GuestTimer,
  HomeTactic,
  GuestTactic,
  HomeUglov,
  GuestUglov,
  HomeInj,
  GuestInj : Integer;

  OutPlayerNumber,
  InPlayerNumber : Integer;

  Spr : Integer; // Спрайты :  1 и 2

  BallVx,BallVy : Real; // необходимы для уменьшения скорости мяча

procedure StartInit; // Глобальная начальная инициализация игроков
procedure SecondInitPlayers; // Инициализация векторов скоростей игроков
procedure PrintP(index:integer); // Печать объекта на PaintBox
procedure PenaltiR; // Инициализация игроков для пенальти
procedure PenaltiL; // Инициализация игроков для пенальти
procedure Shtraf1L; // Инициализация игроков для штрафного
procedure Shtraf2L; // Инициализация игроков для штрафного
procedure Shtraf1R; // Инициализация игроков для штрафного
procedure Shtraf2R; // Инициализация игроков для штрафного
procedure FreeR;    // Свободный удар
procedure FreeL;    // Свободный удар
procedure UglovR;   // Угловой
procedure UglovL;   // Угловой

implementation
Uses
  uVisual2, uShinnik;

// Заполнение массива Спрайтов
// index-номер игрока  1-11 home,  12-22 alien,  23-ball
// ptype-тип игрока 1-В, 2-З, 3-П, 4-Н 5-ball
// ttype-изображение 0-прямое, 1-зеркальное
procedure Fill(index, ptype, ttype, zer: byte);
var
  il,jl, kl : integer; // local variables
begin
  if zer=1 then
    begin
      case ptype of
        1: begin
             if manF[index].T_Sub = 0 then
               begin
                 if ttype=0 then
                 begin // прямо
                   for kl:= 1 to 3 do
                     begin
                       for il:=1 to ph do for jl:=1 to ph do
                         manVisual[index,kl,il,jl]:=ManG1[il,jl];
                       for il:=1 to ph do for jl:=1 to ph do
                         manVisual[index,3+kl,il,jl]:=ManG1[il,jl];
                     end;
                 end
                 else
                 begin //зеркально
                   for kl:= 1 to 3 do
                     begin
                       for il:=1 to ph do for jl:=ph downto 1 do
                         manVisual[index,kl,il,jl]:=ManG1[il,ph+1-jl];
                       for il:=1 to ph do for jl:=ph downto 1 do
                         manVisual[index,3+kl,il,jl]:=ManG1[il,ph+1-jl];
                     end;
                 end
               end;
           end;
        2: begin
             if manF[index].T_Sub = 0 then
               begin
                 if ttype=0 then
                 begin // прямо
                   for kl:= 1 to 3 do
                     begin
                       for il:=1 to ph do for jl:=1 to ph do
                         manVisual[index,kl,il,jl]:=ManP1[il,jl];
                       for il:=1 to ph do for jl:=1 to ph do
                         manVisual[index,3+kl,il,jl]:=ManP2[il,jl];
                     end;
                 end
                 else
                 begin //зеркально
                   for kl:= 1 to 3 do
                     begin
                       for il:=1 to ph do for jl:=ph downto 1 do
                         manVisual[index,kl,il,jl]:=ManP1[il,ph+1-jl];
                       for il:=1 to ph do for jl:=ph downto 1 do
                         manVisual[index,3+kl,il,jl]:=ManP2[il,ph+1-jl];
                     end;
                 end
               end;
           end;
        3: begin
           end;
        4: begin
             for kl:= 1 to 6 do
               begin
                 for il:=1 to ph do for jl:=1 to ph do
                   manVisual[index,kl,il,jl]:=Ball1[il,jl];
               end;
           end;
        5: begin
             for kl:= 1 to 6 do
               begin
                 for il:=1 to ph do for jl:=1 to ph do
                   manVisual[index,kl,il,jl]:=Ball1[il,jl];
               end;
           end
      end;
    end
  else
    begin
      case ptype of
        1: begin
             if manF[index].T_Sub = 0 then
               begin
                 if ttype=0 then
                 begin // прямо
                   for kl:= 1 to 3 do
                     begin
                       for il:=1 to ph do for jl:=1 to ph do
                         manVisual[index,3+kl,il,jl]:=ManG1[il,jl];
                       for il:=1 to ph do for jl:=1 to ph do
                         manVisual[index,kl,il,jl]:=ManG1[il,jl];
                     end;
                 end
                 else
                 begin //зеркально
                   for kl:= 1 to 3 do
                     begin
                       for il:=1 to ph do for jl:=ph downto 1 do
                         manVisual[index,3+kl,il,jl]:=ManG1[il,ph+1-jl];
                       for il:=1 to ph do for jl:=ph downto 1 do
                         manVisual[index,kl,il,jl]:=ManG1[il,ph+1-jl];
                     end;
                 end
               end;
           end;
        2: begin
             if manF[index].T_Sub = 0 then
               begin
                 if ttype=0 then
                 begin // прямо
                   for kl:= 1 to 3 do
                     begin
                       for il:=1 to ph do for jl:=1 to ph do
                         manVisual[index,3+kl,il,jl]:=ManP1[il,jl];
                       for il:=1 to ph do for jl:=1 to ph do
                         manVisual[index,kl,il,jl]:=ManP2[il,jl];
                     end;
                 end
                 else
                 begin //зеркально
                   for kl:= 1 to 3 do
                     begin
                       for il:=1 to ph do for jl:=ph downto 1 do
                         manVisual[index,3+kl,il,jl]:=ManP1[il,ph+1-jl];
                       for il:=1 to ph do for jl:=ph downto 1 do
                         manVisual[index,kl,il,jl]:=ManP2[il,ph+1-jl];
                     end;
                 end
               end;
           end;
        3: begin
           end;
        4: begin
             for kl:= 1 to 6 do
               begin
                 for il:=1 to ph do for jl:=1 to ph do
                   manVisual[index,kl,il,jl]:=Ball1[il,jl];
               end;
           end;
        5: begin
             for kl:= 1 to 6 do
               begin
                 for il:=1 to ph do for jl:=1 to ph do
                   manVisual[index,kl,il,jl]:=Ball1[il,jl];
               end;
           end
      end;
    end;
end;


// Печать объекта на футбольном поле
procedure PrintP(index:integer);

var
  il,jl : integer;
  lcolor: TColor; // цвет формы
  xl,yl : integer;  // Координаты объекта
  LocSpr : integer;
begin
   if (GameSituation = gs_PenaltiR) or (GameSituation = gs_PenaltiL) or
      (GameSituation = GS_changeOut) or (GameSituation = GS_changeIn) or
      (GameSituation = GS_AllIn)
      then
        begin
          if index = GameSubSituation
            then locSpr := Spr
            else locSpr := 1;
        end
      else
        begin
          LocSpr := Spr;
        end;

  xl:= manF[index].X-1;
  yl:= manF[index].Y-1;
  if index in [1..11] then lcolor := clBlue
                      else lColor := clRed;
  for il:= 1 to ph do
    for jl:=1 to ph do
      begin
        if manVisual[index,LocSpr,il,jl]=1 then
          Form10.pb.Canvas.Pixels[xl+jl,yl+il]:=lcolor;
        if manVisual[index,LocSpr,il,jl]=2 then // Тело
          Form10.pb.Canvas.Pixels[xl+jl,yl+il]:=$a5ffff;
        if manVisual[index,LocSpr,il,jl]=3 then // Белый
          Form10.pb.Canvas.Pixels[xl+jl,yl+il]:={clWhite}clSilver;
        if manVisual[index,LocSpr,il,jl]=4 then // Черный
          Form10.pb.Canvas.Pixels[xl+jl,yl+il]:=clBlack;
      end;
end;

procedure PenaltiR;
var
  i : Integer;
begin
  // HOME TEAM
  ManF[ 1].X := 40;    ManF[ 1].Y := 55;
  ManF[ 2].X := 90;    ManF[ 2].Y := 15;
  ManF[ 3].X := 70;    ManF[ 3].Y := 54;
  ManF[ 4].X := 65;    ManF[ 4].Y := 75;
  ManF[ 5].X :=120;    ManF[ 5].Y := 35;
  ManF[ 6].X :=115;    ManF[ 6].Y := 55;
  ManF[ 7].X :=140;    ManF[ 7].Y := 95;
  ManF[ 8].X :=170;    ManF[ 8].Y := 75;
  ManF[ 9].X :=200;    ManF[ 9].Y :=115;
  ManF[10].X :=250;    ManF[10].Y := 25;
  ManF[11].X :=310;    ManF[11].Y := 85;
  // ALIEN TEAM
  ManF[13].X :=400;    ManF[13].Y := 15;
  ManF[14].X :=380;    ManF[14].Y := 37;
  ManF[15].X :=396;    ManF[15].Y := 85;
  ManF[16].X :=350;    ManF[16].Y := 75;
  ManF[17].X :=358;    ManF[17].Y :=105;
  ManF[18].X :=201;    ManF[18].Y := 55;
  ManF[19].X :=285;    ManF[19].Y := 35;
  ManF[20].X :=135;    ManF[20].Y := 88;
  ManF[21].X :=200;    ManF[21].Y := 85;
  ManF[22].X :=165;    ManF[22].Y := 33;

// BALL
  ManF[23].X :=397;    ManF[23].Y := 55;
// Вносим некоторую случайность в расстановке игроков по полю
  Randomize;
  For i := 2 to 11 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(10)) - Round(Random(9));
      ManF[i].Y := ManF[i].Y + Round(Random(10)) - Round(Random(9));
    end;
  For i := 13 to 22 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(10)) - Round(Random(9));
      ManF[i].Y := ManF[i].Y + Round(Random(10)) - Round(Random(9));
    end;
  ManF[1].X := ManF[1].X + Round(Random(5)) - Round(Random(4));
  ManF[1].Y := ManF[1].Y + Round(Random(10)) - Round(Random(9));
  ManF[12].X := ManF[12].X + Round(Random(5)) - Round(Random(4));
  ManF[12].Y := ManF[12].Y + Round(Random(10)) - Round(Random(9));

  For i:= 1 to 23 do
    begin
      ManF[i].XOld := ManF[i].X;
      ManF[i].YOld := ManF[i].Y;
      manF[i].HaveBall := False;
    end;

  // Ставим человечка для пробития пенальти
  ManF[GameSubSituation].X := ManF[23].X - 20;
  ManF[GameSubSituation].Y := ManF[23].Y;
  ManF[GameSubSituation].Vx := 2 + Random(1);
  ManF[GameSubSituation].Vy := 0;

  ManF[23].Vx := 0;
  ManF[23].Vy := 0;

end;

procedure PenaltiL;
var
  i : Integer;
begin
  ManF[ 2].X := 90;    ManF[ 2].Y := 15;
  ManF[ 3].X := 75;    ManF[ 3].Y := 33;
  ManF[ 4].X := 65;    ManF[ 4].Y := 79;
  ManF[ 5].X :=120;    ManF[ 5].Y := 35;
  ManF[ 6].X :=115;    ManF[ 6].Y := 55;
  ManF[ 7].X :=140;    ManF[ 7].Y := 95;
  ManF[ 8].X :=170;    ManF[ 8].Y := 75;
  ManF[ 9].X :=200;    ManF[ 9].Y :=115;
  ManF[10].X :=250;    ManF[10].Y := 25;
  ManF[11].X :=360;    ManF[11].Y := 35;

  // ALIEN TEAM
  ManF[12].X :=415;    ManF[12].Y := 55;
  ManF[13].X :=400;    ManF[13].Y := 15;
  ManF[14].X :=380;    ManF[14].Y := 55;
  ManF[15].X :=396;    ManF[15].Y := 75;
  ManF[16].X :=350;    ManF[16].Y := 75;
  ManF[17].X :=358;    ManF[17].Y :=105;
  ManF[18].X :=201;    ManF[18].Y := 55;
  ManF[19].X :=285;    ManF[19].Y := 35;
  ManF[20].X :=135;    ManF[20].Y := 88;
  ManF[21].X :=200;    ManF[21].Y := 85;
  ManF[22].X :=165;    ManF[22].Y := 33;

// BALL
  ManF[23].X :=64;     ManF[23].Y := 55;
// Вносим некоторую случайность в расстановке игроков по полю
  Randomize;
  For i := 2 to 11 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(15)) - Round(Random(15));
      ManF[i].Y := ManF[i].Y + Round(Random(15)) - Round(Random(15));
    end;
  For i := 13 to 22 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(15)) - Round(Random(15));
      ManF[i].Y := ManF[i].Y + Round(Random(15)) - Round(Random(15));
    end;
  ManF[1].X := ManF[1].X + Round(Random(5)) - Round(Random(4));
  ManF[1].Y := ManF[1].Y + Round(Random(10)) - Round(Random(9));
  ManF[12].X := ManF[12].X + Round(Random(5)) - Round(Random(4));
  ManF[12].Y := ManF[12].Y + Round(Random(10)) - Round(Random(9));

  For i:= 1 to 23 do
    begin
      ManF[i].XOld := ManF[i].X;
      ManF[i].YOld := ManF[i].Y;
      manF[i].HaveBall := False;
    end;

  // Ставим человечка для пробития пенальти
  ManF[GameSubSituation].X := ManF[23].X + 20;
  ManF[GameSubSituation].Y := ManF[23].Y;
  ManF[GameSubSituation].Vx := -2 - Random(1);
  ManF[GameSubSituation].Vy := 0;

  ManF[23].Vx := 0;
  ManF[23].Vy := 0;
end;

procedure Shtraf1L; // Инициализация игроков для штрафного со стенкой
var
  xt, yt : integer; // временное ранение координат нарушения правил
  i : integer;
begin
  if ManF[GameSubSituation].X<30 then ManF[GameSubSituation].X:=30;
  xt := ManF[GameSubSituation].X;
  yt := ManF[GameSubSituation].Y;
  // HOME TEAM
  ManF[ 1].X := 40;    ManF[ 1].Y := 55;
  ManF[ 2].X := 90;    ManF[ 2].Y := 15;
  ManF[ 3].X := 70;    ManF[ 3].Y := 54;
  ManF[ 4].X := 65;    ManF[ 4].Y := 75;
  ManF[ 5].X :=120;    ManF[ 5].Y := 35;
  ManF[ 6].X :=115;    ManF[ 6].Y := 55;
  ManF[ 7].X :=140;    ManF[ 7].Y := 95;
  ManF[ 8].X :=170;    ManF[ 8].Y := 75;
  ManF[ 9].X :=200;    ManF[ 9].Y :=115;
  ManF[10].X :=250;    ManF[10].Y := 25;
  ManF[11].X :=360;    ManF[11].Y := 35;

  // ALIEN TEAM
  ManF[12].X :=415;    ManF[12].Y := 55;
  ManF[13].X :=400;    ManF[13].Y := 15;
  ManF[14].X :=380;    ManF[14].Y := 55;
  ManF[15].X :=396;    ManF[15].Y := 75;
  ManF[16].X :=350;    ManF[16].Y := 75;
  ManF[17].X :=358;    ManF[17].Y :=105;
  ManF[18].X :=201;    ManF[18].Y := 55;
  ManF[19].X :=285;    ManF[19].Y := 35;
  ManF[20].X :=135;    ManF[20].Y := 88;
  ManF[21].X :=200;    ManF[21].Y := 85;
  ManF[22].X :=165;    ManF[22].Y := 33;

// BALL
  ManF[23].X :=xt - 1;
  ManF[23].Y := yt;
// Вносим некоторую случайность в расстановке игроков по полю
  Randomize;
  For i := 2 to 11 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(15)) - Round(Random(15));
      ManF[i].Y := ManF[i].Y + Round(Random(15)) - Round(Random(15));
    end;
  For i := 13 to 22 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(15)) - Round(Random(15));
      ManF[i].Y := ManF[i].Y + Round(Random(15)) - Round(Random(15));
    end;
  ManF[1].X := ManF[1].X + Round(Random(5)) - Round(Random(4));
  ManF[1].Y := ManF[1].Y + Round(Random(10)) - Round(Random(9));
  ManF[12].X := ManF[12].X + Round(Random(5)) - Round(Random(4));
  ManF[12].Y := ManF[12].Y + Round(Random(10)) - Round(Random(9));

  For i:= 1 to 23 do
    begin
      ManF[i].XOld := ManF[i].X;
      ManF[i].YOld := ManF[i].Y;
      manF[i].HaveBall := False;
    end;

  ManF[23].Vx := 0;
  ManF[23].Vy := 0;

  ManF[GameSubSituation].X := xt;
  ManF[GameSubSituation].Y := yt;
  ManF[GameSubSituation].Vx := -2 - random(2);
  ManF[GameSubSituation].Vy := 0;

  // отводим игроков от мяча на некоторое расстояние
  for i:=2 to 11 do
    begin
      if (ManF[i].X > (xt - 6)) and (manF[i].X < xt) then ManF[i].X := ManF[i].X - 10 else
      if (ManF[i].X >= xt) and (manF[i].X < (xt + 6)) then ManF[i].X := ManF[i].X + 10;
      if (ManF[i].Y > (yt - 6)) and (manF[i].Y < yt) then ManF[i].Y := ManF[i].Y - 10 else
      if (ManF[i].Y >= yt) and (manF[i].Y < (yt + 6)) then ManF[i].Y := ManF[i].Y + 10;
    end;
  for i:=13 to 22 do
    begin
      if i <> GameSubSituation then
        begin
          if (ManF[i].X > (xt - 6)) and (manF[i].X < xt) then ManF[i].X := ManF[i].X - 10 else
          if (ManF[i].X >= xt) and (manF[i].X < (xt + 6)) then ManF[i].X := ManF[i].X + 10;
          if (ManF[i].Y > (yt - 6)) and (manF[i].Y < yt) then ManF[i].Y := ManF[i].Y - 10 else
          if (ManF[i].Y >= yt) and (manF[i].Y < (yt + 6)) then ManF[i].Y := ManF[i].Y + 10;
        end;
    end;

  // эта секция необходима для расстановки стенки перед мячем
  if ManF[23].Y < 40 then
    begin
      for i := 9 to 11 do
        begin
          if ManF[23].X > 40
            then ManF[i].X := ManF[23].X - 30
            else ManF[i].X := ManF[23].X - 10;
          ManF[i].Y := ManF[23].Y + (13 - i)*6
        end;
    end else
  if ManF[23].Y > 70 then
    begin
      for i := 9 to 11 do
        begin
          if ManF[23].X > 40
            then ManF[i].X := ManF[23].X - 30
            else ManF[i].X := ManF[23].X - 10;
          ManF[i].Y := ManF[23].Y + (7 - i)*6
        end;
    end else
    begin
      for i := 9 to 11 do
        begin
          if ManF[23].X > 40
            then ManF[i].X := ManF[23].X - 30
            else ManF[i].X := ManF[23].X - 10;
          ManF[i].Y := ManF[23].Y + (10 - i)*6
        end;
    end;
end;

procedure Shtraf2L; // Инициализация игроков для штрафного без стенки
var
  xt, yt : integer; // временное ранение координат нарушения правил
  i : integer;
begin
  if ManF[GameSubSituation].X<30 then ManF[GameSubSituation].X:=30;
  xt := ManF[GameSubSituation].X;
  yt := ManF[GameSubSituation].Y;
  // HOME TEAM
  ManF[ 1].X := 40;    ManF[ 1].Y := 55;
  ManF[ 2].X := 90;    ManF[ 2].Y := 15;
  ManF[ 3].X := 70;    ManF[ 3].Y := 54;
  ManF[ 4].X := 65;    ManF[ 4].Y := 75;
  ManF[ 5].X :=120;    ManF[ 5].Y := 35;
  ManF[ 6].X :=115;    ManF[ 6].Y := 55;
  ManF[ 7].X :=140;    ManF[ 7].Y := 95;
  ManF[ 8].X :=170;    ManF[ 8].Y := 75;
  ManF[ 9].X :=200;    ManF[ 9].Y :=115;
  ManF[10].X :=250;    ManF[10].Y := 25;
  ManF[11].X :=360;    ManF[11].Y := 35;

  // ALIEN TEAM
  ManF[12].X :=415;    ManF[12].Y := 55;
  ManF[13].X :=400;    ManF[13].Y := 15;
  ManF[14].X :=380;    ManF[14].Y := 55;
  ManF[15].X :=396;    ManF[15].Y := 75;
  ManF[16].X :=350;    ManF[16].Y := 75;
  ManF[17].X :=358;    ManF[17].Y :=105;
  ManF[18].X :=201;    ManF[18].Y := 55;
  ManF[19].X :=285;    ManF[19].Y := 35;
  ManF[20].X :=135;    ManF[20].Y := 88;
  ManF[21].X :=200;    ManF[21].Y := 85;
  ManF[22].X :=165;    ManF[22].Y := 33;

// BALL
  ManF[23].X :=xt - 1;
  ManF[23].Y := yt;
// Вносим некоторую случайность в расстановке игроков по полю
  Randomize;
  For i := 2 to 11 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(15)) - Round(Random(15));
      ManF[i].Y := ManF[i].Y + Round(Random(15)) - Round(Random(15));
    end;
  For i := 13 to 22 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(15)) - Round(Random(15));
      ManF[i].Y := ManF[i].Y + Round(Random(15)) - Round(Random(15));
    end;
  ManF[1].X := ManF[1].X + Round(Random(5)) - Round(Random(4));
  ManF[1].Y := ManF[1].Y + Round(Random(10)) - Round(Random(9));
  ManF[12].X := ManF[12].X + Round(Random(5)) - Round(Random(4));
  ManF[12].Y := ManF[12].Y + Round(Random(10)) - Round(Random(9));

  For i:= 1 to 23 do
    begin
      ManF[i].XOld := ManF[i].X;
      ManF[i].YOld := ManF[i].Y;
      manF[i].HaveBall := False;
    end;

  ManF[23].Vx := 0;
  ManF[23].Vy := 0;

  ManF[GameSubSituation].X := xt;
  ManF[GameSubSituation].Y := yt;
  ManF[GameSubSituation].Vx := -2 - random(2);
  ManF[GameSubSituation].Vy := 0;

  // отводим игроков от мяча на некоторое расстояние
  for i:=2 to 11 do
    begin
      if (ManF[i].X > (xt - 6)) and (manF[i].X < xt) then ManF[i].X := ManF[i].X - 10 else
      if (ManF[i].X >= xt) and (manF[i].X < (xt + 6)) then ManF[i].X := ManF[i].X + 10;
      if (ManF[i].Y > (yt - 6)) and (manF[i].Y < yt) then ManF[i].Y := ManF[i].Y - 10 else
      if (ManF[i].Y >= yt) and (manF[i].Y < (yt + 6)) then ManF[i].Y := ManF[i].Y + 10;
    end;
  for i:=13 to 22 do
    begin
      if i <> GameSubSituation then
        begin
          if (ManF[i].X > (xt - 6)) and (manF[i].X < xt) then ManF[i].X := ManF[i].X - 10 else
          if (ManF[i].X >= xt) and (manF[i].X < (xt + 6)) then ManF[i].X := ManF[i].X + 10;
          if (ManF[i].Y > (yt - 6)) and (manF[i].Y < yt) then ManF[i].Y := ManF[i].Y - 10 else
          if (ManF[i].Y >= yt) and (manF[i].Y < (yt + 6)) then ManF[i].Y := ManF[i].Y + 10;
        end;
    end;
end;

procedure Shtraf1R; // Инициализация игроков для штрафного со стенкой
var
  xt, yt : integer; // временное ранение координат нарушения правил
  i : integer;
begin
  if ManF[GameSubSituation].X>410 then ManF[GameSubSituation].X:=400;
  xt := ManF[GameSubSituation].X;
  yt := ManF[GameSubSituation].Y;
  // HOME TEAM
  ManF[ 1].X := 40;    ManF[ 1].Y := 55;
  ManF[ 2].X := 90;    ManF[ 2].Y := 15;
  ManF[ 3].X := 70;    ManF[ 3].Y := 54;
  ManF[ 4].X := 65;    ManF[ 4].Y := 75;
  ManF[ 5].X :=120;    ManF[ 5].Y := 35;
  ManF[ 6].X :=115;    ManF[ 6].Y := 55;
  ManF[ 7].X :=140;    ManF[ 7].Y := 95;
  ManF[ 8].X :=170;    ManF[ 8].Y := 75;
  ManF[ 9].X :=200;    ManF[ 9].Y :=115;
  ManF[10].X :=250;    ManF[10].Y := 25;
  ManF[11].X :=360;    ManF[11].Y := 35;

  // ALIEN TEAM
  ManF[12].X :=415;    ManF[12].Y := 55;
  ManF[13].X :=400;    ManF[13].Y := 15;
  ManF[14].X :=380;    ManF[14].Y := 55;
  ManF[15].X :=396;    ManF[15].Y := 75;
  ManF[16].X :=350;    ManF[16].Y := 75;
  ManF[17].X :=358;    ManF[17].Y :=105;
  ManF[18].X :=201;    ManF[18].Y := 55;
  ManF[19].X :=285;    ManF[19].Y := 35;
  ManF[20].X :=135;    ManF[20].Y := 88;
  ManF[21].X :=200;    ManF[21].Y := 85;
  ManF[22].X :=165;    ManF[22].Y := 33;

// BALL
  ManF[23].X :=xt + 4;
  ManF[23].Y := yt;
// Вносим некоторую случайность в расстановке игроков по полю
  Randomize;
  For i := 2 to 11 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(15)) - Round(Random(15));
      ManF[i].Y := ManF[i].Y + Round(Random(15)) - Round(Random(15));
    end;
  For i := 13 to 22 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(15)) - Round(Random(15));
      ManF[i].Y := ManF[i].Y + Round(Random(15)) - Round(Random(15));
    end;
  ManF[1].X := ManF[1].X + Round(Random(5)) - Round(Random(4));
  ManF[1].Y := ManF[1].Y + Round(Random(10)) - Round(Random(9));
  ManF[12].X := ManF[12].X + Round(Random(5)) - Round(Random(4));
  ManF[12].Y := ManF[12].Y + Round(Random(10)) - Round(Random(9));

  For i:= 1 to 23 do
    begin
      ManF[i].XOld := ManF[i].X;
      ManF[i].YOld := ManF[i].Y;
      manF[i].HaveBall := False;
    end;

  ManF[23].Vx := 0;
  ManF[23].Vy := 0;

  ManF[GameSubSituation].X := xt;
  ManF[GameSubSituation].Y := yt;
  ManF[GameSubSituation].Vx := +2 + random(2);
  ManF[GameSubSituation].Vy := 0;

  // отводим игроков от мяча на некоторое расстояние
  for i:=13 to 22 do
    begin
      if (ManF[i].X > (xt - 6)) and (manF[i].X < xt) then ManF[i].X := ManF[i].X - 10 else
      if (ManF[i].X >= xt) and (manF[i].X < (xt + 6)) then ManF[i].X := ManF[i].X + 10;
      if (ManF[i].Y > (yt - 6)) and (manF[i].Y < yt) then ManF[i].Y := ManF[i].Y - 10 else
      if (ManF[i].Y >= yt) and (manF[i].Y < (yt + 6)) then ManF[i].Y := ManF[i].Y + 10;
    end;
  for i:=2 to 11 do
    begin
      if i <> GameSubSituation then
        begin
          if (ManF[i].X > (xt - 6)) and (manF[i].X < xt) then ManF[i].X := ManF[i].X - 10 else
          if (ManF[i].X >= xt) and (manF[i].X < (xt + 6)) then ManF[i].X := ManF[i].X + 10;
          if (ManF[i].Y > (yt - 6)) and (manF[i].Y < yt) then ManF[i].Y := ManF[i].Y - 10 else
          if (ManF[i].Y >= yt) and (manF[i].Y < (yt + 6)) then ManF[i].Y := ManF[i].Y + 10;
        end;
    end;

  // эта секция необходима для расстановки стенки перед мячем
  if ManF[23].Y < 40 then
    begin
      for i := 20 to 22 do
        begin
          if ManF[23].X < 390
            then ManF[i].X := ManF[23].X + 30
            else ManF[i].X := ManF[23].X + 10;
          ManF[i].Y := ManF[23].Y + (24 - i)*6
        end;
    end else
  if ManF[23].Y > 70 then
    begin
      for i := 20 to 22 do
        begin
          if ManF[23].X < 390
            then ManF[i].X := ManF[23].X + 30
            else ManF[i].X := ManF[23].X + 10;
          ManF[i].Y := ManF[23].Y + (18 - i)*6
        end;
    end else
    begin
      for i := 20 to 22 do
        begin
          if ManF[23].X <390
            then ManF[i].X := ManF[23].X + 30
            else ManF[i].X := ManF[23].X + 10;
          ManF[i].Y := ManF[23].Y + (21 - i)*6
        end;
    end;

end;

procedure Shtraf2R; // Инициализация игроков для штрафного без стенки
var
  xt, yt : integer; // временное ранение координат нарушения правил
  i : integer;
begin
  if ManF[GameSubSituation].X>410 then ManF[GameSubSituation].X:=400;
  xt := ManF[GameSubSituation].X;
  yt := ManF[GameSubSituation].Y;
  // HOME TEAM
  ManF[ 1].X := 40;    ManF[ 1].Y := 55;
  ManF[ 2].X := 90;    ManF[ 2].Y := 15;
  ManF[ 3].X := 70;    ManF[ 3].Y := 54;
  ManF[ 4].X := 65;    ManF[ 4].Y := 75;
  ManF[ 5].X :=120;    ManF[ 5].Y := 35;
  ManF[ 6].X :=115;    ManF[ 6].Y := 55;
  ManF[ 7].X :=140;    ManF[ 7].Y := 95;
  ManF[ 8].X :=170;    ManF[ 8].Y := 75;
  ManF[ 9].X :=200;    ManF[ 9].Y :=115;
  ManF[10].X :=250;    ManF[10].Y := 25;
  ManF[11].X :=360;    ManF[11].Y := 35;

  // ALIEN TEAM
  ManF[12].X :=415;    ManF[12].Y := 55;
  ManF[13].X :=400;    ManF[13].Y := 15;
  ManF[14].X :=380;    ManF[14].Y := 55;
  ManF[15].X :=396;    ManF[15].Y := 75;
  ManF[16].X :=350;    ManF[16].Y := 75;
  ManF[17].X :=358;    ManF[17].Y :=105;
  ManF[18].X :=201;    ManF[18].Y := 55;
  ManF[19].X :=285;    ManF[19].Y := 35;
  ManF[20].X :=135;    ManF[20].Y := 88;
  ManF[21].X :=200;    ManF[21].Y := 85;
  ManF[22].X :=165;    ManF[22].Y := 33;

// BALL
  ManF[23].X :=xt + 4;
  ManF[23].Y := yt;
// Вносим некоторую случайность в расстановке игроков по полю
  Randomize;
  For i := 2 to 11 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(15)) - Round(Random(15));
      ManF[i].Y := ManF[i].Y + Round(Random(15)) - Round(Random(15));
    end;
  For i := 13 to 22 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(15)) - Round(Random(15));
      ManF[i].Y := ManF[i].Y + Round(Random(15)) - Round(Random(15));
    end;
  ManF[1].X := ManF[1].X + Round(Random(5)) - Round(Random(4));
  ManF[1].Y := ManF[1].Y + Round(Random(10)) - Round(Random(9));
  ManF[12].X := ManF[12].X + Round(Random(5)) - Round(Random(4));
  ManF[12].Y := ManF[12].Y + Round(Random(10)) - Round(Random(9));

  For i:= 1 to 23 do
    begin
      ManF[i].XOld := ManF[i].X;
      ManF[i].YOld := ManF[i].Y;
      manF[i].HaveBall := False;
    end;

  ManF[23].Vx := 0;
  ManF[23].Vy := 0;

  ManF[GameSubSituation].X := xt;
  ManF[GameSubSituation].Y := yt;
  ManF[GameSubSituation].Vx := +2 + random(2);
  ManF[GameSubSituation].Vy := 0;

  // отводим игроков от мяча на некоторое расстояние
  for i:=13 to 22 do
    begin
      if (ManF[i].X > (xt - 6)) and (manF[i].X < xt) then ManF[i].X := ManF[i].X - 10 else
      if (ManF[i].X >= xt) and (manF[i].X < (xt + 6)) then ManF[i].X := ManF[i].X + 10;
      if (ManF[i].Y > (yt - 6)) and (manF[i].Y < yt) then ManF[i].Y := ManF[i].Y - 10 else
      if (ManF[i].Y >= yt) and (manF[i].Y < (yt + 6)) then ManF[i].Y := ManF[i].Y + 10;
    end;
  for i:=2 to 11 do
    begin
      if i <> GameSubSituation then
        begin
          if (ManF[i].X > (xt - 6)) and (manF[i].X < xt) then ManF[i].X := ManF[i].X - 10 else
          if (ManF[i].X >= xt) and (manF[i].X < (xt + 6)) then ManF[i].X := ManF[i].X + 10;
          if (ManF[i].Y > (yt - 6)) and (manF[i].Y < yt) then ManF[i].Y := ManF[i].Y - 10 else
          if (ManF[i].Y >= yt) and (manF[i].Y < (yt + 6)) then ManF[i].Y := ManF[i].Y + 10;
        end;
    end;
end;


procedure FreeR;
begin
  ManF[ 2].X := 90;    ManF[ 2].Y := 15;
  ManF[ 3].X := 70;    ManF[ 3].Y := 54;
  ManF[ 4].X := 65;    ManF[ 4].Y := 75;
  ManF[ 5].X :=120;    ManF[ 5].Y := 35;
  ManF[ 6].X :=115;    ManF[ 6].Y := 55;
  ManF[ 7].X :=140;    ManF[ 7].Y := 95;
  ManF[ 8].X :=170;    ManF[ 8].Y := 75;
  ManF[ 9].X :=200;    ManF[ 9].Y :=115;
  ManF[10].X :=250;    ManF[10].Y := 25;
  ManF[11].X :=310;    ManF[11].Y := 85;
  // ALIEN TEAM
  ManF[13].X :=400;    ManF[13].Y := 15;
  ManF[14].X :=380;    ManF[14].Y := 37;
  ManF[15].X :=396;    ManF[15].Y := 85;
  ManF[16].X :=350;    ManF[16].Y := 75;
  ManF[17].X :=358;    ManF[17].Y :=105;
  ManF[18].X :=201;    ManF[18].Y := 55;
  ManF[19].X :=285;    ManF[19].Y := 35;
  ManF[20].X :=135;    ManF[20].Y := 88;
  ManF[21].X :=200;    ManF[21].Y := 85;
  ManF[22].X :=165;    ManF[22].Y := 33;

// BALL
  ManF[23].X := ManF[12].X - 2;    ManF[23].Y := ManF[12].Y;
  ManF[23].VX := -1;    ManF[23].Vy := 0;
end;

procedure FreeL;
begin
  ManF[ 2].X := 90;    ManF[ 2].Y := 15;
  ManF[ 3].X := 70;    ManF[ 3].Y := 54;
  ManF[ 4].X := 65;    ManF[ 4].Y := 75;
  ManF[ 5].X :=120;    ManF[ 5].Y := 35;
  ManF[ 6].X :=115;    ManF[ 6].Y := 55;
  ManF[ 7].X :=140;    ManF[ 7].Y := 95;
  ManF[ 8].X :=170;    ManF[ 8].Y := 75;
  ManF[ 9].X :=200;    ManF[ 9].Y :=115;
  ManF[10].X :=250;    ManF[10].Y := 25;
  ManF[11].X :=310;    ManF[11].Y := 85;
  // ALIEN TEAM
  ManF[13].X :=400;    ManF[13].Y := 15;
  ManF[14].X :=380;    ManF[14].Y := 37;
  ManF[15].X :=396;    ManF[15].Y := 85;
  ManF[16].X :=350;    ManF[16].Y := 75;
  ManF[17].X :=358;    ManF[17].Y :=105;
  ManF[18].X :=201;    ManF[18].Y := 55;
  ManF[19].X :=285;    ManF[19].Y := 35;
  ManF[20].X :=135;    ManF[20].Y := 88;
  ManF[21].X :=200;    ManF[21].Y := 85;
  ManF[22].X :=165;    ManF[22].Y := 33;

// BALL
  ManF[23].X := ManF[1].X + 6;    ManF[23].Y := ManF[1].Y;
  ManF[23].VX := -1;    ManF[23].Vy := 0;
end;

procedure UglovR;
begin
  if manF[23].y < 50 then
    begin
      ManF[23].X :=400;    ManF[23].Y := 3;
      manF[23].Vx := -3;    ManF[23].Vy := 3;

      manF[2].X := 402;    ManF[2].Y := 1;
      manF[2].Vx:= -1;   ManF[2].vY := 1.7;
    end
  else
    begin
      ManF[23].X :=450;    ManF[23].Y := 140;
      manF[23].Vx := -3;    ManF[23].Vy := -3;

      manF[2].X := 452;    ManF[2].Y := 143;
      manF[2].Vx:= -1.7;   ManF[2].Vy := -1.7;
    end;
end;

procedure UglovL;
begin
  if manF[23].y < 50 then
    begin
      ManF[23].X :=55;    ManF[23].Y := 3;
      manF[23].Vx := 3;    ManF[23].Vy := 3;

      manF[21].X := 57;  ManF[21].Y := 0;
      manF[21].Vx:= 1;   ManF[21].vY := 1;
    end
  else
    begin
      ManF[23].X :=10;    ManF[23].Y := 140;
      manF[23].Vx := 3;    ManF[23].Vy := -3;

      manF[21].X := 8;    ManF[21].Y := 143;
      manF[21].Vx:= 1.7;   ManF[21].Vy := -1.7;
    end;
end;

procedure SecondInitPlayers; // Инициализация векторов скоростей игроков
var
  i  : integer;
begin
// Создаем первоначальные вектора движения (Случайным образом)
  For i:= 2 to 11 do
    begin
      ManF[i].Vx := 1 + Round(Random(3));
      while ManF[i].Vy = 0 do ManF[i].Vy := Round(Random(3)) - Round(Random(3));
    end;
  For i:= 13 to 22 do
    begin
      ManF[i].Vx := -(1 + Round(Random(3)));
      while ManF[i].Vy = 0 do ManF[i].Vy := Round(Random(3)) - Round(Random(3));
    end;
  While ManF[23].Vx = 0 do
    ManF[23].Vx := Round(Random(4)) - Round(Random(4));
  ManF[23].Vy := Round(Random(4)) - Round(Random(4));
end;
// Инициализация координат объектов и других данных
procedure InitPlayers;
var
  i, j, k, l  : integer;
begin

  for i:=1 to 23 do
   for j:= 1 to 2 do
     for k:=1 to ph do
      for l:=1 to ph do
        manVisual[i,j,k,l] := 0;
// Присваиваем новые значения координатам объектов

  // HOME TEAM
  ManF[ 1].X := 40;    ManF[ 1].Y := 55;
  ManF[ 2].X := 90;    ManF[ 2].Y := 15;
  ManF[ 3].X := 70;    ManF[ 3].Y := 54;
  ManF[ 4].X := 65;    ManF[ 4].Y := 75;
  ManF[ 5].X :=120;    ManF[ 5].Y := 35;
  ManF[ 6].X :=115;    ManF[ 6].Y := 55;
  ManF[ 7].X :=140;    ManF[ 7].Y := 95;
  ManF[ 8].X :=170;    ManF[ 8].Y := 75;
  ManF[ 9].X :=200;    ManF[ 9].Y :=115;
  ManF[10].X :=250;    ManF[10].Y := 25;
  ManF[11].X :=360;    ManF[11].Y := 35;

  // ALIEN TEAM
  ManF[12].X :=415;    ManF[12].Y := 55;
  ManF[13].X :=400;    ManF[13].Y := 15;
  ManF[14].X :=380;    ManF[14].Y := 55;
  ManF[15].X :=396;    ManF[15].Y := 75;
  ManF[16].X :=350;    ManF[16].Y := 75;
  ManF[17].X :=358;    ManF[17].Y :=105;
  ManF[18].X :=201;    ManF[18].Y := 55;
  ManF[19].X :=285;    ManF[19].Y := 35;
  ManF[20].X :=135;    ManF[20].Y := 88;
  ManF[21].X :=200;    ManF[21].Y := 85;
  ManF[22].X :=165;    ManF[22].Y := 33;

// BALL
  ManF[23].X :=280;    ManF[23].Y := 44;
// Вносим некоторую случайность в расстановке игроков по полю
  Randomize;
  For i := 2 to 11 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(10)) - Round(Random(9));
      ManF[i].Y := ManF[i].Y + Round(Random(10)) - Round(Random(9));
    end;
  For i := 13 to 22 do
    begin
      ManF[i].X := ManF[i].X + Round(Random(10)) - Round(Random(9));
      ManF[i].Y := ManF[i].Y + Round(Random(10)) - Round(Random(9));
    end;
  ManF[1].X := ManF[1].X + Round(Random(5)) - Round(Random(4));
  ManF[1].Y := ManF[1].Y + Round(Random(10)) - Round(Random(9));
  ManF[12].X := ManF[12].X + Round(Random(5)) - Round(Random(4));
  ManF[12].Y := ManF[12].Y + Round(Random(10)) - Round(Random(9));

  For i:= 1 to 23 do
    begin
      ManF[i].XOld := ManF[i].X;
      ManF[i].YOld := ManF[i].Y;
      manF[i].HaveBall := False;
    end;

// Создаем первоначальные вектора движения (Случайным образом)
  For i:= 2 to 11 do
    begin
      ManF[i].Vx := 1 + Round(Random(3));
      while ManF[i].Vy = 0 do ManF[i].Vy := Round(Random(3)) - Round(Random(3));
    end;
  For i:= 13 to 22 do
    begin
      ManF[i].Vx := -(1 + Round(Random(3)));
      while ManF[i].Vy = 0 do ManF[i].Vy := Round(Random(3)) - Round(Random(3));
    end;
  While ManF[23].Vx = 0 do
    ManF[23].Vx := Round(Random(4)) - Round(Random(4));
  ManF[23].Vy := Round(Random(4)) - Round(Random(4));


// 1-номер игрока  1-11 home,  12-22 alien,  23-ball
// 2-тип игрока 1-В, 2-З, 3-П, 4-Н 5-ball
// 3-изображение 0-прямое, 1-зеркальное
  Fill(1,1,1,Random(2));
  for i:= 2 to 11 do
    begin
       Fill(i,2,1, Random(2));
     end;
  Fill(12,1,0, 1);
  Fill(23,5,0, 1);
  for i:= 13 to 22 do
    begin
      Fill(i,2,0, Random(2));
    end;

end;

// Глобальная начальная инициализация игроков
procedure StartInit;
begin
  homePenalti := 0;
  GuestPenalti := 0;
  homePenaltiGoal := 0;
  GuestPenaltiGoal := 0;
  homeKickGoal := 0; // удары по воротам
  GuestKickGoal := 0;
  HomeTimer := 0;
  GuestTimer := 0;
  HomeTactic := 2;  // Штурм=0, Атака=1, Защита = 2, Крепость = 3
  GuestTactic := 2; // Штурм=0, Атака=1, Защита = 2, Крепость = 3
  HomeInj := 0;
  GuestInj := 0;
  HomeUglov := 0;
  GuestUglov := 0;

  CountTicks :=77;
  GameTimer := 0;
  GameSituation :=0;
  GameSubSituation :=0;
  if GameAnimation
    then
      begin
         // Подготовка для выхода футболистов
        GameSituation :=0;
        GameSubSituation :=0;
      end;
  Spr := 1;
  InitPlayers;
end;



end.
