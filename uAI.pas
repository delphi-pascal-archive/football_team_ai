unit uAI;
// В этом модуле находятся процедуры искусственного интеллекта
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;


procedure GetNewWay(iP:Integer); // Новое действие для футболиста
procedure GetNewWay2(iP:Integer); // Новое действие для футболиста (второй вариант)
procedure GetNewWay3(iP:Integer); // Новое действие для футболиста (третий вариант)

implementation
uses
  Var_3D, uVisual2;

procedure Direction(x1,y1, ip : Integer; var vx1, vy1 : real);
var
  i,j : Integer;
begin
  i := abs(ManF[IP].X - x1);
  j := abs(ManF[IP].Y - y1);
  if manF[Ip].Y < Y1 then
    begin
      if J < 10 then vy1 := 1 else
      if J < 30 then vy1 := 2 else
      if J < 50 then vy1 := 3 else
      if J < 80 then vy1 := 4 else vy1 := 4
    end else
  if manF[IP].Y = Y1 then vy1 := 0
   else
    begin
      if J < 10 then vy1 := -1 else
      if J < 30 then vy1 := -2 else
      if J < 50 then vy1 := -3 else
      if J < 80 then vy1 := -4 else vy1 := -4
    end;

  if manF[Ip].x < x1 then
    begin
      if i < 10 then vx1 := 1 else
      if i < 30 then vx1 := 2 else
      if i < 50 then vx1 := 3 else
      if i < 80 then vx1 := 4 else vx1 := 4
    end else
  if manF[IP].x = x1 then vx1 := 0
   else
    begin
      if i < 10 then vx1 := -1 else
      if i < 30 then vx1 := -2 else
      if i < 50 then vx1 := -3 else
      if i < 80 then vx1 := -4 else vx1 := -4
    end;
end;

// Вычисляем x по y
function Line_Right(y : real): Integer;
begin
  Result := Round((y-5)*(411-460)/(5-140) + 411);
end;
function Line_Left(y : real): Integer;
begin
  Result := Round((y-5)*(54-5)/(5-140) + 54);
end;

// проверяем мяч на поподание в воротах
procedure BallCheck;
var
  x_r, x_l , i, j: integer;
begin
 x_r :=Line_Right(ManF[23].Y)+2;
 x_l :=Line_Left(ManF[23].Y);
 if (ManF[23].Y<67) and (ManF[23].Y>45) and (ManF[23].X> (x_r-3))
   then
     begin
       if GameTimer > 90
         then
           InKubok := 3; // Закончили игру
       // Забили мяч в правые ворота
       d1v:= d1v+1;
       form10.d1.Caption := IntToStr(d1v);
       //form10.Digit1.Value := form10.Digit1.Value + 1;
       manF[23].X := form10.imgFld.Width div 2;
       manF[23].Vx := - manF[23].Vx*0.2;
       CountTicks := 3;
       if GameSituation = GS_penaltiR then
         begin
           GameSituation := GS_None;
           Inc(HomePenaltiGoal);
         end;
     end;
 if ((ManF[23].Y>68) or (ManF[23].Y<44)) and (ManF[23].X > (x_r-3))
   then
     begin
       // Проверяем, кто коснулся мяча последним.
       i:= 1;
       j:= 0;
       while (j=0) and (i<=11) do
         begin
           if manF[i].HaveBall
             then j:=1
             else i:=i+1;
         end;
       if j=0
         then //  Мяч ушел от гостей -> угловой
           begin
             CountTicks := 22;
             Inc(HomeUglov);
           end
         else //  Мяч ушел от хозяев -> свободный
           begin
             CountTicks := 24;
           end;
     end;
 if (ManF[23].Y<67) and (ManF[23].Y>45) and (ManF[23].X < (x_l-2))
   then
     begin
       // Забили мяч в левые ворота
       if GameTimer > 90
         then
           InKubok := 3; // Закончили игру
       d2v:= d2v+1;
       form10.d2.Caption := IntToStr(d2v);
