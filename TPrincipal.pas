unit TPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, REST.Types, Data.Bind.Components,
  Data.Bind.ObjectScope, REST.Client, Vcl.StdCtrls,System.JSON,Vcl.Clipbrd;

type
  TForm1 = class(TForm)
    Button1: TButton;
    edtUsername: TEdit;
    edtPassword: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtWellKnown: TEdit;
    Label3: TLabel;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    edtClientId: TEdit;
    Label4: TLabel;
    memoToken: TMemo;
    CopyToken: TButton;
    procedure Button1Click(Sender: TObject);
    procedure CopyTokenClick(Sender: TObject);
  private
    function GetJsonValue(psValue, psJson: String):String;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  sTokenEndpoint:String;
  sJwksUri:String;
begin
  RESTClient1.ResetToDefaults;
  RESTRequest1.Method := TRESTRequestMethod.rmGet;
  RESTClient1.BaseURL := edtWellKnown.Text;
  RESTRequest1.Execute;

  if not RESTResponse1.Status.Success then
    raise Exception.Create('Sorry, was unable to get token url');

  //first, get token url
  RESTResponse1.GetSimpleValue('token_endpoint',sTokenEndpoint);
  //get certificate to validate token on jwt.io
  RestResponse1.GetSimpleValue('jwks_uri',sJwksUri);

  //Set openid params to authenticate
  RESTClient1.ResetToDefaults;
  RESTClient1.BaseURL := sTokenEndpoint;
  RESTRequest1.Method := TRESTRequestMethod.rmPOST;
  RESTRequest1.AddParameter('client_id',edtClientId.Text,TRESTRequestParameterKind.pkGETorPOST);
  RESTRequest1.AddParameter('grant_type','password',TRESTRequestParameterKind.pkGETorPOST);
  Restrequest1.AddParameter('username',edtusername.Text,TRESTRequestParameterKind.pkGETorPOST);
  Restrequest1.AddParameter('password',edtPassword.Text,TRESTRequestParameterKind.pkGETorPOST);

  RESTRequest1.Execute;
  memoToken.Text := RESTRequest1.Response.Content;
end;

procedure TForm1.CopyTokenClick(Sender: TObject);
begin
  ClipBoard.AsText := GetJsonValue('access_token',memoToken.Text);
end;

function TForm1.GetJsonValue(psValue:String;psJson:String):string;
var
  json:TJSONObject;
  jsonValue:TJsonValue;
begin
  json := TJSONObject.Create;
  try
    jsonValue := json.ParseJSONValue(psJson);
    result := jsonValue.FindValue(psvalue).Value;
  finally
    FreeAndNil(json);
  end;

end;

end.
