program PagingFMX;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormMain in 'FormMain.pas' {MainForm},
  Model in 'Model.pas',
  SampleData in 'SampleData.pas';

{$R *.res}
{$STRONGLINKTYPES ON}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.