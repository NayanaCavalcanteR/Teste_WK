unit fPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  Vcl.StdCtrls, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, dmConexao, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids, System.ImageList, Vcl.ImgList;


type
  TfrmPedidos = class(TForm)
    pnlNavegacao: TPanel;
    btInicio: TSpeedButton;
    btAnterior: TSpeedButton;
    btNovo: TSpeedButton;
    btEditar: TSpeedButton;
    btExcluir: TSpeedButton;
    btCancelar: TSpeedButton;
    btProximo: TSpeedButton;
    btFinal: TSpeedButton;
    pnlPedido: TPanel;
    Label1: TLabel;
    edNumPedido: TDBEdit;
    Label2: TLabel;
    edDataEmissao: TDBEdit;
    Label3: TLabel;
    lkCliente: TDBLookupComboBox;
    pnlItensPedido: TPanel;
    griditens: TDBGrid;
    pnlProduto: TPanel;
    pnlValorTotal: TPanel;
    Label7: TLabel;
    edValorTotal: TEdit;
    btSalvar: TSpeedButton;
    pnlNavDetalhes: TPanel;
    btAnteriorItem: TSpeedButton;
    btNovoItem: TSpeedButton;
    btEditarItem: TSpeedButton;
    btExcluirItem: TSpeedButton;
    btCancelarItem: TSpeedButton;
    btProximoItem: TSpeedButton;
    btSalvarItem: TSpeedButton;
    pnlDadosProduto: TPanel;
    Label4: TLabel;
    lkProdutos: TDBLookupComboBox;
    Label5: TLabel;
    edQuantidade: TDBEdit;
    edValorUnitario: TDBEdit;
    Label6: TLabel;
    ImageList: TImageList;
    btPsqPedido: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btInicioClick(Sender: TObject);
    procedure btAnteriorClick(Sender: TObject);
    procedure btProximoClick(Sender: TObject);
    procedure btFinalClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btEditarClick(Sender: TObject);
    procedure btExcluirClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure FormataCampo(Sender: TObject; var Key: Char);
    procedure btAnteriorItemClick(Sender: TObject);
    procedure btNovoItemClick(Sender: TObject);
    procedure btEditarItemClick(Sender: TObject);
    procedure btSalvarItemClick(Sender: TObject);
    procedure btExcluirItemClick(Sender: TObject);
    procedure btCancelarItemClick(Sender: TObject);
    procedure btProximoItemClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btPsqPedidoClick(Sender: TObject);
  private
    { Private declarations }
    procedure IncluirProduto;
    procedure StatusTela;
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

uses fPesquisaPedidos;

{ TForm1 }

{ TfrmPedidos }

procedure TfrmPedidos.btAnteriorClick(Sender: TObject);
begin
  dtmConexao.dsPedidos.DataSet.Prior;
  StatusTela;
end;

procedure TfrmPedidos.btAnteriorItemClick(Sender: TObject);
begin
  dtmConexao.dsItensPedido.DataSet.Prior;
  StatusTela;
end;

procedure TfrmPedidos.btCancelarClick(Sender: TObject);
begin
  if (not dtmConexao.dsPedidos.DataSet.Active) then
    Exit;

  dtmConexao.dsPedidos.DataSet.Cancel;
  StatusTela;
end;

procedure TfrmPedidos.btCancelarItemClick(Sender: TObject);
begin
  dtmConexao.dsItensPedido.DataSet.Cancel;
  StatusTela;
end;

procedure TfrmPedidos.btEditarClick(Sender: TObject);
begin
  if (not dtmConexao.dsPedidos.DataSet.Active) then
    Exit;

  dtmConexao.dsPedidos.DataSet.Edit;
  StatusTela;
end;

procedure TfrmPedidos.btEditarItemClick(Sender: TObject);
begin
  if (dtmConexao.dsItensPedido.DataSet.IsEmpty) then
    Exit;

  dtmConexao.dsItensPedido.DataSet.Edit;
  StatusTela;
