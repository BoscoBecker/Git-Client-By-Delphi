unit Git.Classe.Pagecontrol.TabSheet;

interface

uses ubtnTabSHeet,ComCtrls ;

type
  TGitPageControl = class

  Public Class function AdicionaRepositorio(const Caption: string; const PageControl: TPageControl):TTabSheet; static;

  end;

implementation

class function TGitPageControl.AdicionaRepositorio(const Caption: string; const PageControl: TPageControl):TTabSheet;
begin
   var tab:= TBtnTabSheet.Create(PageControl);
   tab.Caption:= Caption;
   tab.PageControl:= PageControl;
   tab.Repaint;
   result:= tab;
end;

begin


end.
