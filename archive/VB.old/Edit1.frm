VERSION 4.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   " Robot Raum-Editor"
   ClientHeight    =   6252
   ClientLeft      =   3996
   ClientTop       =   2268
   ClientWidth     =   5400
   BeginProperty Font 
      name            =   "MS Sans Serif"
      charset         =   0
      weight          =   700
      size            =   7.8
      underline       =   0   'False
      italic          =   0   'False
      strikethrough   =   0   'False
   EndProperty
   ForeColor       =   &H80000008&
   Height          =   6804
   Icon            =   "Edit1.frx":0000
   KeyPreview      =   -1  'True
   Left            =   3948
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6252
   ScaleWidth      =   5400
   Top             =   1764
   Width           =   5496
   Begin VB.HScrollBar HScroll9 
      Height          =   255
      Left            =   960
      Max             =   3
      Min             =   1
      TabIndex        =   10
      Top             =   5160
      Value           =   1
      Width           =   375
   End
   Begin VB.HScrollBar HScroll8 
      Height          =   255
      Left            =   960
      Max             =   5
      Min             =   1
      TabIndex        =   9
      Top             =   5880
      Value           =   1
      Width           =   375
   End
   Begin VB.HScrollBar HScroll7 
      Height          =   255
      Left            =   3120
      Max             =   3
      Min             =   1
      TabIndex        =   8
      Top             =   5880
      Value           =   1
      Width           =   375
   End
   Begin VB.HScrollBar HScroll6 
      Height          =   255
      Left            =   2760
      Max             =   3
      Min             =   1
      TabIndex        =   7
      Top             =   5880
      Value           =   1
      Width           =   375
   End
   Begin VB.VScrollBar HScroll5 
      Height          =   1215
      Left            =   5040
      Max             =   4
      Min             =   1
      TabIndex        =   5
      Top             =   4920
      Value           =   1
      Width           =   255
   End
   Begin VB.HScrollBar HScroll4 
      Height          =   255
      Left            =   3720
      Max             =   5
      Min             =   1
      TabIndex        =   4
      Top             =   4800
      Value           =   1
      Width           =   1215
   End
   Begin VB.HScrollBar HScroll3 
      Height          =   255
      Left            =   2040
      Max             =   9
      Min             =   1
      TabIndex        =   3
      Top             =   5160
      Value           =   1
      Width           =   375
   End
   Begin VB.HScrollBar HScroll2 
      Height          =   255
      Left            =   3120
      Max             =   9
      Min             =   1
      TabIndex        =   2
      Top             =   5160
      Value           =   1
      Width           =   375
   End
   Begin VB.HScrollBar HScroll1 
      Height          =   255
      Left            =   2760
      Max             =   9
      Min             =   1
      TabIndex        =   1
      Top             =   5160
      Value           =   1
      Width           =   375
   End
   Begin MSComDlg.CommonDialog CMDialog1 
      Left            =   2040
      Top             =   1920
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   327680
      DefaultExt      =   "*.SCE"
      FileName        =   "*.SCE"
      Filter          =   "Scenarien für Robot 1.00 |*.SCE"
      Flags           =   4
   End
   Begin VB.Image Bild 
      Height          =   855
      Left            =   120
      Stretch         =   -1  'True
      Top             =   5280
      Width           =   735
   End
   Begin VB.Image Teil 
      Height          =   375
      Index           =   14
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   375
   End
   Begin VB.Image Teil 
      Height          =   375
      Index           =   13
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   375
   End
   Begin VB.Image Teil 
      Height          =   375
      Index           =   12
      Left            =   2400
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   375
   End
   Begin VB.Image Teil 
      Height          =   375
      Index           =   11
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   375
   End
   Begin VB.Image Teil 
      Height          =   375
      Index           =   10
      Left            =   1680
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   375
   End
   Begin VB.Image Teil 
      Height          =   375
      Index           =   9
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   375
   End
   Begin VB.Image Teil 
      Height          =   375
      Index           =   8
      Left            =   960
      Stretch         =   -1  'True
      Top             =   5520
      Width           =   375
   End
   Begin Threed.SSRibbon Räume 
      Height          =   255
      Index           =   1
      Left            =   3720
      TabIndex        =   6
      Top             =   5160
      Width           =   255
      _Version        =   65536
      _ExtentX        =   450
      _ExtentY        =   450
      _StockProps     =   65
      BackColor       =   12632256
   End
   Begin VB.Image Teil 
      Height          =   375
      Index           =   7
      Left            =   3120
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   375
   End
   Begin VB.Image Teil 
      Height          =   375
      Index           =   6
      Left            =   2760
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   375
   End
   Begin VB.Image Teil 
      Height          =   375
      Index           =   5
      Left            =   2400
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   375
   End
   Begin VB.Image Teil 
      Height          =   375
      Index           =   4
      Left            =   2040
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   375
   End
   Begin VB.Image Teil 
      Height          =   375
      Index           =   3
      Left            =   1680
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   375
   End
   Begin VB.Image Teil 
      Height          =   375
      Index           =   2
      Left            =   1320
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   375
   End
   Begin VB.Image Teil 
      BorderStyle     =   1  'Fixed Single
      Height          =   375
      Index           =   1
      Left            =   960
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   375
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label1"
      ForeColor       =   &H80000008&
      Height          =   375
      Left            =   0
      TabIndex        =   0
      Top             =   4800
      Width           =   975
   End
   Begin VB.Image Image1 
      Height          =   255
      Index           =   1
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Menu Spiel 
      Caption         =   "Datei"
      Begin VB.Menu neu 
         Caption         =   "Neu"
      End
      Begin VB.Menu laden 
         Caption         =   "Laden"
      End
      Begin VB.Menu speichern 
         Caption         =   "Speichern"
      End
      Begin VB.Menu B 
         Caption         =   "-"
      End
      Begin VB.Menu ende 
         Caption         =   "Beenden"
      End
   End
   Begin VB.Menu H 
      Caption         =   "Hilfe"
      Begin VB.Menu hilfe 
         Caption         =   "Hilfe"
      End
      Begin VB.Menu steuer 
         Caption         =   "Steuerung"
      End
      Begin VB.Menu A 
         Caption         =   "-"
      End
      Begin VB.Menu Über 
         Caption         =   "Über"
      End
   End
   Begin VB.Menu einstell 
      Caption         =   "Einstellungen"
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
'Dim Hinter, Wand, Figur
Dim Raum
'Dim Punkt(1 To 10)
'Dim Nam(1 To 10)
Dim WEG1
Dim Feld(1 To 400)
Dim Level(1 To 20)
Private Sub Akt()
 Dim Zahl
 Zahl = 0
 Do
  Zahl = Zahl + 1
  Image1(Zahl).Picture = LoadPicture(Feld(Zahl))
 Loop While Not Zahl = 400
 'On Error Resume Next
 'Label3.Caption = "Leben: " & Leben
 'Label4.Caption = "Punkte: " & Punkte
 Label1.Caption = "Raum: " & Raum
