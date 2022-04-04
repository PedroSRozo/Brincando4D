unit Brincando3.Uteis.ConverterComponent.CheckBox;

interface

uses
  Brincando3.Uteis.ManipulaComponentes.Interfaces, Vcl.StdCtrls,
  System.Classes;

type
  TConvertertComponentCheckBox = class(TInterfacedObject, iConverterComponent)
  private
    FComponent: TCheckBox;
    function GetValue(aObjeto: TObject; aCampo: String): Boolean;
    procedure SetValue(aObjeto: TObject; aCampo: String; aValue: Boolean);
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

function TConvertertComponentCheckBox.CanConvert
  (aComponent: TComponent): Boolean;
begin
  Result := aComponent is TCheckBox;
  if Result then
    FComponent := TCheckBox(aComponent);
end;

constructor TConvertertComponentCheckBox.Create;
begin

end;

destructor TConvertertComponentCheckBox.Destroy;
begin

  Inherited;
end;

function TConvertertComponentCheckBox.GetValue(aObjeto: TObject;
  aCampo: String): Boolean;
begin
  Result := GetPropValue(aObjeto, aCampo);
end;

class function TConvertertComponentCheckBox.New: iConverterComponent;
begin
  Result := Self.Create;
end;

procedure TConvertertComponentCheckBox.PreencheComponent(aObject: TObject;
  aCampo: String);
begin
  FComponent.Checked := GetValue(aObject, aCampo);
end;

procedure TConvertertComponentCheckBox.PreencheObjeto(aObject: TObject;
  aCampo: String);
begin
  SetValue(aObject, aCampo, FComponent.Checked);
end;

procedure TConvertertComponentCheckBox.SetValue(aObjeto: TObject;
  aCampo: String; aValue: Boolean);
begin
  SetPropValue(aObjeto, aCampo, aValue);
end;

initialization

TConverterAttributesDBBind.RegisterComponenet(TConvertertComponentCheckBox.New);
TConverterAttributesDBBindValue.RegisterComponenet
  (TConvertertComponentCheckBox.New);

end.
