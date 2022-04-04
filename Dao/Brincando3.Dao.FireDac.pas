unit Brincando3.Dao.FireDac;

interface

uses
  System.Rtti,
  System.TypInfo,
  System.SysUtils,
  System.Variants,
  Brincando3.Dao.Interfaces,
  Brincando3.QueryCreator.Interfaces,
  Brincando3.Model.Atributes,
  Brincando3.Controller.Factory.Query,
  Brincando3.Controller.Factory.QueryCreator;

type
  TDaoFireDac = class(TInterfacedObject, iDAO)
  private
    FParent: TObject;
    FTable: String;
    FUniqueKey: String;
    FQueryCreator: iQueryCreator;
    FQuery: iQuery;
    procedure BuscaInformacoesModel;
    function GetDBName(aPropertyName: String): String;
    function GetValor(aPropertyName: String): String;
  public
    constructor Create(aParent: TObject);
    destructor Destroy; override;
    class function New(aParent: TObject): iDAO;
    function Gravar: iDAO;
    function Select(aValue : Integer) : iDAO;
  end;

implementation

{ TMinhaClasse }

procedure TDaoFireDac.BuscaInformacoesModel;
var
  vRttiContext: TRttiContext;
  vRttiType: TRttiType;
  vRttiProperty: TRttiProperty;
  vCustomAttribute: TCustomAttribute;
begin
  vRttiContext := TRttiContext.Create;
  try
    vRttiType := vRttiContext.GetType(FParent.ClassType);
    for vCustomAttribute in vRttiType.GetAttributes do
      if vCustomAttribute is DBTable then
        FTable := DBTable(vCustomAttribute).Table;

    for vRttiProperty in vRttiType.GetProperties do
      for vCustomAttribute in vRttiProperty.GetAttributes do
        if vCustomAttribute is DBUniqueKey then
          FUniqueKey := vRttiProperty.Name;
  finally
    vRttiContext.Free;
  end;
end;

constructor TDaoFireDac.Create(aParent: TObject);
begin
  if not Assigned(aParent) then
    raise Exception.Create('Objeto informado não é valido.');

  FParent := aParent;
  FQueryCreator := TFactoryQueryCreator.New.Firebird;
  FQuery := TFactoryQuery.New.FireDac;
  BuscaInformacoesModel;
end;

destructor TDaoFireDac.Destroy;
begin

  Inherited;
end;

function TDaoFireDac.GetDBName(aPropertyName: String): String;
var
  vRttiContext: TRttiContext;
  vRttiType: TRttiType;
  vRttiProperty: TRttiProperty;
  vCustomAttribute: TCustomAttribute;
begin
  vRttiContext := TRttiContext.Create;
  try
    vRttiType := vRttiContext.GetType(FParent.ClassType);
    for vRttiProperty in vRttiType.GetProperties do
      if vRttiProperty.Name = aPropertyName then
      begin
        Result := vRttiProperty.Name;
        for vCustomAttribute in vRttiProperty.GetAttributes do
          if vCustomAttribute is DBName then
            Result := DBName(vCustomAttribute).Name;
        Break;
      end;
  finally
    vRttiContext.Free;
  end;
end;

function TDaoFireDac.GetValor(aPropertyName: String): String;
var
  tipo: TTypeKind;
begin
  case PropType(FParent, aPropertyName) of
    tkInteger:
      Result := VarToStr(GetPropValue(FParent, aPropertyName));
    tkFloat:
      Result := FormatCurr('0.00', GetPropValue(FParent, aPropertyName));
  else
    Result := QuotedStr(GetPropValue(FParent, aPropertyName, True));
  end;
  Result := UpperCase(Result);
end;

function TDaoFireDac.Gravar: iDAO;
var
  LPropList: TPropList;
  LPropCount: Integer;
  I: Integer;
  LQuery: String;
  LCampos: String;
  LValores: String;
  LPropertyName: String;
begin
  Result := Self;
  LPropCount := GetPropList(PTypeInfo(FParent.ClassInfo), tkAny, @LPropList);
  for I := 0 to Pred(LPropCount) do
  begin
    LPropertyName := String(LPropList[I].Name);
    LCampos := LCampos + GetDBName(LPropertyName);
    LValores := LValores + ':' + GetDBName(LPropertyName);
    if I = Pred(LPropCount) then
      Break;
    LCampos := LCampos + ',';
    LValores := LValores + ',';
  end;
  FQuery.SQL(FQueryCreator.Insert(FTable).Campos(LCampos).Valores(LValores)
    .&End.Query);
  for I := 0 to Pred(LPropCount) do
  begin
    LPropertyName := String(LPropList[I].Name);
    FQuery.AddParam(LPropertyName, GetValor(LPropertyName));
  end;
  FQuery.Execute;
end;

class function TDaoFireDac.New(aParent: TObject): iDAO;
begin
  Result := Self.Create(aParent);
end;

function TDaoFireDac.Select(aValue: Integer): iDAO;
begin
  //select
end;

end.
