VERSION 2.00
Begin Form Form1 
   BackColor       =   &H00000000&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Installation"
   ClientHeight    =   6045
   ClientLeft      =   3465
   ClientTop       =   1605
   ClientWidth     =   3180
   Height          =   6450
   Icon            =   INSTALL.FRX:0000
   Left            =   3405
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6045
   ScaleWidth      =   3180
   Top             =   1260
   Width           =   3300
   Begin CommandButton Command3 
      Caption         =   "Abbrechen"
      Height          =   615
      Left            =   1680
      TabIndex        =   5
      Top             =   5280
      Width           =   1335
   End
   Begin CommandButton Command2 
      Caption         =   "OK"
      Height          =   615
      Left            =   120
      TabIndex        =   4
      Top             =   5280
      Width           =   1335
   End
   Begin CommandButton Command1 
      Caption         =   "Neues Verzeichnis erstellen"
      Height          =   375
      Left            =   120
      TabIndex        =   3
      Top             =   1440
      Width           =   2895
   End
   Begin DirListBox Dir1 
      BackColor       =   &H00000000&
      ForeColor       =   &H0000FFFF&
      Height          =   2730
      Left            =   120
      TabIndex        =   1
      Top             =   1920
      Width           =   2895
   End
   Begin DriveListBox Drive1 
      BackColor       =   &H00000000&
      ForeColor       =   &H0000FFFF&
      Height          =   315
      Left            =   120
      TabIndex        =   0
      Top             =   4800
      Width           =   2895
   End
   Begin Label Label1 
      Alignment       =   2  'Center
      BackStyle       =   0  'Transparent
      Caption         =   "Wählen sie das Verzeichnis, in das Robot 1.00 installiert werden soll."
      FontBold        =   -1  'True
      FontItalic      =   0   'False
      FontName        =   "MS Sans Serif"
      FontSize        =   12
      FontStrikethru  =   0   'False
      FontUnderline   =   0   'False
      ForeColor       =   &H0000FFFF&
      Height          =   1335
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   2895
   End
End

Sub Command1_Click ()
 On Error GoTo Fehler
 Dim Verz, Zahl, Aus
 Verz = InputBox$("Geben sie das Verzeichnis ein, das unter " & Dir1.Path & " erstellt werden soll (maximal 8 Zeichen):", "Verzeichnis erstellen")
 Verz = LTrim$(RTrim$(Verz))
 If Verz = "" Then
  MsgBox "Verzeichnis wird nicht erstellt.", , "Abbrechen"
  Exit Sub
 End If
 Zahl = 0
 Do
  Zahl = Zahl + 1
  If Mid(Verz, Zahl, 1) = " " Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = " " Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = "+" Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = "=" Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = "[" Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = "]" Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = "*" Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = "?" Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = ";" Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = ":" Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = "," Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = "." Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = "<" Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = ">" Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = "|" Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = "/" Then GoTo Fehler
  If Mid(Verz, Zahl, 1) = "\" Then GoTo Fehler
 Loop While Not Zahl = 8
 If Not Right(Dir1.Path, 1) = "\" Then Verz = "\" & Verz
 'MsgBox Dir1.Path & Verz
 Aus = Shell("VERZ.BAT " & Dir1.Path & Verz)
 Dir1.Refresh
 MsgBox "Verzeichnis " & Dir1.Path & Verz & " wurde hergestellt.", , "Verzeichnis erstellen"
 Exit Sub
Fehler:
 MsgBox "Der Name enthällt ungültige Zeichen.", , "Fehler"
 Exit Sub
End Sub

Sub Command2_Click ()
 On Error Resume Next
 If MsgBox("Soll das Programm in das Verzeichnis " & Dir1.Path & " installiert werden?", 4, "Installation") = 6 Then
  Dim Inst, Verz, L, Ja
  'MsgBox "Daten werden kopiert.", , "Installation"
  Ja = "Nein"
  Verz = Dir1.Path
  If Not Right(Verz, 1) = "\" Then Verz = Verz & "\"
  If Not Dir(Verz & "*.*") = "" Then
   If Not MsgBox("Wollen sie wirklich das Progamm in das Verzeichnis " & Dir1.Path & " installieren? Dort sind bereits Dateien vorhanden!", 4, "Hinweis") = 6 Then Exit Sub
   If MsgBox("Wollen sie die vorhandenen Dateien löschen?", 4, "Löschen") = 6 Then
    Ja = "Ja"
    MsgBox "Dateien werden gelöscht!", , "Löschen"
   End If
  End If
  L = Left(Verz, 1)
  Verz = Mid(Verz, 3, Len(Verz) - 1)
  Inst = Shell("INST.BAT " & L & " " & Verz & " " & Ja, 1)
  'MsgBox "Programm wird nun entpackt.", , "Installation"
  'Inst = Shell(Verz & "entp.exe")
  'MsgBox "Warten sie bitte, bis es fertig entpackt wurde und klicken sie dann auf OK.", , "Installation"
  'Kill Verz & "ENTP.EXE"
  End
 End If
 Exit Sub
End Sub

Sub Command3_Click ()
 If MsgBox("Wollen sie wirklich das Installationsprogramm beenden?", 4, "Ende") = 6 Then End
End Sub

Sub Drive1_Change ()
 On Error GoTo F
 Dir1.Path = Drive1.Drive
 Exit Sub
F:
 MsgBox "Fehler beim lesen von Laufwerk " & Drive1.Drive, , "Fehler"
 Drive1.Drive = Dir1.Path
 Exit Sub
End Sub

Sub Form_Unload (Cancel As Integer)
 Command3_Click
 Cancel = 1
End Sub

