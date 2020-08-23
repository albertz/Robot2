VERSION 4.00
Begin VB.Form Form1 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Robot 1.00"
   ClientHeight    =   5532
   ClientLeft      =   3972
   ClientTop       =   2376
   ClientWidth     =   4824
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
   Height          =   6084
   Icon            =   "Robot1.frx":0000
   Left            =   3924
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5532
   ScaleWidth      =   4824
   Top             =   1872
   Width           =   4920
   Begin VB.Timer König 
      Interval        =   250
      Left            =   2880
      Top             =   2040
   End
   Begin VB.Timer Robot 
      Interval        =   500
      Left            =   2280
      Top             =   2040
   End
   Begin VB.Timer Timer2 
      Interval        =   1
      Left            =   2520
      Top             =   6360
   End
   Begin VB.TextBox Text1 
      Appearance      =   0  'Flat
      Height          =   285
      Left            =   1200
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   6360
      Width           =   855
   End
   Begin VB.Image Pict 
      Height          =   252
      Index           =   1
      Left            =   4920
      Stretch         =   -1  'True
      Top             =   120
      Width           =   252
   End
   Begin MSComDlg.CommonDialog CMDialog1 
      Left            =   1680
      Top             =   2040
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   327680
      CancelError     =   -1  'True
      DefaultExt      =   "*.SPI"
      FileName        =   "*.SPI"
      Filter          =   "Spielstände von Robot 1.00 |*.SPI"
      Flags           =   4
   End
   Begin VB.Image Dinge 
      Height          =   255
      Index           =   1
      Left            =   2640
      Stretch         =   -1  'True
      Top             =   4800
      Width           =   255
   End
   Begin VB.Label Label1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label1"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   0
      TabIndex        =   4
      Top             =   4800
      Width           =   2655
   End
   Begin VB.Image Image1 
      Height          =   255
      Index           =   1
      Left            =   0
      Stretch         =   -1  'True
      Top             =   0
      Width           =   255
   End
   Begin VB.Label Label5 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Raum: 1"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   1320
      TabIndex        =   3
      Top             =   5040
      Width           =   1335
   End
   Begin VB.Label Label4 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Punkte: 0"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   0
      TabIndex        =   2
      Top             =   5280
      Width           =   2655
   End
   Begin VB.Label Label3 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Leben: 3"
      ForeColor       =   &H80000008&
      Height          =   255
      Left            =   0
      TabIndex        =   1
      Top             =   5040
      Width           =   1335
   End
   Begin VB.Menu Spiel 
      Caption         =   "Spiel"
      Begin VB.Menu neu 
         Caption         =   "Neu"
      End
      Begin VB.Menu laden 
         Caption         =   "Laden"
      End
      Begin VB.Menu C 
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
      Begin VB.Menu B 
         Caption         =   "-"
      End
      Begin VB.Menu HS 
         Caption         =   "HighScore"
      End
   End
End
Attribute VB_Name = "Form1"
Attribute VB_Creatable = False
Attribute VB_Exposed = False
'Dim Hinter, Wand, Figur
Dim Pause, Leben, Punkte, Raum, Hint(1 To 400)
Dim Punkt(1 To 10)
Dim Nam(1 To 10)
Dim Cheat, FG1, FG2
Dim Level(1 To 20)
Dim Feld(1 To 400) As String
Dim Ruck(1 To 27)
Dim AusW, Tuer
Dim Diamant(1 To 3)
Function BLDN(Z As Integer) As String
 Dim D As String
 D = ""
 If Z = 1 Then D = "HINTER.BMP"
 If Z = 2 Then D = "FIGUR.BMP"
 If Z = 3 Then D = "WAND1.BMP"
 If Z = 4 Then D = "WAND2.BMP"
 If Z = 5 Then D = "WAND3.BMP"
 If Z = 6 Then D = "ROBOT1.BMP"
 If Z = 7 Then D = "ROBOT2.BMP"
 If Z = 8 Then D = "ROBOT3.BMP"
 If Z = 9 Then D = "ROBOT4.BMP"
 If Z = 10 Then D = "ROBOT5.BMP"
 If Z = 11 Then D = "ROBOT6.BMP"
 If Z = 12 Then D = "ROBOT7.BMP"
 If Z = 13 Then D = "ROBOT8.BMP"
 If Z = 14 Then D = "ROBOT9.BMP"
 If Z = 15 Then D = "KONIG.BMP"
 If Z = 16 Then D = "SCHL1.BMP"
 If Z = 17 Then D = "SCHL2.BMP"
 If Z = 18 Then D = "SCHL3.BMP"
 If Z = 19 Then D = "SCHL4.BMP"
 If Z = 20 Then D = "SCHL5.BMP"
 If Z = 21 Then D = "SCHL6.BMP"
 If Z = 22 Then D = "SCHL7.BMP"
 If Z = 23 Then D = "SCHL8.BMP"
 If Z = 24 Then D = "SCHL9.BMP"
 If Z = 25 Then D = "TUER1.BMP"
 If Z = 26 Then D = "TUER2.BMP"
 If Z = 27 Then D = "TUER3.BMP"
 If Z = 28 Then D = "TUER4.BMP"
 If Z = 29 Then D = "TUER5.BMP"
 If Z = 30 Then D = "TUER6.BMP"
 If Z = 31 Then D = "TUER7.BMP"
 If Z = 32 Then D = "TUER8.BMP"
 If Z = 33 Then D = "TUER9.BMP"
 If Z = 34 Then D = "PUNKT1.BMP"
 If Z = 35 Then D = "PUNKT2.BMP"
 If Z = 36 Then D = "PUNKT3.BMP"
 If Z = 37 Then D = "PUNKT4.BMP"
 If Z = 38 Then D = "PUNKT5.BMP"
 If Z = 39 Then D = "AETZ.BMP"
 If Z = 40 Then D = "LEBEN.BMP"
 If Z = 41 Then D = "KILL.BMP"
 If Z = 42 Then D = "SPEICHER.BMP"
 If Z = 43 Then D = "DIAMANT1.BMP"
 If Z = 44 Then D = "DIAMANT2.BMP"
 If Z = 45 Then D = "DIAMANT3.BMP"
 If Z = 46 Then D = "CODE1.BMP"
 If Z = 47 Then D = "CODE2.BMP"
 If Z = 48 Then D = "CODE3.BMP"
 BLDN = D
End Function


Function WB(D As String) As Integer
 Dim Z As Integer
 Z = 0
 If D = "HINTER.BMP" Then Z = 1
 If D = "FIGUR.BMP" Then Z = 2
 If D = "WAND1.BMP" Then Z = 3
 If D = "WAND2.BMP" Then Z = 4
 If D = "WAND3.BMP" Then Z = 5
 If D = "ROBOT1.BMP" Then Z = 6
 If D = "ROBOT2.BMP" Then Z = 7
 If D = "ROBOT3.BMP" Then Z = 8
 If D = "ROBOT4.BMP" Then Z = 9
 If D = "ROBOT5.BMP" Then Z = 10
 If D = "ROBOT6.BMP" Then Z = 11
 If D = "ROBOT7.BMP" Then Z = 12
 If D = "ROBOT8.BMP" Then Z = 13
 If D = "ROBOT9.BMP" Then Z = 14
 If D = "KONIG.BMP" Then Z = 15
 If D = "SCHL1.BMP" Then Z = 16
 If D = "SCHL2.BMP" Then Z = 17
 If D = "SCHL3.BMP" Then Z = 18
 If D = "SCHL4.BMP" Then Z = 19
 If D = "SCHL5.BMP" Then Z = 20
 If D = "SCHL6.BMP" Then Z = 21
 If D = "SCHL7.BMP" Then Z = 22
 If D = "SCHL8.BMP" Then Z = 23
 If D = "SCHL9.BMP" Then Z = 24
 If D = "TUER1.BMP" Then Z = 25
 If D = "TUER2.BMP" Then Z = 26
 If D = "TUER3.BMP" Then Z = 27
 If D = "TUER4.BMP" Then Z = 28
 If D = "TUER5.BMP" Then Z = 29
 If D = "TUER6.BMP" Then Z = 30
 If D = "TUER7.BMP" Then Z = 31
 If D = "TUER8.BMP" Then Z = 32
 If D = "TUER9.BMP" Then Z = 33
 If D = "PUNKT1.BMP" Then Z = 34
 If D = "PUNKT2.BMP" Then Z = 35
 If D = "PUNKT3.BMP" Then Z = 36
 If D = "PUNKT4.BMP" Then Z = 37
 If D = "PUNKT5.BMP" Then Z = 38
 If D = "AETZ.BMP" Then Z = 39
 If D = "LEBEN.BMP" Then Z = 40
 If D = "KILL.BMP" Then Z = 41
 If D = "SPEICHER.BMP" Then Z = 42
 If D = "DIAMANT1.BMP" Then Z = 43
 If D = "DIAMANT2.BMP" Then Z = 44
 If D = "DIAMANT3.BMP" Then Z = 45
 If D = "CODE1.BMP" Then Z = 46
 If D = "CODE2.BMP" Then Z = 47
 If D = "CODE3.BMP" Then Z = 48
 WB = Z
