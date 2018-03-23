<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="Project2ForWeb._Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    
    <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.1/jquery-ui.min.js"></script> 
    <link href="jquery-ui.css" rel="stylesheet" type="text/css" />  
    <script src="http://ajax.aspnetcdn.com/ajax/jquery/jquery-1.8.0.js"></script>
    <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/jquery-ui.js"></script>

       <script type="text/javascript">  
           $(function () {
               $("#txtCategory").autocomplete({
                   source: function (request, response) {
                       // var param = { cityname: $('#txtCategory').val() };
                       $.ajax({
                           type: "POST",
                           url: "Default.aspx/GetCategory",
                           data: "{'pre':'"+request.term+"'}",
                           dataType: "json",
                           contentType: "application/json; charset=utf-8",
                           dataFilter: function (data) { return data; },
                           success: function (data) {
                               response($.map(data.d, function (item) {
                                   return {
                                       value: item
                                   }
                               }))
                           },
                           error: function (XMLHttpRequest, textStatus, errorThrown) {
                               alert(errorThrown);
                           }
                       });
                   },
                   minLength: 2//minLength as 2, it means when ever user enter 2 character in TextBox the AutoComplete method will fire and get its source data. 
               });
           });
           </script>

    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 299px;
            font-size: large;
            text-align: center;
        }
        .auto-style3 {
            width: 299px;
            font-size: large;
            height: 26px;
            text-align: center;
        }
        .auto-style4 {
            height: 26px;
        }
        .auto-style5 {
            width: 299px;
            font-size: large;
            text-align: center;
            height: 30px;
        }
        .auto-style6 {
            height: 30px;
        }
    </style>
</head>
<body style="height: 35px">
    <form id="form1" runat="server">
    <div>
    
        <h1>
            <asp:Label ID="Label1Ex" runat="server" style="font-size: xx-large" Text="Expenses"></asp:Label>
            <table align="left" class="auto-style1">
                <tr>
                    <td class="auto-style3">Date</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtDate" ErrorMessage="*" style="font-size: large"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtDate" ErrorMessage="Please Enter A Date" style="font-size: large" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Description</td>
                    <td>
                        <asp:TextBox ID="txtDesc" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDesc" ErrorMessage="*" style="font-size: large"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Category</td>
                    <td>
                        <asp:TextBox ID="txtCategory" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Amount</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAmount" ErrorMessage="*" style="font-size: large"></asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </h1>
    
    </div>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
        <p>
            &nbsp;</p>
        <p>
            <asp:Button ID="btnSave" runat="server" style="text-align: left" Text="Save" />
        </p>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="au_id" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="au_id" HeaderText="au_id" ReadOnly="True" SortExpression="au_id" />
                <asp:BoundField DataField="au_lname" HeaderText="au_lname" SortExpression="au_lname" />
                <asp:BoundField DataField="au_fname" HeaderText="au_fname" SortExpression="au_fname" />
                <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                <asp:BoundField DataField="address" HeaderText="address" SortExpression="address" />
                <asp:BoundField DataField="city" HeaderText="city" SortExpression="city" />
                <asp:BoundField DataField="state" HeaderText="state" SortExpression="state" />
                <asp:BoundField DataField="zip" HeaderText="zip" SortExpression="zip" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mybookstoreConnectionString1 %>" DeleteCommand="DELETE FROM [authors] WHERE [au_id] = @au_id" InsertCommand="INSERT INTO [authors] ([au_lname], [au_fname], [phone], [address], [city], [state], [zip]) VALUES (@au_lname, @au_fname, @phone, @address, @city, @state, @zip)" ProviderName="<%$ ConnectionStrings:mybookstoreConnectionString1.ProviderName %>" SelectCommand="SELECT [au_id], [au_lname], [au_fname], [phone], [address], [city], [state], [zip] FROM [authors]" UpdateCommand="UPDATE [authors] SET [au_lname] = @au_lname, [au_fname] = @au_fname, [phone] = @phone, [address] = @address, [city] = @city, [state] = @state, [zip] = @zip WHERE [au_id] = @au_id">
            <DeleteParameters>
                <asp:Parameter Name="au_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="au_lname" Type="String" />
                <asp:Parameter Name="au_fname" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="state" Type="String" />
                <asp:Parameter Name="zip" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="au_lname" Type="String" />
                <asp:Parameter Name="au_fname" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="state" Type="String" />
                <asp:Parameter Name="zip" Type="String" />
                <asp:Parameter Name="au_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
