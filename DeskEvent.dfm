object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = #24037#20316#35760#24405
  ClientHeight = 367
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lv1: TListView
    Left = 0
    Top = 0
    Width = 625
    Height = 369
    Columns = <
      item
        Caption = 'ID'
        Width = 30
      end
      item
        Alignment = taCenter
        Caption = #20107#20214#21517
        Width = 130
      end
      item
        Alignment = taCenter
        Caption = #30446#21069#29366#24577
        Width = 300
      end
      item
        Alignment = taCenter
        Caption = #30446#21069#32791#26102
        Width = 100
      end
      item
        Alignment = taCenter
        Caption = #32423#21035
        Width = 60
      end>
    GridLines = True
    TabOrder = 0
    ViewStyle = vsReport
    OnMouseEnter = lv1MouseEnter
    OnMouseLeave = lv1MouseLeave
  end
  object mmo1: TMemo
    Left = 88
    Top = 24
    Width = 417
    Height = 81
    Lines.Strings = (
      'mmo1')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object tmrAutoMove: TTimer
    Enabled = False
    Interval = 10
    OnTimer = tmrAutoMoveTimer
    Left = 296
    Top = 64
  end
  object tmrAniBack: TTimer
    Enabled = False
    Interval = 10
    OnTimer = tmrAniBackTimer
    Left = 376
    Top = 64
  end
  object Conn1: TFDConnection
    Left = 152
    Top = 136
  end
  object Qry1: TFDQuery
    Connection = Conn1
    Left = 200
    Top = 136
  end
  object fdphysqltdrvrlnk1: TFDPhysSQLiteDriverLink
    Left = 256
    Top = 136
  end
end