End Function
Private Sub Akt()
 Dim Zahl, Z3
 Zahl = 0
 Do
  Zahl = Zahl + 1
  Image1(Zahl).Picture = Pict(WB(Feld(Zahl))).Picture
 Loop While Not Zahl = 400
 'On Error Resume Next
 Label3.Caption = "Leben: " & Leben
 Label4.Caption = "Punkte: " & Punkte
 Label5.Caption = "Raum: " & Raum
End Sub


Sub Einsatz(SATZ)
 ChDir P
 If Ruck(SATZ) = "" Then
  MsgBox "Sie haben keinen Gegenstand ausgwählt.", , "Hinweis"
  AusW = 2
  Exit Sub
 End If
 Dim GRE
 GRE = Ruck(SATZ)
 If Left(GRE, 4) = "SCHL" Then
  MsgBox "Schlüssel kann man nicht benutzen. Mit ihnen kann man durch Türen gehen.", , "Hinweis"
  Exit Sub
 End If
 SND = Shell("Play.Exe EINSATZ.WAV", 1)
 If GRE = "AETZ.BMP" Then
  Dim Zahl
  Zahl = 0
  Do
   Zahl = Zahl + 1
   If Feld(Zahl) = "FIGUR.BMP" Then GoTo Zahl
  Loop While Not Zahl = 400
  MsgBox "Männchen wurde nicht gefunden!", , "Fehler"
  End
Zahl:
  Dim RT
  If (Rand(Zahl + 1) = False) And (Feld(Zahl + 1) = "WAND1.BMP") Then
   Feld(Zahl + 1) = "HINTER.BMP"
   RT = True
  End If
  If (Rand(Zahl - 1) = False) And (Feld(Zahl - 1) = "WAND1.BMP") Then
   Feld(Zahl - 1) = "HINTER.BMP"
   RT = True
  End If
  If (Rand(Zahl + 20) = False) And (Feld(Zahl + 20) = "WAND1.BMP") Then
   Feld(Zahl + 20) = "HINTER.BMP"
   RT = True
  End If
  If (Rand(Zahl - 20) = False) And (Feld(Zahl - 20) = "WAND1.BMP") Then
   Feld(Zahl - 20) = "HINTER.BMP"
   RT = True
  End If
  If RT = True Then GoTo RT
  MsgBox "Sie können hier keine Mauer wegätzen.", , "Hinweis"
  Exit Sub
RT:
  Dinge(SATZ).Picture = Pict(1).Picture
  Ruck(SATZ) = ""
  Akt
  MsgBox "Mauer wurde weggeätzt.", , "Hinweis"
  Exit Sub
 End If
 If GRE = "LEBEN.BMP" Then
  If Leben = 10 Then
   MsgBox "Sie können nicht mehr als 10 Leben haben.", , "Hinweis"
   Exit Sub
  End If
  Leben = Leben + 1
  Akt
  Dinge(SATZ).Picture = Pict(1).Picture
  Ruck(SATZ) = ""
  Exit Sub
 End If
 If Left(GRE, 7) = "DIAMANT" Then
  Dim Zahl1
  Zahl1 = 0
  Do
   Zahl1 = Zahl1 + 1
   If Feld(Zahl1) = "FIGUR.BMP" Then GoTo Zahl1
  Loop While Not Zahl1 = 400
  MsgBox "Männchen wurde nicht gefunden!", , "Fehler"
  End
Zahl1:
  If (Rand(Zahl1 + 1) = False) And (Feld(Zahl1 + 1) = "CODE" & Mid(GRE, 8, 1) & ".BMP") Then
   Feld(Zahl1 + 1) = "HINTER.BMP"
   GoTo RT1
  End If
  If (Rand(Zahl1 - 1) = False) And (Feld(Zahl1 - 1) = "CODE" & Mid(GRE, 8, 1) & ".BMP") Then
   Feld(Zahl1 - 1) = "HINTER.BMP"
   GoTo RT1
  End If
  If (Rand(Zahl1 + 20) = False) And (Feld(Zahl1 + 20) = "CODE" & Mid(GRE, 8, 1) & ".BMP") Then
   Feld(Zahl1 + 20) = "HINTER.BMP"
   GoTo RT1
  End If
  If (Rand(Zahl1 - 20) = False) And (Feld(Zahl1 - 20) = "CODE" & Mid(GRE, 8, 1) & ".BMP") Then
   Feld(Zahl1 - 20) = "HINTER.BMP"
   GoTo RT1
  End If
  MsgBox "Sie können hier keinen Diamant hinsetzen.", , "Hinweis"
  Exit Sub
RT1:
  Dinge(SATZ).Picture = Pict(1).Picture
  Ruck(SATZ) = ""
  Diamant(Mid(GRE, 8, 1) * 1) = 1
  Punkte = Punkte + 1000
  Akt
  MsgBox "Diamant wurde gesetzt.", , "Hinweis"
  Exit Sub
 End If
 If GRE = "SPEICHER.BMP" Then
  Raum1 0, Raum
  On Error GoTo D
NN:
  CMDialog1.Action = 2
  If CMDialog1.filename = "*.SPI" Then
   If MsgBox("Sie müssen eine Datei auswählen. Wollen sie abbrechen?", 4, "Abbrechen") = 6 Then Exit Sub
   GoTo NN
  End If
  If Not Dir$(CMDialog1.filename) = "" Then
   If Not MsgBox("Die Datei " + CMDialog1.filename + " ist bereits vorhanden. Wollen sie diese Datei überschreiben?", 4, "Fehler") = 6 Then GoTo NN
  End If
  If Not Right$(CMDialog1.filename, 4) = ".SPI" Then
   MsgBox "Die Erweiterung muß SPI sein!", , "Hinweis"
   GoTo NN
  End If
  Dinge(SATZ).Picture = Pict(1).Picture
  Ruck(SATZ) = ""
  Dim FileNum%, Text$, ZG, GZ, TT1$
  Text$ = Text$ & Raum & Chr$(13) & Chr$(10)
  Text$ = Text$ & Name1 & Chr$(13) & Chr$(10)
  Text$ = Text$ & Punkte & Chr$(13) & Chr$(10)
  Text$ = Text$ & Leben & Chr$(13) & Chr$(10)
  Text$ = Text$ & Diamant(1) & Chr$(13) & Chr$(10)
  Text$ = Text$ & Diamant(2) & Chr$(13) & Chr$(10)
  Text$ = Text$ & Diamant(3) & Chr$(13) & Chr$(10)
  Text$ = Text$ & Tuer & Chr$(13) & Chr$(10)
  Text$ = Text$ & ":RUCK" & Chr$(13) & Chr$(10)
  ZG = 0
  Do
   ZG = ZG + 1
   Text$ = Text$ & Ruck(ZG) & Chr$(13) & Chr$(10)
  Loop While Not ZG = 27
  Text$ = Text$ & "ENDE" & Chr$(13) & Chr$(10)
  ZG = 0
  Do
   ZG = ZG + 1
   Text$ = Text$ & ":RAUM" & ZG & Chr$(13) & Chr$(10) & Level(ZG)
  Loop While Not ZG = 20
  FileNum% = FreeFile
  Open CMDialog1.filename For Output As FileNum%
  Print #FileNum%, Text$
  Close FileNum%
  Akt
  MsgBox "Daten wurden abgespeichert!", , "Speichern"
  ChDir P
  Exit Sub
 End If
