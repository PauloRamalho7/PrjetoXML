unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  IniFiles;

type
  TFrmLeitorXMLs = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    OpenDialog: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    iniconf:TIniFile;
  public
    { Public declarations }
    Caminho :string;
end;

var
  FrmLeitorXMLs: TFrmLeitorXMLs;

implementation

{$R *.dfm}

uses ufrmExibeXml;

procedure TFrmLeitorXMLs.BitBtn1Click(Sender: TObject);
  begin
    if OpenDialog.Execute then begin
      edit1.Text := OpenDialog.FileName;
      caminho    := edit1.Text;
    end;
    try
     Application.CreateForm(TFrmExibeXML, FrmExibeXml);
     FrmExibeXml.ShowModal;
    finally
     FrmExibeXml.Release;
   end;
end;

procedure TFrmLeitorXMLs.FormCreate(Sender: TObject);
begin
  iniconf := TIniFile.Create(ExtractFilePath(Application.ExeName)+'conf.ini');
end;

end.
