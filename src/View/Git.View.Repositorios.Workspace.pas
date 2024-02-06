﻿unit Git.View.Repositorios.Workspace;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Themes, Math, ExtCtrls, StdCtrls, Vcl.Imaging.pngimage,
  Vcl.WinXCtrls;


type
  TFrmWorskpace = class(TForm)
    Panel1: TPanel;
    PageControl1: TPageControl;
    Panel2: TPanel;
    TabSheet1: TTabSheet;
    Panel3: TPanel;
    Panel4: TPanel;
    btnAdicionar: TButton;
    Edit2: TEdit;
    lblInfo: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Label1: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel9: TPanel;
    Label5: TLabel;
    Image1: TImage;
    pnlBranch: TPanel;
    Panel7: TPanel;
    Label6: TLabel;
    Image3: TImage;
    pnlTags: TPanel;
    Label3: TLabel;
    Image2: TImage;
    pnlTopo: TPanel;
    Image7: TImage;
    Label11: TLabel;
    Image6: TImage;
    Label10: TLabel;
    Image5: TImage;
    Label9: TLabel;
    Label8: TLabel;
    Image4: TImage;
    imgNot: TImage;
    imgOK: TImage;
    Label7: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    TabSheet2: TTabSheet;
    Panel8: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Memo1: TMemo;
    Panel13: TPanel;
    Button1: TButton;
    Panel14: TPanel;
    btnCommit: TButton;
    Label12: TLabel;
    Label14: TLabel;
    pnlCenterNoChange: TPanel;
    Label13: TLabel;
    Image8: TImage;
    Image9: TImage;
    Label15: TLabel;
    Timer1: TTimer;
    Panel15: TPanel;
    ComboBox1: TComboBox;
    Loading: TActivityIndicator;
    Loading2: TActivityIndicator;
    procedure Button2Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label4MouseEnter(Sender: TObject);
    procedure Label4MouseLeave(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
  private
    FProjectName: String;
    FGitFoldetValid: boolean;
    procedure SetProjectName(const Value: String);
    procedure GetImagemValidFolderGIt(const value: string);
    function GetGitFoldetValid: boolean;
    function GetClonePanel(const Panel: TPanel):TPanel;
    procedure CopiarPanel(PanelOrigem, PanelDestino: TPanel);
  public
     property ProjectName: String read FProjectName write SetProjectName;
     property GitFoldetValid: boolean read GetGitFoldetValid;
  end;

var
  FrmWorskpace: TFrmWorskpace;

implementation

{$R *.dfm}

uses FileCtrl, Git.Classe.Folder.Adicionar, Git.Classe.Pagecontrol.TabSheet, Git.Classe.Utils;

procedure TFrmWorskpace.Button2Click(Sender: TObject);
begin
  Loading.Animate:= True;
  Loading.Repaint;
  try
    edit1.text:= TGitFindFolder.GitFolderExists;
    GetImagemValidFolderGIt(edit1.text);
  finally
    Loading.Animate:= False;
  end;
end;

procedure TFrmWorskpace.btnAdicionarClick(Sender: TObject);
var
  tabsheet: TTabSheet;
  Pnl: TPanel;
begin
  try
    SetProjectName(edit2.text);
    pnlTopo.Visible:= GetGitFoldetValid;
    Pnl:= GetClonePanel(panel10);
    //CopiarPanel(panel10,Pnl);
    Pnl.Parent:= TGitPageControl.AdicionaRepositorio(FProjectName,PageControl1);
  finally
    Loading2.Animate:= False;
  end;
end;

procedure TFrmWorskpace.CopiarPanel(PanelOrigem, PanelDestino: TPanel);
var
  PanelCopy: TPanel;
begin
  PanelCopy := TPanel.Create(PanelOrigem.Parent);
  PanelCopy.Parent := PanelDestino.Parent;
  PanelCopy.Left := PanelOrigem.Left;
  PanelCopy.Top := PanelOrigem.Top;
  PanelCopy.Width := PanelOrigem.Width;
  PanelCopy.Height := PanelOrigem.Height;
  PanelCopy.Caption := PanelOrigem.Caption;
  PanelDestino.InsertControl(PanelCopy);
end;

procedure TFrmWorskpace.Edit1Exit(Sender: TObject);
begin
  lblInfo.Visible:= not (Edit1.text <> '');
end;

procedure TFrmWorskpace.Edit2Change(Sender: TObject);
begin
  Loading2.Animate:= True;
  Loading2.Repaint;
  btnAdicionar.Enabled:= (Edit2.Text <> '');
end;

procedure TFrmWorskpace.FormCreate(Sender: TObject);
begin
  TGitUtils.CentralizarPanel(Self,Panel4);
  TGitUtils.CentralizarPanel(Self,pnlTopo);
end;

procedure TFrmWorskpace.FormResize(Sender: TObject);
begin
  TGitUtils.CentralizarPanel(Self,Panel4);
  TGitUtils.CentralizarPanel(Self,pnlTopo);
  TGitUtils.CentralizarPanel(Self,pnlCenterNoChange);
end;

function TFrmWorskpace.GetClonePanel(const Panel: TPanel): TPanel;
//var
//  PanelClone: TPanel;
begin
//  PanelClone:= TPanel.Create(nil);
//  PanelClone.Name:= 'PNL'+random(10000).ToString+FormatDateTime('hhmmss',Now);
//  PanelClone.Visible:= true;
//  Panelclone:= Panel;
//  PanelClone.InsertControl(Panel);
//  result:= Panelclone;
end;

function TFrmWorskpace.GetGitFoldetValid: boolean;
begin
  result:= FProjectName<> '';
end;

procedure TFrmWorskpace.GetImagemValidFolderGIt(const value: string);
begin
  imgok.Visible:= Trim(value) <> '';
  imgnot.Visible:= not(imgok.Visible);
end;

procedure TFrmWorskpace.Label4MouseEnter(Sender: TObject);
begin
  TLabel(sender).Font.Style:= [TFontStyle.fsBold];
end;

procedure TFrmWorskpace.Label4MouseLeave(Sender: TObject);
begin
  TLabel(sender).Font.Style:= [];
end;

procedure TFrmWorskpace.Memo1Change(Sender: TObject);
begin
  btnCommit.Enabled:=  (Memo1.Lines.Text <> '');
end;

procedure TFrmWorskpace.SetProjectName(const Value: String);
begin
  FProjectName := Value;
end;

end.