End Sub




Sub Raum1(R1, R2)
 If Not R1 = 0 Then Label1.Caption = "Raum: " & R1
 If R2 = 0 Then GoTo R
 Level(R2) = ""
 Dim TZ
 TZ = 0
 Do
  TZ = TZ + 1
  Level(R2) = Level(R2) & Feld(TZ) & Chr$(13) & Chr$(10)
 Loop While Not TZ = 400
 'MsgBox Level(R2)
R:
 If R1 = 0 Then Exit Sub
 If Level(R1) = "" Then
  Dim Zahl, Z1, Z2
  Zahl = 0
  Z1 = 0
  Z2 = Räume(1).Top
  Do
   Zahl = Zahl + 1
   Z1 = Z1 + 1
   Feld(Zahl) = "HINTER.BMP"
   If Zahl < 21 Then
    Feld(Zahl) = "WAND1.BMP"
    GoTo Weg2
   End If
   If Zahl > 380 Then
    Feld(Zahl) = "WAND1.BMP"
    GoTo Weg2
   End If
   Z3 = 0
   Do
    Z3 = Z3 + 1
    If Zahl = Z3 * 20 Then
     Feld(Zahl) = "WAND1.BMP"
     GoTo Weg2
    ElseIf Zahl = (Z3 * 20) + 1 Then
     Feld(Zahl) = "WAND1.BMP"
     GoTo Weg2
    End If
   Loop While Not Z3 = 20
