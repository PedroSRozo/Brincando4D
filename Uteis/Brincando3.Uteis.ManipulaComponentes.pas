unit Brincando3.Uteis.ManipulaComponentes;

interface

uses
  Vcl.Forms,
  System.Rtti,
  Brincando3.Model.Atributes,
  System.Generics.Collections,
  Brincando3.Uteis.ManipulaComponentes.Interfaces;

type
  TUteisManipulaComponentes = class
  private
    class var FLista: TList<iConverterAttributes>;
  protected
    class function GetLista: TList<iConverterAttributes>;
  public
    class destructor Destroy;
    class procedure RegisterConverter(aValue: iConverterAttributes);
    class procedure PreencheObjeto(aObjeto: TObject; aForm: TForm;
      aNome: String; aEscopo: TEscopo);
    class procedure PreencheView(aObjeto: TObject; aForm: TForm; aNome: String;
      aEscopo: TEscopo);
  end;

implementation

uses
  System.Classes, Vcl.StdCtrls, System.TypInfo, System.SysUtils;

{ TUteisRtti }

class destructor TUteisManipulaComponentes.Destroy;
begin
  if FLista <> nil then
    FreeAndNil(FLista);
end;

class function TUteisManipulaComponentes.GetLista: TList<iConverterAttributes>;
begin
  if FLista = nil then
    FLista := TList<iConverterAttributes>.Create;
  Result := FLista;
end;

class procedure TUteisManipulaComponentes.PreencheObjeto(aObjeto: TObject; aForm: TForm;
  aNome: String; aEscopo: TEscopo);
var
  vRttiContext: TRttiContext;
  vRttiType: TRttiType;
  vRttiField: TRttiField;
  LAttribute: TCustomAttribute;
  LComponent: TComponent;
  I: Integer;
begin
  vRttiContext := TRttiContext.Create;
  try
    vRttiType := vRttiContext.GetType(aForm.ClassType);
    for vRttiField in vRttiType.GetFields do
      for LAttribute in vRttiField.GetAttributes do
      begin
        LComponent := aForm.FindComponent(vRttiField.Name);
        for I := 0 to Pred(FLista.Count) do
          FLista[I]
            .CanConvert(LAttribute)
              .Compare(aNome, aEscopo)
                .CanConvert(LComponent)
                  .FillObject(aObjeto);
      end;
  finally
    vRttiContext.Free;
  end;
end;

class procedure TUteisManipulaComponentes.PreencheView(aObjeto: TObject; aForm: TForm;
  aNome: String; aEscopo: TEscopo);
var
  LContext: TRttiContext;
  LType: TRttiType;
  LField: TRttiField;
  LAttribute: TCustomAttribute;
  LComponent: TComponent;
  I: Integer;
begin
  LContext := TRttiContext.Create;
  try
    LType := LContext.GetType(aForm.ClassType);
    for LField in LType.GetFields do
      for LAttribute in LField.GetAttributes do
      begin
        LComponent := aForm.FindComponent(LField.Name);
        for I := 0 to Pred(FLista.Count) do
          FLista[I]
            .CanConvert(LAttribute)
              .Compare(aNome, aEscopo)
                .CanConvert(LComponent)
                  .FillComponent(aObjeto);
      end;
  finally
    LContext.Free;
  end;
end;

class procedure TUteisManipulaComponentes.RegisterConverter(aValue: iConverterAttributes);
begin
  GetLista.Add(aValue);
end;

end.
