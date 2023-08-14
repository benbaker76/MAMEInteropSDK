Attribute VB_Name = "Module2"
Option Explicit

Private Type COPYDATASTRUCT
    dwData As Long
    cbData As Long
    lpData As Long
End Type

Private Type copydata_id_string
    id As Long
    lpString As Byte
End Type

Public Function handle_copydata(wParam As Long, lParam As Long) As String
    Dim sString  As String
    Dim copydata As COPYDATASTRUCT
    Dim data As copydata_id_string
    Dim buf(1 To 255) As Byte
    
    Call CopyMemory(copydata, ByVal lParam, Len(copydata))    ' ByVal lParam &H12FD98
    Call CopyMemory(data, ByVal copydata.lpData, Len(data))
    Call CopyMemory(buf(1), ByVal (copydata.lpData + 4), 6) ' copydata.cbData - 4)

    Form1.Text1.Text = Form1.Text1.Text & "wParam (" & Hex(wParam) & ") lParam (" & Hex(lParam) & ")" & vbNewLine
    Form1.Text1.Text = Form1.Text1.Text & "copydata.dwData (" & Hex(copydata.dwData) & ") copydata.cbData (" & Hex(copydata.cbData) & ") copydata.dwData (" & Hex(copydata.lpData) & ")" & vbNewLine

    sString = StrConv(buf, vbUnicode)
    sString = Left$(sString, InStr(1, sString, Chr$(0)) - 1)
    'sString = Replace(sString, Chr$(0), "")
    'frmReceive.lblString = sString
    Form1.Text1.Text = Form1.Text1.Text & "sString (" & sString & ")" & vbNewLine
    
    handle_copydata = sString
End Function

