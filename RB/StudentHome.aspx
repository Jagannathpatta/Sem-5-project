<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentHome.aspx.cs" Inherits="RB.bttest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap.css" rel="stylesheet" />
</head>
<body>
    <div class="jumbotron">
    <form id="form1" runat="server">
        <br />
        <div class="col-2 float-right">
            <asp:Button ID="btnlogout" CssClass="btn btn-primary" runat="server" OnClick="btnlogout_Click" Text="Logout" /></div>
        <div class="col-9" style="margin-left:100px">

        <h2><strong> HI <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></strong></h2>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" CellPadding="1" CellSpacing="1" CssClass="form-check" RepeatDirection="Horizontal" RepeatLayout="Flow" TextAlign="Left">
                <asp:ListItem Value="1">Sem 1</asp:ListItem>
                <asp:ListItem Value="2">Sem 2</asp:ListItem>
                <asp:ListItem Value="3">Sem 3</asp:ListItem>
                <asp:ListItem Value="4">Sem 4</asp:ListItem>
                <asp:ListItem Value="5">Sem 5</asp:ListItem>
                <asp:ListItem Value="6">Sem 6</asp:ListItem>
            </asp:RadioButtonList>
            <h3><strong>
                <asp:LinkButton ID="btnview" OnClick="btnview_Click" runat="server">Click Here</asp:LinkButton> View Your Result.</strong></h3>
        </div>
        
     </form>
    </div>
</body>
</html>