D:
  If Err = 32755 Then
   If MsgBox("Sie müssen eine Datei auswählen. Wollen sie abbrechen?", 4, "Abbrechen") = 6 Then Exit Sub
   Resume
  End If
  MsgBox "Fehler beim schreiben der Datei " & CMDialog1.filename, , "Fehler"
  ChDir P
  Exit Sub
End Sub

Function Rand(UZ)
  Dim UZA
  UZA = 0
  Do
   UZA = UZA + 1
   If UZ < 20 Then GoTo OU
   If UZ > 380 Then GoTo OU
   If UZ = (UZA * 20) + 1 Then GoTo OU
   If UZ = UZA * 20 Then
OU:
    Rand = True
    Exit Function
   End If
  Loop While Not UZA = 20
  Rand = False
End Function

Sub Raum1(R1, R2)
  ChDir P
  If R1 < 0 Then GoTo ZFG1
  If R2 < 0 Then GoTo ZFG1
  If R1 > 20 Then GoTo ZFG1
  If R2 > 20 Then GoTo ZFG1
  GoTo ZFG2
ZFG1:
  MsgBox "Der nächste Raum konnte nicht geladen werden. Es kann daran liegen, daß das aktuelle Scenario falsch editiert wurde. Kontrolieren sie das bitte. Das Programm wird nun beendet.", , "Fehler"
  End
ZFG2:
  If R2 = 0 Then GoTo ZS
  Level(R2) = ""
  Dim UH$, UR
  UR = 0
  Do
   UR = UR + 1
   UH$ = Feld(UR) & Chr$(13) & Chr$(10)
   Level(R2) = Level(R2) & UH$
  Loop While Not UR = 400
ZS:
  If R1 = 0 Then Exit Sub
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
End Sub











Private Sub Bumm()
 If Leben = 0 Then
  MsgBox "Sie haben verloren.", , "Game Over"
  HighScore 1
  If Not MsgBox("Wollen sie nocheinmal spielen?", 4, "Ende") = 6 Then End
  On Error GoTo f1
  Dim Eddy
  Eddy = Shell("Robot.exe", 1)
  End
 End If
 Leben = Leben - 1
 MsgBox "Sie haben ein Leben verloren!", , "Noch " & Leben & " Leben"
 'Shape1(1).BackColor = Grün
 'Shape1(2).BackColor = Grün
 'Shape1(3).BackColor = Grün
 'Wurm(1) = 3
 'Wurm(2) = 2
 'Wurm(3) = 1
 'Gauge1.Value = 0
 'R = "R"
 'Zufall
 Akt
 Exit Sub
f1:
 If MsgBox("Die Programmdatei wurde nicht im aktuellen Verzeichnis gefunden. Haben sie das Programm im Verzeichnisses des Programms gestartet?", 4, "Fehler") = 6 Then
  MsgBox "Die Programmdatei wurde nicht gefunden! Starten sie das Programm nocheinmal neu und wenden sie sich an den Hersteller.", , "Ende"
  End
 End If
 If MsgBox("Die Programmdatei kann nicht gefunden werden! Starten sie das Programm nächstens im Verzeichnis das Programms. Wollen sie das Programm jetzt beenden?", 4, "Ende") = 6 Then End
 Exit Sub
End Sub



Function Stelle(ST1, ST2)
 Dim STS2
 STS2 = ST2
 STS2 = (STS2 * 20) - 20
 'MsgBox "FG1: " & ST1 & " ; FG2: " & ST2 & Chr$(13) & ST1 & " + (" & ST2 & " * 20) - 20) = " & (ST1 + STS2), , "Rechnung + Variablen"
 Stelle = ST1 + STS2
End Function

Sub TOT()
 Punkte = Punkte + 250
 Dim OUI
 OUI = 0
 Do
  OUI = OUI + 1
  If Left$(Feld(OUI), 5) = "ROBOT" Then Feld(OUI) = "HINTER.BMP"
 Loop While Not OUI = 400
 Akt
 MsgBox "Alle Roboter in diesem Raum wurden zerstört!", , "Hinweis"
End Sub

Private Sub ende_Click()
 SND = Shell("Play.Exe ENDE.WAV", 1)
 If MsgBox("Wollen sie wirklich schon dieses Programm beenden?", 4, "Ende") = 6 Then End
End Sub

Private Sub Form_Load()
 ChDir P
 Dim FileNum%, Temp$, Zahl, Z1, Z2, DAT$
 SND = Shell("Play.Exe NEWGAME.WAV", 1)
 Dim ZZ1 As Integer
 ZZ1 = 1
 Pict(1).Picture = LoadPicture(BLDN(1))
 Do
  ZZ1 = ZZ1 + 1
  Load Pict(ZZ1)
  Pict(ZZ1).Top = (ZZ1 * 240) - 120
  Pict(ZZ1).Left = Pict(1).Left
  Pict(ZZ1).Visible = True
  Pict(ZZ1).Enabled = True
  Pict(ZZ1).Picture = LoadPicture(BLDN(ZZ1))
 Loop While Not ZZ1 = 48
 FileNum% = FreeFile
 'Räume(1).Value = True
 Open "DATEN.DAT" For Input As FileNum%
 Input #FileNum%, DAT$
 Input #FileNum%, DAT$
 Close FileNum%
 FileNum% = FreeFile
 Dim HFG
 HFG = 0
 Do
  HFG = HFG + 1
  Level(HFG) = ""
 Loop While Not HFG = 20
 Open DAT$ For Input As FileNum%
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
 'MsgBox "Datei wurde geladen!", , "Laden"
 'Exit Sub
'E:
 'MsgBox "Fehler beim lesen der Datei " & CMDialog1.filename, , "Fehler"
 'Exit Sub
 'On Error Resume Next
 'On Error GoTo Fehler
 Dim Z3
 'Weiß = QBColor(7)
 'Rot = QBColor(12)
 'Grün = QBColor(10)
 'Boden =
 Z3 = 1
 Z2 = Dinge(1).Top
 Z1 = 0
 Dinge(1).Picture = Pict(1).Picture
 Do
  Z1 = Z1 + 1
  Z3 = Z3 + 1
  Load Dinge(Z3)
  Dinge(Z3).Visible = True
  Dinge(Z3).Height = 255
  Dinge(Z3).Left = Dinge(1).Left + (Z1 * 240)
  Dinge(Z3).Top = Z2
  Dinge(Z3).Width = 255
  Dinge(Z3).Picture = Pict(1).Picture
  If Z1 = 8 Then
   Z1 = -1
   Z2 = Z2 + 240
  End If
 Loop While Not Z2 = Dinge(1).Top + 720
 Image1(1).Picture = Pict(3).Picture
 Z3 = 0
 Do
  Z3 = Z3 + 1
  Hint(Z3) = False
 Loop While Not Z3 = 400
 Figur = Pict(2).Picture
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
  Image1(Zahl).Picture = Pict(1).Picture
  If Zahl < 21 Then
   Hint(Zahl) = True
   Image1(Zahl).Picture = Pict(3).Picture
   GoTo Weg
  End If
  If Zahl > 380 Then
   Hint(Zahl) = True
   Image1(Zahl).Picture = Pict(3).Picture
   GoTo Weg
  End If
  Z3 = 0
  Do
   Z3 = Z3 + 1
   If Zahl = Z3 * 20 Then
    Hint(Zahl) = True
    Image1(Zahl).Picture = Pict(3).Picture
    'MsgBox Z3 & " * 20 = " & Zahl, , "Rechnung"
    GoTo Weg
   ElseIf Zahl = (Z3 * 20) + 1 Then
    Hint(Zahl) = True
    Image1(Zahl).Picture = Pict(3).Picture
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
 Label1.Caption = "Name: " + Name1
 FG1 = 2 'Figur Pos X
 FG2 = 2 'Figur Pos Y
 Raum = 1 'Raum Nr
 Leben = 3 'Anz Leben
 Punkte = 0 'Anz Punkte
 Hint(1) = True
 Pause = True 'Pausierung
 Dinge(1).BorderStyle = 1 'ausgewaehltes Ding
 AusW = 1 'Auswahl?
 Tuer = ""
 Diamant(1) = 0 'Diamant gesetzt
 Diamant(2) = 0
 Diamant(3) = 0
 Akt
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

