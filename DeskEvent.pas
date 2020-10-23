unit DeskEvent;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.ExtCtrls, System.Math, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteDef,
  FireDAC.Phys.SQLite, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm1 = class(TForm)
    lv1: TListView;
    tmrAutoMove: TTimer;
    tmrAniBack: TTimer;
    mmo1: TMemo;
    Conn1: TFDConnection;
    Qry1: TFDQuery;
    fdphysqltdrvrlnk1: TFDPhysSQLiteDriverLink;
    procedure FormCreate(Sender: TObject);
    procedure tmrAutoMoveTimer(Sender: TObject);
    procedure lv1MouseEnter(Sender: TObject);
    procedure lv1MouseLeave(Sender: TObject);
    procedure tmrAniBackTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure HideSelf;
    procedure ShowAllForm;
    function DBFileCheck: Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
{ TForm1 }
uses
  Global;

function TForm1.DBFileCheck: Boolean;
var
  MyConn: TFDConnection;
  MyQry: TFDQuery;
  Sql: string;
begin
  MyConn := TFDConnection.Create(Self);
  MyConn.DriverName := 'SQLite';
  MyConn.Params.Add('DriverID=SQLite');
  if not FileExists(DBPath) then
  begin
    MyConn.Params.Add('DataBase=' + DBPath);
    MyConn.Connected := True;
    Sql := 'CREATE TABLE WORKEVENT(ID INTEGER PRIMARY KEY,Title string(100),)';
  end;
//function TForm1.CreateDBFile(FileName: string; out HisRecord, StatusRecord: Integer; out HisNewTime, StatusNewTime: string): Boolean;
//var
//  Sql: string;
//  Tables: TStrings;
//  HisBool, StatusBool: Boolean;
//  i: Integer;
//begin
//  Result := True;
//  HisBool := False;
//  StatusBool := False;
//  try
//    Conn1.DriverName := 'SQLite';
//    Conn1.Params.Add('DriverID=SQLite');
//    if not FileExists(DBPath) then
//    begin
//      Conn1.Params.Add('Database=' + DBPath);
//      Conn1.Connected := True;
//      Sql := 'CREATE TABLE CardHis(ID integer PRIMARY KEY,Name string(100),LotID string(100),Time TEXT,OD integer,EqID string(100))';
//      Conn1.ExecSQL(Sql);
//      Sql := 'CREATE TABLE CardStatus(ID integer PRIMARY KEY,Name string(100),Time TEXT,Status string(100))';
//      Conn1.ExecSQL(Sql);
//      Conn1.Connected := False;
//      Conn1.Close;
//    end
//    else
//    begin
//      //检测是否有CardHis和CardStatus两个表
//      Conn1.Params.Add('Database=' + DBPath);
//      Conn1.Connected := True;
//      Tables := TStringList.Create;
//      Conn1.GetTableNames('', '', '', Tables, [osMy, osSystem, osOther], [tkTable], False);
//      for i := 0 to Tables.Count - 1 do
//      begin
//        if Pos('CardHis', Tables[i]) > 0 then
//        begin
//          HisBool := True;
//          Continue;
//        end;
//        if Pos('CardStatus', Tables[i]) > 0 then
//        begin
//          StatusBool := True;
//        end;
//      end;
//      if not HisBool then
//      begin
//        Conn1.Params.Add('Database=' + DBPath);
//        Conn1.Connected := True;
//        Sql := 'CREATE TABLE CardHis(ID integer PRIMARY KEY,Name string(100),LotID string(100),Time string(100),OD integer,EqID string(100))';
//        Conn1.ExecSQL(Sql);
//        MsgLog('针卡历史表已经建立！');
//      end
//      else
//      begin
//        MsgLog('针卡历史表已存在！');
//        Qry1.Connection := Conn1;
//        Conn1.Connected := True;
//        with Qry1 do
//        begin
//          Close;
//          Sql.Clear;
//          Sql.Text := 'Select * from ' + HisName;
//          Open;
//          //HisRecord := Fields.Count;
//          if Fields.Count > 0 then
//          begin
//            First;
//            while not Eof do
//            begin
//              Inc(HisRecord);
//              Next;
//            end;
//          end;
//          Close;
//          Sql.Clear;
//          Sql.Text := 'select Time from ' + HisName + ' order by Time desc';
//          Open;
//          HisNewTime := Fields[0].AsString;
//          Close;
//        end;
//        Conn1.Connected := False;
//        Conn1.Close;
//      end;
//      if not StatusBool then
//      begin
//        Conn1.Params.Add('Database=' + DBPath);
//        Conn1.Connected := True;
//        Sql := 'CREATE TABLE CardStatus(ID integer PRIMARY KEY,Name string(100),Time string(100),Status string(100))';
//        Conn1.ExecSQL(Sql);
//        MsgLog('针卡状态表已经建立！');
//      end
//      else
//      begin
//        MsgLog('针卡状态表已存在！');
//        Qry1.Connection := Conn1;
//        Conn1.Connected := True;
//        with Qry1 do
//        begin
//          Close;
//          Open;
//          Sql.Clear;
//          Sql.Text := 'Select * from ' + StatusName;
//          Open;
//          if Fields.Count > 0 then
//          begin
//            First;
//            while not Eof do
//            begin
//              Inc(StatusRecord);
//              Next;
//            end;
//          end;
//          Close;
//          Sql.Clear;
//          Sql.Text := 'select Time from ' + StatusName + ' order by Time desc';
//          Open;
//          StatusNewTime := Fields[0].AsString;
//          Close;
//        end;
//      end;
//    end;
//  except
//    Result := False;
//  end;
//end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  HideSelf;
end;

