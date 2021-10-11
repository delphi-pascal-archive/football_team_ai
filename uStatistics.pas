unit uStatistics;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TfmStat = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmStat: TfmStat;

implementation
Uses
  Var_3D, uVisual2;
{$R *.DFM}

procedure TfmStat.FormShow(Sender: TObject);
var
  a : Real;
  s: String;
begin
  // ������� �������� �������� ������
  
  // ������� ����� �����
  s := IntToStr(GameTimer);
  if GameTimer < 10
    then s := '0' + s;
  fmStat.Label24.Caption := s+':00';

  // ������� ���������� ������� �����
//  fmStat.Label6.Caption := IntToStr(form10.Digit1.Value);
//  fmStat.Label7.Caption := IntToStr(form10.Digit2.Value);
  fmStat.Label6.Caption := form10.D1.Caption;
  fmStat.Label7.Caption := form10.D2.Caption;

  // ������� ���������� ��������
  fmStat.Label9.Caption := IntToStr(homePenalti);
  fmStat.Label10.Caption := IntToStr(GuestPenalti);

  // ������� ���������� ������ �� �������
  fmStat.Label12.Caption := IntToStr(homeKickGoal);
  fmStat.Label13.Caption := IntToStr(GuestKickGoal);

  // ������� ���������� �������� �����
  if GameTimer>0
    then a := homeTimer/GameTimer*100
    else a := 0;
  fmStat.Label21.Caption := IntToStr(Round(a));
  if GameTimer>0
    then a := GuestTimer/GameTimer*100
    else a := 0;
  fmStat.Label22.Caption := IntToStr(Round(a));

  // ������� ���������� � ������� ������
  if HomeTactic = 0  then s:='�����';
  if HomeTactic = 1  then s:='�����';
  if HomeTactic = 2  then s:='������';
  if HomeTactic = 3  then s:='��������';
  fmStat.Label26.Caption := s;

  if GuestTactic = 0 then s:='�����';
  if GuestTactic = 1 then s:='�����';
  if GuestTactic = 2 then s:='������';
  if GuestTactic = 3 then s:='��������';
  fmStat.Label27.Caption := s;

  // ������� ���������� ��������
  fmStat.Label15.Caption := IntToStr(GuestInj);
  fmStat.Label16.Caption := IntToStr(HomeInj);

  // ������� ���������� ��������
  fmStat.Label9.Caption := IntToStr(HomePenalti)+' ('+IntToStr(HomePenaltiGoal)+')';
  fmStat.Label10.Caption := IntToStr(GuestPenalti)+' ('+IntToStr(GuestPenaltiGoal)+')';

  // ������� ���������� �������
  fmStat.Label19.Caption := IntToStr(GuestUglov);
  fmStat.Label18.Caption := IntToStr(HomeUglov);
end;
procedure TfmStat.FormCreate(Sender: TObject);
begin
  fmStat.Color := clBlack;
end;

procedure TfmStat.FormPaint(Sender: TObject);
begin
  // ������ �����
  Canvas.Brush.Color := clNavy;
  Canvas.FrameRect(Rect(0, 0, Width, Height));
end;

procedure TfmStat.Image1Click(Sender: TObject);
begin
  fmStat.Close;
end;

end.
