unit ClinicPlus.Form;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ListBox, FMX.MultiView, FMX.Objects, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Ani, FMX.TabControl, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, system.JSON, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.FMXUI.Wait, FMX.Edit;

type
  TClinicPlusForm = class(TForm)
    TopRCT: TRectangle;
    MenuBTN: TButton;
    AtualizarBTN: TButton;
    Label1: TLabel;
    ButtonRCT: TRectangle;
    ScheduleLYT: TLayout;
    SchedulePTH: TPath;
    HomeLYT: TLayout;
    HomePTH: TPath;
    HistoryLYT: TLayout;
    HistoryPTH: TPath;
    AnimeLYT: TLayout;
    AnimeRCT: TRectangle;
    MultiView1: TMultiView;
    MenuLST: TListBox;
    ColorAnimation1: TColorAnimation;
    ListBoxitem1: TListBox;
    ListBoxItem2: TListBox;
    ListBoxItem3: TListBox;
    ListBoxItem4: TListBox;
    ListBoxItem5: TListBox;
    ContentTBC: TTabControl;
    ScheduleTBC: TTabItem;
    HomeTBC: TTabItem;
    HistoryTBC: TTabItem;
    ScheduleLTV: TListView;
    HistoryLTV: Tlistview;
    Layout1: TLayout;
    Circle1: TCircle;
    NameLBL: TLabel;
    cpflbl: TLabel;
    ClienteMTB: TFDMemTable;
    AgendamentoMTB: TFDMemTable;
    HistoricoMTB: TFDMemTable;
    ClienteMTBidcliente: TAutoIncField;
    ClienteMTBNome: TStringField;
    ClienteMTBCpf: TStringField;
    ClienteMTBNascimento: TDateTimeField;
    ClienteMTBFoto: TBlobField;
    AgendamentoMTBidagendamento: TAutoIncField;
    AgendamentoMTBidfuncionario: TIntegerField;
    AgendamentoMTBidcliente: TIntegerField;
    AgendamentoMTBidlocal: TIntegerField;
    AgendamentoMTBidadmin: TIntegerField;
    AgendamentoMTBdata_agendamento: TDateField;
    AgendamentoMTBhora_agendamento: TTimeField;
    AgendamentoMTBdata_atendimento: TDateField;
    AgendamentoMTBhora_atendimento: TTimeField;
    AgendamentoMTBdata_confirmacao: TDateTimeField;
    AgendamentoMTBdata_cadastro: TDateTimeField;
    AgendamentoMTBfg_status: TStringField;
    AgendamentoMTBprofissional: TStringField;
    AgendamentoMTBpaciente: TStringField;
    AgendamentoMTBlocal: TStringField;
    HistoricoMTBidagendamento: TAutoIncField;
    HistoricoMTBidfuncionario: TIntegerField;
    HistoricoMTBidcliente: TIntegerField;
    HistoricoMTBidlocal: TIntegerField;
    HistoricoMTBidadmin: TIntegerField;
    HistoricoMTBdata_confirmacao: TDateTimeField;
    HistoricoMTBdata_agendamento: TDateField;
    HistoricoMTBhora_agendamento: TTimeField;
    HistoricoMTBdata_atendimento: TDateField;
    HistoricoMTBhora_atendimento: TTimeField;
    HistoricoMTBdata_cadastro: TDateTimeField;
    HistoricoMTBfg_status: TStringField;
    HistoricoMTBprofissional: TStringField;
    HistoricoMTBpaciente: TStringField;
    HistoricoMTBlocal: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    BindSourceDB2: TBindSourceDB;
    LinkListControlToField2: TLinkListControlToField;
    FDConnection1: TFDConnection;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Circle2: TCircle;
    procedure ScheduleLYTClick(Sender: TObject);

    procedure HomeLYTClick(Sender: TObject);
    procedure HistoryLYTClick(Sender: TObject);
    procedure AtualizarBTNClick(Sender: TObject);
    procedure ScheduleLTVUpdateObjects(const Sender: TObject;
      const AItem: TListViewItem);
    procedure ScheduleLTVButtonClick(const Sender: TObject;
      const AItem: TListItem; const AObject: TListItemSimpleControl);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Procedure GetAgendamentoAtivo(const AToken: String);
    procedure GetHistorico(const AToken: String);
        procedure GetCliente(const AToken: String);
            procedure LoadCliente(const AToken: String);
    Procedure ChangeSchedule(const AID: integer; Json: TJsonObject);
    Procedure Login(Const ID, CPF: String);

  end;

  const


  //EnderecoServidor = 'http://localhost:9000/';
  EnderecoServidor =  'http://192.168.137.1:9000/';
  //Token = 'bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE3MzI2MjY0NDksImV4cCI6MTczMjcxMjg0'+
  //'OSwiaXNzIjoibG9jYWxob3N0IiwiaWQiOiIxIiwibm9tZSI6IkRFTkl'+
  //'MU09OIE1PUklMSU4iLCJjcGYiOiI0NDQuNDQ0LjQ0NC00NCIsIm5hc2NpbWV'+
  //'udG8iOiIxOFwvMTBcL'+
  //'zE5NzIifQ.l-WqixmLLkBMs8mm9067Y_mGhVi7rWB6TBPj9w_N1TY';
