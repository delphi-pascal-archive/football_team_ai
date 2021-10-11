unit uVisual2;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ExtCtrls;

type
  TForm10 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Image1: TImage;
    Timer1: TTimer;
    Timer2: TTimer;
    LblTimer: TLabel;
    Label4: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Timer3: TTimer;
    imgFld: TImage;
    Label8: TLabel;
    pb: TPaintBox;
    Label9: TLabel;
    D1: TLabel;
    D2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Label4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label4Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure Label6MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormPaint(Sender: TObject);
    procedure Label7MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label5MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Timer3Timer(Sender: TObject);
    procedure pbPaint(Sender: TObject);
  private
    procedure SayNum(index : integer);
  public
    procedure UpdateSoccerField;
  end;

Var
  Form10: TForm10;
  InKubok : Integer; // ���� ���  ���� ��� ���? 1=start, 2=finish, 0=none
  Pl_Array : array[1..22, 1..2] of Integer;
  d1v,d2v : integer;

implementation
{$R *.DFM}

Uses Var_3D, uAI, uResults, uStatistics, uChange, uShinnik;


procedure TForm10.UpdateSoccerField;
var
  i: integer;
begin
  pb.Canvas.CopyRect(Rect(0, 0, ImgFld.Picture.Bitmap.Width, ImgFld.Picture.Bitmap.Height),
                     ImgFld.Picture.BitMap.Canvas,
                     Rect(0, 0, ImgFld.Picture.Bitmap.Width, ImgFld.Picture.Bitmap.Height));
  if GameAnimation and (GameSituation = GS_AllIn)
    then
      begin
        for i:=1 to 22 do
          begin
            if Pl_Array[i,1] = 1
              then GameSubSituation := i
              else GameSubSituation := 0;
            PrintP(i);    // ������ ����� ����������� ����������
          end;
      end
    else
      begin
        PrintP(23);
        for i:=1 to 22 do
          PrintP(i);    // ������ ����� ����������� ����������
      end;
end;

procedure TForm10.FormShow(Sender: TObject);
var
  s: string;
begin
  if inKubok = 1
    then // ������ �����, ���� ������ ������ , ����� ���
      begin
        if a.Tur = 6  then s := '1/16 ������';
        if a.Tur = 11 then s := '1/8 ������';
        if a.Tur = 16 then s := '1/4 ������';
        if a.Tur = 21 then s := '1/2 ������';
        if a.Tur = 26 then s := '�����';
        form10.Label8.Caption := '����� ������ :  ' + s;
      end;
  if inKubok = 0
    then // ������  ���
      begin
        form10.Label8.Caption := '��������� ������ :  ' + IntToStr(a.Tur)+' ���';
      end;
  Form10.LblTimer.Caption := '00:00';
  Form10.Label6.Visible := True;
  Form10.Label4.Visible := True;
  Form10.Timer1.Enabled := True;
  if not GameAnimation then
    begin
      Form10.LblTimer.Caption := '90:00';
      form10.Timer2.Enabled := False;
      Form10.Label6.Visible := False;
      Form10.Label4.Visible := False;
    end;
  UpdateSoccerField;
end;


procedure TForm10.Image1Click(Sender: TObject);
begin
  fmMainMenu.PlayWav('Click',True);
  Close;
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
  form10.color:=clBlack;
  d1v := 0;
  d2v:=0;
  D1.Caption := IntToStr(d1v);
  D2.Caption := IntToStr(d2v);
  inKubok := 0; // ������������� ���� �� �� �����

  pb.Width:=imgFld.Width;
  pb.Height:=imgFld.Height;  
end;

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
var
  c3,c4 : integer;
begin
  if (inKubok = 1) or (inKubok=3) // ���� �� ���������
    then
      begin
        c3:=0;
        c4:=0;
        while c3 = c4 do
          begin
            GetGameResult(tHome, tNoHome, c3, c4);
            if c3 < StrToInt(d1.Caption)
              then c3 := StrToInt(d1.Caption);
            if c4 < StrToInt(d2.Caption)
              then c4 := StrToInt(d2.Caption)
          end;
        inKubok := 2; // ���� �� ����� ���������
        d1v := c3;
        d2v := c4;

      end;

  form10.Timer1.Enabled := False;
  form10.Timer2.Enabled := False;
  rHome := StrToInt(form10.D1.Caption);
  rNoHome := StrToInt(form10.D2.Caption);
  // ���� �������� ����, �� ��������� ��������� ������� ��������� ����
  if (GameTimer <90) and (inKubok = 0)
    then
      begin // ����� �� �������� ����, ����� ������� ��������� ���������
        c3:=0;
        c4:=0;
        GetGameResult(tHome, tNoHome, c3, c4);
        if rHome < c3
          then rHome := c3;
        if rNoHome < c4
          then rNoHome := c4;
