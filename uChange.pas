unit uChange;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfmChange = class(TForm)
    lb1: TListBox;
    lb2: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Label2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lb1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure lb2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmChange: TfmChange;

implementation
Uses
  Var_3D, uVisual2, uShinnik;

{$R *.DFM}

procedure TfmChange.Button2Click(Sender: TObject);
begin
  fmMainMenu.PlayWav('Click',True);
  form10.Label6.Font.Style :=[fsBold];
  Close;
end;

procedure TfmChange.Button1Click(Sender: TObject);
var
  s : string;
begin
  fmMainMenu.PlayWav('Click',True);
  if lb2.Items.Count = 0 then
    begin // некого менять в игре
//      ErrorMessage:=9;
//      fmError.ShowModal;
      form10.Label6.Font.Style :=[fsBold];
      form10.Label6.Visible := False;
      fmChange.Close;
      Exit;
    end;
  OutPlayerNumber := lb1.ItemIndex+1;
  InPlayerNumber := lb2.ItemIndex+1;
  s := lb1.Items.Strings[lb1.ItemIndex];
  lb1.Items.Strings[lb1.ItemIndex]:=lb2.Items.Strings[lb2.ItemIndex];
  lb2.Items.Strings[lb2.ItemIndex]:=s;
  CountTicks := 20; // Замена игрока
  form10.Label6.Font.Style :=[fsBold];
  form10.Label6.Visible := False;
  Close;
end;

procedure TfmChange.FormCreate(Sender: TObject);
begin
  fmChange.Color := clBlack;
end;

procedure TfmChange.Label1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label1.Font.Style := [fsBold, fsUnderLine];
  label2.Font.Style := [fsBold];
end;

procedure TfmChange.Label2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label2.Font.Style := [fsBold, fsUnderLine];
  label1.Font.Style := [fsBold];
end;

procedure TfmChange.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label1.Font.Style := [fsBold];
  label2.Font.Style := [fsBold];
end;

procedure TfmChange.lb1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label1.Font.Style := [fsBold];
  label2.Font.Style := [fsBold];
end;

procedure TfmChange.lb2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  label1.Font.Style := [fsBold];
  label2.Font.Style := [fsBold];
end;

procedure TfmChange.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  label1.Font.Style := [fsBold];
  label2.Font.Style := [fsBold];
end;

procedure TfmChange.FormShow(Sender: TObject);
begin
  lb1.ItemIndex := 0;
  if lb2.Items.Count > 0
    then
     lb2.ItemIndex := 0;
end;

procedure TfmChange.FormPaint(Sender: TObject);
begin
  // Рисуем рамку
  Canvas.Brush.Color := clNavy;
  Canvas.FrameRect(Rect(0, 0, Width, Height));
end;

end.