end;

procedure TfrmPedidos.btExcluirClick(Sender: TObject);
begin
  if (not dtmConexao.dsPedidos.DataSet.Active) then
    Exit;

  dtmConexao.dsPedidos.DataSet.Delete;
  StatusTela;
end;

procedure TfrmPedidos.btExcluirItemClick(Sender: TObject);
begin
  if (dtmConexao.dsItensPedido.DataSet.IsEmpty) then
    Exit;

  dtmConexao.dsItensPedido.DataSet.Delete;
  StatusTela;
end;

procedure TfrmPedidos.btFinalClick(Sender: TObject);
begin
  dtmConexao.dsPedidos.DataSet.Last;
  StatusTela;
end;

procedure TfrmPedidos.btInicioClick(Sender: TObject);
begin
  dtmConexao.dsPedidos.DataSet.First;
  StatusTela;
end;

procedure TfrmPedidos.btNovoClick(Sender: TObject);
begin
  if (not dtmConexao.dsPedidos.DataSet.Active) then
    Exit;

  dtmConexao.dsPedidos.DataSet.Append;
  StatusTela;
end;

procedure TfrmPedidos.btNovoItemClick(Sender: TObject);
begin
  dtmConexao.dsItensPedido.DataSet.Append;
  StatusTela;
end;

procedure TfrmPedidos.btProximoClick(Sender: TObject);
begin
  dtmConexao.dsPedidos.DataSet.Next;
  StatusTela;
end;

procedure TfrmPedidos.btProximoItemClick(Sender: TObject);
begin
  dtmConexao.dsItensPedido.DataSet.Next;
  StatusTela;
end;

procedure TfrmPedidos.btPsqPedidoClick(Sender: TObject);
var
  numPedido: integer;
begin
  numPedido := TfrmPesquisaPedidos.Inicializa;
  dtmConexao.GetPedidos(numPedido);
  StatusTela;
end;

procedure TfrmPedidos.btSalvarClick(Sender: TObject);
begin
  dtmConexao.dsPedidos.DataSet.Post;
  StatusTela;
end;

procedure TfrmPedidos.btSalvarItemClick(Sender: TObject);
begin
  dtmConexao.dsItensPedido.DataSet.Post;
  StatusTela;
end;

