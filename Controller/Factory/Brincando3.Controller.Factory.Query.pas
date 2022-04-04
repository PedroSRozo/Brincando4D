unit Brincando3.Controller.Factory.Query;

interface

uses
  Brincando3.Controller.Factory.Interfaces,
  Brincando3.Dao.Interfaces,
  Brincando3.Dao.Query.FireDac;

type
  TFactoryQuery = class(TInterfacedObject, iFactoryQuery)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFactoryQuery;
    function FireDac: iQuery;
  end;

implementation

{ TFactoryQuery }

constructor TFactoryQuery.Create;
begin

end;

destructor TFactoryQuery.Destroy;
begin

  Inherited;
end;

function TFactoryQuery.FireDac: iQuery;
begin
  Result := TQueryFireDac.New;
end;

class function TFactoryQuery.New: iFactoryQuery;
begin
  Result := Self.Create;
end;

end.
