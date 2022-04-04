unit Brincando3.Model.Atributes;

interface

type
  TEscopo = (eGravar, eConsultar);
  DBUniqueKey = class(TCustomAttribute);

  DBBindValue = class(TCustomAttribute)
  private
    FName: String;
    FEscopo: TEscopo;
    FCampo: String;
  public
    constructor Create(aCampo, aName: String; aEscopo: TEscopo);
    property Campo: String read FCampo write FCampo;
    property Name: String read FName write FName;
    property Escopo: TEscopo read FEscopo write FEscopo;
  end;

  DBBind = class(TCustomAttribute)
  private
    FName: String;
    FEscopo: TEscopo;
    FCampo: String;
  public
    constructor Create(aCampo, aName: String; aEscopo: TEscopo);
    property Campo: String read FCampo write FCampo;
    property Name: String read FName write FName;
    property Escopo: TEscopo read FEscopo write FEscopo;
  end;

  DBTable = class(TCustomAttribute)
  private
    FTable: String;
  public
    constructor Create(aTable: String);
    property Table: String read FTable write FTable;
  end;

  DBName = class(TCustomAttribute)
  private
    FName: String;
  public
    constructor Create(aNome: String);
    property Name: String read FName write FName;
  end;

implementation

{ DBName }

constructor DBName.Create(aNome: String);
begin
  FName := aNome;
end;

{ DBTable }

constructor DBTable.Create(aTable: String);
begin
  FTable := aTable;
end;

{ DBBind }

constructor DBBind.Create(aCampo, aName: String; aEscopo: TEscopo);
begin
  FCampo := aCampo;
  FName := aName;
  FEscopo := aEscopo;
end;

{ DBBindValue }

constructor DBBindValue.Create(aCampo, aName: String; aEscopo: TEscopo);
begin
  FCampo := aCampo;
  FName := aName;
  FEscopo := aEscopo;
end;

end.
