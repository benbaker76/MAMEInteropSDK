Attribute VB_Name = "Module1"



Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Declare Function SetClipboardViewer Lib "user32" (ByVal hwnd As Long) As Long

Public Declare Function RegisterWindowMessage Lib "user32.dll" Alias "RegisterWindowMessageA" (ByVal lpString As String) As Long
Public Declare Function PostMessage Lib "user32" Alias "PostMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hwnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long



Public Const WM_DRAWCLIPBOARD = &H308
Public Const GWL_WNDPROC = (-4)
Public PrevProc As Long
Public PrevMSG
Public MameHwnd As Long

Public HookHwnd As Long

Public MameStart As Long
Public StartUp As Long
Public MameStop As Long
Public MameChange As Long

Public RegisterME As Long
Public UnregisterME As Long
Public GetIdStr As Long

Const WM_COPYDATA = &H4A


Public Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long

Public Declare Function CreateWindowEx _
   Lib "user32" Alias "CreateWindowExA" (ByVal dwExStyle As Long, _
   ByVal lpClassName As String, _
   ByVal lpWindowName As String, _
   ByVal dwStyle As Long, _
   ByVal x As Long, _
   ByVal y As Long, _
   ByVal nWidth As Long, _
   ByVal nHeight As Long, _
   ByVal hWndParent As Long, _
   ByVal hMenu As Long, _
   ByVal hInstance As Long, _
   lpParam As Any) As Long




Public MsgNames As New Collection

Public Sub HookForm(F As Long)
    PrevProc = SetWindowLong(F, GWL_WNDPROC, AddressOf WindowProc)
End Sub
Public Sub UnHookForm(F As Long)
    SetWindowLong F, GWL_WNDPROC, PrevProc
End Sub
Public Function WindowProc(ByVal hwnd As Long, ByVal uMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
    Select Case uMsg
        Case MameStart
            Form1.Cls
            Form1.Print "mame start"
            MameHwnd = wParam
            PostMessage MameHwnd, RegisterME, HookHwnd, 1
            SendMessage MameHwnd, GetIdStr, HookHwnd, 0
        Case MameStop
            Form1.Cls
            Form1.Print "mame stop"
            For x = 1 To Form1.BoxStatus.UBound
            Form1.BoxStatus(x).Visible = False
            Next x
        Case MameChange
            Form1.Cls
            Form1.Print Str(uMsg), Str(wParam), Str(lParam)
            SendMessage MameHwnd, GetIdStr, HookHwnd, wParam
            SetBox wParam, lParam
        Case RegisterME
        Case UnregisterME
        Case WM_COPYDATA
            handle_copydata wParam, lParam
        Case Default
            WindowProc = CallWindowProc(PrevProc, hwnd, uMsg, wParam, lParam)
   End Select
End Function











Public Sub SetBox(Lindex As Long, LVal As Long)
On Error Resume Next
If Lindex > 12344 Then Lindex = Lindex - 12344

If Form1.BoxStatus.UBound < Lindex Then
Load Form1.BoxStatus(Lindex)
Form1.BoxStatus(Lindex).Left = Form1.BoxStatus(Lindex - 1).Left + Form1.BoxStatus(Lindex - 1).Width
Form1.BoxStatus(Lindex).Top = Form1.BoxStatus(1).Top
Form1.Width = Form1.Width + Form1.BoxStatus(Lindex).Width
End If

'If LVal > 0 Then
Form1.BoxStatus(Lindex).Visible = True
'Else
'Form1.BoxStatus(Lindex).Visible = False
'End If
Form1.BoxStatus(Lindex).Caption = Trim(Str(LVal))


Form1.Print Str(Lindex), Str(LVal)
End Sub
