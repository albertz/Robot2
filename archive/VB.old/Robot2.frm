VERSION 4.00
Begin VB.Form Form2 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Robot 1.00"
   ClientHeight    =   1656
   ClientLeft      =   2148
   ClientTop       =   2448
   ClientWidth     =   4956
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
   Height          =   1980
   Icon            =   "Robot2.frx":0000
   KeyPreview      =   -1  'True
   Left            =   2100
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1656
   ScaleWidth      =   4956
   Top             =   2172
   Width           =   5052
   Begin VB.Frame Frame1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Einstellungen"
      ForeColor       =   &H80000008&
      Height          =   615
      Left            =   120
      TabIndex        =   2
      Top             =   120
      Width           =   4695
      Begin VB.Timer Timer2 
         Interval        =   1
         Left            =   1080
         Top             =   480
      End
      Begin VB.Timer Timer1 
         Interval        =   1
         Left            =   2640
         Top             =   480
      End
      Begin VB.TextBox Text1 
         Appearance      =   0  'Flat
         Height          =   285
         Left            =   720
         TabIndex        =   3
         Top             =   240
         Width           =   3855
      End
      Begin VB.Label Label1 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "Name:"
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   615
      End
   End
   Begin VB.CommandButton Command2 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Start"
      Height          =   735
      Left            =   120
      TabIndex        =   1
      Top             =   840
      Width           =   2175
   End
   Begin VB.CommandButton Command1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      Caption         =   "Ende"
      Height          =   735
      Left            =   2640
      TabIndex        =   0
      Top             =   840
      Width           =   2175
   End
End
Attribute VB_Name = "Form2"
Attribute VB_Creatable = False
Attribute VB_Exposed = False

Private Sub Command1_Click()
 If MsgBox("Wollen sie wirklich schon dieses Programm beenden?", 4, "Ende") = 6 Then End
End Sub

Private Sub Command2_Click()
 On Error GoTo WWW
 Name1 = Text1.Text
 Name1 = LTrim$(RTrim$(Name1))
 If Name1 = "" Then
  MsgBox "Sie müssen erst einen Namen eingeben!", , "Start"
  Text1.Text = ""
  Text1.SetFocus
  Exit Sub
 End If
 Dim FileNum%, TTT$, Text2$, Temp$
 FileNum% = FreeFile
 Open "DATEN.DAT" For Input As FileNum%
 Input #FileNum%, Temp$
 Do While Not EOF(FileNum%)
  Input #FileNum%, Temp$
  TTT$ = TTT$ + Temp$ + Chr$(13) + Chr$(10)
 Loop
 Close FileNum%
 FileNum% = FreeFile
 Open "DATEN.DAT" For Output As FileNum%
 Text2$ = Name1 + Chr$(13) + Chr$(10) + TTT$
 Print #FileNum%, Text2$
 Close FileNum%
WWW:
 'If Option1.Value = True Then SCHW = "Leicht"
 'If Option2.Value = True Then SCHW = "Mittel"
 'If Option3.Value = True Then SCHW = "Schwer"
 If MsgBox("Stimmen die Einstellungen so?" + Chr(13) + "Name: " + Name1, 4, "Start") = 6 Then
  Form2.Hide
  Form1.Show
 End If
 Exit Sub
End Sub

Private Sub Form_KeyPress(KeyAscii As Integer)
 Text1.SetFocus
 If KeyAscii = 8 Then Key = True
 If KeyAscii = 27 Then
  KeyAscii = 0
  Command1_Click
  Exit Sub
 End If
 If KeyAscii = 13 Then
  KeyAscii = 0
  Command2_Click
  Exit Sub
 End If
 If (Len(Text1.Text) = 10) And (Key = False) Then
  MsgBox "Ihr Name darf nicht mehr als 10 Zeichen brauchen. Braucht er mehr Zeichen, dann benutzen sie eine Abkürzung." + Chr$(13) + "Grund: Sonst wird die HighScore falsch abgespeichert!", , "Hinweis"
  KeyAscii = 0
 End If
End Sub

Private Sub Form_Load()
 P = App.Path
End Sub


Private Sub Form_Unload(Cancel As Integer)
 If MsgBox("Wollen sie wirklich schon dieses Programm beenden?", 4, "Ende") = 6 Then End
 Cancel = 1
End Sub

Private Sub Timer1_Timer()
 On Error GoTo FSD
 Timer1.Enabled = False
 Dim FileNum%, Text$
 FileNum% = FreeFile
 Open "DATEN.DAT" For Input As FileNum%
 Input #FileNum%, Text$
 Close FileNum%
 Text1.Text = Text$
 Text1.SetFocus
 Exit Sub
FSD:
 If Not MsgBox("Die Datei DATEN.DAT wurde nicht gefunden! Wollen sie trotzdem weitermachen?", 4, "Fehler") = 6 Then End
 Exit Sub
End Sub

Private Sub Timer2_Timer()
 If Len(Text1.Text) > 10 Then Text1.Text = Left$(Text1.Text, 10)
End Sub

