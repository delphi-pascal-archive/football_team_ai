program Football_team_AI;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  uAI in 'uAI.pas',
  uChange in 'uChange.pas' {fmChange},
  uStatistics in 'uStatistics.pas' {fmStat},
  uVisual2 in 'uVisual2.pas' {Form10},
  Var_3D in 'Var_3D.pas',
  uShinnik in 'uShinnik.pas' {fmMainMenu},
  uResults in 'uResults.pas' {fmResults};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title:='Ёмитатор футбольного матча';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfmMainMenu, fmMainMenu);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TfmChange, fmChange);
  Application.CreateForm(TfmStat, fmStat);
  Application.CreateForm(TfmResults, fmResults);
  Application.Run;
end.