Weg2:
   If Z1 = 240 * 19 Then
    'MsgBox "240 * 20 = " & Z1, , "Zahl: " & Zahl
    Z1 = -240
    Z2 = Z2 + 240
   End If
  Loop While Not Zahl = 400
  Feld(1) = "WAND1.BMP"
  Akt
 Else
  On Error Resume Next
  Dim FileNum%, Temp$
  FileNum% = FreeFile
  Temp$ = Level(R1)
  Open "DATEN.TMP" For Output As FileNum%
  Print #FileNum%, Temp$
  Close FileNum%
  FileNum% = FreeFile
  Open "DATEN.TMP" For Input As FileNum%
  Dim ZF
  ZF = 0
  Do
   ZF = ZF + 1
   Input #FileNum%, Temp$
   Feld(ZF) = Temp$
  Loop While Not ZF = 400
  Close FileNum%
  Kill "DATEN.TMP"
  Akt
 End If
End Sub

Function Stelle(ST1, ST2)
 Dim STS2
 STS2 = ST2
 STS2 = (STS2 * 20) - 20
 'MsgBox "FG1: " & ST1 & " ; FG2: " & ST2 & Chr$(13) & ST1 & " + (" & ST2 & " * 20) - 20) = " & (ST1 + STS2), , "Rechnung + Variablen"
 Stelle = ST1 + STS2
End Function

Sub TOT()

End Sub

Private Sub einstell_Click()
 Form1.Hide
 Form2.Show
End Sub

Private Sub ende_Click()
 If MsgBox("Wollen sie wirklich schon dieses Programm beenden?", 4, "Ende") = 6 Then End
End Sub