var
  ClinicPlusForm: TClinicPlusForm;
  //UserId: Integer;
  token : string;

implementation

Uses RESTRequest4D, Dataset.Serialize, System.Threading, DataSet.Serialize.Adapter.RESTRequest4D;

{$R *.fmx}



procedure TClinicPlusForm.AtualizarBTNClick(Sender: TObject);
begin
//ttask.Run(Procedure
//begin
GetAgendamentoAtivo(token);
GetHistorico(token);

//end);


end;

procedure TClinicPlusForm.Button1Click(Sender: TObject);
begin
if (edit1.Text ='') or (edit2.Text='') then
raise Exception.Create('Informe o ID e o CPF');

Ttask.Run(procedure
  begin
    login(edit1.Text, edit2.Text)  ;
    loadcliente(token);
    getagendamentoativo(token);
    gethistorico(token);
    Tthread.Synchronize(tthread.current, procedure begin

    circle2.fill.Bitmap.Assign(circle1.fill.Bitmap) ;
    multiview1.HideMaster;

    end);


  end);
end;

procedure TClinicPlusForm.ChangeSchedule(const AID: integer; Json: TJsonObject);
begin
  Trequest.New.BaseURL(EnderecoServidor+'agendamento').
  ResourceSuffix(AID.ToString).AddBody(Json,false)
  .Accept('application/json').Put;
end;

procedure TClinicPlusForm.FormCreate(Sender: TObject);
begin
Tdatasetserializeconfig.GetInstance.CaseNameDefinition:= TcaseNameDefinition.cndLower;

animerct.Position.X:=homelyt.Position.X;

//Ttask.Run(procedure
//begin
 //  LoadCliente(Token);
  // Getagendamentoativo(Token);
   //GetHistorico(Token);
//end);

Multiview1.ShowMaster;
edit1.SetFocus;
end;

procedure TClinicPlusForm.GetAgendamentoAtivo(const AToken: string);
begin
   TRequest.New.BaseURL(Enderecoservidor+'agendamento')
   .AddHeader('Authorization',AToken,[poDoNotEncode])
   .AddParam('fg_status','a')        //AddParam('idcliente',User.ToString).
   .Accept('aplication/json')
   .Adapters(TDataSetSerializeAdapter.New(AgendamentoMtb)).Get;


end;

procedure TClinicPlusForm.GetCliente(const AToken: string);
begin
  TRequest.New.BaseURL(EnderecoServidor+'cliente').AddHeader('Authorization',AToken,[poDoNotEncode])
                      //ResourceSuffix(ID.ToString)
  .accept('aplication/json').Adapters(TDataSetSerializeAdapter.New(ClienteMTB)).Get;

end;

procedure TClinicPlusForm.GetHistorico(const Atoken: String);
begin
  TRequest.New.BaseURL(EnderecoServidor+'agendamento').AddHeader('Authorization',AToken,[poDoNotEncode])
                                                                    //AddParam('idcliente',User.ToString)
  .Accept('application/json')
  .Adapters(TDataSetSerializeAdapter.New(historicoMTB)).Get;

end;

procedure TClinicPlusForm.HistoryLYTClick(Sender: TObject);
begin
    Tanimator.AnimateFloat(AnimeRCT, 'position.x', historyLYT.Position.X, 0.5,
TanimationType.Out, TinterpolationType.Bounce);

ContentTBC.SetActiveTabWithTransitionAsync(historyTBC,
 Ttabtransition.slide,Ttabtransitiondirection.normal,nil);
end;

