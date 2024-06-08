inherited frmTitular: TfrmTitular
  Caption = 'frmTitular'
  TextHeight = 15
  inherited pnlRodape: TPanel
    ExplicitLeft = 27
    ExplicitWidth = 1077
    inherited bvl1: TBevel
      Width = 78
      ExplicitWidth = 78
    end
    inherited btnCancelar: TBitBtn
      Left = 415
      ExplicitLeft = 415
    end
    inherited btnFechar: TBitBtn
      AlignWithMargins = True
      Left = 769
      Width = 84
      ExplicitLeft = 769
      ExplicitWidth = 84
    end
    inherited dbnvgr1: TDBNavigator
      Left = 496
      Hints.Strings = ()
      ExplicitLeft = 496
    end
    inherited btnGravar: TBitBtn
      Left = 334
      ExplicitLeft = 334
    end
  end
  inherited pgcPrincipal: TPageControl
    inherited tsListagem: TTabSheet
      inherited dbgrdListagem: TDBGrid
        DataSource = dsListagem
        OnCellClick = dbgrdListagemCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nacionalidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataNascimento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Sexo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EstadoCivil'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Logradouro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Numero'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Complemento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Bairro'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CEP'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Pais'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DataInclusao'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FlagAtivo'
            Visible = True
          end>
      end
    end
    inherited tsCadastroTitulares: TTabSheet
      inherited pnl1: TPanel
        Width = 372
        ExplicitWidth = 372
        inherited grp2: TGroupBox
          Width = 366
          ExplicitTop = 3
          ExplicitHeight = 304
        end
      end
      inherited pnl2: TPanel
        Left = 372
        Width = 480
        ExplicitLeft = 372
        ExplicitWidth = 480
        inherited grp4: TGroupBox
          Width = 474
          ExplicitWidth = 474
          DesignSize = (
            474
            404)
        end
      end
    end
  end
  inherited qryListagem: TADOQuery
    Active = True
    SQL.Strings = (
      'SELECT * FROM Titular')
    object intgrfldListagemID: TIntegerField
      FieldName = 'ID'
    end
    object strngfldListagemNome: TStringField
      FieldName = 'Nome'
      Size = 255
    end
    object strngfldListagemNacionalidade: TStringField
      FieldName = 'Nacionalidade'
      Size = 255
    end
    object dtmfldListagemDataNascimento: TDateTimeField
      FieldName = 'DataNascimento'
    end
    object strngfldListagemCPF: TStringField
      FieldName = 'CPF'
      Size = 255
    end
    object strngfldListagemSexo: TStringField
      FieldName = 'Sexo'
      FixedChar = True
      Size = 1
    end
    object strngfldListagemEstadoCivil: TStringField
      FieldName = 'EstadoCivil'
      FixedChar = True
      Size = 1
    end
    object strngfldListagemLogradouro: TStringField
      FieldName = 'Logradouro'
      Size = 255
    end
    object strngfldListagemNumero: TStringField
      FieldName = 'Numero'
      Size = 255
    end
    object strngfldListagemComplemento: TStringField
      FieldName = 'Complemento'
      Size = 255
    end
    object strngfldListagemBairro: TStringField
      FieldName = 'Bairro'
      Size = 255
    end
    object strngfldListagemCEP: TStringField
      FieldName = 'CEP'
      Size = 255
    end
    object strngfldListagemCidade: TStringField
      FieldName = 'Cidade'
      Size = 255
    end
    object strngfldListagemUF: TStringField
      FieldName = 'UF'
      Size = 255
    end
    object strngfldListagemPais: TStringField
      FieldName = 'Pais'
      Size = 255
    end
    object dtmfldListagemDataInclusao: TDateTimeField
      FieldName = 'DataInclusao'
    end
    object strngfldListagemFlagAtivo: TStringField
      FieldName = 'FlagAtivo'
      FixedChar = True
      Size = 1
    end
  end
end
