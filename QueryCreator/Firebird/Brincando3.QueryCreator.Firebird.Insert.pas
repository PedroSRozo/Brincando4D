unit Brincando3.QueryCreator.Firebird.Insert;

interface

uses
  Brincando3.QueryCreator.Interfaces;

type
  TFirebirdInsert = class(TInterfacedObject, iInsert)
  private
    FParent : iQueryCreator;
    FQuery : String;
  public
    constructor Create(aParent: iQueryCreator; aTable : String);
    destructor Destroy; override;
    class function New(aParent: iQueryCreator; aTable : String): iInsert;
    function Campos(aValue: String): iInsert;
    function Valores(aValue: String): iInsert;
    function &End: iQueryCreator;
  end;

implementation

{ TFirebirdInsert }

function TFirebirdInsert.Campos(aValue: String): iInsert;
begin
  Result := Self;
  FQuery := FQuery + ' (' + aValue + ') ';
end;

function TFirebirdInsert.&End: iQueryCreator;
begin
  Result := FParent.Query(FQuery);
end;

constructor TFirebirdInsert.Create(aParent: iQueryCreator; aTable : String);
begin
  FParent := aParent;
  FQuery := 'INSERT INTO ' + aTable;
end;

destructor TFirebirdInsert.Destroy;
begin

  Inherited;
end;

class function TFirebirdInsert.New(aParent: iQueryCreator; aTable : String): iInsert;
begin
  Result := Self.Create(aParent, aTable);
end;

function TFirebirdInsert.Valores(aValue: String): iInsert;
begin
  Result := Self;
  FQuery := FQuery + ' VALUES (' + aValue + ') ';
end;

end.
