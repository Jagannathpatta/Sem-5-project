<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hod.aspx.cs" Inherits="RB.hod" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 113px;
        }
        .auto-style2 {
            width: 218px;
        }
        .auto-style3 {
            width: 635px;
        }
        .auto-style4 {
            width: 113px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1" style="border-spacing: 0px; border-collapse: collapse">
        
        <tr style="background-color: #FFCC00">
            <td class="auto-style2" >&nbsp;</td>
            <td class="auto-style3" style="font-family: 'Bahnschrift SemiBold SemiConden'; font-size: 95px; font-weight: normal; font-style: oblique; font-variant: inherit; color: #000000; padding: inherit; position: relative; z-index: auto; ">Result Builder</td>
            <td class="auto-style4" style="position: relative; text-align:right; padding-right: 20px;" >
                <asp:Button ID="btn_logout" runat="server" OnClick="LogOut" Text="Logout" Font-Bold="True" Font-Italic="False" Font-Names="Arial Black" ForeColor="#FFFFCC" BackColor="#ff6600"  />
            </td>
        </tr>
        
    </table>
    </form>
</body>
</html>