//        form10.Digit1.Value := rHome;
//        form10.Digit2.Value := rNoHome;
      end;
end;

procedure TForm10.Timer1Timer(Sender: TObject);
var
  i, j: integer;
begin
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// ������ ���������� � �����  :)
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  UpdateSoccerField;
  
  Spr := Spr+1;
  if Spr = 7 then Spr := 1;

  if GameAnimation and (GameSituation = GS_AllIn)
    then
      begin
        For i:= 1 to  22 do
          begin
            GetNewWay2(i);
          end;
        j:=0;
        for i:= 1 to 22 do
          begin
            if Pl_Array[i,1] = 1 then inc(j);
          end;
        label9.Caption := IntToStr(j);  
        if j=0 then
          begin
            if CountTicks = 999
              then
                begin
                  CountTicks := 0;
                  GameSituation := gs_None;
                  GameSubSituation := 0;
                  SecondInitPlayers;
                end;
          end;
      end
    else
  if GameAnimation and (GameSituation = GS_AllOut)
    then
      begin
        For i:= 1 to  22 do
          begin
            GetNewWay3(i);
          end;
        j:=0;
        for i:= 1 to 22 do
          begin
            if Pl_Array[i,1] = 2 then inc(j);
          end;
        label9.Caption := IntToStr(j);
        if j=0 then
          begin
            if CountTicks = 999
              then
                begin
                  CountTicks := 101;
                  GameSituation := gs_None;
                  GameSubSituation := 0;
                end;
          end;
      end
    else
  if GameAnimation then // ������ !!!
    begin
      // ����� �������� ��� ����������
      GetNewWay(12); GetNewWay(1);
      for i :=2 to 6 do
        begin
          GetNewWay(i);
          GetNewWay(11+i);
        end;
      for i :=7 to 11 do
        begin
          GetNewWay(11+i);
          GetNewWay(i);
        end;
      GetNewWay(23);
    end;

  if CountTicks = 0 then
    begin // �������� � ������ ����
      fmResults.Label1.Caption := '�����';
      form10.Timer1.Enabled := False;
      fmResults.ShowModal;
      form10.Timer1.Enabled := True;
      CountTicks := 2;
      form10.Timer2.Enabled := True;
      GameTimer := 0;
      form10.Label4.Visible := True;
      form10.Label6.Visible := True;
    end else
  if CountTicks = 3 then
    begin
      fmMainMenu.PlayWav('Goal',True);
      fmResults.Label1.Caption := '���';
      form10.Timer1.Enabled := False;
      form10.Timer2.Enabled := False;
      fmResults.ShowModal;
      form10.Timer1.Enabled := True;
      form10.Timer2.Enabled := True;
      SayNum(StrToInt(form10.D1.Caption));
      Timer3.Enabled := true;
      CountTicks := 2;
    end else
  if CountTicks = 10 then
    begin
      fmResults.Label1.Caption := '��������';
      form10.Timer1.Enabled := False;
      form10.Timer2.Enabled := False;
      if GameSituation = GS_shtraf1L
        then Shtraf1L   // ����������� ����������� �� �������
        else Shtraf2L;  // ����������� ����������� ��� ������
      fmResults.ShowModal;
      form10.Timer1.Enabled := True;
      form10.Timer2.Enabled := True;
      CountTicks := 2;
    end else
  if CountTicks = 11 then
    begin
      fmResults.Label1.Caption := '��������';
      form10.Timer1.Enabled := False;
      form10.Timer2.Enabled := False;
      if GameSituation = GS_shtraf1R
        then Shtraf1R   // ����������� ����������� �� �������
        else Shtraf2R;  // ����������� ����������� ��� ������
      fmResults.ShowModal;
      form10.Timer1.Enabled := True;
      form10.Timer2.Enabled := True;
      CountTicks := 2;
    end else
  if CountTicks = 12 then
    begin // �������� � ����� ������ [penalti_L]
      fmResults.Label1.Caption := '��������';
      form10.Timer1.Enabled := False;
      form10.Timer2.Enabled := False;
      PenaltiL;
      fmResults.ShowModal;
      form10.Timer1.Enabled := True;
      form10.Timer2.Enabled := True;
      CountTicks := 2;
    end else
  if CountTicks = 13 then
    begin // �������� � ������ ������ [penalti_R]
      fmResults.Label1.Caption := '��������';
      form10.Timer1.Enabled := False;
      form10.Timer2.Enabled := False;
      PenaltiR;
      fmResults.ShowModal;
      form10.Timer1.Enabled := True;
      form10.Timer2.Enabled := True;
      CountTicks := 2;
    end else
  if CountTicks = 20 then
    begin // ������ ������ - ����� ������ � ����
      fmResults.Label1.Caption := '������';
      form10.Timer1.Enabled := False;
      form10.Timer2.Enabled := False;
      fmResults.ShowModal;
      GameSituation := GS_ChangeOut;
      GameSubSituation := OutPlayerNumber;
      if tNoHome = a.My then GameSubSituation := GameSubSituation + 11;
      ManF[OutPlayerNumber].XOld := ManF[OutPlayerNumber].X;
      ManF[OutPlayerNumber].YOld := ManF[OutPlayerNumber].Y;
      form10.Timer1.Enabled := True;
      CountTicks := 2;
    end else
  if CountTicks = 21 then
    begin // ������ ������ - ����� ������ � ����
      form10.Timer1.Enabled := True;
      CountTicks := 2;
    end else
  if CountTicks = 22 then
    begin // ������� � ������ �����
      fmResults.Label1.Caption := '�������';
      form10.Timer1.Enabled := False;
      form10.Timer2.Enabled := False;
      UglovR;
      fmResults.ShowModal;
      form10.Timer1.Enabled := True;
      form10.Timer2.Enabled := True;
      CountTicks := 2;
    end else
  if CountTicks = 23 then
    begin // ������� � ����� �����
      fmResults.Label1.Caption := '�������';
      form10.Timer1.Enabled := False;
      form10.Timer2.Enabled := False;
      UglovL;
      fmResults.ShowModal;
      form10.Timer1.Enabled := True;
      form10.Timer2.Enabled := True;
      CountTicks := 2;
    end else
  if CountTicks = 24 then
    begin // ��������� � ������ �����
      fmResults.Label1.Caption := '�� �����';
      form10.Timer1.Enabled := False;
      form10.Timer2.Enabled := False;
      FreeR;
      fmResults.ShowModal;
      form10.Timer1.Enabled := True;
      form10.Timer2.Enabled := True;
      CountTicks := 2;
    end else
  if CountTicks = 25 then
    begin // ��������� � ����� �����
      fmResults.Label1.Caption := '�� �����';
      form10.Timer1.Enabled := False;
      form10.Timer2.Enabled := False;
      FreeL;
      fmResults.ShowModal;
      form10.Timer1.Enabled := True;
      form10.Timer2.Enabled := True;
      CountTicks := 2;
    end else

  if CountTicks = 30 then
    begin
      fmResults.Label1.Caption := '�������������';
      form10.Timer1.Enabled := False;
      form10.Timer2.Enabled := False;
      fmResults.ShowModal;
      form10.Timer1.Enabled := True;
      form10.Timer2.Enabled := True;
      CountTicks := 2;
    end else
  if CountTicks = 77 then
    begin // ���������� � ������ �������
      for i:= 1 to 22 do
        begin
          manF[i].XOld := Manf[i].X;
          manF[i].YOld := ManF[i].Y;
          ManF[i].X := 232;
          ManF[i].Y := 150;
          Pl_Array[i,1] := 1; // ����� ��������� �� ����� ����� - ������� 0
        end;
      GameSituation := GS_AllIn;
      CountTicks := 999;
    end else
  if CountTicks = 78 then
    begin // ���������� � ������ �������
      for i:= 1 to 22 do
        begin
          manF[i].XOld := 232;
          manF[i].YOld := 150;
          Pl_Array[i,1] := 2; // ����� ��������� �� ����� ����� - ������� 0
        end;
      GameSituation := GS_AllOut;
      CountTicks := 999;
    end else
  if CountTicks = 100 then
    begin // ����� ����
      fmResults.Label1.Caption := '�����';
      form10.Timer1.Enabled := False;
      fmResults.ShowModal;
      form10.Label6.Visible := False;
      form10.Timer1.Enabled := True;
      CountTicks := 78;
      if inKubok > 0
        then inKubok := 2;
    end else
    if CountTicks = 101 then
    begin // ����� ����
      form10.Timer1.Enabled := False;
      form10.Label6.Visible := False;
      if inKubok > 0
        then inKubok := 2;
    end;

