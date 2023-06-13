unit uFrmExibeXml;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Xml.xmldom, Xml.XMLIntf, Vcl.StdCtrls,
  Vcl.Buttons, Xml.XMLDoc, Vcl.ComCtrls;

type
  TFrmExibeXML = class(TForm)
    TreeView1: TTreeView;
    XMLDocument: TXMLDocument;
    Memo1: TMemo;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    mmSaida: TMemo;
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    procedure GenereteTree(XMLNode: IXMLNode; TreeNode: TTreeNode);
  public
    { Public declarations }
  end;

var
  FrmExibeXML: TFrmExibeXML;

implementation

{$R *.dfm}

uses uFrmPrincipal;

{ TForm2 }

procedure TFrmExibeXML.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure TFrmExibeXML.BitBtn2Click(Sender: TObject);
var
  NodeEvolucao,
  NodeArquetipo : IXMLNode;
  StOrdem: String;
  PairList: TStringList;
  i: Integer;
  OutputFile: TextFile;
begin
  NodeEvolucao :=  XMLDocument.ChildNodes['composicao'].ChildNodes['evolucao'];
  PairList := TStringList.Create;
  mmSaida.Lines.Clear;

  for i := 0 to NodeEvolucao.ChildNodes.Count-1 do begin
    NodeArquetipo := NodeEvolucao.ChildNodes[i];
    if NodeArquetipo.ChildNodes['ativo'].Text = 'T' then begin
        StOrdem := '';
        StOrdem := NodeArquetipo.ChildNodes['ordem'].Text + ' - ';
        StOrdem := StOrdem + NodeArquetipo.ChildNodes['perguntas'].ChildNodes['pergunta'].ChildNodes['descricao'].Text + ' - ' ;
        StOrdem := StOrdem + NodeArquetipo.ChildNodes['perguntas'].ChildNodes['pergunta'].ChildNodes['id_prpergunta'].Text  ;
        PairList.Add(StOrdem);
        mmSaida.Lines.Add(StOrdem);
    end;
  end;

  // Ordenar a lista pelos pares ordem
  PairList.Sort;

  // Criar o arquivo de saída
  AssignFile(OutputFile,FrmLeitorXMLs.Caminho+'_arquivo_ordenado.txt');
  Rewrite(OutputFile);

    try
      // Escrever os pares ordem e descrição no arquivo de saída
      for i := 0 to PairList.Count - 1 do
      begin
        Writeln(OutputFile, PairList[i]);
      end;
    finally
      // Fechar o arquivo de saída
      CloseFile(OutputFile);
    end;
    // Liberar a memória ocupada pela lista
    PairList.Free;

  ShowMessage('Processamento concluído.');
end;

procedure TFrmExibeXML.FormShow(Sender: TObject);
begin
    XMLDocument.LoadFromFile (FrmLeitorXMLs.Caminho); // pegando o conteúdo da variável Caminho.
    TreeView1.Items.Clear; //limpa o conteúdo que estiver na TreeView
    XMLDocument.Active:= True; // ativa o XMLDocument
    GenereteTree(XMLDocument.DocumentElement, nil); //Monta a TreeView
    with Memo1.Lines do
     begin
      Clear; //limpa o memo para receber as informações do arquivo XML
      Add('Versão : ' + XMLDocument.Version);
      Add('Encoding : ' + XMLDocument.Encoding);
      Add('Nome : ' + XMLDocument.FileName);
end;
end;

procedure TFrmExibeXML.GenereteTree(XMLNode: IXMLNode; TreeNode: TTreeNode);
var
  NodeText : string;
  NewTreeNode: TTreeNode;
  I : Integer;
 begin
  if XMLNode.NodeType <> ntElement then
    Exit;
  NodeText := XMLNode.NodeName;
  if XMLNode.IsTextElement then
    NodeText := NodeText + '=' + XMLNode.NodeValue;
  NewTreeNode := TreeView1.Items.AddChild(TreeNode, NodeText);
  if XMLNode.HasChildNodes then
    for I := 0 to XMLNode.ChildNodes.Count - 1 do
      GenereteTree(XMLNode.ChildNodes[I], NewTreeNode);
 end;

end.
