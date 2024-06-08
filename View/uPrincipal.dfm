object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'HSS Produ'#231#245'es'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = mmPrincipal
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object pnlAvaliacaoLogica: TPanel
    Left = 0
    Top = 0
    Width = 628
    Height = 113
    Align = alTop
    TabOrder = 0
    object lbledtAvaliacaoLogica: TLabeledEdit
      Left = 16
      Top = 46
      Width = 177
      Height = 23
      EditLabel.Width = 89
      EditLabel.Height = 15
      EditLabel.Caption = 'Avalia'#231#227'o L'#243'gica'
      TabOrder = 0
      Text = ''
    end
    object btnSomar: TButton
      Left = 208
      Top = 45
      Width = 75
      Height = 25
      Caption = 'Somar'
      TabOrder = 1
      OnClick = btnSomarClick
    end
  end
  object mmPrincipal: TMainMenu
    Left = 296
    Top = 224
    object mniCadastro: TMenuItem
      Caption = 'Cadastro'
      object mniTitulares: TMenuItem
        Caption = 'Titulares'
        OnClick = mniTitularesClick
      end
      object mniN1: TMenuItem
        Caption = '-'
      end
      object mniSair: TMenuItem
        Caption = 'Sair'
        OnClick = mniSairClick
      end
    end
  end
end
