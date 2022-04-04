unit Brincando3.Controller.Factory.QueryCreator;

interface

uses
  Brincando3.Controller.Factory.Interfaces,
  Brincando3.QueryCreator.Interfaces,
  Brincando3.QueryCreator.Firebird;

type
  TFactoryQueryCreator = class(TInterfacedObject, iFactoryQueryCreator)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFactoryQueryCreator;
    function Firebird : iQueryCreator;
  end;

implementation

{ TFactoryQueryCreator }

constructor TFactoryQueryCreator.Create;
begin

end;

destructor TFactoryQueryCreator.Destroy;
begin

  Inherited;
end;

function TFactoryQueryCreator.Firebird: iQueryCreator;
begin
  Result := TQueryCreatorFirebird.New;
end;

class function TFactoryQueryCreator.New: iFactoryQueryCreator;
begin
  Result := Self.Create;
end;

end.
