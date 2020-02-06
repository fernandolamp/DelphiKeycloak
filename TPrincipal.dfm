object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Token from keycloak'
  ClientHeight = 353
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 15
    Width = 22
    Height = 13
    Caption = 'User'
  end
  object Label2: TLabel
    Left = 16
    Top = 66
    Width = 46
    Height = 13
    Caption = 'Password'
  end
  object Label3: TLabel
    Left = 192
    Top = 16
    Width = 58
    Height = 13
    Caption = 'Well Known '
  end
  object Label4: TLabel
    Left = 16
    Top = 120
    Width = 41
    Height = 13
    Caption = 'Client ID'
  end
  object Button1: TButton
    Left = 16
    Top = 164
    Width = 75
    Height = 25
    Caption = 'Get Token'
    TabOrder = 0
    OnClick = Button1Click
  end
  object edtUsername: TEdit
    Left = 16
    Top = 34
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtPassword: TEdit
    Left = 16
    Top = 85
    Width = 121
    Height = 21
    PasswordChar = '*'
    TabOrder = 2
  end
  object edtWellKnown: TEdit
    Left = 184
    Top = 34
    Width = 425
    Height = 21
    TabOrder = 3
    Text = 
      'http://localhost:8080/auth/realms/master/.well-known/openid-conf' +
      'iguration'
  end
  object edtClientId: TEdit
    Left = 16
    Top = 139
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object memoToken: TMemo
    Left = 184
    Top = 61
    Width = 425
    Height = 252
    TabOrder = 5
  end
  object CopyToken: TButton
    Left = 184
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Copy'
    TabOrder = 6
    OnClick = CopyTokenClick
  end
  object Button2: TButton
    Left = 344
    Top = 320
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 7
    OnClick = Button2Click
  end
  object edtAcesscode: TEdit
    Left = 440
    Top = 319
    Width = 177
    Height = 21
    TabOrder = 8
  end
  object RESTClient1: TRESTClient
    Authenticator = OAuth2Authenticator1
    Params = <>
    Left = 24
    Top = 200
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 64
    Top = 200
  end
  object RESTResponse1: TRESTResponse
    Left = 104
    Top = 200
  end
  object OAuth2Authenticator1: TOAuth2Authenticator
    OnAuthenticate = OAuth2Authenticator1Authenticate
    AccessTokenEndpoint = 
      'http://localhost:8080/auth/realms/master/protocol/openid-connect' +
      '/token'
    AuthCode = 'y0hCuijngkOP5Iq-f8hj4t3GFNeacuqwzGUmBMqikSQ'
    AuthorizationEndpoint = 
      'http://localhost:8080/auth/realms/master/protocol/openid-connect' +
      '/auth'
    ClientID = 'login-auth'
    ClientSecret = 'b507c146-5ec8-4911-8ac8-e579ab10d83f'
    Left = 296
    Top = 176
  end
end