//       form10.Digit2.Value := form10.Digit2.Value + 1;
       manF[23].X := form10.ImgFld.Width div 2;
       manF[23].Vx := - manF[23].Vx*0.2;
       CountTicks := 3;
       if GameSituation = GS_penaltiL then
         begin
           GameSituation := GS_None;
           Inc(GuestPenaltiGoal);
         end;
     end;
 if ((ManF[23].Y>68) or (ManF[23].Y<44)) and (ManF[23].X < (x_l-2))
   then
     begin
       // Проверяем, кто коснулся мяча последним.
       i:= 12;
       j:= 0;
       while (j=0) and (i<=22) do
         begin
           if manF[i].HaveBall
             then j:=1
             else i:=i+1;
         end;
       if j=0
         then //  Мяч ушел от хозяев -> угловой
           begin
             CountTicks := 23;
             Inc(GuestUglov);
           end
         else //  Мяч ушел от гостей -> свободный
           begin
             CountTicks := 25;
           end;
     end;
end;

procedure GoalKeeperCheck(ip2:integer);
var
  i,j : integer;
begin
  i := ManF[23].Y;
  j := ManF[ip2].Y;
  if i<j then ManF[ip2].Vy := -1.25 else
  if i=j then ManF[ip2].Vy := 0
         else ManF[ip2].Vy := 1.25;
  if abs(i-j) <2 then
    begin
      manF[ip2].Y := manF[23].Y;
      manF[ip2].Vy :=0;
    end;
  // Чтобы Вратарь не вышел из своей области
  if ManF[ip2].Y < 30 then ManF[ip2].Y := 30 else
  if ManF[ip2].Y > 85 then ManF[ip2].Y := 85;
end;

function NotEnemy(ip:integer): boolean;
var
  vx,i,j,x,y : integer;
begin
  vx := Round(manF[ip].Vx);
  j := 0;
  if (ip < 12) and (vx>0) then
    begin // рассматриваем игроков команды - хозяина
      x := manF[ip].X;
      y := manF[ip].Y;
      for i := 12 to 22 do
        if (manF[i].X <= x + 20) and (manF[i].X >= x - 20) and
        (manF[i].Y >= y - 20) and (manF[i].Y <= y + 20) and (ip <> i)
          then j :=1;
    end
  else
    begin // рассматриваем игроков команды - гостя
      x := manF[ip].X;
      y := manF[ip].Y;
      for i := 1 to 11 do
        if (manF[i].X <= x + 20) and (manF[i].X >= x - 20) and
        (manF[i].Y >= y - 20) and (manF[i].Y <= y + 20) and (ip <> i)
          then j :=1;
    end;
  if j=0
   then // противников нету
     begin
       // устанавливаем мячику такое же направление, как и у игрока
       if ip > 11
         then
           begin
             if vx>0 then
               manF[ip].Vx:= - ManF[ip].Vx;
             manF[23].X := ManF[ip].X - 3
           end
         else
           begin
             if vx<0 then
               manF[ip].Vx:= - ManF[ip].Vx;
             manF[23].X := ManF[ip].X + 12;
           end;
       manF[23].Vx := ManF[ip].Vx;
       manF[23].Vy := manF[ip].Vy;
       manF[23].Y := ManF[ip].Y;
       NotEnemy := True;
     end
   else NotEnemy := False;
end;

// Возможность отдать пасс ближайщему игроку
procedure GetNearPass(IP:Integer);
var
  i,j, i2, i3, j3 : Integer;
  x1,x2,y1,y2 : Integer;
