unit Brincando3.Uteis.ConverterComponent.Edit;

interface

uses
  Brincando3.Uteis.ManipulaComponentes.Interfaces, System.Classes,
  Vcl.StdCtrls;

type
  TConvertertComponentEdit = class(TInterfacedObject, iConverterComponent)
  private
    FComponent: TEdit;
    function GetValue(aObjeto: TObject; aCampo: String): String;
    procedure SetValue(aObjeto: TObject; aCampo, aValue: String);
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iConverterComponent;
    function CanConvert(aComponent: TComponent): Boolean;
    procedure PreencheComponent(aObject: TObject; aCampo: String);
    procedure PreencheObjeto(aObject: TObject; aCampo: String);
  end;

implementation

uses
  System.TypInfo, System.SysUtils, Brincando3.Uteis.ConverterAttributes.DBBind,
  Brincando3.Uteis.ConverterAttributes.DBBindValue;

{ TConvertertComponentEdit }

function TConvertertComponentEdit.CanConvert(aComponent: TComponent): Boolean;
begin
  Result := aComponent is TEdit;
  if Result then
    FComponent := TEdit(aComponent);
end;

constructor TConvertertComponentEdit.Create;
begin

end;

destructor TConvertertComponentEdit.Destroy;
begin

  Inherited;
end;

function TConvertertComponentEdit.GetValue(aObjeto: TObject;
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

class function TConvertertComponentEdit.New: iConverterComponent;
begin
  Result := Self.Create;
end;

procedure TConvertertComponentEdit.PreencheComponent(aObject: TObject;
  aCampo: String);
begin
  FComponent.Text := GetValue(aObject, aCampo);
end;

procedure TConvertertComponentEdit.PreencheObjeto(aObject: TObject;
  aCampo: String);
begin
  SetValue(aObject,aCampo,FComponent.Text);
end;

procedure TConvertertComponentEdit.SetValue(aObjeto: TObject; aCampo,
  aValue: String);
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
  TConverterAttributesDBBind.RegisterComponenet(TConvertertComponentEdit.New);
  TConverterAttributesDBBindValue.RegisterComponenet(TConvertertComponentEdit.New);

end.
