unit Brincando3.Controller.Factory.Interfaces;

interface

uses
  Brincando3.Model.Interfaces,
  Brincando3.QueryCreator.Interfaces,
  Brincando3.Dao.Interfaces;

type
  iFactoryQueryCreator = interface
    ['{F0208442-C3CB-4968-8874-48244B0B0026}']
    function Firebird : iQueryCreator;
  end;

  iFactoryQuery = interface
    ['{CBFE1CB5-2A18-4759-BDCD-D4E2DC23E44B}']
    function FireDac : iQuery;
  end;

  iFactoryDao = interface
    ['{86EDF3E7-163C-4CDE-A95D-368A69DB5B21}']
    function FireDac(aParent : TObject) : iDao;
  end;

  iFactoryModel = interface
    function Produto: iProduto;
  end;

implementation

end.
