VERSION 4.00
Begin VB.Form Form2 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Einstellungen"
   ClientHeight    =   5736
   ClientLeft      =   4776
   ClientTop       =   2292
   ClientWidth     =   3120
   Height          =   6060
   Icon            =   "Edit2.frx":0000
   Left            =   4728
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5736
   ScaleWidth      =   3120
   Top             =   2016
   Width           =   3216
   Begin VB.CommandButton Command4 
      Caption         =   "Originaldatei wiederherstellen"
      Height          =   375
      Left            =   120
      TabIndex        =   5
      Top             =   5280
      Width           =   2895
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Abbrechen"
      Height          =   375
      Left            =   1680
      TabIndex        =   4
      Top             =   4800
      Width           =   1335
   End
   Begin VB.CommandButton Command2 
      Caption         =   "OK"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   4800
      Width           =   1335
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Neue Datei auswählen"
      Height          =   375
      Left            =   120
      TabIndex        =   2
      Top             =   4320
      Width           =   2895
   End
   Begin VB.FileListBox File1 
      Height          =   3696
      Left            =   120
      Pattern         =   "*.SCE"
      TabIndex        =   0
      Top             =   120
      Width           =   2892
   End
   Begin VB.Label Label1 
      BorderStyle     =   1  'Fixed Single
      Caption         =   "Label1"
      Height          =   255
      Left            =   120
      TabIndex        =   1
      Top             =   3960
      Width           =   2895
   End
End
Attribute VB_Name = "Form2"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()
 File1.Enabled = True
 Command1.Enabled = False
 Command2.Enabled = False
 Command3.Enabled = False
 Command4.Enabled = False
 File1.SetFocus
End Sub

Private Sub Command2_Click()
 ChDir P
 Dim FileNum%, TT1$, TT2$, TTT$, ZZ, Text$
 FileNum% = FreeFile
 Open "DATEN.DAT" For Input As FileNum%
 Input #FileNum%, TT1$
 TT1$ = TT1$ & Chr$(13) & Chr$(10)
 Input #FileNum%, TTT$
 ZZ = 0
 Do
  ZZ = ZZ + 1
  Input #FileNum%, TTT$
  TT2$ = TT2$ & TTT$ & Chr$(13) & Chr$(10)
 Loop While Not ZZ = 10
 Close FileNum%
 FileNum% = FreeFile
 Text$ = TT1$ & Label1.Caption & Chr$(13) & Chr$(10) & TT2$
 Open "DATEN.DAT" For Output As FileNum%
 Print #FileNum%, Text$
 Close FileNum%
 MsgBox "Änderungen wurden abgespeichert!", , "OK"
 Command3_Click
End Sub


Private Sub Command3_Click()
 Form2.Hide
 Form1.Show
End Sub


Private Sub Command4_Click()
   ChDir P
   If Not MsgBox("Wollen sie wirklich die Originaldatei wiederherstellen? Die aktuellen Einstellungen gehen dabei verloren!", 4, "Wiederherstellen") = 6 Then Exit Sub
   Dim Text$, FileNum%
   Text$ = Text$ & "NoName" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "ROBOT.SCE" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   FileNum% = FreeFile
   Open "DATEN.DAT" For Output As FileNum%
   Print #FileNum%, Text$
   Close FileNum%
   Label1.Caption = "ROBOT.SCE"
   MsgBox "Datei wurde wiederhergestellt!", , "Wiederherstellen"
End Sub

Private Sub File1_DblClick()
 Label1.Caption = File1.filename
 File1.Enabled = False
 Command1.Enabled = True
 Command2.Enabled = True
 Command3.Enabled = True
 Command4.Enabled = True
End Sub


Private Sub File1_KeyPress(KeyAscii As Integer)
 If KeyAscii = 13 Then
  Label1.Caption = File1.filename
  File1.Enabled = False
  Command1.Enabled = True
  Command2.Enabled = True
  Command3.Enabled = True
  Command4.Enabled = True
 End If
End Sub


Private Sub Form_Load()
 'MsgBox P
 ChDir P
 File1.Enabled = False
 On Error GoTo ZHQ
 Dim FileNum%, Temp$
 FileNum% = FreeFile
 Open "DATEN.DAT" For Input As FileNum%
 Input #FileNum%, Temp$
 Input #FileNum%, Temp$
 Label1.Caption = Temp$
 Close FileNum%
 Exit Sub
ZHQ:
 Label1.Caption = "Datei DATEN.DAT wurde nicht gefunden"
 If MsgBox("Die Datei DATEN.DAT wurde nicht gefunden. Haben sie dieses Programm im Verzeichnis dieses Programmes gestartet?", 4, "Fehler") = 6 Then
  If MsgBox("Die Datei DATEN.DAT ist nicht vorhanden, da sie vieleicht versehentlich gelöscht worden ist. Wollen sie die Originaldatei wiederherstellen?", 4, "Wiederherstellen") = 6 Then
   Dim Text$
   Text$ = Text$ & "NoName" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "ROBOT.SCE" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   Text$ = Text$ & "---LEER---0" & Chr$(13) & Chr$(10)
   FileNum% = FreeFile
   Open "DATEN.DAT" For Output As FileNum%
   Print #FileNum%, Text$
   Close FileNum%
   Label1.Caption = "ROBOT.SCE"
   MsgBox "Datei wurde wiederhergestellt!", , "Wiederherstellen"
   Exit Sub
  End If
  Exit Sub
 End If
 If MsgBox("Starten sie in Zukunft dieses Programm im Verzeichnis des Programmes! Wollen sie das Programm nun beenden?", 4, "Ende") = 6 Then End
 Command3_Click
 Exit Sub
End Sub


Private Sub Form_Unload(Cancel As Integer)
 If Command3.Enabled = True Then
   Command3_Click
  Else
   MsgBox "Wählen sie eine Datei aus!", , "Fehler"
 End If
 Cancel = 1
End Sub


