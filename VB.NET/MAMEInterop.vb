Imports System.Collections
Imports System.Windows.Forms
Imports System.Runtime.InteropServices
Imports System.Text
Imports System.Collections.Generic
Imports System

Public Enum MAMEMessageType As Integer
	Pause = 0
End Enum

Public Class MAMEInterop
	Implements IDisposable
	<DllImport("MAME32.dll", EntryPoint:="init_mame", CallingConvention:=CallingConvention.StdCall)>
	Private Shared Function init_mame32(clientid As Integer, name As String, <MarshalAs(UnmanagedType.FunctionPtr)> start As DMAME_START, <MarshalAs(UnmanagedType.FunctionPtr)> [stop] As DMAME_STOP, <MarshalAs(UnmanagedType.FunctionPtr)> copydata As DMAME_COPYDATA, <MarshalAs(UnmanagedType.FunctionPtr)> output As DMAME_OUTPUT, useNetworkOutput As Boolean) As Integer
	End Function

	<DllImport("MAME32.dll", EntryPoint:="close_mame", CallingConvention:=CallingConvention.StdCall)>
	Private Shared Function close_mame32() As Integer
	End Function

	<DllImport("MAME32.dll", EntryPoint:="message_mame", CallingConvention:=CallingConvention.StdCall)>
	Private Shared Function message_mame32(id As Integer, value As Integer) As Integer
	End Function

	<DllImport("MAME64.dll", EntryPoint:="init_mame", CallingConvention:=CallingConvention.StdCall)>
	Private Shared Function init_mame64(clientid As Integer, name As String, <MarshalAs(UnmanagedType.FunctionPtr)> start As DMAME_START, <MarshalAs(UnmanagedType.FunctionPtr)> [stop] As DMAME_STOP, <MarshalAs(UnmanagedType.FunctionPtr)> copydata As DMAME_COPYDATA, <MarshalAs(UnmanagedType.FunctionPtr)> output As DMAME_OUTPUT, useNetworkOutput As Boolean) As Integer
	End Function

	<DllImport("MAME64.dll", EntryPoint:="close_mame", CallingConvention:=CallingConvention.StdCall)>
	Private Shared Function close_mame64() As Integer
	End Function

	<DllImport("MAME64.dll", EntryPoint:="message_mame", CallingConvention:=CallingConvention.StdCall)>
	Private Shared Function message_mame64(id As Integer, value As Integer) As Integer
	End Function

	Private Delegate Function DMAME_START(hwnd As IntPtr) As Integer
	Private Delegate Function DMAME_STOP() As Integer
	Private Delegate Function DMAME_COPYDATA(id As Integer, name As IntPtr) As Integer
	Private Delegate Function DMAME_OUTPUT(name As IntPtr, value As Integer) As Integer

	<MarshalAs(UnmanagedType.FunctionPtr)>
	Private startPtr As DMAME_START = Nothing

	<MarshalAs(UnmanagedType.FunctionPtr)>
	Private stopPtr As DMAME_STOP = Nothing

	<MarshalAs(UnmanagedType.FunctionPtr)>
	Private copydataPtr As DMAME_COPYDATA = Nothing

	<MarshalAs(UnmanagedType.FunctionPtr)>
	Private outputPtr As DMAME_OUTPUT = Nothing

	Private m_control As Control = Nothing
	Private m_hWndOutputWindow As IntPtr = IntPtr.Zero

	Public Event MAMEStart As EventHandler(Of MAMEEventArgs)
	Public Event MAMEStop As EventHandler(Of EventArgs)
	Public Event MAMEOutput As EventHandler(Of MAMEOutputEventArgs)

	Private m_isRunning As Boolean = False

	Private m_is64Bit As Boolean = False

	Private m_disposed As Boolean = False

	Public Sub New(control As Control)
		m_control = control
		m_is64Bit = Is64Bit()
	End Sub

	Public Sub Initialize(clientId As Integer, name As String, useNetworkOutput As Boolean)
		m_is64Bit = Is64Bit()

		startPtr = AddressOf mame_start
		stopPtr = AddressOf mame_stop
		copydataPtr = AddressOf mame_copydata
		outputPtr = AddressOf mame_output

		If m_is64Bit Then
			init_mame64(clientId, name, startPtr, stopPtr, copydataPtr, outputPtr, useNetworkOutput)
		Else
			init_mame32(clientId, name, startPtr, stopPtr, copydataPtr, outputPtr, useNetworkOutput)
		End If

		m_isRunning = True
	End Sub

	Public Sub Shutdown()
		If m_is64Bit Then
			close_mame64()
		Else
			close_mame32()
		End If

		m_isRunning = False
	End Sub

	Private Function mame_start(hWnd As IntPtr) As Integer
		m_hWndOutputWindow = hWnd

		Return 1
	End Function

	Private Function mame_stop() As Integer
		m_hWndOutputWindow = IntPtr.Zero

		RaiseEvent MAMEStop(Me, EventArgs.Empty)

		Return 1
	End Function

	Private Function mame_copydata(id As Integer, namePtr As IntPtr) As Integer
		Dim name As String = Marshal.PtrToStringAnsi(namePtr)

		If id = 0 Then
			RaiseEvent MAMEStart(Me, New MAMEEventArgs(name))
		End If

		Return 1
	End Function

	Private Function mame_output(namePtr As IntPtr, state As Integer) As Integer
		Dim name As String = Marshal.PtrToStringAnsi(namePtr)

		RaiseEvent MAMEOutput(Me, New MAMEOutputEventArgs(name, state))

		Return 1
	End Function

	Public Function MessageMAME(id As Integer, value As Integer) As Integer
		Dim retVal As Integer = 0

		If m_is64Bit Then
			retVal = message_mame64(id, value)
		Else
			retVal = message_mame32(id, value)
		End If

		Return retVal
	End Function

	Public Function PauseMAME(pauseValue As Integer) As Integer
		Return MessageMAME(CType(MAMEMessageType.Pause, Integer), pauseValue)
	End Function

	Public ReadOnly Property IsRunning() As Boolean
		Get
			Return m_isRunning
		End Get
	End Property

#Region "IDisposable Members"

	Public Sub Dispose() Implements IDisposable.Dispose
		Dispose(True)
		GC.SuppressFinalize(Me)
		' remove this from gc finalizer list
	End Sub

	Private Sub Dispose(disposing As Boolean)
		If Not Me.m_disposed Then
			' dispose once only
			If disposing Then
				' Dispose managed resources.
				' called from Dispose

				' Clean up unmanaged resources here.
			End If
		End If

		m_disposed = True
	End Sub

#End Region

	Private Function Is64Bit() As Boolean
		Return Marshal.SizeOf(GetType(IntPtr)) = 8
	End Function
End Class

Public Class MAMEEventArgs
	Inherits EventArgs
	Public ROMName As String

	Public Sub New(romName As String)
		romName = romName
	End Sub
End Class

Public Class MAMEOutputEventArgs
	Inherits EventArgs
	Public Name As String
	Public State As Integer

	Public Sub New(name As String, state As Integer)
		name = name
		state = state
	End Sub
End Class
