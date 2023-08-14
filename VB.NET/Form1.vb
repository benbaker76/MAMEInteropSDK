Public Class Form1
    Private MAME As MAMEInterop = Nothing

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        MAME = New MAMEInterop(Me.TextBox1)
		MAME.Initialize(2, "VBTest", True)
	End Sub

    Private Sub Form1_FormClosing(ByVal sender As System.Object, ByVal e As System.Windows.Forms.FormClosingEventArgs) Handles MyBase.FormClosing
        MAME.Dispose()
    End Sub
End Class
