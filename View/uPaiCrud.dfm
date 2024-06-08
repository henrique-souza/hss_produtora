object fPaiCrud: TfPaiCrud
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'fPaiCrud'
  ClientHeight = 497
  ClientWidth = 866
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlRodape: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 449
    Width = 860
    Height = 45
    Align = alBottom
    TabOrder = 0
    StyleName = 'Windows'
    ExplicitTop = 477
    ExplicitWidth = 743
    DesignSize = (
      860
      45)
    object bvl1: TBevel
      Left = 250
      Top = 8
      Width = 97
      Height = 33
      Shape = bsBottomLine
    end
    object btnInserir: TBitBtn
      Left = 7
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Inserir'
      TabOrder = 0
      OnClick = btnInserirClick
    end
    object btnEditar: TBitBtn
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Editar'
      TabOrder = 1
      OnClick = btnEditarClick
    end
    object btnApagar: TBitBtn
      Left = 169
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Apagar'
      TabOrder = 2
      OnClick = btnApagarClick
    end
    object btnCancelar: TBitBtn
      Left = 450
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 3
      OnClick = btnCancelarClick
    end
    object btnFechar: TBitBtn
      Left = 774
      Top = 8
      Width = 75
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      TabOrder = 4
      OnClick = btnFecharClick
      ExplicitLeft = 657
    end
    object dbnvgr1: TDBNavigator
      Left = 548
      Top = 8
      Width = 220
      Height = 25
      DataSource = dsListagem
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 5
    end
    object btnGravar: TBitBtn
      Left = 353
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Gravar'
      TabOrder = 6
      OnClick = btnGravarClick
    end
  end
  object pgcPrincipal: TPageControl
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 860
    Height = 440
    ActivePage = tsListagem
    Align = alClient
    TabOrder = 1
    StyleName = 'Windows'
    ExplicitHeight = 340
    object tsListagem: TTabSheet
      Caption = 'Listagem de Titulares'
      object dbgrdListagem: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 3
        Width = 846
        Height = 404
        Align = alClient
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        OnCellClick = dbgrdListagemCellClick
        OnDblClick = dbgrdListagemDblClick
        OnTitleClick = dbgrdListagemTitleClick
      end
    end
    object tsCadastroTitulares: TTabSheet
      Caption = 'Cadastro de Titulares'
      ImageIndex = 1
      object pnl1: TPanel
        Left = 0
        Top = 0
        Width = 375
        Height = 410
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        ExplicitHeight = 310
        object grp2: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 369
          Height = 404
          Align = alClient
          Caption = 'Endere'#231'o'
          TabOrder = 0
          ExplicitTop = 43
          object lbledtCEP: TLabeledEdit
            Left = 16
            Top = 40
            Width = 189
            Height = 23
            EditLabel.Width = 21
            EditLabel.Height = 15
            EditLabel.Caption = 'CEP'
            EditMask = '00000\-999;1;_'
            MaxLength = 9
            NumbersOnly = True
            TabOrder = 0
            Text = '     -   '
            StyleName = 'Windows'
          end
          object lbledtRua: TLabeledEdit
            Left = 16
            Top = 88
            Width = 221
            Height = 23
            EditLabel.Width = 20
            EditLabel.Height = 15
            EditLabel.Caption = 'Rua'
            TabOrder = 1
            Text = ''
            StyleName = 'Windows'
          end
          object lbledtBairro: TLabeledEdit
            Left = 16
            Top = 240
            Width = 221
            Height = 23
            EditLabel.Width = 31
            EditLabel.Height = 15
            EditLabel.Caption = 'Bairro'
            TabOrder = 2
            Text = ''
          end
          object lbledtCidade: TLabeledEdit
            Left = 16
            Top = 296
            Width = 221
            Height = 23
            EditLabel.Width = 37
            EditLabel.Height = 15
            EditLabel.Caption = 'Cidade'
            TabOrder = 3
            Text = ''
          end
          object lbledtEstado: TLabeledEdit
            Left = 16
            Top = 352
            Width = 221
            Height = 23
            EditLabel.Width = 35
            EditLabel.Height = 15
            EditLabel.Caption = 'Estado'
            TabOrder = 4
            Text = ''
          end
          object btnCEPViaAPI: TBitBtn
            Left = 232
            Top = 40
            Width = 121
            Height = 23
            Caption = 'Preencher endere'#231'o'
            TabOrder = 5
            OnClick = btnCEPViaAPIClick
          end
          object lbledtID: TLabeledEdit
            Left = 272
            Top = 96
            Width = 81
            Height = 23
            EditLabel.AlignWithMargins = True
            EditLabel.Width = 68
            EditLabel.Height = 15
            EditLabel.Caption = 'Identifica'#231#227'o'
            Enabled = False
            TabOrder = 6
            Text = ''
          end
          object lbledtComplemento: TLabeledEdit
            Left = 148
            Top = 145
            Width = 205
            Height = 23
            EditLabel.Width = 77
            EditLabel.Height = 15
            EditLabel.Caption = 'Complemento'
            TabOrder = 7
            Text = ''
          end
          object rgFlagAtivo: TRadioGroup
            Left = 248
            Top = 296
            Width = 105
            Height = 98
            Caption = 'Cadastro ativo?'
            Items.Strings = (
              'Sim'
              'N'#227'o')
            TabOrder = 8
            OnExit = rgFlagAtivoExit
          end
          object lbledtNumero: TLabeledEdit
            Left = 16
            Top = 145
            Width = 121
            Height = 23
            EditLabel.Width = 44
            EditLabel.Height = 15
            EditLabel.Caption = 'N'#250'mero'
            TabOrder = 9
            Text = ''
          end
          object lbledtPais: TLabeledEdit
            Left = 16
            Top = 191
            Width = 221
            Height = 23
            EditLabel.Width = 21
            EditLabel.Height = 15
            EditLabel.Caption = 'Pa'#237's'
            TabOrder = 10
            Text = ''
          end
        end
      end
      object pnl2: TPanel
        Left = 375
        Top = 0
        Width = 477
        Height = 410
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitHeight = 310
        object grp4: TGroupBox
          AlignWithMargins = True
          Left = 3
          Top = 3
          Width = 471
          Height = 404
          Align = alClient
          Caption = 'Informa'#231#245'es pessoais'
          TabOrder = 0
          ExplicitHeight = 304
          DesignSize = (
            471
            404)
          object grpDataDeNascimento: TGroupBox
            Left = 18
            Top = 125
            Width = 183
            Height = 52
            Caption = 'Data de nascimento'
            TabOrder = 0
            object dtpDataDeNascimento: TDateTimePicker
              AlignWithMargins = True
              Left = 5
              Top = 20
              Width = 173
              Height = 27
              Align = alClient
              Date = 45450.000000000000000000
              Time = 0.822643333332962400
              TabOrder = 0
            end
          end
          object lbledtCPF: TLabeledEdit
            Left = 16
            Top = 200
            Width = 392
            Height = 23
            EditLabel.Width = 21
            EditLabel.Height = 15
            EditLabel.Caption = 'CPF'
            EditMask = '999\.999\.999\-99;1;_'
            MaxLength = 14
            TabOrder = 1
            Text = '   .   .   -  '
            StyleName = 'Windows'
          end
          object rgSexo: TRadioGroup
            AlignWithMargins = True
            Left = 18
            Top = 229
            Width = 207
            Height = 68
            Caption = 'Sexo'
            Columns = 2
            Items.Strings = (
              'Masculino'
              'Feminino')
            TabOrder = 2
            StyleName = 'Windows'
            OnExit = rgSexoExit
          end
          object rgEstadoCivil: TRadioGroup
            AlignWithMargins = True
            Left = 248
            Top = 229
            Width = 217
            Height = 68
            Anchors = [akTop, akRight]
            Caption = 'Estado civil'
            Columns = 2
            Items.Strings = (
              'Solteiro(a)'
              'Casado(a)')
            TabOrder = 3
            OnExit = rgEstadoCivilExit
          end
        end
        object lbledtNome: TLabeledEdit
          Left = 19
          Top = 43
          Width = 393
          Height = 23
          EditLabel.Width = 33
          EditLabel.Height = 15
          EditLabel.Caption = 'Nome'
          TabOrder = 1
          Text = ''
          OnExit = lbledtNomeExit
        end
        object lbledtNacionalidade: TLabeledEdit
          Left = 19
          Top = 99
          Width = 393
          Height = 23
          EditLabel.Width = 76
          EditLabel.Height = 15
          EditLabel.Caption = 'Nacionalidade'
          TabOrder = 2
          Text = ''
        end
      end
    end
  end
  object qryListagem: TADOQuery
    Connection = dtmdlDBConnection.conDatabaseConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 423
    Top = 173
  end
  object dsListagem: TDataSource
    DataSet = qryListagem
    Left = 527
    Top = 173
  end
  object rstclntClientCEP: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'utf-8, *;q=0.8'
    Params = <>
    SynchronizedEvents = False
    Left = 88
    Top = 96
  end
  object rstrqstRequestCEP: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = rstclntClientCEP
    Params = <>
    Response = rstrspnsResponseCEP
    SynchronizedEvents = False
    Left = 88
    Top = 160
  end
  object rstrspnsResponseCEP: TRESTResponse
    ContentType = 'text/html'
    Left = 88
    Top = 216
  end
end