begin
  if IP in [2..11] then
    begin // рассчитываем для команды - хозяина
      i:=1;
      j:=0;
      x1 := ManF[IP].X;
      y1 := ManF[IP].Y;
      j3 := x1 + i;
      y2 := 0;
      x2 := j3;
      while (j=0) and (i<50)do // расстояние = 50 точкам
        begin // сканируем полукругом
              //     2 2 2 3
              //     1 1 2 3
              //   x   1 2 3
              //     1 1 2 3
              //     2 2 2 3
          j3 := x1 + i;
          x2 := j3;
          y2 := 1;
          for i3 := y1-i to y1 + i do
            begin
              y2 := i3;
              i2 := 1;
              while (j=0) and (i2<=11) do
                begin
                  if (ManF[i2].X = x2) and (ManF[i2].Y = y2)
                   then // человек бежит к правым воротам
                     begin
                       j:=1;
                     end
                   else i2 := i2+1;
                end;
            end;
          if j=0 then
            i := i+1
        end;
      if j=1
        then Direction(x2,y2,23,manF[23].Vx, manF[23].Vy);
    end
  else
  if IP in [13..22] then
    begin // рассчитываем для команды - гостя
      i:=50;
      j:=0;
      x1 := ManF[IP].X;
      y1 := ManF[IP].Y;
      y2 := 0;
      j3 := x1 - i;
      x2 := j3;
      while (j=0) and (i<50)do // расстояние = 50 точкам
        begin // сканируем полукругом
          j3 := x1 - i;
          x2 := j3;
          y2 := 1;
          for i3 := y1-i to y1 + i do
            begin
              y2 := i3;
              i2 := 12;
              while (j=0) and (i2<=22) do
                begin
                  if (ManF[i2].X = x2) and (ManF[i2].Y = y2)
                   then// человек бежит к правым воротам
                     begin
                       j:=1;
                     end
                   else i2 := i2+1;
                end;
            end;
          if j=0 then
            i := i+1
        end;
      if j=1
        then Direction(x2,y2,23,manF[23].Vx, manF[23].Vy);
    end
end;



procedure GetNewWay(IP:Integer); // Новое действие для футболиста
var
  i,j,x1,y1,x2,y2 ,i2: Integer;
  nx,ny : Integer;
