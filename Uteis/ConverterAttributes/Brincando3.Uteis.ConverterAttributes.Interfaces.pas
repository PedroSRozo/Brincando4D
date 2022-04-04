
unit Brincando3.Uteis.ConverterAttributes.Interfaces;

interface

uses
  Brincando3.Model.Atributes, System.Classes;
  type
  iConverterComponent = interface
    ['{78304B32-C0F4-4B33-B8B7-14FF2073A2FF}']
    function CanConvert(aComponent : TComponent) : Boolean;
    procedure PreencheComponent(aObject : TObject; aCampo: String);
    procedure PreencheObjeto(aObject: TObject; aCampo: String);
  end;

  iConverterAttributes = interface
    ['{FD7E2EB7-A4D0-4FFB-814F-AA98760A446F}']
    function CanConvert(aAttribute: TCustomAttribute)
      : iConverterAttributes; overload;
    function Compare(aName: String; aEscopo: TEscopo): iConverterAttributes;
    function CanConvert(aComponent: TComponent): iConverterAttributes; overload;
    function FillComponent(aObject: TObject): iConverterAttributes;
    function FillObject(aObject: TObject): iConverterAttributes;
  end;

implementation

end.
