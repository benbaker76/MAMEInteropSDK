Attribute VB_Name = "CopyD"
'Option Explicit

Public lpPrevWndProc As Long
Public lHwnd         As Long

Public Const GWL_WNDPROC = (-4)
Public Const WM_COPYDATA = &H4A

Public Type COPYDATASTRUCT
    dwData As Long
    cbData As Long
    lpData As Long
End Type

Public Type MAMEDATASTRUCT
    id As Single
    dstring As String * 255
    
End Type

Dim Buffer1() As Byte
Dim Buffer2() As Byte

Public Type TmpStruct
id(1 To 4) As Byte
dstring(1 To 4) As Byte
End Type
'Copies a block of memory from one location to another.
'
Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" _
   (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)
Declare Sub CopyMemoryRead Lib "kernel32" Alias "RtlMoveMemory" _
   (hpvDest As Any, hpvSource As Any, ByVal cbCopy As Long)

Declare Function CallWindowProc Lib "user32" Alias _
   "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hwnd As _
   Long, ByVal Msg As Long, ByVal wParam As Long, ByVal lParam As _
   Long) As Long

Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" _
   (ByVal hwnd As Long, ByVal nIndex As Long, ByVal dwNewLong As _
   Long) As Long


Public Function pReceiveMsg(lParam As Long)
Dim sString(1 To 255) As Byte
Dim cds     As COPYDATASTRUCT
'Dim Cdata As copydata_id_string
Dim sData$



'buffer the structure
CopyMemory cds, ByVal lParam, Len(cds)

'get the data
'Dim mdata As MAMEDATASTRUCT
ReDim Buffer1(cds.cbData) As Byte
CopyMemory Buffer1(0), ByVal cds.lpData, cds.cbData

ReDim Buffer1(UBound(Buffer1) - 4) As Byte
For x = 0 To UBound(Buffer2)
Buffer2(x) = Buffer1(x + 4)
Next x




junk = StrConv(Buffer2(), vbUnicode)

Debug.Print junk

'Dim JString As String, ids
'For x = 1 To 4
'ids = ids & sString(x)
'Next x
'Debug.Print ids
'For x = 4 To cds.cbData + 1 Step 2
'tmpchr = sString(x) + sString(x + 1)
'JString = JString & StrConv(tmpchr, vbUnicode)
'Next x
'sString = CStr(sString)
'pReceiveMsg = JString
'pReceiveMsg = mdata.DString
'Form1.Caption = pReceiveMsg
'MsgBox sString
End Function


