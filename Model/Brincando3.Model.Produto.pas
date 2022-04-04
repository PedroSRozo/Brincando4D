unit Brincando3.Model.Produto;

interface

uses Brincando3.Model.Atributes;

type
  [DBTable('PRODUTOS')]
  TModelProduto = class
  private
    FDescricao: String;
    FReferencia: String;
    FisAtivo: Boolean;
    FValor: Currency;
    FEstoque: Integer;
    FCODIGO: Integer;
    procedure SetDescricao(const Value: String);
    procedure SetReferencia(const Value: String);
    procedure SetEstoque(const Value: Integer);
    procedure SetisAtivo(const Value: Boolean);
    procedure SetValor(const Value: Currency);
    procedure SetCODIGO(const Value: Integer);
  published
    [DBUniqueKey]
    property CODIGO : Integer read FCODIGO write SetCODIGO;
    [DBName('PROD_DESCRICAO')]
    property Descricao: String read FDescricao write SetDescricao;
    property Referencia: String read FReferencia write SetReferencia;
    property Valor: Currency read FValor write SetValor;
    property Estoque: Integer read FEstoque write SetEstoque;
    property isAtivo: Boolean read FisAtivo write SetisAtivo;
  end;

implementation

{ TModelProduto }

procedure TModelProduto.SetCODIGO(const Value: Integer);
begin
  FCODIGO := Value;
end;

procedure TModelProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TModelProduto.SetEstoque(const Value: Integer);
begin
  FEstoque := Value;
end;

procedure TModelProduto.SetisAtivo(const Value: Boolean);
begin
  FisAtivo := Value;
end;

procedure TModelProduto.SetReferencia(const Value: String);
begin
  FReferencia := Value;
end;

procedure TModelProduto.SetValor(const Value: Currency);
begin
  FValor := Value;
end;

end.