Private Sub HighScore(M)
 ChDir P
 On Error GoTo GZH
 Dim FileNum%, Text$
 FileNum% = FreeFile
 Open "DATEN.DAT" For Input As FileNum%
 Input #FileNum%, Text$
 Input #FileNum%, Text$
 'MsgBox "Erste geschaft."
 Dim ZH
 ZH = 0
 Do
  ZH = ZH + 1
  Input #FileNum%, Text$
  'MsgBox Text$
  Nam(ZH) = Text$
  'MsgBox "Zweit läuft." & Chr$(13) & "Nam(" & ZH & "): " & Nam(ZH)
 Loop While Not ZH = 10
 Close FileNum%
 ZH = 0
 Dim ZUF
 Do
  ZH = ZH + 1
  ZUF = Right$(Nam(ZH), Len(Nam(ZH)) - 10)
  Punkt(ZH) = ZUF * 1
  Nam(ZH) = Left$(Nam(ZH), 10)
  'MsgBox "Dritte läuft." & Chr$(13) & "Nam(" & ZH & "): " & Nam(ZH) & Chr$(13) & "Punkt(" & ZH & "): " & Punkt(ZH)
 Loop While Not ZH = 10
 If M = 1 Then
  'MsgBox "Es wird geguckt, ob du eingetragen wirst!"
  ZH = 0
  Do
   ZH = ZH + 1
   If Punkte > Punkt(ZH) Then
    'MsgBox "Du hast " & Punkte & " Punkte und der vorige hatte " & Punkt(ZH) & " Punkte.", , "Punkte"
    SND = Shell("Play.Exe HISCORE.WAV", 1)
    MsgBox "Sie können sich auf dem " & ZH & ". Platz eintragen!", , "Herzlichen Glückwunsch"
    Dim ZHZH
    ZHZH = ZH
    If ZHZH = 10 Then GoTo ZHZH
    ZH = 11
    Do
     ZH = ZH - 1
     Nam(ZH) = Nam(ZH - 1)
     Punkt(ZH) = Punkt(ZH - 1)
    Loop While Not ZH - 1 = ZHZH
ZHZH:
    Nam(ZHZH) = Left$(Name1 & "            ", 10)
    Punkt(ZHZH) = Punkte
    GoTo Raus
   End If
  Loop While Not ZH = 10
  MsgBox "Sie können sich leider nicht in die HighScore eintragen. Vieleicht wird es nächstes mal besser!", , "Schade"
  GoTo Zeigen
Raus:
  Dim TextT1$
  Text$ = ""
  FileNum% = FreeFile
  Open "DATEN.DAT" For Input As FileNum%
  Input #FileNum%, Text$
  Text$ = Text$ + Chr$(13) + Chr$(10)
  Input #FileNum%, TextT1$
  Text$ = Text$ + TextT1$ + Chr$(13) + Chr$(10)
  'Loop While Not TextT1$ = "ENDE"
  Close FileNum%
  'MsgBox "Datei wurde gelesen:" & Chr$(13) & Text$
  FileNum% = FreeFile
  Text$ = Text$ & Nam(1) & Punkt(1) & Chr$(13) & Chr$(10) & Nam(2) & Punkt(2) & Chr$(13) & Chr$(10) & Nam(3) & Punkt(3) & Chr$(13) & Chr$(10) & Nam(4) & Punkt(4) & Chr$(13) & Chr$(10) & Nam(5) & Punkt(5) & Chr$(13) & Chr$(10) & Nam(6) & Punkt(6) & Chr$(13) & Chr$(10) & Nam(7) & Punkt(7) & Chr$(13) & Chr$(10) & Nam(8) & Punkt(8) & Chr$(13) & Chr$(10) & Nam(9) & Punkt(9) & Chr$(13) & Chr$(10) & Nam(10) & Punkt(10) & Chr$(13) & Chr$(10)
  'MsgBox "So wird die Datei abgespeichert:" & Chr$(13) & Text$
  Open "DATEN.DAT" For Output As FileNum%
  Print #FileNum%, Text$
  Close FileNum%
 End If
Zeigen:
 MsgBox Nam(1) & " - " & Punkt(1) & Chr$(13) & Nam(2) & " - " & Punkt(2) & Chr$(13) & Nam(3) & " - " & Punkt(3) & Chr$(13) & Nam(4) & " - " & Punkt(4) & Chr$(13) & Nam(5) & " - " & Punkt(5) & Chr$(13) & Nam(6) & " - " & Punkt(6) & Chr$(13) & Nam(7) & " - " & Punkt(7) & Chr$(13) & Nam(8) & " - " & Punkt(8) & Chr$(13) & Nam(9) & " - " & Punkt(9) & Chr$(13) & Nam(10) & " - " & Punkt(10), , "HighScore"
 Exit Sub
GZH:
 MsgBox "Fehler beim lesen/schreiben/finden der Datei DATEN.DAT!", , "Fehler"
 'MsgBox "Error: " & Err & Chr$(13) & Error(Err) & ".", , "Error"
 Exit Sub
End Sub

Private Sub hilfe_Click()
 MsgBox "Das Ziel des Spieles ist es, zum bösen König zu kommen, und ihn zu zerstören. Sie können ihn allerdings nicht soe einfach, wie die Roboter töten. Außerdem ist er auch schnelle. Wie sie ihn töten, werden sie im laufe des Spiels rauskriegen. Wie sie ihn zerstören, müssen sie selbst rauskriegen. Um zu ihm zu kommen, müssen sie durch viele Räume mit Hindernissen. Es gibt fast zu jedem Hindernis ein Schlüssel oder ähnliches. Die Türen lassen sich mit Schlüsseln überqueren, die Roboter müssen sie zerstören, manche Mauern lassen sich wegätzen, usw. Sie kommen in den nächsten Raum, indem sie alle Roboter des Raumes zerstören und durch einen der Ausgänge in der Wand gehen. Viel Spaß beim spielen.", , "Hilfe zu Robot 1.00"
End Sub

Private Sub HS_Click()
 HighScore 2
End Sub

Private Sub Laufen(R)
  'R in ['R','L','O','U']

  ChDir P 'ins eigene Verz wechseln, um Sounds usw. zu finden
  On Error Resume Next


  Dim TAS, G1, G2
  'G1: neue Pos
  'G2: alte Pos

  'suche Maennchen
  TAS = 0
  Do
   TAS = TAS + 1
   If Feld(TAS) = "FIGUR.BMP" Then
    G2 = TAS
    GoTo HJA
   End If
  Loop While Not TAS = 400
  MsgBox "Der Computer konnte das Männchen nicht finden! Das Programm wird beendet.", , "Fehler"
  End