Private Sub Form_Load()
  'On Error Resume Next
 On Error GoTo Fehler
 P = App.Path
 ChDir P
 Bild.Picture = LoadPicture("ROBOT.ICO")
 Dim Zahl, Z1, Z2, Z3
 Teil(1).Picture = LoadPicture("WAND1.BMP")
 Teil(2).Picture = LoadPicture("HINTER.BMP")
 Teil(3).Picture = LoadPicture("FIGUR.BMP")
 Teil(4).Picture = LoadPicture("ROBOT1.BMP")
 Teil(5).Picture = LoadPicture("KONIG.BMP")
 Teil(6).Picture = LoadPicture("SCHL1.BMP")
 Teil(7).Picture = LoadPicture("TUER1.BMP")
 Teil(8).Picture = LoadPicture("PUNKT1.BMP")
 Teil(9).Picture = LoadPicture("AETZ.BMP")
 Teil(10).Picture = LoadPicture("LEBEN.BMP")
 Teil(11).Picture = LoadPicture("KILL.BMP")
 Teil(12).Picture = LoadPicture("SPEICHER.BMP")
 Teil(13).Picture = LoadPicture("DIAMANT1.BMP")
 Teil(14).Picture = LoadPicture("CODE1.BMP")
 'Weiß = QBColor(7)
 'Rot = QBColor(12)
 'Grün = QBColor(10)
 'Boden =
 'Z3 = 1
 'Z2 = Dinge(1).Top
 'Z1 = 0
 'Dinge(1).Picture = LoadPicture("HINTER.BMP")
 'Do
 ' Z1 = Z1 + 1
 ' Z3 = Z3 + 1
  
 ' Load Dinge(Z3)
 ' Dinge(Z3).Visible = True
 ' Dinge(Z3).Height = 255
 ' Dinge(Z3).Left = Dinge(1).Left + (Z1 * 240)
 ' Dinge(Z3).Top = Z2
 ' Dinge(Z3).Width = 255
 ' Dinge(Z3).Picture = LoadPicture("HINTER.BMP")
 ' If Z1 = 8 Then
 '  Z1 = -1
 '  Z2 = Z2 + 240
 ' End If
 'Loop While Not Z2 = Dinge(1).Top + 720
 Zahl = 1
 Z1 = 0
 Z2 = Räume(1).Top
 Do
  Zahl = Zahl + 1
  Z1 = Z1 + 1
  Load Räume(Zahl)
  Räume(Zahl).Visible = True
  Räume(Zahl).Left = Räume(1).Left + (Z1 * 240)
  Räume(Zahl).Top = Z2
  Räume(Zahl).Width = 255
  If Z1 = 4 Then
   Z1 = -1
   Z2 = Z2 + 240
  End If
 Loop While Not Zahl = 20
 Räume(1).Value = True
 Image1(1).Picture = LoadPicture("WAND1.BMP")
 'Figur = LoadPicture("FIGUR.BMP")
  Zahl = 1
 Z1 = 0
 Z2 = 0
 Do
  Z1 = Z1 + 240
  Zahl = Zahl + 1
  'MsgBox "Zahl: " & Zahl & Chr$(13) & "Z1: " & Z1 & Chr$(13) & "Z2: " & Z2, , "Variablen"
  Load Image1(Zahl)
  Image1(Zahl).Visible = True
  Image1(Zahl).Height = 255
  Image1(Zahl).Left = Z1
  Image1(Zahl).Top = Z2
  Image1(Zahl).Width = 255
  Image1(Zahl).Picture = LoadPicture("HINTER.BMP")
  Feld(Zahl) = "HINTER.BMP"
  If Zahl < 21 Then
   Feld(Zahl) = "WAND1.BMP"
   Image1(Zahl).Picture = LoadPicture("WAND1.BMP")
   GoTo Weg
  End If
  If Zahl > 380 Then
   Feld(Zahl) = "WAND1.BMP"
   Image1(Zahl).Picture = LoadPicture("WAND1.BMP")
   GoTo Weg
  End If
  Z3 = 0
  Do
   Z3 = Z3 + 1
   If Zahl = Z3 * 20 Then
    Feld(Zahl) = "WAND1.BMP"
    Image1(Zahl).Picture = LoadPicture("WAND1.BMP")
    'MsgBox Z3 & " * 20 = " & Zahl, , "Rechnung"
    GoTo Weg
   ElseIf Zahl = (Z3 * 20) + 1 Then
    Feld(Zahl) = "WAND1.BMP"
    Image1(Zahl).Picture = LoadPicture("WAND1.BMP")
    'MsgBox "(" & Z3 & " * 20) + 1 = " & Zahl, , "Rechnung"
    GoTo Weg
   End If
  Loop While Not Z3 = 20
Weg:
  If Z1 = 240 * 19 Then
   'MsgBox "240 * 20 = " & Z1, , "Zahl: " & Zahl
   Z1 = -240
   Z2 = Z2 + 240
  End If
 Loop While Not Zahl = 400
 'Label1.Caption = "Name: " + Name1
 'FG1 = 2
 'FG2 = 2
 'FG = 22
 Feld(1) = "WAND1.BMP"
 Raum = 1
 'Leben = 3
 'Punkte = 0
 Feld(22) = "FIGUR.BMP"
 'Hint(1) = True
 Akt
 'Pause = True
 Exit Sub
Fehler:
 MsgBox "Error: " & Err & " !  " & Error(Err) & " .", , "Error"
 'MsgBox "Zahl: " & Zahl
 End
End Sub

Private Sub Form_Unload(Cancel As Integer)
 If MsgBox("Wollen sie wirklich schon dieses Programm beenden?", 4, "Ende") = 6 Then End
 Cancel = 1
End Sub


Private Sub hilfe_Click()
 MsgBox "In diesem Editor können sie ganze Scenarien mit 20 (4 x 5) Räumen editieren. Das Ziel ist es, hinterher mit dem Männchen zu dem König zu kommen. Editieren sie also so die Welten, das dies möglich ist. Um zum Ziel zu kommen, können sie Türen, Schlüssel, Wände, usw. editieren. Viel Spaß beim editieren und spielen!", , "Hilfe zu Robot Raum-Editor 1.00"
