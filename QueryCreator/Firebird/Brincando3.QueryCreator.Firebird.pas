unit Brincando3.QueryCreator.Firebird;

interface

uses
  Brincando3.QueryCreator.Interfaces,
  Brincando3.QueryCreator.Firebird.Insert;

type
  TQueryCreatorFirebird = class(TInterfacedObject, iQueryCreator)
  protected
    FQuery: String;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iQueryCreator;
    function Insert(aTable : String): iInsert;
    function Query(aValue : String) : iQueryCreator; overload;
    function Query: String; overload;
  end;

implementation

{ TQueryCreator }

constructor TQueryCreatorFirebird.Create;
begin

end;

destructor TQueryCreatorFirebird.Destroy;
begin

  Inherited;
end;

function TQueryCreatorFirebird.Insert(aTable : String): iInsert;
begin
  Result := TFirebirdInsert.New(Self, aTable);
end;

class function TQueryCreatorFirebird.New: iQueryCreator;
begin
  Result := Self.Create;
end;

function TQueryCreatorFirebird.Query(aValue: String): iQueryCreator;
begin
  Result := Self;
  FQuery := aValue;
end;

function TQueryCreatorFirebird.Query: String;
begin
  Result := FQuery;
end;

end.
