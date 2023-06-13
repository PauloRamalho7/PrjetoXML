program ProjetoXML;

uses
  Vcl.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {FrmLeitorXMLs},
  ufrmExibeXml in 'ufrmExibeXml.pas' {FrmExibeXML};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLeitorXMLs, FrmLeitorXMLs);
  Application.CreateForm(TFrmExibeXML, FrmExibeXML);
  Application.Run;
end.
