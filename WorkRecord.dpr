program WorkRecord;

uses
  Vcl.Forms,
  DeskEvent in 'DeskEvent.pas' {Form1},
  Global in 'Global.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
