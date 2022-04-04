unit Brincando3.Controller.Produto;

interface

uses
  Vcl.Forms,
  Brincando3.Model.Interfaces,
  Brincando3.Model.Produto,
  Brincando3.Dao.Interfaces,
  Brincando3.Controller.Factory.Dao, Brincando3.Model.Atributes;

type
  TControllerProduto = class(TInterfacedObject, iProduto)
  private
    FObject: TModelProduto;
    FForm: TForm;
    procedure Limpar;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iProduto;
    function SetForm(aForm: TForm): iProduto;
    function PreencheObjeto(aEscopo: TEscopo): iProduto;
    function PreencheView(aEscopo: TEscopo): iProduto;
    function Dao: iDAO;
  end;

implementation

uses
  Brincando3.Uteis.ManipulaComponentes;

constructor TControllerProduto.Create;
begin
  FObject := TModelProduto.Create;
end;

function TControllerProduto.Dao: iDAO;
begin
  Result := TFactoryDao.New.FireDac(FObject);
end;

destructor TControllerProduto.Destroy;
begin
  FObject.Free;
  Inherited;
end;

procedure TControllerProduto.Limpar;
begin
  FObject.Free;
  FObject := TModelProduto.Create;
end;

class function TControllerProduto.New: iProduto;
begin
  Result := Self.Create;
end;

function TControllerProduto.PreencheObjeto(aEscopo: TEscopo): iProduto;
begin
  Result := Self;
  Limpar;
  TUteisManipulaComponentes.PreencheObjeto(FObject,FForm,'PRODUTO',aEscopo);
end;

function TControllerProduto.PreencheView(aEscopo: TEscopo): iProduto;
begin
  Result := Self;
  TUteisManipulaComponentes.PreencheView(FObject,FForm,'PRODUTO',aEscopo);
end;

function TControllerProduto.SetForm(aForm: TForm): iProduto;
begin
  Result := Self;
  FForm := aForm;
end;

end.