HJA:
  If R = "R" Then G1 = G2 + 1
  If R = "L" Then G1 = G2 - 1
  If R = "O" Then G1 = G2 - 20
  If R = "U" Then G1 = G2 + 20
  If Feld(G1) = "WAND3.BMP" Then
   SND = Shell("Play.Exe STROM.WAV", 1)
   If Leben = 0 Then
     MsgBox "Sie sind gegen einen Elektro-Zaun gerannt. Game over!", , "Sie haben ein Leben verloren"
     HighScore 1
     Exit Sub
    Else
     Leben = Leben - 1
     MsgBox "Sie sind gegen einen Elektro-Zaun gerannt. Ein Leben weniger!", , "Sie haben ein Leben verloren"
   End If
  End If
  If Feld(G1) = "WAND1.BMP" Then
   SND = Shell("Play.Exe FL.WAV", 1)
   Exit Sub
  End If
  If Feld(G1) = "WAND2.BMP" Then
   SND = Shell("Play.Exe FL.WAV", 1)
   Exit Sub
  End If
  If Left(Feld(G1), 4) = "CODE" Then
   SND = Shell("Play.Exe FL.WAV", 1)
   Exit Sub
  End If
  If Feld(G1) = "KONIG.BMP" Then
   SND = Shell("Play.Exe KONIG.WAV", 1)
   If Leben = 0 Then
     MsgBox "Sie sind gegen den König gerannt. Game over!", , "Ende"
     HighScore 1
     If MsgBox("Wollen sie nocheinmal spielen?", 4, "Ende") = 6 Then
      Eddy = Shell("Robot.Exe", 1)
     End If
     End
    Else
     Leben = Leben - 1
     MsgBox "Sie sind gegen den König gerannt. Ein Leben weniger!", , "Sie haben ein Leben verloren"
   End If
   Feld(G2) = "HINTER.BMP"
   Image1(G2).Picture = Pict(WB(Feld(G2))).Picture
   Feld(G1) = "KONIG.BMP"
   Image1(G1).Picture = Pict(WB(Feld(G1))).Picture
   Feld(22) = "FIGUR.BMP"
   Image1(22).Picture = Pict(WB(Feld(22))).Picture
   Akt
   Exit Sub
  End If
  If Left(Feld(G1), 5) = "PUNKT" Then
   SND = Shell("Play.Exe PUNKT.WAV", 1)
   Punkte = Punkte + 1000
  End If
  If Feld(G1) = "KILL.BMP" Then
   SND = Shell("Play.Exe RL.WAV", 1)
   TOT
  End If
  Dim JKH
  JKH = 0
  Do
   JKH = JKH + 1
   If Ruck(JKH) = "" Then GoTo JKH
  Loop While Not JKH = 27
  JKH = 0
JKH:
  If Left(Feld(G1), 4) = "SCHL" Then
   SND = Shell("Play.Exe EINSATZ.WAV", 1)
   If JKH = 0 Then
    MsgBox "Ihr Rucksack ist leider voll. Benutzen oder löschen sie ein Ding aus dem Rucksack.", , "Hinweis"
    Exit Sub
   End If
   Punkte = Punkte + 500
   Ruck(JKH) = Feld(G1)
   Dinge(JKH).Picture = Pict(WB(Feld(G1))).Picture
  End If
  If Feld(G1) = "AETZ.BMP" Then
   SND = Shell("Play.Exe EINSATZ.WAV", 1)
   If JKH = 0 Then
    MsgBox "Ihr Rucksack ist leider voll. Benutzen oder löschen sie ein Ding aus dem Rucksack.", , "Hinweis"
    Exit Sub
   End If
   Ruck(JKH) = Feld(G1)
   Dinge(JKH).Picture = Pict(WB(Feld(G1))).Picture
  End If
  'If Feld(G1) = "AETZ.BMP" Then
  ' SND = Shell("Play.Exe EINSATZ.WAV", 1)
  ' If JKH = 0 Then
  '  MsgBox "Ihr Rucksack ist leider voll. Benutzen oder löschen sie ein Ding aus dem Rucksack.", , "Hinweis"
  '  Exit Sub
  ' End If
  ' Ruck(JKH) = Feld(G1)
  ' Dinge(JKH).Picture = LoadPicture(Feld(G1))
  'End If
  If Feld(G1) = "LEBEN.BMP" Then
   SND = Shell("Play.Exe EINSATZ.WAV", 1)
   If JKH = 0 Then
    MsgBox "Ihr Rucksack ist leider voll. Benutzen oder löschen sie ein Ding aus dem Rucksack.", , "Hinweis"
    Exit Sub
   End If
   Ruck(JKH) = Feld(G1)
   Dinge(JKH).Picture = Pict(WB(Feld(G1))).Picture
  End If
  If Feld(G1) = "SPEICHER.BMP" Then
   SND = Shell("Play.Exe EINSATZ.WAV", 1)
   If JKH = 0 Then
    MsgBox "Ihr Rucksack ist leider voll. Benutzen oder löschen sie ein Ding aus dem Rucksack.", , "Hinweis"
    Exit Sub
   End If
   Ruck(JKH) = Feld(G1)
   Dinge(JKH).Picture = Pict(WB(Feld(G1))).Picture
  End If
  If Left(Feld(G1), 7) = "DIAMANT" Then
   SND = Shell("Play.Exe PUNKT.WAV", 1)
   If JKH = 0 Then
    MsgBox "Ihr Rucksack ist leider voll. Benutzen oder löschen sie ein Ding aus dem Rucksack.", , "Hinweis"
    Exit Sub
   End If
   Punkte = Punkte + 1000
   Label4.Caption = "Punkte: " & Punkte
   Ruck(JKH) = Feld(G1)
   Dinge(JKH).Picture = Pict(WB(Feld(G1))).Picture
  End If
  Dim UZA
  UZA = 0
  Dim KLO, Tuer1
  KLO = 0
  If Not Tuer = "" Then
   KLO = 1
   Tuer1 = Tuer
   Tuer = ""
  End If
  If Left(Feld(G1), 4) = "TUER" Then
   SND = Shell("Play.Exe FL.WAV", 1)
   Dim YQA
   YQA = 0
   Do
    YQA = YQA + 1
    If Left(Ruck(YQA), 4) = "SCHL" Then
     If Mid(Ruck(YQA), 5, 1) = Mid(Feld(G1), 5, 1) Then
      Tuer = Feld(G1)
      GoTo YQA
     End If
    End If
   Loop While Not YQA = 27
   Exit Sub
  End If
YQA:
  Do 'untersuche, ob Raumwechseln noetig ist
   UZA = UZA + 1
   If G1 < 20 Then GoTo OUG
   If G1 > 380 Then GoTo OUG
   If G1 = (UZA * 20) + 1 Then GoTo OUG
   If G1 = UZA * 20 Then
OUG:
    If Not Tuer = "" Then Tuer = ""
    Feld(G2) = "HINTER.BMP"
    ' Else
    '  Feld(G2) = Tuer
    '  Tuer = ""
    'End If
    If R = "R" Then Raum1 Raum + 1, Raum
    If R = "L" Then Raum1 Raum - 1, Raum
    If R = "O" Then Raum1 Raum - 5, Raum
    If R = "U" Then Raum1 Raum + 5, Raum
    If R = "R" Then Feld(G1 - 18) = "FIGUR.BMP"
    If R = "L" Then Feld(G1 + 18) = "FIGUR.BMP"
    If R = "O" Then Feld(G1 + 360) = "FIGUR.BMP"
    If R = "U" Then Feld(G1 - 360) = "FIGUR.BMP"
    If R = "R" Then Raum = Raum + 1
    If R = "L" Then Raum = Raum - 1
    If R = "O" Then Raum = Raum - 5
    If R = "U" Then Raum = Raum + 5
    Akt
    Exit Sub
   End If
  Loop While Not UZA = 20
  'Dim KLO, Tuer1
  'If Feld(G1) = "HINTER.BMP" Then SND = Shell("Play.Exe FL.WAV", 1)
  If KLO = 0 Then Feld(G2) = "HINTER.BMP"
  If KLO = 1 Then Feld(G2) = Tuer1
  Feld(G1) = "FIGUR.BMP"
  Image1(G2).Picture = Pict(WB(Feld(G2))).Picture
  Image1(G1).Picture = Pict(2).Picture
  Label3.Caption = "Leben: " & Leben
  Label4.Caption = "Punkte: " & Punkte
  Label5.Caption = "Raum: " & Raum
End Sub