procedure TForm1.HideSelf;
var
  Screen2Width: Integer;
begin
  if Screen2Mode = 1 then
  begin
    Screen2Width := Screen.Monitors[0].Width + Screen.Monitors[1].Width;
  end;

  Self.Left := Screen2Width - 10;
  Self.Top := (Screen.Height - Self.Height) div 2;
end;

procedure TForm1.lv1MouseEnter(Sender: TObject);
begin
  if not (EnterLV and StAnim) then
  begin
    EnterLV := True;
    StAnim := True;
    tmrAutoMove.Enabled := True;
    //mmo1.Lines.Add('enter..'+TimeToStr(Now));
  end;
end;

procedure TForm1.lv1MouseLeave(Sender: TObject);
begin
  if EnterLV and EndAnim and InScreenCenter then
  begin
    EnterLV := False;
    tmrAniBack.Enabled := True;
  end;

end;

procedure TForm1.ShowAllForm;
begin
  Self.Left := (Screen.Width - Self.Width) div 2;

end;

procedure TForm1.tmrAniBackTimer(Sender: TObject);
var
  W, H: Integer;
  Dis: Integer;
begin
  if not EnterLV then
  begin

    W := Screen.Width;
    H := Screen.Height;
    if Self.Left < W - 10 then
    begin
      if not ProAnim then
      begin
        ProAnim := True;
      end;
      Dis := W - Self.Left;
      Self.Left := Self.Left + Round(Sqrt(Dis / AnimLevel_1));
    end
    else
    begin
      tmrAniBack.Enabled := False;
      InScreenCenter := False;
    end;
  end;
end;

procedure TForm1.tmrAutoMoveTimer(Sender: TObject);
var
  W, H: Integer;
  Dis: Integer;
begin
  if InScreenCenter then
  begin
    Exit;
  end;
  if not EnterLV then
  begin
    Exit;
  end;
  W := Screen.Width;
  H := Screen.Height;
  //mmo1.Lines.Add('w='+IntToStr(w));
  //mmo1.Lines.Add('left='+IntToStr(Self.Left));
  //mmo1.Lines.Add('w```='+IntToStr((W - Self.Width) div 2));
  if Self.Left > ((W - Self.Width) div 2) then
  begin
    if not ProAnim then
    begin
      ProAnim := True;
    end;
    Dis := Self.Left - (W - Self.Width) div 2;
    //mmo1.Lines.Add('Dis='+IntToStr(Dis));
    Self.Left := Self.Left - Round(Sqrt(Dis / AnimLevel_1));
  end
  else
  begin
    tmrAutoMove.Enabled := False;
    StAnim := False;
    ProAnim := False;
    EndAnim := True;
    InScreenCenter := True;
  end;

end;

end.

