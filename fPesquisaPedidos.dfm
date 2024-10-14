object frmPesquisaPedidos: TfrmPesquisaPedidos
  Left = 0
  Top = 0
  Caption = 'Pesquisar pedidos'
  ClientHeight = 85
  ClientWidth = 253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlPedido: TPanel
    Left = 0
    Top = 0
    Width = 253
    Height = 47
    Align = alClient
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 0
    ExplicitWidth = 624
    ExplicitHeight = 49
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 71
      Height = 15
      Caption = 'N'#186' do pedido'
    end
    object edPedido: TEdit
      Left = 93
      Top = 13
      Width = 87
      Height = 23
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 47
    Width = 253
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitTop = 48
    object btOk: TButton
      Left = 94
      Top = 8
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
      OnClick = btOkClick
    end
    object btCancelar: TButton
      Left = 175
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
