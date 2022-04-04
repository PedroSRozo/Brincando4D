unit Brincando3.View.Principal;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Brincando3.Controller.Factory.Interfaces,
  Brincando3.Controller.Factory,
  Brincando3.Model.Atributes, Vcl.ExtCtrls;

type
  TForm10 = class(TForm)
    Button1: TButton;
    [DBBind('Descricao', 'PRODUTO', eGravar)]
    Edit1: TEdit;
    [DBBind('Referencia', 'PRODUTO', eGravar)]
    Edit2: TEdit;
    [DBBind('Valor', 'PRODUTO', eGravar)]
    Edit3: TEdit;
    [DBBind('Estoque', 'PRODUTO', eGravar)]
    LabeledEdit1: TLabeledEdit;
    [DBBind('isAtivo', 'PRODUTO', eGravar)]
    CheckBox1: TCheckBox;

    [DBBind('Descricao', 'PRODUTO', eConsultar)]
    Edit5: TEdit;
    [DBBind('Referencia', 'PRODUTO', eConsultar)]
    LabeledEdit2: TLabeledEdit;
    [DBBindValue('Valor', 'PRODUTO', eConsultar)]
    Edit7: TEdit;
    [DBBind('Estoque', 'PRODUTO', eConsultar)]
    Edit8: TEdit;
    [DBBind('isAtivo', 'PRODUTO', eConsultar)]
    CheckBox2: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Button2: TButton;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    FFactory: iFactoryModel;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);
begin
  FFactory.Produto.PreencheObjeto(eGravar).Dao.Gravar;
end;

procedure TForm10.Button2Click(Sender: TObject);
begin
  FFactory.Produto.Dao.Select(1);//.EndDao.This.PreencheView(eConsultar);
  FFactory.Produto.PreencheView(eConsultar);
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
  FFactory := TFactoryController.New;
  FFactory.Produto.SetForm(Self);
end;

end.
