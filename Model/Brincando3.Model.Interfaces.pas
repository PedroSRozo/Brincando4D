unit Brincando3.Model.Interfaces;

interface

uses
  Vcl.Forms,
  Brincando3.Dao.Interfaces, Brincando3.Model.Atributes;

type
  iProduto = interface
    ['{0997051E-7083-4E7B-9CAB-BFCF9349468A}']
    function SetForm(aForm: TForm): iProduto;
    function PreencheObjeto(aEscopo: TEscopo): iProduto;
    function PreencheView(aEscopo: TEscopo): iProduto;
    function Dao: iDAO;
  end;

implementation

end.