procedure TClinicPlusForm.HomeLYTClick(Sender: TObject);
var TabDirection: TTabTransitionDirection;
begin
  if ContentTBC.ActiveTab.Index > HomeTBC.Index then
  Tabdirection := Ttabtransitiondirection.Reversed
  else
  TabDirection := TtabtransitionDirection.Normal;
  Tanimator.AnimateFloat( AnimeRCT,'position.x',Homelyt.Position.X,0.5, tAnimationType.Out,
  Tinterpolationtype.Bounce);
  Contenttbc.SetActiveTabWithTransitionAsync(hometbc,
  Ttabtransition.Slide,tabdirection,nil);

end;

procedure TClinicPlusForm.LoadCliente(const Atoken: string);
var
  FotoStream: TmemoryStream;
  BrushBmp: TBrushBitmap;
begin
  //GetCliente(ID);
  GetCliente(Atoken);
   Tthread.Synchronize(Tthread.CurrentThread, procedure
   begin
   NameLBL.Text := ClienteMTBnome.AsString;
   CPFLBL.Text := ClienteMTBCPF.AsString;
   FotoStream := TmemoryStream.Create;
   BrushBmp := TbrushBitmap.Create;

   try
   ClienteMTBFoto.SaveToStream(FotoStream);
   BrushBmp.Bitmap.LoadFromStream(FotoStream);
   BrushBmp.WrapMode := TwrapMode.TileStretch;
   Circle1.Fill.Bitmap.Assign(BrushBmp);

   finally
         FotoStream.Free;
         Brushbmp.Free;
   end;
   end);
end;


procedure TClinicPlusForm.Login(const ID, CPF: String);
var
JSON: TJSONobject;
Resposta: IResponse;
begin
JSON:= TJSONobject.Create;
try
  Json.AddPair('idcliente', id);
   Json.AddPair('cpf', cpf);
   try
   Resposta := Trequest.New.BaseURL(EnderecoServidor+'token').AddBody(JSON, false).Accept('application/json')
   .post;

   if Resposta.StatusCode=200 then
   begin
     Token := 'Bearer '+Resposta.Content;
   end else
   begin
     showmessage('falha na autenticação'+ Resposta.Content);
   end;
   except
   on E:Exception do begin
     Showmessage('Falha no Login' + E.Message);
   end;

   end;

finally
     JSON.Free;
end;

end;

procedure TClinicPlusForm.ScheduleLTVButtonClick(const Sender: TObject;
  const AItem: TListItem; const AObject: TListItemSimpleControl);
  var
  JSON: TJSONObject;
begin

  if Aobject.Name.ToLower = 'confirmabutton' then
  begin
   AgendamentoMTB.Edit;
   AgendamentoMTBfg_status.AsString := 'C';
   AgendamentoMTBdata_confirmacao.Value := now;
   AgendamentoMTB.Post;
   JSON := AgendamentoMTB.ToJSONObject();
   Changeschedule(AgendamentoMTBidagendamento.Value, JSON);
   Json.Free;

  end;

    if Aobject.Name.ToLower = 'cancelabutton' then
   begin

   AgendamentoMTB.Edit;
   AgendamentoMTBfg_status.AsString := 'I';
   AgendamentoMTBdata_confirmacao.Value := now;
   AgendamentoMTB.Post;
   JSON := AgendamentoMTB.ToJSONObject();
   Changeschedule(AgendamentoMTBidagendamento.Value, JSON);
   Json.Free;

   end;

   Ttask.Run(Procedure
   begin
   sleep(50);
   AgendamentoMTB.EmptyDataSet;
   HistoricoMTB.EmptyDataSet;
   getagendamentoativo(Token);
   GetHistorico(Token);
   end);

end;

procedure TClinicPlusForm.ScheduleLTVUpdateObjects(const Sender: TObject;
  const AItem: TListViewItem);
begin
 AItem.Objects.DrawableByName('ConfirmaButton').Height:=37;
  AItem.Objects.DrawableByName('CancelaButton').Height:=37;

end;

procedure TClinicPlusForm.ScheduleLYTClick(Sender: TObject);
begin
Tanimator.AnimateFloat(AnimeRCT, 'position.x', ScheduleLYT.Position.X, 0.5,
TanimationType.Out, TinterpolationType.Bounce);

ContentTBC.SetActiveTabWithTransitionAsync(ScheduleTBC,
 Ttabtransition.slide,Ttabtransitiondirection.Reversed,nil);

end;

end.
