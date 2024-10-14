program Teste_WK;

uses
  Vcl.Forms,
  fPedidos in 'fPedidos.pas' {frmPedidos},
  dmConexao in 'dmConexao.pas' {dtmConexao: TDataModule},
  fPesquisaPedidos in 'fPesquisaPedidos.pas' {frmPesquisaPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.CreateForm(TfrmPedidos, frmPedidos);
  Application.CreateForm(TfrmPesquisaPedidos, frmPesquisaPedidos);
  Application.Run;
end.
