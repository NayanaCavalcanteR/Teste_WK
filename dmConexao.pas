unit dmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, IniFiles, Vcl.Forms, DateUtils;

const
  cs_ArqCfgDB = 'testeWK_db';

type
  TdtmConexao = class(TDataModule)
    Conexao: TFDConnection;
    qryClientes: TFDQuery;
    qryClientesCODIGO: TIntegerField;
    qryClientesNOME: TStringField;
    qryProdutos: TFDQuery;
    qryProdutosCODIGO: TIntegerField;
    qryProdutosDESCRICAO: TStringField;
    qryPedidos: TFDQuery;
    qryItensPedido: TFDQuery;
    dsClientes: TDataSource;
    dsProdutos: TDataSource;
    dsPedidos: TDataSource;
    qryPedidosDATA_EMISSAO: TDateField;
    qryPedidosCOD_CLIENTE: TIntegerField;
    qryItensPedidoNUM_PEDIDO: TIntegerField;
    qryItensPedidoCOD_PRODUTO: TIntegerField;
    qryItensPedidoQUANTIDADE: TIntegerField;
    dsItensPedido: TDataSource;
    qryItensPedidoDESCRICAO: TStringField;
    qryPedidosVALOR_TOTAL: TBCDField;
    qryItensPedidoVALOR_UNITARIO: TBCDField;
    qryItensPedidoVALOR_TOTAL: TBCDField;
    qryPedidosNUM_PEDIDO: TAutoIncField;
    qryItensPedidoCODIGO: TAutoIncField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qryPedidosNewRecord(DataSet: TDataSet);
    procedure qryItensPedidoBeforePost(DataSet: TDataSet);
    procedure qryPedidosAfterOpen(DataSet: TDataSet);
    procedure qryPedidosAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
    procedure InicializaConexao;
  public
    { Public declarations }
    procedure GetClientes;
    procedure GetProdutos;
    procedure GetPedidos(const Pedido: integer);
    procedure GetItensPedido(const Pedido: integer);
  end;

var
  dtmConexao: TdtmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdtmConexao }

procedure TdtmConexao.DataModuleCreate(Sender: TObject);
begin
  InicializaConexao;
end;

procedure TdtmConexao.GetClientes;
begin
  qryClientes.Close;
  qryClientes.SQL.Clear;
  qryClientes.SQL.Text := 'SELECT CODIGO, NOME FROM CLIENTES';
  qryClientes.Open;
end;

procedure TdtmConexao.GetItensPedido(const Pedido: integer);
begin
  qryItensPedido.Close;
  qryItensPedido.SQL.Clear;
  qryItensPedido.SQL.Text := ' SELECT I.CODIGO, I.NUM_PEDIDO, I.COD_PRODUTO, P.DESCRICAO, I.QUANTIDADE, I.VALOR_UNITARIO, I.VALOR_TOTAL '+
                             ' FROM ITENS_PEDIDO I ' +
                             ' JOIN PRODUTOS P ON P.CODIGO = I.COD_PRODUTO ' +
                             ' WHERE NUM_PEDIDO = '+IntToStr(Pedido);
  qryItensPedido.Open;
end;

procedure TdtmConexao.GetPedidos(const Pedido: integer);
begin
  qryPedidos.Close;
  qryPedidos.SQL.Clear;
  qryPedidos.SQL.Text := ' SELECT NUM_PEDIDO, DATA_EMISSAO, COD_CLIENTE, VALOR_TOTAL '+
                         ' FROM PEDIDOS ' +
                         ' WHERE NUM_PEDIDO = '+IntToStr(Pedido);
  qryPedidos.Open;
end;

procedure TdtmConexao.GetProdutos;
begin
  qryProdutos.Close;
  qryProdutos.SQL.Clear;
  qryProdutos.SQL.Text := 'SELECT CODIGO, DESCRICAO FROM PRODUTOS';
  qryProdutos.Open;
end;

procedure TdtmConexao.InicializaConexao;
var
  ArquivoIni: TIniFile;
begin
  ArquivoIni := TIniFile.Create(ExtractFileDir(Application.ExeName)+'\'+cs_ArqCfgDB+'.ini');
  try
    Conexao.Connected   := False;
    Conexao.LoginPrompt := False;
    Conexao.Params.Add('Database='+ArquivoIni.ReadString('Banco de Dados','database',''));
    Conexao.Params.Add('User_Name='+ArquivoIni.ReadString('Banco de Dados','username',''));
    Conexao.Params.Add('Server='+ArquivoIni.ReadString('Banco de Dados','server',''));
    Conexao.Params.Add('Port='+ArquivoIni.ReadString('Banco de Dados','port',''));
    Conexao.Params.Add('Password='+ArquivoIni.ReadString('Banco de Dados','password',''));
    Conexao.Params.Add('DriverID=MySQL');
    Conexao.Connected := True;
  finally
    ArquivoIni.Free;
  end;

end;

procedure TdtmConexao.qryItensPedidoBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('NUM_PEDIDO').AsInteger := qryPedidos.FieldByName('NUM_PEDIDO').AsInteger;
  DataSet.FieldByName('VALOR_TOTAL').AsFloat  := (DataSet.FieldByName('QUANTIDADE').AsInteger*DataSet.FieldByName('VALOR_UNITARIO').AsFloat);
end;

procedure TdtmConexao.qryPedidosAfterOpen(DataSet: TDataSet);
begin
  GetItensPedido(DataSet.FieldByName('NUM_PEDIDO').AsInteger);
end;

procedure TdtmConexao.qryPedidosAfterScroll(DataSet: TDataSet);
begin
  GetItensPedido(DataSet.FieldByName('NUM_PEDIDO').AsInteger);
end;

procedure TdtmConexao.qryPedidosNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('DATA_EMISSAO').AsDateTime := DateOf(Now);
end;

end.
