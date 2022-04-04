unit Brincando3.Dao.Interfaces;

interface

type
  iQuery = interface
    function SQL(aValue: String): iQuery;
    function AddParam(aKey: String; aValue: String): iQuery; overload;
    function AddParam(aKey: String; aValue: Integer): iQuery; overload;
    function AddParam(aKey: String; aValue: Currency): iQuery; overload;
    function Execute: iQuery;
  end;

  iDAO = interface
    ['{E8EA091E-5C42-451D-8A7C-537A714A4158}']
    function Gravar: iDAO;
    function Select(aValue : Integer) : iDAO;
  end;

implementation

end.