begin
  if IP = 23 // проверяем мяч в воротах;
    then BallCheck;

  // проверка различных ситуация в игре
  if GameSituation = GS_penaltiL then
    begin
      If (IP <> GameSubSituation) and (IP<>23)  and (IP<>1) then Exit;
    end else
  if GameSituation = GS_penaltiR then
    begin
      If (IP <> GameSubSituation) and (IP<>23)  and (IP<>12) then Exit;
    end else
  if GameSituation = GS_ChangeOut then
    begin
      if IP <> GameSubSituation then Exit;
      Direction(form10.ImgFld.Width div 2, form10.ImgFld.Height - 10,
                IP, ManF[IP].Vx, ManF[IP].Vy);
      ManF[IP].X := ManF[IP].X + Round(ManF[IP].Vx);
      ManF[IP].Y := ManF[IP].Y + Round(ManF[IP].Vy);
      if (ManF[IP].X > (form10.ImgFld.Width div 2 - 2)) and
         (ManF[IP].X < (form10.ImgFld.Width div 2 + 2)) and
         (ManF[IP].Y > (form10.ImgFld.Height - 12)) and
         (ManF[IP].Y < (form10.ImgFld.Height - 7))
        then
          begin
            GameSituation := GS_ChangeIn;
          end;
      Exit;    
    end else
  if GameSituation = GS_ChangeIn then
    begin
      if IP <> GameSubSituation then Exit;
      Direction(ManF[IP].Xold, manF[IP].Yold,
                IP, ManF[IP].Vx, ManF[IP].Vy);
      ManF[IP].X := ManF[IP].X + Round(ManF[IP].Vx);
      ManF[IP].Y := ManF[IP].Y + Round(ManF[IP].Vy);
      if (ManF[IP].X = ManF[IP].Xold) and (ManF[IP].Y = ManF[IP].Yold)
        then
          begin
            // Заменили игрока УРА !!!!
            GameSituation := GS_None;
            ManF[IP].Vx := 2 + Random(3) - Random(3);
            ManF[IP].Vy := 2 + Random(3) - Random(3);
            form10.Label6.Visible := True;
            form10.Timer2.Enabled := True;
          end;
      Exit;
    end;


  if (ip=1) or (ip=12) then ManF[IP].Vx := 0;

  if IP = 23 then
    begin
     if Abs(ManF[23].Vx)<10
       then
         begin
           ManF[23].Vx := ManF[23].Vx*0.99;
           ManF[23].Vy := ManF[23].Vy*0.99
         end
       else
         begin
           ManF[23].Vx := ManF[23].Vx*0.2;
           ManF[23].Vy := ManF[23].Vy*0.2
         end;
    end;
  ManF[IP].Xold := ManF[IP].X;
  ManF[IP].Yold := ManF[IP].Y;
  ManF[IP].X := ManF[IP].X + Round(ManF[IP].Vx);
  ManF[IP].Y := ManF[IP].Y + Round(ManF[IP].Vy);
  x1 := Line_Right(ManF[IP].Y) - 6 ;
  x2 := Line_Left(ManF[IP].Y) - 4;
  if ManF[IP].X <x2 then
    begin
      ManF[IP].Vx:= - ManF[IP].Vx;
      ManF[IP].X := ManF[IP].X + 2;
      if (IP = 23) and (GameSituation = GS_penaltiL) then GameSituation := GS_None;
    end else
  if (ManF[IP].X > x1) and(ip<>23) then
    begin
      ManF[IP].Vx:= - ManF[IP].Vx;
      ManF[IP].X := ManF[IP].X - 2;
      if (IP = 23) and (GameSituation = GS_penaltiR) then GameSituation := GS_None;
    end else
  if (ManF[IP].X > x1+9) and(ip=23) then
    begin
      ManF[IP].Vx:= - ManF[IP].Vx;
      ManF[IP].X := ManF[IP].X - 2;
      if (IP = 23) and (GameSituation = GS_penaltiR) then GameSituation := GS_None;
    end;
  if ManF[IP].Y <0 then
    begin
      ManF[IP].Vy:= - ManF[IP].Vy;
      ManF[IP].Y:= 0;
     end else
  if ManF[IP].Y >125 then
    begin
      ManF[IP].Vy:= - ManF[IP].Vy;
      ManF[IP].Y:= 125;
    end;
  if IP = 23 then
    begin
      Exit; // Не обрабатываем мяч как игрока!
    end;

  // Обрабатываем игрока!!!

  // Если скорость слишком большая, то уменьшаем и наоборот

  if abs(manF[IP].Vx) > 4.7
     then manF[IP].Vx := manF[IP].Vx*0.8;
  if abs(manF[IP].Vx) < 1.1
     then manF[IP].Vx := manF[IP].Vx*1.2;

  if abs(manF[IP].Vy) > 4.7
     then manF[IP].Vy := manF[IP].Vy*0.8;
  if abs(manF[IP].Vy) < 1.1
     then manF[IP].Vy := manF[IP].Vy*1.2;


  if manF[IP].Count > 0 then Dec(manF[IP].Count);
  x1 := abs(Manf[IP].X - manF[23].X);
  y1 := abs(Manf[IP].Y - manF[23].Y);
  x2 := form10.ImgFld.Height div 2;
  y2 := abs(ManF[23].Y - x2);

  // Вычисляем исходя из тактики размер области захвата мяча
  nx := 6;
  if IP in [1..11] then
    begin
      if HomeTactic = 0 then
        begin // Штурм
          if manF[IP].X < (form10.ImgFld.Width div 2)
            then nx := nx - 2
            else nx := nx + 4;
        end
      else
      if HomeTactic = 1 then
        begin // атака
          if manF[IP].X < (form10.ImgFld.Width div 2)
            then nx := nx - 2
            else nx := nx + 3;
        end
      else
      if HomeTactic = 2 then
        begin // Защита
          if manF[IP].X < (form10.ImgFld.Width div 2)
            then nx := nx + 2
            else nx := nx - 1;
        end
      else
      if HomeTactic = 3 then
        begin // Крепость
          if manF[IP].X < (form10.ImgFld.Width div 2)
            then nx := nx + 3
            else nx := nx - 2;
        end;
    end
  else
    begin // Вторая команда
      if GuestTactic = 0 then
        begin // Штурм
          if manF[IP].X < (form10.ImgFld.Width div 2)
            then nx := nx + 4
            else nx := nx - 2;
        end
      else
      if GuestTactic = 1 then
        begin // атака
          if manF[IP].X < (form10.ImgFld.Width div 2)
            then nx := nx + 3
            else nx := nx - 2;
        end
      else
      if GuestTactic = 2 then
        begin // Защита
          if manF[IP].X < (form10.ImgFld.Width div 2)
            then nx := nx - 1
            else nx := nx + 2;
        end
      else
      if GuestTactic = 3 then
        begin // Крепость
          if manF[IP].X < (form10.ImgFld.Width div 2)
            then nx := nx - 2
            else nx := nx + 3;
        end;
    end;
  ny := nx;

  j := 0;
  for i:=1 to 22 do
    if manF[i].HaveBall
       then j := i; // получили номер игрока, у которого мяч
  if ((x1>nx)and (x1<60{original=15})) and ((y1>ny) and (y1<60{original=15})) then
    begin // направляем игрока к мячу
      if ManF[23].X > manF[IP].X
        then manF[IP].Vx := abs(manF[IP].Vx) else
      if ManF[23].X < manF[IP].X
        then manF[IP].Vx := -abs(manF[IP].Vx) else

      if ManF[23].Y > manF[IP].Y
        then manF[IP].Vy := abs(manF[IP].Vy) else
      if ManF[23].Y < manF[IP].Y
        then manF[IP].Vy := -abs(manF[IP].Vy) else
    end;

  // Игрок пытается сбить противника, если тот слишком близко
  if IP in [1..11] then
    begin
      i2 := 0;
      for i := 12 to 22 do
        if (manF[i].X = manF[IP].X) and (manF[i].Y =manF[IP].Y)
          then i2 := i;
      i := Random(20);
      if (i2>0) and (i<5) then
        begin
          // сбили противника
          CountTicks := 10;
          manF[IP].Kick_Inj_Count := manF[IP].Kick_Inj_Count + 1; // увеличиваем предупреждения
          manF[i2].Inj_Count := ManF[i2].Inj_Count + 1; // увеличиваем повреждения
          homeInj := HomeInj + 1; // Увеличиваем счетчик штрафных для команды
          // меняем направление движения противника
          manF[i2].Vx := -manF[i2].Vx;
          manF[i2].Vy := -manF[i2].Vy;
          if manF[IP].X < 130 then
            begin
              GameSituation := GS_shtraf1L; // штравной в левую сторону
              GameSubSituation := i2; // кто будет пробивать штрафной
            end
          else
            begin
              GameSituation := GS_shtraf2L; // штравной в левую сторону
              GameSubSituation := i2; // кто будет пробивать штрафной
            end;
          if (manF[IP].X < 50) and (manF[IP].Y < 85) and (manF[IP].Y > 34)
            then  // пенальти в левые ворота
              begin
                inc(GuestPenalti);
                GameSituation := GS_penaltiL; // пенальти в левые ворота
                GameSubSituation := i2; // кто будет пробивать пенальти
                Dec(HomeInj);
                CountTicks := 12;
              end;
        end;
      i2 := 0;
      for i := 2 to 11 do
        if (manF[i].X > (manF[IP].X-3)) and (manF[i].X < (manF[IP].X+3)) and
           (manF[i].Y > (manF[IP].Y-2)) and (manF[i].Y < (manF[IP].Y+2)) and (IP<>i)
          then i2 := i;
      if i2>0 then
        begin // меняем направление движение напарника по команде
          manF[i2].Vy := -manF[i2].Vy;
        end
    end
  else
    begin
      i2 := 0;
      for i := 1 to 11 do
        if (manF[i].X = manF[IP].X) and (manF[i].Y =manF[IP].Y)
          then i2 := i;
      i := Random(20);
      if (i2>0) and (i<5) then
        begin
          // сбили противника
          CountTicks := 11;
          manF[IP].Kick_Inj_Count := manF[IP].Kick_Inj_Count + 1; // увеличиваем предупреждения
          manF[i2].Inj_Count := ManF[i2].Inj_Count + 1; // увеличиваем повреждения
          GuestInj := GuestInj + 1; // Увеличиваем счетчик штрафных для команды
          // меняем направление движения противника
          manF[i2].Vx := -manF[i2].Vx;
          manF[i2].Vy := -manF[i2].Vy;
          if manF[IP].X > 330 then
            begin
              GameSituation := GS_shtraf1R; // штравной в правую сторону со стенкой
              GameSubSituation := i2; // кто будет пробивать штрафной
            end
          else
            begin
              GameSituation := GS_shtraf2R; // штравной в правую сторону без стенки
              GameSubSituation := i2; // кто будет пробивать штрафной
            end;
          if (manF[IP].X > 400) and (manF[IP].Y < 85) and (manF[IP].Y > 34)
            then  // пенальти в правые ворота
              begin
                inc(HomePenalti);
                GameSituation := GS_penaltiR; // пенальти в левые ворота
                GameSubSituation := i2; // кто будет пробивать пенальти
                Dec(GuestInj);
                CountTicks := 13;
              end;
        end;
      i2 := 0;
      for i := 13 to 22 do
        if (manF[i].X > (manF[IP].X-3)) and (manF[i].X < (manF[IP].X+3)) and
           (manF[i].Y > (manF[IP].Y-2)) and (manF[i].Y < (manF[IP].Y+2)) and (IP<>i)
          then i2 := i;
      if i2>0 then
        begin // меняем направление движение напарника по команде
          manF[i2].Vy := -manF[i2].Vy;
        end
    end;

  if (x1<nx) and (y1<ny) then
    begin // меняем направление движения мячика
      manF[j].HaveBall := False;
      ManF[IP].HaveBall := True;
      if abs(manF[IP].Vx)>abs(manF[23].Vx)
        then manF[23].Vx := abs(manF[IP].Vx)
        else manF[23].Vx := abs(manF[23].Vx);
      if IP in [12..22]
        then manF[23].Vx := -manF[23].Vx;
      if x2 > manF[23].Y then
        begin
          if y2<30 then manF[23].Vy := 1 else
          if y2<70 then manF[23].Vy := 2 else
          if y2<110 then manF[23].Vy := 3
                   else manF[23].Vy := 4
        end else
      if x2 = manF[23].Y then
        begin
          manF[23].Vy := 0;
        end
      else // x2<manF[23].Y
        begin
          if y2<30 then manF[23].Vy := -1 else
          if y2<70 then manF[23].Vy := -2 else
          if y2<110 then manF[23].Vy := -3
                   else manF[23].Vy := -4
        end;
      manF[23].Vy:=ManF[23].Vy + Round(Random(4)) - Round(Random(4));
      y2 := Round(Random(10));
      if y2 > 7 then
        begin
          if ManF[23].Vx>0
            then ManF[23].Vx := ManF[23].Vx + Round(Random(1))
            else ManF[23].Vx := ManF[23].Vx - Round(Random(1))
        end;
      if (IP=1) or (IP=12) then
        begin  // Вратари отбивают сильно мяч
          manF[23].Vx := ManF[23].Vx*3;
          manF[23].Vy := ManF[23].Vy*2;
          // это уже не пенальти
          GameSubSituation := GS_None;
          GameSituation := GS_None;
        end
      else
        begin
          // Возможность отдать пасс ближнему своему игроку
          if (manF[IP].X > 390) and (ip<12)
            then
              begin
                Direction(430,45 + Random(30),23,manF[23].Vx, manF[23].Vy);
                manF[23].Vx := manF[23].Vx*1.2;
                manF[23].Vy := manF[23].Vy*1.2;
                if ManF[IP].Count = 0
                  then
                    begin
                      inc(HomeKickGoal);
                      manF[IP].Count := 10;
                    end
              end else
          if (ManF[IP].X >340) and (ip <12)
            then // удар по правым воротам
              begin
                if (manF[ip].Y > 30) and (manF[ip].Y<115)
                  then Direction(450,40 + Random(35),23,manF[23].Vx, manF[23].Vy)
                  else Direction(410,40 + Random(35),23,manF[23].Vx, manF[23].Vy);
                manF[23].Vx := manF[23].Vx*1.2;
                manF[23].Vy := manF[23].Vy*1.2;
                if ManF[IP].Count = 0
                  then
                    begin
                      inc(HomeKickGoal);
                      manF[IP].Count := 10;
                    end;
                if GameSituation = GS_penaltiR then
                  begin
                    while abs(manF[IP].Vy) < 0.7 do
                      manF[IP].Vy := Random(3) - Random(3);
                    if abs(manF[IP].Vy) < 1 then ManF[IP].Vy := ManF[IP].Vy*2.5;
                  end
              end
            else
          if (manF[IP].X < 50) and (ip>11)
            then
              begin   // Бъем издалека по воротам
                if (manF[ip].Y > 30) and (manF[ip].Y<115)
                  then Direction(15,45 + Random(25),23,manF[23].Vx, manF[23].Vy)
                  else Direction(30,45 + Random(25),23,manF[23].Vx, manF[23].Vy);

                manF[23].Vx := manF[23].Vx*1.2;
                manF[23].Vy := manF[23].Vy*1.2;

                if ManF[IP].Count = 0
                  then
                    begin
                      inc(GuestKickGoal);
                      manF[IP].Count := 10;
                    end
              end else
          if (ManF[IP].X <90) and (ip > 11)
            then // удар по левым воротам
              begin
                if (manF[ip].Y > 30) and (manF[ip].Y<115)
                  then Direction(10,45 + Random(25),23,manF[23].Vx, manF[23].Vy)
                  else Direction(55,45 + Random(25),23,manF[23].Vx, manF[23].Vy);
                manF[23].Vx := manF[23].Vx*1.2;
                manF[23].Vy := manF[23].Vy*1.2;
                if ManF[IP].Count = 0
                  then
                    begin
                      inc(GuestKickGoal);
                      manF[IP].Count := 10;
                    end;
                if GameSituation = GS_penaltiL then
                  begin
                    while abs(manF[IP].Vy) < 0.7 do
                      manF[IP].Vy := Random(3) - Random(3);
                    if abs(manF[IP].Vy) < 1 then ManF[IP].Vy := ManF[IP].Vy*2.5;
                  end
              end
          else
            begin
              if (GameSituation <> GS_shtraf1l) and (GameSituation <> GS_shtraf2l) and
                 (GameSituation <> GS_shtraf1r) and (GameSituation <> GS_shtraf2r)
                then
                  begin
                    if not NotEnemy(IP) // если есть противники на пути
                      then GetNearPass(IP);
                  end
                else
                  begin
                    // пробиваем штрафной
                    if IP>11
                      then Direction(30, 55, IP, ManF[23].Vx, ManF[23].Vy)
                      else Direction(410, 55, IP, ManF[23].Vx, ManF[23].Vy);
                    ManF[23].Vx := ManF[23].Vx * 3;
                    ManF[23].Vy := ManF[23].Vy * 3;
                    // Это уже больше не штрафной
                    GameSituation := GS_none;
                    manF[IP].Vy := 2;
                    if (ip=1) or (IP=12) then ManF[IP].Vx := 0;
                  end;
            end
        end;
    end;
  if (IP=1) or (IP=12) then // проверяем местоположение вратарей
    GoalKeeperCheck(IP);
  if (abs(manF[IP].Vy) <0.2) and (ip<>GameSubSituation) then manF[IP].Vy := 1;   
