Imports System.Web
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Services
Imports System.Web.Script.Services

Public Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    <WebMethod(), _
      [ScriptMethod](ResponseFormat:=ResponseFormat.Json)>
    Public Shared Function GetCategory(ByVal pre As String) As List(Of String)
        Dim allCategory As List(Of String) = New List(Of String)
        Dim dc As mybookstoreEntities = New mybookstoreEntities()
        
        Return allCategory
    End Function


    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click, txtDate.TextChanged

        Page.Validate()
        If (Page.IsValid) Then
            Dim Dates As String = txtDate.Text
            Dim Description As String = txtDesc.Text
            Dim Category As String = txtCategory.Text
            Dim Amount As String = txtAmount.Text

        End If

        Dim cn As New SqlConnection("Data Source=GRANT948\GRANT978;Initial Catalog=mybookstore;Integrated Security=True")
        Dim cm As New SqlCommand
        cn.Open()
        cm.Connection = cn
        cm.CommandText = "insert into authors (Date, Description, Category, Amount) values ('" & txtDate.Text & "','" & txtDesc.Text & "', '" & txtCategory.Text & "', '" & txtAmount.Text & "')"
        cm.ExecuteNonQuery()
        Response.Write("data inserted")
        cn.Close()
        GridView1.DataBind()

    End Sub
End Class