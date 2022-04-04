program Brincando3;

uses
  Vcl.Forms,
  Brincando3.View.Principal in 'View\Brincando3.View.Principal.pas' {Form10},
  Brincando3.Model.Interfaces in 'Model\Brincando3.Model.Interfaces.pas',
  Brincando3.Dao.FireDac in 'Dao\Brincando3.Dao.FireDac.pas',
  Brincando3.Controller.Produto in 'Controller\Brincando3.Controller.Produto.pas',
  Brincando3.Model.Produto in 'Model\Brincando3.Model.Produto.pas',
  Brincando3.Controller.Factory in 'Controller\Brincando3.Controller.Factory.pas',
  Brincando3.Controller.Factory.Interfaces in 'Controller\Factory\Brincando3.Controller.Factory.Interfaces.pas',
  Brincando3.Model.Atributes in 'Model\Brincando3.Model.Atributes.pas',
  Brincando3.QueryCreator.Firebird in 'QueryCreator\Firebird\Brincando3.QueryCreator.Firebird.pas',
  Brincando3.QueryCreator.Firebird.Insert in 'QueryCreator\Firebird\Brincando3.QueryCreator.Firebird.Insert.pas',
  Brincando3.Dao.Query.FireDac in 'Dao\Query\Brincando3.Dao.Query.FireDac.pas',
  Brincando3.Controller.Factory.Dao in 'Controller\Factory\Brincando3.Controller.Factory.Dao.pas',
  Brincando3.Controller.Factory.Query in 'Controller\Factory\Brincando3.Controller.Factory.Query.pas',
  Brincando3.Dao.Interfaces in 'Dao\Brincando3.Dao.Interfaces.pas',
  Brincando3.QueryCreator.Interfaces in 'QueryCreator\Brincando3.QueryCreator.Interfaces.pas',
  Brincando3.Controller.Factory.QueryCreator in 'Controller\Factory\Brincando3.Controller.Factory.QueryCreator.pas',
  Brincando3.Uteis.ManipulaComponentes in 'Uteis\Brincando3.Uteis.ManipulaComponentes.pas',
  Brincando3.Uteis.ConverterAttributes.DBBind in 'Uteis\ConverterAttributes\Brincando3.Uteis.ConverterAttributes.DBBind.pas',
  Brincando3.Uteis.ConverterAttributes.DBBindValue in 'Uteis\ConverterAttributes\Brincando3.Uteis.ConverterAttributes.DBBindValue.pas',
  Brincando3.Uteis.ManipulaComponentes.Interfaces in 'Uteis\Brincando3.Uteis.ManipulaComponentes.Interfaces.pas',
  Brincando3.Uteis.ConverterComponent.Edit in 'Uteis\ConverterComponent\Brincando3.Uteis.ConverterComponent.Edit.pas',
  Brincando3.Uteis.ConverterComponent.LabeledEdit in 'Uteis\ConverterComponent\Brincando3.Uteis.ConverterComponent.LabeledEdit.pas',
  Brincando3.Uteis.ConverterComponent.CheckBox in 'Uteis\ConverterComponent\Brincando3.Uteis.ConverterComponent.CheckBox.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm10, Form10);
  Application.Run;
end.