Private Sub König_Timer()
 If Pause = False Then
  'SND = Shell("Play.Exe RL.WAV", 1)
  'On Error Resume Next
  Dim Z1, RONE, FF, Eddy, Z2
  'FF: Pos von Figur
  'Z1: Pos von Koenig
  Dim VOR1
  'Z1 = 0
  'Do
  ' Z1 = Z1 + 1
  ' VOR(Z1) = 0
  'Loop While Not Z1 = 100
  'Anzahl = 0
  
  'suche Figur
  Z1 = 0
  Do
   Z1 = Z1 + 1
   If Feld(Z1) = "FIGUR.BMP" Then GoTo QAD1
  Loop While Not Z1 = 400
  MsgBox "Das Männchen wurde nicht gefunden!", , "Fehler"
  End

  'suche Koenig
QAD1:
  FF = Z1
  Z1 = 0
  Do
   Z1 = Z1 + 1
   If Feld(Z1) = "KONIG.BMP" Then
    SND = Shell("Play.Exe RL.WAV", 1)
    GoTo VOR1
   End If
  Loop While Not Z1 = 400
  Exit Sub

VOR1:
   If Y(Z1) = Y(FF) Then
ANDE1:
     If X(Z1) > X(FF) Then RONE = Z1 - 20 Else RONE = Z1 + 20
     If Feld(RONE) = "FIGUR.BMP" Then
      SND = Shell("Play.Exe KONIG.WAV", 1)
      If Leben = 0 Then
        MsgBox "Der König hat sie erreicht. Game Over.", , "Vorsicht"
        HighScore 1
        If MsgBox("Wollen sie nocheinmal spielen?", 4, "Ende") = 6 Then
         Eddy = Shell("Robot.Exe", 1)
        End If
        End
       Else
        Leben = Leben - 1
        MsgBox "Der König hat sie erreicht. Ein Leben weniger.", , "Vorsicht"
        'MsgBox "Meldung"
        GoTo WW
      End If
WW:
      'Feld(FF) = "HINTER.BMP"
      'MsgBox "HAlt"
      'MsgBox Str$(RONE)
      Feld(Z1) = "HINTER.BMP"
      Image1(Z1).Picture = Pict(WB(Feld(Z1))).Picture
      Feld(RONE) = "KONIG.BMP"
      Image1(RONE).Picture = Pict(WB(Feld(RONE))).Picture
      Feld(22) = "FIGUR.BMP"
      Image1(22).Picture = Pict(WB(Feld(22))).Picture
      Akt
      GoTo NNEE1
     End If
     If Feld(RONE) = "WAND3.BMP" Then
      If Diamant(1) = 1 Then
       If Diamant(2) = 1 Then
        If Diamant(3) = 1 Then
         SND = Shell("Play.Exe STROM.WAV", 1)
         MsgBox "Du hast es geschaft! Der König ist tot! Das Spiel ist zu Ende!", , "SpielEnde"
         HighScore 1
         If MsgBox("Wollen sie nocheinmal spielen?", 4, "Ende") = 6 Then
           SND = Shell("Robot.Exe", 1)
         End If
         End
        End If
       End If
      End If
     End If
     ' Feld(RONE) = "HINTER.BMP"
     ' Image1(RONE).Picture = LoadPicture(Feld(RONE))
     ' Feld(Z1) = "HINTER.BMP"
     ' Image1(Z1).Picture = LoadPicture(Feld(Z1))
     ' GoTo NNEE1
     'End If
     If Feld(RONE) = "WAND1.BMP" Then GoTo NNEE1
     If Feld(RONE) = "WAND2.BMP" Then GoTo NNEE1
     If Left(Feld(RONE), 4) = "CODE" Then GoTo NNEE1
     If Left(Feld(RONE), 4) = "TUER" Then GoTo NNEE1
     'If Left(Feld(RONE), 5) = "ROBOT" Then
     ' GoTo NNEE1
     'End If
     Feld(RONE) = Feld(Z1)
     Image1(RONE).Picture = Pict(WB(Feld(RONE))).Picture
     Feld(Z1) = "HINTER.BMP"
     Image1(Z1).Picture = Pict(WB(Feld(Z1))).Picture
    Else
     If Y(Z1) > Y(FF) Then RONE = Z1 - 1 Else RONE = Z1 + 1
     If Feld(RONE) = "FIGUR.BMP" Then
      SND = Shell("Play.Exe KONIG.WAV", 1)
      If Leben = 0 Then
        MsgBox "Der König hat sie erreicht. Game Over.", , "Vorsicht"
        HighScore 1
        If MsgBox("Wollen sie nocheinmal spielen?", 4, "Ende") = 6 Then
         Eddy = Shell("Robot.Exe", 1)
        End If
        End
       Else
        Leben = Leben - 1
        MsgBox "Der König hat sie erreicht. Ein Leben weniger.", , "Vorsicht"
        GoTo WW
      End If
      Feld(Z1) = "HINTER.BMP"
      Image1(Z1).Picture = Pict(WB(Feld(Z1))).Picture
      GoTo NNEE1
     End If
     If Feld(RONE) = "WAND3.BMP" Then
      If Diamant(1) = 1 Then
       If Diamant(2) = 1 Then
        If Diamant(3) = 1 Then
         SND = Shell("Play.Exe STROM.WAV", 1)
         MsgBox "Du hast es geschaft! Der König ist tot! Das Spiel ist zu Ende!", , "SpielEnde"
         HighScore 1
         If MsgBox("Wollen sie nocheinmal spielen?", 4, "Ende") = 6 Then
           SND = Shell("Robot.Exe", 1)
         End If
         End
        End If
       End If
      End If
     End If
     'If Feld(RONE) = "WAND3.BMP" Then
     ' Feld(RONE) = "HINTER.BMP"
     ' Image1(RONE).Picture = LoadPicture(Feld(RONE))
     ' Feld(Z1) = "HINTER.BMP"
     ' Image1(Z1).Picture = LoadPicture(Feld(Z1))
     ' GoTo NNEE1
     'End If
     If Feld(RONE) = "WAND1.BMP" Then GoTo ANDE1
     If Feld(RONE) = "WAND2.BMP" Then GoTo ANDE1
     'If Left(Feld(RONE), 4) = "WAND" Then GoTo ANDE1
     If Left(Feld(RONE), 4) = "CODE" Then GoTo ANDE1
     If Left(Feld(RONE), 4) = "TUER" Then GoTo ANDE1
     'If Left(Feld(RONE), 5) = "ROBOT" Then
     ' GoTo ANDE1
     'End If
     'If Feld(RONE) = "FIGUR.BMP" Then
     Feld(RONE) = Feld(Z1)
     Image1(RONE).Picture = Pict(WB(Feld(RONE))).Picture
     Feld(Z1) = "HINTER.BMP"
     Image1(Z1).Picture = Pict(WB(Feld(Z1))).Picture
   End If
 End If
NNEE1:
 Exit Sub
End Sub

Private Sub laden_Click()
 On Error GoTo E
Noch1:
 CMDialog1.Action = 1
 If CMDialog1.filename = "*.SPI" Then Exit Sub
 If Dir$(CMDialog1.filename) = "" Then
  MsgBox "Die Datei " + CMDialog1.filename + " ist nicht vorhanden. Wählen sie bitte eine andere Datei aus!", 4, "Fehler"
  GoTo Noch1
 End If
 If Not Right$(CMDialog1.filename, 4) = ".SPI" Then
  MsgBox "Die Erweiterung muß SPI sein!", , "Hinweis"
  GoTo Noch1
 End If
 Dim FileNum%, Temp$, TT1$, Zahl, Z1, Z2
 FileNum% = FreeFile
 'Räume(1).Value = True
 Dim HFG
 HFG = 0
 Do
  HFG = HFG + 1
  Level(HFG) = ""
 Loop While Not HFG = 20
 Open CMDialog1.filename For Input As FileNum%
 On Error Resume Next
 Zahl = 0
 Input #FileNum%, TT1$
 Raum = TT1$ * 1
 Input #FileNum%, TT1$
 Name1 = TT1$
 Label1.Caption = "Name: " & Name1
 Input #FileNum%, TT1$
 Punkte = TT1$ * 1
 Input #FileNum%, TT1$
 Leben = TT1$ * 1
 Input #FileNum%, TT1$
 Diamant(1) = TT1$ * 1
 Input #FileNum%, TT1$
 Diamant(2) = TT1$ * 1
 Input #FileNum%, TT1$
 Diamant(3) = TT1$ * 1
 Input #FileNum%, TT1$
 Tuer = TT1$
 Input #FileNum%, TT1$
 'Raum = TT1$ * 1
 Dim ZQW
 ZQW = 0
 Do
  ZQW = ZQW + 1
  Input #FileNum%, TT1$
  'Raum = TT1$ * 1
  Ruck(ZQW) = TT1$
  If TT1$ = "" Then Dinge(ZQW).Picture = Pict(1).Picture Else Dinge(ZQW).Picture = Pict(WB(TT1$)).Picture
 Loop While Not ZQW = 27
 Input #FileNum%, TT1$
 'Raum = TT1$ * 1
 AusW = 1
 Pause = True
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
 Raum1 Raum, 0
 Akt
 MsgBox "Datei wurde geladen!", , "Laden"
 ChDir P
 Exit Sub