End Sub









Private Sub HScroll1_Change()
 Teil_Click 6
 Teil(6).Picture = LoadPicture("SCHL" & HScroll1.Value & ".BMP")
End Sub

Private Sub HScroll2_Change()
 Teil_Click 7
 Teil(7).Picture = LoadPicture("TUER" & HScroll2.Value & ".BMP")
End Sub

Private Sub HScroll3_Change()
 Teil_Click 4
 Teil(4).Picture = LoadPicture("ROBOT" & HScroll3.Value & ".BMP")
End Sub

Private Sub HScroll4_Change()
 Dim Alt
 Alt = Raum
 Räume(((HScroll5.Value * 5) - 5) + HScroll4.Value).Value = True
 Raum = ((HScroll5.Value * 5) - 5) + HScroll4.Value
 Dim ZT
 ZT = 0
 Do
  ZT = ZT + 1
  Räume(ZT).Value = False
 Loop While Not ZT = 20
 Räume(Raum).Value = True
 Raum1 Raum, Alt
End Sub

Private Sub HScroll5_Change()
 Dim Alt
 Alt = Raum
 Räume(((HScroll5.Value * 5) - 5) + HScroll4.Value).Value = True
 Raum = ((HScroll5.Value * 5) - 5) + HScroll4.Value
 Dim ZT
 ZT = 0
 Do
  ZT = ZT + 1
  Räume(ZT).Value = False
 Loop While Not ZT = 20
 Räume(Raum).Value = True
 Raum1 Raum, Alt
End Sub

Private Sub HScroll6_Change()
 Teil_Click 13
 Teil(13).Picture = LoadPicture("DIAMANT" & HScroll6.Value & ".BMP")
End Sub

Private Sub HScroll7_Change()
 Teil_Click 14
 Teil(14).Picture = LoadPicture("CODE" & HScroll7.Value & ".BMP")
End Sub

Private Sub HScroll8_Change()
 Teil_Click 8
 Teil(8).Picture = LoadPicture("PUNKT" & HScroll8.Value & ".BMP")
End Sub

Private Sub HScroll9_Change()
 Teil_Click 1
 Teil(1).Picture = LoadPicture("WAND" & HScroll9.Value & ".BMP")
End Sub

Private Sub Image1_Click(Index As Integer)
 If Teil(3).BorderStyle = 1 Then
  If Raum = 1 Then
    Dim QW
    QW = 0
    Do
     QW = QW + 1
     If Feld(QW) = "FIGUR.BMP" Then
      Feld(QW) = "HINTER.BMP"
      Image1(QW).Picture = LoadPicture("HINTER.BMP")
      GoTo QW
     End If
    Loop While Not QW = 400
QW:
   Else
    MsgBox "Sie können das Männchen nur in Raum 1 hinsetzen!", , "Fehler"
    Exit Sub
  End If
 End If
 If Feld(Index) = "FIGUR.BMP" Then
  If Not MsgBox("Hier ist schon das Männchen. Wollen sie den ausgewählten Gegenstand stattdessen jetzt hier hin setzten? (Hinweis: Sie müssen Hinterher dann das Männchen woanders hinsetzten!)", 4, "Hinweis") = 6 Then Exit Sub
 End If
 If Teil(5).BorderStyle = 1 Then
  If Not MsgBox("Sie können den König nur einmal hinsetzen. Wollen sie es jetzt hier hin setzen?", 4, "König") = 6 Then Exit Sub
 End If
 Dim FAS
 FAS = 0
 Do
  FAS = FAS + 1
  If Teil(FAS).BorderStyle = 1 Then
   If FAS = 1 Then Feld(Index) = "WAND" & HScroll9.Value & ".BMP"
   If FAS = 4 Then Feld(Index) = "ROBOT" & HScroll3.Value & ".BMP"
   If FAS = 6 Then Feld(Index) = "SCHL" & HScroll1.Value & ".BMP"
   If FAS = 7 Then Feld(Index) = "TUER" & HScroll2.Value & ".BMP"
   If FAS = 8 Then Feld(Index) = "PUNKT" & HScroll8.Value & ".BMP"
   If FAS = 13 Then Feld(Index) = "DIAMANT" & HScroll6.Value & ".BMP"
   If FAS = 14 Then Feld(Index) = "CODE" & HScroll7.Value & ".BMP"
   If FAS = 2 Then Feld(Index) = "HINTER.BMP"
   If FAS = 3 Then Feld(Index) = "FIGUR.BMP"
   If FAS = 5 Then Feld(Index) = "KONIG.BMP"
   If FAS = 9 Then Feld(Index) = "AETZ.BMP"
   If FAS = 10 Then Feld(Index) = "LEBEN.BMP"
   If FAS = 11 Then Feld(Index) = "KILL.BMP"
   If FAS = 12 Then Feld(Index) = "SPEICHER.BMP"
   Image1(Index).Picture = Teil(FAS).Picture
   Exit Sub
  End If
 Loop While Not FAS = 14
