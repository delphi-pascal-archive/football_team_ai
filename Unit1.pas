unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
implementation

uses uVisual2, Var_3D, uShinnik;

{$R *.DFM}

procedure TForm1.FormShow(Sender: TObject);
begin
 StartInit; // Глобальная начальная инициализация игроков

// Для тестирования
//  CountTicks := 100;
//  GameSubSituation := 4;
{
 manF[23].x:= 40;
 manF[23].y:= 5;
 manF[23].vX := 2;
 manF[1].HaveBall := True;
}
 inKubok := 0;
 GameAnimation := True;
 Form10.ShowModal;
 Close;
end;

end.