end;

procedure GetNewWay2(iP:Integer); // Новое действие для футболиста
begin
  Direction(ManF[IP].XOld, ManF[IP].YOld,
            IP, ManF[IP].Vx, ManF[IP].Vy);
  ManF[IP].X := ManF[IP].X + Round(ManF[IP].Vx);
  ManF[IP].Y := ManF[IP].Y + Round(ManF[IP].Vy);
  if (ManF[IP].X > (ManF[IP].XOld - 2)) and
     (ManF[IP].X < (ManF[IP].XOld + 2)) and
     (ManF[IP].Y > (ManF[IP].YOld - 2)) and
     (ManF[IP].Y < (ManF[IP].YOld + 2))
    then
      Pl_Array[IP,1] := 0; // Игрок добежал до своей точки
end;
procedure GetNewWay3(iP:Integer); // Новое действие для футболиста
begin
  Direction(ManF[IP].XOld, ManF[IP].YOld,
            IP, ManF[IP].Vx, ManF[IP].Vy);
  ManF[IP].X := ManF[IP].X + Round(ManF[IP].Vx);
  ManF[IP].Y := ManF[IP].Y + Round(ManF[IP].Vy);
  if (ManF[IP].X > (ManF[IP].XOld - 2)) and
     (ManF[IP].X < (ManF[IP].XOld + 2)) and
     (ManF[IP].Y > (ManF[IP].YOld - 2)) and
     (ManF[IP].Y < (ManF[IP].YOld + 2))
    then
        Pl_Array[IP,1] := 0; // Игрок добежал до своей точки
end;

end.