End Sub

Private Sub laden_Click()
 On Error GoTo E
Noch1:
 CMDialog1.Action = 1
 If CMDialog1.filename = "*.SCE" Then Exit Sub
 If Dir$(CMDialog1.filename) = "" Then
  MsgBox "Die Datei " + CMDialog1.filename + " ist nicht vorhanden. Wählen sie bitte eine andere Datei aus!", 4, "Fehler"
  GoTo Noch1
 End If
 If Not Right$(CMDialog1.filename, 4) = ".SCE" Then
  MsgBox "Die Erweiterung muß SCE sein!", , "Hinweis"
  GoTo Noch1
 End If
 Dim FileNum%, Temp$, Zahl, Z1, Z2
 FileNum% = FreeFile
 Räume(1).Value = True
 Dim HFG
 HFG = 0
 Do
  HFG = HFG + 1
  Level(HFG) = ""
 Loop While Not HFG = 20
 Open CMDialog1.filename For Input As FileNum%
 On Error Resume Next
 Zahl = 0
 Do
  If Not Left$(Temp$, 5) = ":RAUM" Then Input #FileNum%, Temp$
  Zahl = Zahl + 1
  Z1 = 0
  Do
   Input #FileNum%, Temp$
   If Left$(Temp$, 5) = ":RAUM" Then GoTo VF
   Z1 = Z1 + 1
   Level(Zahl) = Level(Zahl) & Temp$ & Chr$(13) & Chr$(10)
  Loop While Not Z1 = 400
VF:
 'If Z1 = 400 Then MsgBox Level(Zahl), , Zahl
 Loop While Not Zahl = 20
 Raum1 1, 0
 MsgBox "Datei wurde geladen!", , "Laden"
 ChDir P
 Exit Sub
E:
 MsgBox "Fehler beim lesen der Datei " & CMDialog1.filename, , "Fehler"
 ChDir P
 Exit Sub
End Sub

Private Sub neu_Click()
 On Error GoTo F
 If MsgBox("Wollen sie wirklich ein neues Spiel anfangen?", 4, "Neu") = 6 Then
  Dim Eddy
  Eddy = Shell("Raumedit.exe", 1)
  End
 End If
 Exit Sub
F:
 If MsgBox("Die Programmdatei wurde nicht im aktuellen Verzeichnis gefunden. Haben sie das Programm im Verzeichnisses des Programms gestartet?", 4, "Fehler") = 6 Then
  MsgBox "Die Programmdatei wurde nicht gefunden! Starten sie das Programm nocheinmal neu und wenden sie sich an den Hersteller.", , "Ende"
  End
 End If
 If MsgBox("Die Programmdatei kann nicht gefunden werden! Starten sie das Programm nächstens im Verzeichnis das Programms. Wollen sie das Programm jetzt beenden?", 4, "Ende") = 6 Then End
 Exit Sub
End Sub