//  if (inKubok = 3) and (Digit1.Value <> Digit2.Value) then
//    begin
//      CountTicks := 100;
//      timer2.Enabled := False;
//    end;
end;

procedure TForm10.Timer2Timer(Sender: TObject);
var
  s : string;
  i : integer;
begin
  // ���� ������� ����� ����� ������
  inc(GameTimer);
  s := IntToStr(GameTimer);
  if GameTimer < 10
    then s := '0' + s;
  form10.LblTimer.Caption := s+':00';
  if GameTimer = 90 then
    begin
      if inKubok = 0
        then
          begin
            CountTicks := 100;
            timer2.Enabled := False;
          end
        else
          begin
            if D1.Caption = D2.Caption
              then
                begin
                  GameTimer := 91;
                  form10.LblTimer.Caption := '91:00';
                  CountTicks := 30; // ���������� ������ �� ��������� ����
                  inKubok := 3;
                end
              else
                begin
                  CountTicks := 100;
                  inKubok := 2; // ���� �����������, ���� �� ������ ��������
                  timer2.Enabled := False;
                end
          end;
    end;
  for i := 1 to 11 do
    if manF[i].HaveBall then Inc(homeTimer);
  for i := 12 to 22 do
    if manF[i].HaveBall then Inc(GuestTimer);
