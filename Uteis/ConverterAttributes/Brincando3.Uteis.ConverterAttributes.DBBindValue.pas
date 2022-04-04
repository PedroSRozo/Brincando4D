unit Brincando3.Uteis.ConverterAttributes.DBBindValue;

interface

uses
  Vcl.StdCtrls,
  Brincando3.Model.Atributes,
  System.Classes,
  Vcl.ExtCtrls,
  System.Generics.Collections, Brincando3.Uteis.ManipulaComponentes.Interfaces;

type

  TConverterAttributesDBBindValue = class(TInterfacedObject,
    iConverterAttributes)
  private
    FCanDo: Boolean;
    FAttribute: TCustomAttribute;
    class var FIndexConverterComponent: Integer;
    class var FLista: TList<iConverterComponent>;
    function GetValue(aObjeto: TObject; aCampo: String): String;
    procedure SetValue(aObjeto: TObject; aCampo, aValue: String);
    procedure ReiniciarConverter;
    class function GetListaComponents: TList<iConverterComponent>;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iConverterAttributes;
    class procedure RegisterComponenet(aValue: iConverterComponent);
    function CanConvert(aAttribute: TCustomAttribute)
      : iConverterAttributes; overload;
    function Compare(aName: String; aEscopo: TEscopo): iConverterAttributes;
    function CanConvert(aComponent: TComponent): iConverterAttributes; overload;
    function FillComponent(aObject: TObject): iConverterAttributes;
    function FillObject(aObject: TObject): iConverterAttributes;
  end;

implementation

uses
  System.TypInfo, System.SysUtils, Brincando3.Uteis.ManipulaComponentes;

{ TConverterAttributes }

function TConverterAttributesDBBindValue.CanConvert
  (aAttribute: TCustomAttribute): iConverterAttributes;
begin
  Result := Self;
  FCanDo := aAttribute is DBBindValue;
  if FCanDo then
    FAttribute := aAttribute;
end;

function TConverterAttributesDBBindValue.CanConvert(aComponent: TComponent)
  : iConverterAttributes;
var
  I: Integer;
begin
  Result := Self;
  if not FCanDo then
    Exit;
  FCanDo := False;
  for I := 0 to Pred(FLista.Count) do
  begin
    FCanDo := FLista[I].CanConvert(aComponent);
    if FCanDo then
    begin
      FIndexConverterComponent := I;
      Break;
    end;
  end;
end;

function TConverterAttributesDBBindValue.Compare(aName: String;
  aEscopo: TEscopo): iConverterAttributes;
begin
  Result := Self;
  if not FCanDo then
    Exit;
  FCanDo := (DBBindValue(FAttribute).Name = aName) and
    (DBBindValue(FAttribute).Escopo = aEscopo);
end;

constructor TConverterAttributesDBBindValue.Create;
begin
  FCanDo := False;
  GetListaComponents;
end;

destructor TConverterAttributesDBBindValue.Destroy;
begin
  if FLista <> nil then
    FreeAndNil(FLista);
  Inherited;
end;

function TConverterAttributesDBBindValue.FillComponent(aObject: TObject)
  : iConverterAttributes;
begin
  Result := Self;
  if not FCanDo then
    Exit;
  if FLista.Count > 0 then
    FLista[FIndexConverterComponent]
      .PreencheComponent(aObject, DBBind(FAttribute).Campo);
end;

function TConverterAttributesDBBindValue.FillObject(aObject: TObject)
  : iConverterAttributes;
begin
  Result := Self;
  if not FCanDo then
    Exit;
  if FLista.Count >= 0 then
    FLista[FIndexConverterComponent]
      .PreencheObjeto(aObject, DBBind(FAttribute).Campo);
end;

class function TConverterAttributesDBBindValue.GetListaComponents
  : TList<iConverterComponent>;
begin
  if FLista = nil then
    FLista := TList<iConverterComponent>.Create;
  Result := FLista;
end;

function TConverterAttributesDBBindValue.GetValue(aObjeto: TObject;
  aCampo: String): String;
begin
  Result := '';
  case PropType(aObjeto, aCampo) of
    tkInteger:
      Result := IntToStr(GetPropValue(aObjeto, aCampo));
    tkFloat:
      Result := CurrToStr(GetPropValue(aObjeto, aCampo));
  else
    Result := GetPropValue(aObjeto, aCampo, True);
  end;
end;

class function TConverterAttributesDBBindValue.New: iConverterAttributes;
begin
  Result := TConverterAttributesDBBindValue.Create;
end;

class procedure TConverterAttributesDBBindValue.RegisterComponenet
  (aValue: iConverterComponent);
begin
  GetListaComponents.Add(aValue);
end;

procedure TConverterAttributesDBBindValue.ReiniciarConverter;
begin
  FCanDo := False;
  FAttribute := nil;
end;

procedure TConverterAttributesDBBindValue.SetValue(aObjeto: TObject;
  aCampo, aValue: String);
begin
  case PropType(aObjeto, aCampo) of
    tkInteger:
      SetPropValue(aObjeto, aCampo, StrToInt(aValue));
    tkFloat:
      SetPropValue(aObjeto, aCampo, StrToCurr(aValue));
  else
    SetPropValue(aObjeto, aCampo, aValue);
  end;
end;

initialization

TUteisManipulaComponentes.RegisterConverter
  (TConverterAttributesDBBindValue.New);

end.
