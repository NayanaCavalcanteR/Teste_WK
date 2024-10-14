unit fPesquisaPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPesquisaPedidos = class(TForm)
    pnlPedido: TPanel;
    Label1: TLabel;
    edPedido: TEdit;
    Panel1: TPanel;
    btOk: TButton;
    btCancelar: TButton;
    procedure btOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function Inicializa: integer;
  end;

var
  frmPesquisaPedidos: TfrmPesquisaPedidos;

implementation

{$R *.dfm}

{ TfrmPesquisaPedidos }

procedure TfrmPesquisaPedidos.btOkClick(Sender: TObject);
begin
  ModalResult := mrNone;

  if (StrToIntDef(edPedido.Text, 0) > 0) then
    ModalResult := mrOk;
end;

class function TfrmPesquisaPedidos.Inicializa: integer;
begin
  Result := 0;

  with Self.Create(nil) do
  try
    if (ShowModal = mrOK) then
      Result := StrToIntDef(edPedido.Text, 0);
  finally
    Free;
  end;
end;

end.