end;

procedure TForm10.Label4MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label4.Font.Style := [fsBold, fsUnderLine];
  label6.Font.Style := [fsBold];
  label4.font.color := clRed;
  label6.font.color := clBlue;
end;

procedure TForm10.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label4.Font.Style := [fsBold];
  label6.Font.Style := [fsBold];
  label4.font.color := clBlue;
  label6.font.color := clBlue;
end;

procedure TForm10.Label4Click(Sender: TObject);
begin
  fmMainMenu.PlayWav('Click',True);
  // ���������� ���������� �� ������� ������ �����
  form10.Timer1.Enabled := False;
  form10.Timer2.Enabled := False;
  fmResults.Timer1.Enabled := False;
  fmStat.ShowModal;
  if (GameTimer < 90) or  (inKubok <>0) then
    begin
      form10.Timer1.Enabled := True;
      form10.Timer2.Enabled := True;
      fmResults.Timer1.Enabled := True;
    end;
  label4.font.color := clBlue;
end;
                
procedure TForm10.Label6Click(Sender: TObject);
begin
  fmMainMenu.PlayWav('Click',True);
  // ������ �������
  if GameSituation <> GS_None then Exit;
  form10.Timer1.Enabled := False;
  form10.Timer2.Enabled := False;
  fmResults.Timer1.Enabled := False;
  fmChange.ShowModal;
  if (GameTimer < 90) or  (inKubok <>0) then
    begin
      form10.Timer1.Enabled := True;
      form10.Timer2.Enabled := True;
      fmResults.Timer1.Enabled := True;
    end;
  fmStat.Label6.Font.Style := [fsBold];
  label6.font.color := clBlue;
end;

procedure TForm10.Label6MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label6.Font.Style := [fsBold, fsUnderLine];
  label4.Font.Style := [fsBold];
  label4.font.color := clBlue;
  label6.font.color := clRed;
end;

procedure TForm10.FormPaint(Sender: TObject);
begin
  // ������ �����
  Canvas.Brush.Color := clNavy;
  Canvas.FrameRect(Rect(0, 0, Width, Height));
end;

procedure TForm10.Label7MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label4.Font.Style := [fsBold];
  label6.Font.Style := [fsBold];
  label4.font.color := clBlue;
  label6.font.color := clBlue;
end;

procedure TForm10.Label5MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label4.Font.Style := [fsBold];
  label6.Font.Style := [fsBold];
  label4.font.color := clBlue;
  label6.font.color := clBlue;
end;

procedure TForm10.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label4.Font.Style := [fsBold];
  label6.Font.Style := [fsBold];
  label4.font.color := clBlue;
  label6.font.color := clBlue;
end;

procedure TForm10.SayNum(index : integer);
begin
  Case index of
    0:  fmMainMenu.PlayWav('0',True);
    1:  fmMainMenu.PlayWav('1',True);
    2:  fmMainMenu.PlayWav('2',True);
    3:  fmMainMenu.PlayWav('3',True);
    4:  fmMainMenu.PlayWav('4',True);
    5:  fmMainMenu.PlayWav('5',True);
    6:  fmMainMenu.PlayWav('6',True);
    7:  fmMainMenu.PlayWav('7',True);
    8:  fmMainMenu.PlayWav('8',True);
  end;
end;

procedure TForm10.Timer3Timer(Sender: TObject);
begin
  SayNum(StrToInt(Form10.D2.Caption));
  timer3.Enabled := False;
end;

procedure TForm10.pbPaint(Sender: TObject);
begin
  UpdateSoccerField;
end;

end.
