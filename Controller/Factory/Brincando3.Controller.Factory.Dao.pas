unit Brincando3.Controller.Factory.Dao;

interface

uses
  Brincando3.Controller.Factory.Interfaces,
  Brincando3.Dao.Interfaces,
  Brincando3.Dao.FireDac;

type
  TFactoryDao = class(TInterfacedObject, iFactoryDao)
  private
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFactoryDao;
    function FireDac(aParent: TObject): iDao;
  end;

implementation

{ TFactoryDao }

constructor TFactoryDao.Create;
begin

end;

destructor TFactoryDao.Destroy;
begin

  Inherited;
end;

function TFactoryDao.FireDac(aParent: TObject): iDao;
begin
  Result := TDaoFireDac.New(aParent);
end;

class function TFactoryDao.New: iFactoryDao;
begin
  Result := Self.Create;
end;

end.
