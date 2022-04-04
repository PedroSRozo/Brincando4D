unit Brincando3.QueryCreator.Interfaces;

interface

type

  iQueryCreator = interface;

  iInsert = interface
    ['{D372D2FB-FB23-485D-800B-C8C233195938}']
    function Campos(aValue: String): iInsert;
    function Valores(aValue: String): iInsert;
    function &End: iQueryCreator;
  end;

  iQueryCreator = interface
    ['{7E78C79F-8107-4A51-B305-7BC7DF910F0B}']
    function Insert(aTable: String): iInsert;
    function Query(aValue: String): iQueryCreator; overload;
    function Query: String; overload;
  end;

implementation

end.
