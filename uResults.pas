unit uResults;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TfmResults = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmResults: TfmResults;

implementation

{$R *.DFM}

procedure TfmResults.FormShow(Sender: TObject);
begin
  fmResults.Timer1.Enabled := True;
end;

procedure TfmResults.Timer1Timer(Sender: TObject);
begin
  timer1.Enabled := False;
  Close;
end;

end.
