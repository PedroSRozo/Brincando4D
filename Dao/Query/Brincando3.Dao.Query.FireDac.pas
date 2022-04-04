unit Brincando3.Dao.Query.FireDac;

interface

uses
  System.Generics.Collections,
  Brincando3.Dao.Interfaces, System.SysUtils;

type
  TQueryFireDac = class(TInterfacedObject, iQuery)
  private
    FConnection : String;
    FQuery : String;
    FParams : TList<String>;
  public
    constructor Create(aConnection : String);
    destructor Destroy; override;
    class function New: iQuery; overload;
    class function New(aConnection : String): iQuery; overload;
    function SQL(aValue: String): iQuery;
    function AddParam(aKey: String; aValue: String): iQuery; overload;
    function AddParam(aKey: String; aValue: Integer): iQuery; overload;
    function AddParam(aKey: String; aValue: Currency): iQuery; overload;
    function Execute: iQuery;
  end;

implementation

{ TQueryFireDac }

function TQueryFireDac.AddParam(aKey, aValue: String): iQuery;
begin
  Result := Self;
  FParams.Add(aKey + ' - ' + aValue);
end;

function TQueryFireDac.AddParam(aKey: String; aValue: Integer): iQuery;
begin
  Result := Self;
  FParams.Add(aKey + ' - ' + IntToStr(aValue));
end;

function TQueryFireDac.AddParam(aKey: String; aValue: Currency): iQuery;
begin
  Result := Self;
  FParams.Add(aKey + ' - ' + CurrToStr(aValue));
end;

constructor TQueryFireDac.Create(aConnection : String);
begin
  if aConnection = EmptyStr then
    aConnection := 'conexao';

  FConnection := aConnection;
  FParams := TList<String>.Create;
end;

destructor TQueryFireDac.Destroy;
begin
  FParams.Free;
  Inherited;
end;

function TQueryFireDac.Execute: iQuery;
var
  LResultado : String;
  Param: String;
begin
  LResultado := 'Query: ' + FQuery + sLineBreak;
  LResultado := LResultado + 'Parametros: ' + sLineBreak;
  for Param in FParams do
    LResultado := LResultado + sLineBreak + Param;

  Result := Self;
  raise Exception.Create(LResultado);
end;

class function TQueryFireDac.New: iQuery;
begin
  Result := Self.Create('');
end;

class function TQueryFireDac.New(aConnection : String): iQuery;
begin
  Result := Self.Create(aConnection);
end;

function TQueryFireDac.SQL(aValue: String): iQuery;
begin
  Result := Self;
  FQuery := aValue;
end;

end.