E:
 If Err = 32755 Then Exit Sub
 MsgBox "Fehler beim lesen der Datei " & CMDialog1.filename, , "Fehler"
 ChDir P
 Exit Sub
End Sub

Private Sub neu_Click()
 On Error GoTo F
 If MsgBox("Wollen sie wirklich ein enues Spiel anfangen?", 4, "Neu") = 6 Then
  Dim Eddy
  Eddy = Shell("Robot.exe", 1)
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

Private Sub NextLevel()
 ChDir P
 'Wurm(1) = 3
 'Wurm(2) = 2
 'Wurm(3) = 1
 R = "R"
 Lang = 3
 Dim J
 J = 3
 Do
  J = J + 1
 'Ä Wurm(J) = ""
 Loop While Not J = 13
 'Gauge1.Value = 0
 Leben = Leben + 1
 Punkte = Punkte + 1000
 'Level = Level + 1
 On Error GoTo FFFF
 Dim FileNum%, Text, Num, Datei$
 FileNum% = FreeFile
 Open "DATEN.DAT" For Input As FileNum%
 Input #FileNum%, Text
 Dim LL
 'LL = Level - 1
 Do
  LL = LL - 1
  Input #FileNum%, Text
  If Text = "ENDE" Then
   Close FileNum%
   GoTo ENDENDE
  End If
 Loop While Not LL = 0
 Close FileNum%
 'MsgBox "Sie haben das " & (Level - 1) & ". Level geschaft. Sie bekommen ein Leben dazu und kommen ins nächste Level!", , "Levelende"
 If Dir$(Text) = "" Then
FFFF:
  If Text = "" Then MsgBox "Die Datei DATEN.DAT wurde nicht richtig geladen! Starten sie den LevelEditor und ändern sie die Einstellungen.", , "Fehler" Else MsgBox "Die LevelDatei " + Text + " wurde nicht gefunden! Starten sie bitte den LevelEditor und ändern sie die Einstellungen.", , "Fehler"
  End
 End If
 Datei$ = Text
 Num = 0
 Do
  Num = Num + 1
  Hint(Num) = False
 Loop While Not Num = 400
 FileNum% = FreeFile
 On Error Resume Next
 Open Datei$ For Input As FileNum%
 Do While Not EOF(FileNum%)
  Input #FileNum%, Text
  Text = Text * 1
  Hint(Text) = True
 Loop
 'Zufall
 Akt
 Exit Sub
ENDENDE:
 MsgBox "Das Spiel ist zu Ende! Sie haben gewonnen!", , "SpielEnde"
 HighScore 1
 If Not MsgBox("Wollen sie nocheinmal spielen?", 4, "Ende") = 6 Then End
 On Error GoTo ff1
 Dim Eddy
 Eddy = Shell("Wurm.exe", 1)
 End
 Exit Sub
ff1:
 If MsgBox("Die Programmdatei wurde nicht im aktuellen Verzeichnis gefunden. Haben sie das Programm im Verzeichnisses des Programms gestartet?", 4, "Fehler") = 6 Then
  MsgBox "Die Programmdatei wurde nicht gefunden! Starten sie das Programm nocheinmal neu und wenden sie sich an den Hersteller.", , "Ende"
  End
 End If
 If MsgBox("Die Programmdatei kann nicht gefunden werden! Starten sie das Programm nächstens im Verzeichnis das Programms. Wollen sie das Programm jetzt beenden?", 4, "Ende") = 6 Then End
 Exit Sub
End Sub

Private Sub ROBOT_Timer()
 If Pause = False Then
  'On Error Resume Next
  Dim Anzahl, Z1, RONE, FF, Eddy, Z2
  Dim VOR(1 To 100)
  Z1 = 0
  Do
   Z1 = Z1 + 1
   VOR(Z1) = 0
  Loop While Not Z1 = 100
  Anzahl = 0
  Z1 = 0
  Do
   Z1 = Z1 + 1
   If Feld(Z1) = "FIGUR.BMP" Then GoTo QAD
  Loop While Not Z1 = 400
  MsgBox "Das Männchen wurde nicht gefunden!", , "Fehler"
  End
QAD:
  FF = Z1
  Z1 = 0
  Do
   Z1 = Z1 + 1
   If Left(Feld(Z1), 5) = "ROBOT" Then
    Anzahl = Anzahl + 1
    'Dim VOR(1)
    VOR(Anzahl) = Z1
   End If
  Loop While Not Z1 = 400
  If Anzahl = 0 Then Exit Sub
  Z1 = 0
  'Z2 = Anzahl
  Do
  'Do
  'Do
  'Do
NNEEXX:
   Z1 = Z1 + 1
   Z2 = Anzahl + 1
   Do
    Z2 = Z2 - 1
    If VOR(Z2) = Z1 Then GoTo NEX
   Loop While Not Z2 = 1
   GoTo NNEE
NEX:
   If Left(Feld(Z1), 5) = "ROBOT" Then
    'Anzahl = Anzahl + 1
    SND = Shell("Play.Exe RL.WAV", 1)
    If Y(Z1) = Y(FF) Then
