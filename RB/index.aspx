<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="RB.WebForm1" %>

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
        .auto-style5 {
            height: 110px;
            position: relative;
            left: 2px;
            top: 2px;
            width: 1401px;
        }
        .auto-style7 {
            width: 100%;
            height: 601px;
        }
        .auto-style8 {
            height: 110px;
        }
        </style>
    <link href="bootstrap.css" rel="stylesheet" />
</head>
<body>
   
    <form id="form1" runat="server">
   
    <table class="auto-style1" style="border-spacing: 0px; border-collapse: collapse">
        
        <tr style="background-color: #FFCC00">
            <td class="auto-style2" >&nbsp;</td>
            <td class="auto-style3" style="font-family: 'Bahnschrift SemiBold SemiConden'; font-size: 95px; font-weight: normal; font-style: oblique; font-variant: inherit; color: #000000; padding: inherit; position: relative; z-index: auto; ">Result Builder</td>
            <td class="auto-style4" style="position: relative; text-align:right; padding-right: 20px;" >
                <asp:Button ID="btn_login" runat="server" OnClick="Login" Text="Login" CssClass="btn btn-primary"   />
            </td>
        </tr>
        
    </table>

    
    <table class="auto-style7">
        <tr>
            <td class="auto-style5" style="font-family: 'Arial Black'; font-size: 75px; font-weight: bold; text-decoration: none; text-align:center; position: relative;">! Welcome !</td>
        </tr>
        <tr>
            <td style="padding: 30px; font-family: 'Times New Roman', Times, serif; text-align:center; font-size: 40px; position: relative;">This website is a Third year project, Useful for the college faculty to generate the proper report card of a student and get&#39;s a softcopy. and The information of the student is been stored in the database of the website. The report card generating process is only accessible by the authorised faculty members assigned by the programmer.</td>
        </tr>
        <tr>
            <td class="auto-style8" style="text-align:center; position: relative;">
                <asp:Button ID="btn_continue" runat="server" CssClass="btn btn-primary btn-lg" OnClick="Login" Text="Continue ..." Height="50px" Width="200px"/>
            </td>
        </tr>
    </table>
    
    
    <p>
        &nbsp;</p>

    
    </form>

    
</body>
</html>
