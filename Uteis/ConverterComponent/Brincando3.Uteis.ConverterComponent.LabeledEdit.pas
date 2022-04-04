unit Brincando3.Uteis.ConverterComponent.LabeledEdit;

interface

uses
  Brincando3.Uteis.ManipulaComponentes.Interfaces, System.Classes,
  Vcl.ExtCtrls;

type
  TConvertertComponentLabeledEdit = class(TInterfacedObject, iConverterComponent)
  private
    FComponent: TLabeledEdit;
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

function TConvertertComponentLabeledEdit.CanConvert(aComponent: TComponent): Boolean;
begin
  Result := aComponent is TLabeledEdit;
  if Result then
    FComponent := TLabeledEdit(aComponent);
end;

constructor TConvertertComponentLabeledEdit.Create;
begin

end;

destructor TConvertertComponentLabeledEdit.Destroy;
begin

  Inherited;
end;

function TConvertertComponentLabeledEdit.GetValue(aObjeto: TObject;
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

class function TConvertertComponentLabeledEdit.New: iConverterComponent;
begin
  Result := Self.Create;
end;

procedure TConvertertComponentLabeledEdit.PreencheComponent(aObject: TObject;
  aCampo: String);
begin
  FComponent.Text := GetValue(aObject, aCampo);
end;

procedure TConvertertComponentLabeledEdit.PreencheObjeto(aObject: TObject;
  aCampo: String);
begin
  SetValue(aObject,aCampo,FComponent.Text);
end;

procedure TConvertertComponentLabeledEdit.SetValue(aObjeto: TObject; aCampo,
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
  TConverterAttributesDBBind.RegisterComponenet(TConvertertComponentLabeledEdit.New);
  TConverterAttributesDBBindValue.RegisterComponenet(TConvertertComponentLabeledEdit.New);

end.
