﻿unit Git.Classe.Utils;

interface

uses Forms, ExtCtrls;

type

  TGitUtils = class
  public class  Procedure CentralizarPanel(AForm: TForm; APanel: TPanel; AterarTopo: boolean=false);  static;

end;

implementation

{ TGitUtils }

class procedure TGitUtils.CentralizarPanel(AForm: TForm; APanel: TPanel; AterarTopo: boolean);
begin
  APanel.Left := (AForm.ClientWidth div 2) - (APanel.Width div 2);
  if AterarTopo then APanel.Top := (AForm.ClientHeight div 2) - (APanel.Height div 2);
  APanel.Update;
  AForm.Update;
end;

end.
