object dtmConexao: TdtmConexao
  OnCreate = DataModuleCreate
  Height = 302
  Width = 521
  object Conexao: TFDConnection
    LoginPrompt = False
    Left = 80
    Top = 40
  end
  object qryClientes: TFDQuery
    Connection = Conexao
    Left = 80
    Top = 104
    object qryClientesCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qryClientesNOME: TStringField
      FieldName = 'NOME'
      Size = 50
    end
  end
  object qryProdutos: TFDQuery
    Connection = Conexao
    Left = 80
    Top = 168
    object qryProdutosCODIGO: TIntegerField
      FieldName = 'CODIGO'
    end
    object qryProdutosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
  end
  object qryPedidos: TFDQuery
    AfterOpen = qryPedidosAfterOpen
    AfterScroll = qryPedidosAfterScroll
    OnNewRecord = qryPedidosNewRecord
    Connection = Conexao
    Left = 272
    Top = 104
    object qryPedidosNUM_PEDIDO: TAutoIncField
      FieldName = 'NUM_PEDIDO'
    end
    object qryPedidosDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object qryPedidosCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object qryPedidosVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '0.00'
      Size = 2
    end
  end
  object qryItensPedido: TFDQuery
    BeforePost = qryItensPedidoBeforePost
    MasterSource = dsPedidos
    MasterFields = 'NUM_PEDIDO'
    Connection = Conexao
    Left = 272
    Top = 168
    object qryItensPedidoNUM_PEDIDO: TIntegerField
      FieldName = 'NUM_PEDIDO'
    end
    object qryItensPedidoCODIGO: TAutoIncField
      FieldName = 'CODIGO'
    end
    object qryItensPedidoCOD_PRODUTO: TIntegerField
      FieldName = 'COD_PRODUTO'
    end
    object qryItensPedidoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 150
    end
    object qryItensPedidoQUANTIDADE: TIntegerField
      FieldName = 'QUANTIDADE'
    end
    object qryItensPedidoVALOR_UNITARIO: TBCDField
      FieldName = 'VALOR_UNITARIO'
      DisplayFormat = '0.00'
      Size = 2
    end
    object qryItensPedidoVALOR_TOTAL: TBCDField
      FieldName = 'VALOR_TOTAL'
      DisplayFormat = '0.00'
      Size = 2
    end
  end
  object dsClientes: TDataSource
    DataSet = qryClientes
    Left = 160
    Top = 104
  end
  object dsProdutos: TDataSource
    DataSet = qryProdutos
    Left = 160
    Top = 168
  end
  object dsPedidos: TDataSource
    DataSet = qryPedidos
    Left = 352
    Top = 104
  end
  object dsItensPedido: TDataSource
    DataSet = qryItensPedido
    Left = 352
    Top = 168
  end
end