Private Sub Räume_Click(Index As Integer, Value As Integer)
 If WEG1 = True Then Exit Sub
 On Error Resume Next
 Dim ZS1, ZS2, ZT
 WEG1 = True
 ZT = 0
 Do
  ZT = ZT + 1
  Räume(ZT).Value = False
 Loop While Not ZT = 20
 Räume(Index).Value = True
 ZS1 = Index
 ZS2 = -1
 Do
  ZS2 = ZS2 + 1
  If ZS2 > 0 Then ZS1 = ZS1 - 5
  'MsgBox ZS1, , ZS2
 Loop While Not ZS1 - 5 < 1
 ZS2 = ZS2 + 1
 HScroll4.Value = ZS1
 HScroll5.Value = ZS2
 Raum1 Index, Raum
 Raum = Index
 WEG1 = False
End Sub

Private Sub speichern_Click()
 On Error GoTo D
Noch:
 CMDialog1.Action = 2
 If CMDialog1.filename = "*.SCE" Then Exit Sub
 If Not Dir$(CMDialog1.filename) = "" Then
  If Not MsgBox("Die Datei " + CMDialog1.filename + " ist bereits vorhanden. Wollen sie diese Datei überschreiben?", 4, "Fehler") = 6 Then GoTo Noch
 End If
 If Not Right$(CMDialog1.filename, 4) = ".SCE" Then
  MsgBox "Die Erweiterung muß SCE sein!", , "Hinweis"
  GoTo Noch
 End If
 Raum1 0, Raum
 Dim FileNum%, Text$, ZG, GZ, TT1$
 ZG = 0
 Do
  ZG = ZG + 1
  If Level(ZG) = "" Then
   FileNum% = FreeFile
   Open "Leer.Dat" For Input As FileNum%
   GZ = 0
   Do
    GZ = GZ + 1
    Input #FileNum%, TT1$
    Level(ZG) = Level(ZG) & TT1$ & Chr$(13) & Chr$(10)
   Loop While Not GZ = 400
  End If
  Text$ = Text$ & ":RAUM" & ZG & Chr$(13) & Chr$(10) & Level(ZG)
 Loop While Not ZG = 20
 FileNum% = FreeFile
 Open CMDialog1.filename For Output As FileNum%
 Print #FileNum%, Text$
 Close FileNum%
 MsgBox "Daten wurden abgespeichert!", , "Speichern"
 ChDir P
 Exit Sub
D:
 MsgBox "Fehler beim schreiben der Datei " & CMDialog1.filename, , "Fehler"
 ChDir P
 Exit Sub
End Sub

Private Sub steuer_Click()
 MsgBox "Unten klicken sie das entsprechende Teil an, das sie editieren wollen. Dann klicken sie es irgendwo in den Raum hin. Speichern, laden, usw. können sie oben im Menü.", , "Steuerung zu Robot Raum_Editor 1.00"
End Sub


Private Sub Teil_Click(Index As Integer)
 Dim ZUT
 ZUT = 0
 Do
  ZUT = ZUT + 1
  Teil(ZUT).BorderStyle = 0
 Loop While Not ZUT = 14
 Teil(Index).BorderStyle = 1
End Sub

Private Sub Über_Click()
 MsgBox "Robot Raum-Editor 1.00" + Chr(13) + "Dies ist ein Programm von Albert Zeyer." + Chr(13) + "Ich hoffe, es gefällt ihnen." + Chr(13) + "Bei Fehlern wenden sie sich bitte an den Hersteller." + Chr(13) + "Viel Spaß beim spielen!", , "Über"
End Sub

Private Function X(X1)
 Dim H, XX1
 XX1 = X1
 H = 0
 Do
 H = H + 1
 If XX1 = H * 20 Then
  XX1 = XX1 - 20
  GoTo H
 End If
 Loop While Not H = 20
H:
 X = Int(XX1 / 20) + 1
 'MsgBox "Int((" & X1 & " / 20) - 0,1) + 1 = " & X(X1), , "Rechnung"
End Function

Private Function Y(Y1)
 Dim F
 F = Y1 - (20 * (X(Y1) - 1))
 If F = 0 Then Y = 20 Else Y = F
 'MsgBox Y1 & " - (20 * (" & ZF1 & " - 1)) = " & Y(Y1), , "Rechnung"
End Function



