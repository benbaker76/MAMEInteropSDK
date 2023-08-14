VERSION 5.00
Begin VB.Form Form1 
   AutoRedraw      =   -1  'True
   Caption         =   "Form1"
   ClientHeight    =   4650
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   10200
   LinkTopic       =   "Form1"
   ScaleHeight     =   4650
   ScaleWidth      =   10200
   StartUpPosition =   3  'Windows Default
   Begin VB.TextBox Text1 
      Height          =   2415
      Left            =   240
      MultiLine       =   -1  'True
      TabIndex        =   2
      Top             =   2040
      Width           =   9735
   End
   Begin VB.Label BoxStatus 
      BackColor       =   &H0000FF00&
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Index           =   1
      Left            =   0
      TabIndex        =   1
      Top             =   840
      Visible         =   0   'False
      Width           =   180
   End
   Begin VB.Label BoxStatus 
      BackColor       =   &H0000FF00&
      Caption         =   "0"
      BeginProperty Font 
         Name            =   "Arial"
         Size            =   15.75
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   360
      Index           =   0
      Left            =   240
      TabIndex        =   0
      Top             =   840
      Visible         =   0   'False
      Width           =   180
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()

  hwndthis = CreateWindowEx(0, "STATIC", "Hooker", WS_OVERLAPPEDWINDOW, 0, 0, 1, 1, 0&, 0&, App.hInstance, 0&)
  
    HookHwnd = hwndthis
    HookForm HookHwnd
    
    MameHwnd = -1
    MameStart = RegisterWindowMessage("MAMEOutputStart")
    MameStop = RegisterWindowMessage("MAMEOutputStop")
    MameChange = RegisterWindowMessage("MAMEOutputUpdateState")
    RegisterME = RegisterWindowMessage("MAMEOutputRegister")
    UnregisterME = RegisterWindowMessage("MAMEOutputUnregister")
    GetIdStr = RegisterWindowMessage("MAMEOutputGetIDString")
    'Register this form as a Clipboardviewer
   
    
End Sub
Private Sub Form_Unload(Cancel As Integer)
    'Unhook the form
    UnHookForm HookHwnd
End Sub
Private Sub Command1_Click()
    
End Sub

Private Sub Timer1_Timer()
If MameHwnd <= 0 Then
    'FindMame
Else
    Timer1.Enabled = False
End If
End Sub