ANDE:
     If X(Z1) > X(FF) Then RONE = Z1 - 20 Else RONE = Z1 + 20
     If Feld(RONE) = "FIGUR.BMP" Then
      SND = Shell("Play.Exe ROBOT.WAV", 1)
      If Leben = 0 Then
        MsgBox "Ein Roboter hat sie erreicht. Game Over.", , "Vorsicht"
        HighScore 1
        If MsgBox("Wollen sie nocheinmal spielen?", 4, "Ende") = 6 Then
         Eddy = Shell("Robot.Exe", 1)
        End If
        End
       Else
        Leben = Leben - 1
        MsgBox "Ein Roboter hat sie erreicht. Ein Leben weniger.", , "Vorsicht"
      End If
      Feld(Z1) = "HINTER.BMP"
      Image1(Z1).Picture = Pict(WB(Feld(Z1))).Picture
      GoTo NNEE
     End If
     If Feld(RONE) = "WAND3.BMP" Then
      SND = Shell("Play.Exe STROM.WAV", 1)
      Feld(RONE) = "HINTER.BMP"
      Image1(RONE).Picture = Pict(WB(Feld(RONE))).Picture
      Feld(Z1) = "HINTER.BMP"
      Image1(Z1).Picture = Pict(WB(Feld(Z1))).Picture
      GoTo NNEE
     End If
     If Left(Feld(RONE), 4) = "WAND" Then GoTo NNEE
     If Left(Feld(RONE), 4) = "CODE" Then GoTo NNEE
     If Left(Feld(RONE), 4) = "TUER" Then GoTo NNEE
     If Left(Feld(RONE), 5) = "ROBOT" Then
      GoTo NNEE
     End If
     Feld(RONE) = Feld(Z1)
     Image1(RONE).Picture = Pict(WB(Feld(RONE))).Picture
     Feld(Z1) = "HINTER.BMP"
     Image1(Z1).Picture = Pict(WB(Feld(Z1))).Picture
    Else
     If Y(Z1) > Y(FF) Then RONE = Z1 - 1 Else RONE = Z1 + 1
     If Feld(RONE) = "FIGUR.BMP" Then
      SND = Shell("Play.Exe ROBOT.WAV", 1)
      If Leben = 0 Then
        MsgBox "Ein Roboter hat sie erreicht. Game Over.", , "Vorsicht"
        HighScore 1
        If MsgBox("Wollen sie nocheinmal spielen?", 4, "Ende") = 6 Then
         Eddy = Shell("Robot.Exe", 1)
        End If
        End
       Else
        Leben = Leben - 1
        MsgBox "Ein Roboter hat sie erreicht. Ein Leben weniger.", , "Vorsicht"
      End If
      Feld(Z1) = "HINTER.BMP"
      Image1(Z1).Picture = Pict(WB(Feld(Z1))).Picture
      GoTo NNEE
     End If
     If Feld(RONE) = "WAND3.BMP" Then
      SND = Shell("Play.Exe STROM.WAV", 1)
      Feld(RONE) = "HINTER.BMP"
      Image1(RONE).Picture = Pict(WB(Feld(RONE))).Picture
      Feld(Z1) = "HINTER.BMP"
      Image1(Z1).Picture = Pict(WB(Feld(Z1))).Picture
      GoTo NNEE
     End If
     If Left(Feld(RONE), 4) = "WAND" Then GoTo ANDE
     If Left(Feld(RONE), 4) = "CODE" Then GoTo ANDE
     If Left(Feld(RONE), 4) = "TUER" Then GoTo ANDE
     If Left(Feld(RONE), 5) = "ROBOT" Then
      GoTo ANDE
     End If
     Feld(RONE) = Feld(Z1)
     Image1(RONE).Picture = Pict(WB(Feld(RONE))).Picture
     Feld(Z1) = "HINTER.BMP"
     Image1(Z1).Picture = Pict(WB(Feld(Z1))).Picture
    End If
   End If

   'Do
   'Loop While Not Z1 = 400
  Loop While Not Z1 = 400
 End If
 Exit Sub
NNEE:
 If Not Z1 = 400 Then GoTo NNEEXX
 Exit Sub
End Sub

Private Sub steuer_Click()
 MsgBox "Das Männchen können sie einfach mit den Pfeiltasten bewegen. Asuwählen, was sie gerade steuern (Rucksack oder Männchen) können sie mit der Leertaste. Mit Enter setzen sie den ausgewählten Gegenstand aus dem Rucksack ein. Pause gibt es mit der Pause-Taste und abbrechen können sie mit ESC. Zusätliches können sie oben im Menü machen.", , "Steuerung zu Robot 1.00"
End Sub

Private Sub Text1_KeyDown(KeyCode As Integer, Shift As Integer)
  ChDir P
  If Pause = False Then
   If AusW = 1 Then
     'If (KeyCode = 39) And (Wurm(2) = Wurm(1) + 1) Then Exit Sub
     'If (KeyCode = 37) And (Wurm(2) = Wurm(1) - 1) Then Exit Sub
     'If (KeyCode = 38) And (Wurm(2) = Wurm(1) - 20) Then Exit Sub
     'If (KeyCode = 40) And (Wurm(2) = Wurm(1) + 20) Then Exit Sub
     If KeyCode = 37 Then
      Laufen "L"
      Exit Sub
     End If
     If KeyCode = 38 Then
      Laufen "O"
      Exit Sub
     End If
     If KeyCode = 39 Then
      Laufen "R"
      Exit Sub
     End If
     If KeyCode = 40 Then
      Laufen "U"
      Exit Sub
     End If
     If KeyCode = 27 Then
      ende_Click
      Exit Sub
     End If
     If KeyCode = 19 Then
      Pause = True
      Exit Sub
     End If
     If KeyCode = 13 Then
      Dim HSF
      HSF = 0
      Do
       HSF = HSF + 1
       If Dinge(HSF).BorderStyle = 1 Then GoTo HSF
      Loop While Not HSF = 27
      Dinge(1).BorderStyle = 1
      AusW = 2
      Exit Sub
HSF:
      Einsatz HSF
      Exit Sub
     End If
     If Chr$(KeyCode) = " " Then
      AusW = 2
      Exit Sub
     End If
    Else
     If Chr$(KeyCode) = " " Then
      AusW = 1
      Exit Sub
     End If
     Dim HSD
     HSD = 0
     Do
      HSD = HSD + 1
      If Dinge(HSD).BorderStyle = 1 Then GoTo HSD
     Loop While Not HSD = 27
     HSD = 1
     Dinge(1).BorderStyle = 1
HSD:
     If KeyCode = 38 Then
      If HSD < 10 Then Exit Sub
      Dinge(HSD).BorderStyle = 0
      Dinge(HSD - 9).BorderStyle = 1
      Exit Sub
     End If
     If KeyCode = 37 Then
      If HSD = 1 Then Exit Sub
      If HSD = 10 Then Exit Sub
      If HSD = 19 Then Exit Sub
      Dinge(HSD).BorderStyle = 0
      Dinge(HSD - 1).BorderStyle = 1
      Exit Sub
     End If
     If KeyCode = 39 Then
      If HSD = 9 Then Exit Sub
      If HSD = 18 Then Exit Sub
      If HSD = 27 Then Exit Sub
      Dinge(HSD).BorderStyle = 0
      Dinge(HSD + 1).BorderStyle = 1
      Exit Sub
     End If
     If KeyCode = 40 Then
      If HSD > 18 Then Exit Sub
      Dinge(HSD).BorderStyle = 0
      Dinge(HSD + 9).BorderStyle = 1
      Exit Sub
     End If
     If KeyCode = 13 Then
      AusW = 1
      Einsatz HSD
      Exit Sub
     End If
     If KeyCode = 19 Then
      AusW = 1
      Pause = True
      Exit Sub
     End If
   End If
  Else
   Dim TASTD
   TASTD = Chr$(KeyCode)
   TASTD = UCase$(TASTD)
   'If Cheat & TASTD = Left$("LEVEL", Len(Cheat & TASTD)) Then
   ' Cheat = Cheat & TASTD
   ' If Cheat = "LEVEL" Then
   '  Cheat = ""
   '  'Pause = False
   '  NextLevel
   '  Akt
   ' End If
   ' Exit Sub
   'End If
   If Cheat & TASTD = Left$("PUNKT", Len(Cheat & TASTD)) Then
    Cheat = Cheat & TASTD
    If Cheat = "PUNKT" Then
     Cheat = ""
     'Pause = False
     Punkte = Punkte + 10000
     Akt
    End If
    Exit Sub
   End If
   If Cheat & TASTD = Left$("LEBEN", Len(Cheat & TASTD)) Then
    Cheat = Cheat & TASTD
    If Cheat = "LEBEN" Then
     Cheat = ""
     'Pause = False
     If Leben = 10 Then
       MsgBox "Du kannst nicht mehr als 10 Leben haben.", , "Hinweis"
      Else
       Leben = Leben + 1
       Akt
     End If
    End If
    Exit Sub
   End If
   If Cheat & TASTD = Left$("KILL", Len(Cheat & TASTD)) Then
    Cheat = Cheat & TASTD
    If Cheat = "KILL" Then
     Cheat = ""
     'Pause = False
     TOT
    End If
    Exit Sub
   End If
   Cheat = ""
   Pause = False
 End If
End Sub

Private Sub Timer1_Timer()
End Sub

Private Sub Timer2_Timer()
 Timer2.Enabled = False
 Text1.SetFocus
End Sub

Private Sub Über_Click()
 MsgBox "Robot 1.00" + Chr(13) + "Dies ist ein Programm von Albert Zeyer." + Chr(13) + "Ich hoffe, es gefällt ihnen." + Chr(13) + "Bei Fehlern wenden sie sich bitte an den Hersteller." + Chr(13) + "Viel Spaß beim spielen!", , "Über"
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