procedure TfrmPedidos.FormataCampo(Sender: TObject; var Key: Char);
begin
  case Key of
    '.', ',': if (Length(TDBEdit(Sender).Text) > 0) and (Pos(',', TDBEdit(Sender).Text) = 0) then
                 Key :=','
              else
                 Key :=#0;
  else
     if (not CharInSet(Key, ['0'..'9'])) and (Key <> #8)  and (Key <> #3) and (Key <> #22) then
        Key :=#0;
  end;
end;

procedure TfrmPedidos.FormShow(Sender: TObject);
begin
  dtmConexao.GetClientes;
  dtmConexao.GetProdutos;
  dtmConexao.GetPedidos(0);
  StatusTela;
end;

procedure TfrmPedidos.IncluirProduto;
begin
  if not dtmConexao.qryItensPedido.Active then
    Exit;

  dtmConexao.qryItensPedido.Append;
  dtmConexao.qryItensPedidoNUM_PEDIDO.AsInteger   := dtmConexao.qryPedidosNUM_PEDIDO.AsInteger;
  dtmConexao.qryItensPedidoCOD_PRODUTO.AsInteger  := StrToIntDef(VarToStrDef(lkProdutos.KeyValue, ''), 0);
  dtmConexao.qryItensPedidoQUANTIDADE.AsInteger   := StrToIntDef(edQuantidade.Text, 0);
  dtmConexao.qryItensPedidoVALOR_UNITARIO.AsFloat := StrToFloatDef(edValorUnitario.Text, 0);
  dtmConexao.qryItensPedidoVALOR_TOTAL.AsFloat    := (dtmConexao.qryItensPedidoQUANTIDADE.AsInteger*dtmConexao.qryItensPedidoVALOR_UNITARIO.AsFloat);
  dtmConexao.qryItensPedido.Post;
end;

procedure TfrmPedidos.StatusTela;
begin
  btPsqPedido.Visible     := (dtmConexao.dsPedidos.DataSet.State = dsBrowse) and (dtmConexao.dsPedidos.DataSet.IsEmpty);

  pnlPedido.Enabled       := (dtmConexao.dsPedidos.DataSet.State in [dsInsert, dsEdit]);
  pnlnavDetalhes.Enabled  := (dtmConexao.dsPedidos.DataSet.State = dsEdit) and (not dtmConexao.dsPedidos.DataSet.isEmpty);
  pnlDadosProduto.Enabled := (dtmConexao.dsItensPedido.DataSet.State in [dsInsert, dsEdit]);
  gridItens.Enabled       := (dtmConexao.dsItensPedido.DataSet.State = dsEdit);

  btInicio.Enabled   := (not dtmConexao.dsPedidos.DataSet.IsEmpty) and (dtmConexao.dsPedidos.DataSet.State = dsBrowse) and (not dtmConexao.dsPedidos.DataSet.Bof);
  btAnterior.Enabled := (not dtmConexao.dsPedidos.DataSet.IsEmpty) and (dtmConexao.dsPedidos.DataSet.State = dsBrowse) and (not dtmConexao.dsPedidos.DataSet.Bof);
  btProximo.Enabled  := (not dtmConexao.dsPedidos.DataSet.IsEmpty) and (dtmConexao.dsPedidos.DataSet.State = dsBrowse) and (not dtmConexao.dsPedidos.DataSet.Eof);
  btFinal.Enabled    := (not dtmConexao.dsPedidos.DataSet.IsEmpty) and (dtmConexao.dsPedidos.DataSet.State = dsBrowse) and (not dtmConexao.dsPedidos.DataSet.Eof);

  btNovo.Enabled     := (dtmConexao.dsPedidos.DataSet.State = dsBrowse);
  btEditar.Enabled   := (dtmConexao.dsPedidos.DataSet.State = dsBrowse) and (not dtmConexao.dsPedidos.DataSet.IsEmpty);
  btExcluir.Enabled  := (dtmConexao.dsPedidos.DataSet.State = dsBrowse) and (not dtmConexao.dsPedidos.DataSet.IsEmpty);
  btSalvar.Enabled   := (dtmConexao.dsPedidos.DataSet.State in [dsInsert, dsEdit]);
  btCancelar.Enabled := (dtmConexao.dsPedidos.DataSet.State in [dsInsert, dsEdit]);

  btAnteriorItem.Enabled := (not dtmConexao.dsItensPedido.DataSet.IsEmpty) and (dtmConexao.dsItensPedido.DataSet.State = dsBrowse) and (not dtmConexao.dsItensPedido.DataSet.Bof);
  btProximoItem.Enabled  := (not dtmConexao.dsItensPedido.DataSet.IsEmpty) and (dtmConexao.dsItensPedido.DataSet.State = dsBrowse) and (not dtmConexao.dsItensPedido.DataSet.Eof);

  btNovoItem.Enabled     := (dtmConexao.dsItensPedido.DataSet.State = dsBrowse);
  btEditarItem.Enabled   := (dtmConexao.dsItensPedido.DataSet.State = dsBrowse) and (not dtmConexao.dsItensPedido.DataSet.IsEmpty);
  btExcluirItem.Enabled  := (dtmConexao.dsItensPedido.DataSet.State = dsBrowse) and (not dtmConexao.dsItensPedido.DataSet.IsEmpty);
  btSalvarItem.Enabled   := (dtmConexao.dsItensPedido.DataSet.State in [dsInsert, dsEdit]);
  btCancelarItem.Enabled := (dtmConexao.dsItensPedido.DataSet.State in [dsInsert, dsEdit]);
end;

end.
