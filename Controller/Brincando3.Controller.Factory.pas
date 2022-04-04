unit Brincando3.Controller.Factory;

interface

uses
  Brincando3.Controller.Factory.Interfaces,
  Brincando3.Model.Interfaces,
  Brincando3.Controller.Produto;

type
  TFactoryController = class(TInterfacedObject, iFactoryModel)
    private
      FProduto : iProduto;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iFactoryModel;
      function Produto : iProduto;
  end;

implementation

constructor TFactoryController.Create;
begin
  FProduto := TControllerProduto.New;
end;

destructor TFactoryController.Destroy;
begin

  Inherited;
end;

class function TFactoryController.New: iFactoryModel;
begin
  Result := Self.Create;
end;

function TFactoryController.Produto: iProduto;
begin
  Result := FProduto;
end;

end.
