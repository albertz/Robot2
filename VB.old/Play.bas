Declare Function sndPlaySound Lib "MMSYSTEM.DLL" (ByVal lpszSoundName$, ByVal wFlags%) As Integer

Sub Main ()
 On Error GoTo Fehler
 If Command = "" Then
   MsgBox "Mit diesem Programm k�nnen sie Wave-Dateien abspielen. �bergeben sie einfach als Parameter den Namen der Wave-Datei und diese Datei wird dann abgespielt!", , "Wave-Player"
  Else
   If Dir(Command) = "" Then
     MsgBox "Die Datei " & Command & " wurde nicht gefunden. �berpr�fen sie die Eingabe.", , "Fehler"
    Else
     Dim rueck
     rueck = sndPlaySound(Command, 1)
   End If
 End If
 End
Fehler:
 MsgBox "Fehler beim abspielen oder finden der Angegebenen Wave-Datei.", , "Fehler"
 End
End Sub

