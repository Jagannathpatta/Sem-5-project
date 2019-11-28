<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginForm.aspx.cs" Inherits="RB.loginForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
       
        .auto-style2 {
            width: 338px;
            margin-left: 80px;
            margin-top: 3px;
        }
        .auto-style3 {
            width: 336px;
            margin-left: 80px;
            margin-top: 3px;
            height: 38px;
        }
        </style>
    <link href="bootstrap.css" rel="stylesheet" />
    <link href="log1.css" rel="stylesheet" />
    </head>
<body style="height: 704px ; align-content:center">
    <form id="form1" runat="server" style="align-content:center" >

        <div>

            <div style="  float:left; height:600px; align-self:center; margin-left:80px;  font-family: 'Noto Sans';"> 
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Image ID="Image1" runat="server" Height="600px" ImageUrl="~/334.jpg" Width="800px" />

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>

            </div>

           <%-- <asp:Panel ID="Panel1" Visible="true" runat="server">
        <div style="border: thin groove #000000; margin-left:900px; position: relative; background-color: #FFCC00 ; height:600px; width:500px; align-self:center; margin-top: 75px; margin-bottom: 75px; font-family: 'Noto Sans';">

            <p class="auto-style2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Enabled="False" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="50px" ForeColor="Black" Text="Login"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="Label2" runat="server" Text="User Name :" Font-Bold="True"></asp:Label>
            </p>
            <p class="auto-style2">
&nbsp;<asp:TextBox ID="txt_UserName" placeholder="name@khalsa.com" runat="server" Height="38px" Width="320px"></asp:TextBox>
                <br />
                &nbsp;
                
                <br />
                <br />
                <asp:Label ID="Label3" runat="server" Text="Password :" Font-Bold="True"></asp:Label>
            </p>
            <p class="auto-style2">
&nbsp;<asp:TextBox ID="txt_Password" runat="server" Height="38px" Width="320px" TextMode="Password"></asp:TextBox>
                <br />
                &nbsp;
                
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btn_login" runat="server" Height="39px" Text="Login" Width="100px" Font-Bold="True" OnClick="btn_login_Click" />
            </p>
            <p class="auto-style2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:LinkButton ID="btn_forgetPass" runat="server" Font-Italic="True" Font-Size="Small" ForeColor="Black" OnClick="btn_forgetPass_Click">Forget Password</asp:LinkButton>
            </p>
            <p class="auto-style2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="status" runat="server" Font-Italic="True" Font-Size="25px" ForeColor="Red"></asp:Label>
            </p>
            <p class="auto-style3">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label4" runat="server" Text="HOD's | Teachers | Students"></asp:Label>
&nbsp;</p>

             </div>
            </asp:Panel>

            <asp:Panel ID="Panel2" Visible="false" runat="server">

                <div style="border: thin groove #000000; margin-left:900px; position: relative; background-color: #FFCC00 ; height:600px; width:500px; align-self:center; margin-top: 75px; margin-bottom: 75px; font-family: 'Noto Sans';">

            <p class="auto-style2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br />
                &nbsp;
                <asp:Label ID="Label5" runat="server" Enabled="False" Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="35px" ForeColor="Black" Text="Recover Password"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Label ID="Label6" runat="server" Text="User Name :" Font-Bold="True"></asp:Label>
            </p>
            <p class="auto-style2">
&nbsp;<asp:TextBox ID="TextBox1" placeholder="name@khalsa.com" runat="server" Height="38px" Width="320px"></asp:TextBox>
                <br />
                &nbsp;
               
                <br />
                <br />
                <asp:Label ID="Label7" runat="server" Text="Email Id :" Font-Bold="True"></asp:Label>
            </p>
            <p class="auto-style2">
&nbsp;<asp:TextBox ID="TextBox2" placeholder="email@gmail.com" runat="server" Height="38px" Width="320px" TextMode="email"></asp:TextBox>
                <br />
                &nbsp;
               
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnsnpd" runat="server" Height="39px" Text="Send Password" Width="176px" Font-Bold="True" OnClick="btnsnpd_Click" />
            </p>
            <p class="auto-style2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:LinkButton ID="LinkButton1" runat="server" Font-Italic="True" Font-Size="Small" ForeColor="Black" OnClick="LinkButton1_Click">Login</asp:LinkButton>
            </p>
            <p class="auto-style2">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label8" runat="server" Font-Italic="True" Font-Size="25px" ForeColor="Red"></asp:Label>
            </p>
            <p class="auto-style3">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label9" runat="server" Text="HOD's | Teachers | Students"></asp:Label>
&nbsp;</p>

             </div>
            </asp:Panel>--%>
            
            <div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Sign In</label>
		<input id="tab-2" type="radio" name="tab" class="for-pwd"><label for="tab-2" class="tab">Forgot Password</label>
		<div class="login-form">
			<div class="sign-in-htm">
				<div class="group">
					<label for="txt_UserName" class="label">Username</label>
                    <asp:TextBox ID="txt_UserName" placeholder="name@gnkc.com" class="input" runat="server"></asp:TextBox>
					<%--<input id="user" type="text" class="input">--%>
				</div>
				<div class="group">
					<label for="txt_Password" class="label">Password</label>
                    <asp:TextBox ID="txt_Password" runat="server" class="input"  TextMode="Password"></asp:TextBox>
					<%--<input id="pass" type="password" class="input" data-type="password">--%>
				</div>
				<div class="group">
                    <asp:Button ID="btn_login" runat="server"  Text="Login"  class="button"  OnClick="btn_login_Click" />
					<%--<input type="submit" class="button" value="Sign In">--%>
				</div>
				<div class="hr"></div>
                <div class="group">
                     <asp:Label ID="status" runat="server" Font-Italic="True" Font-Size="18px" ForeColor="Red"></asp:Label>
				</div>
			</div>
			<div class="for-pwd-htm">
				<div class="group">
					<label for="TextBox1" class="label">Username</label>
                    <asp:TextBox ID="TextBox1" placeholder="name@gnkc.com" runat="server"  class="input" ></asp:TextBox>
					<%--<input id="user" type="text" class="input">--%>
				</div>
                <div class="group">
					<label for="TextBox2" class="label">Email</label>
                    <asp:TextBox ID="TextBox2" placeholder="email@gmail.com" runat="server" class="input" TextMode="email"></asp:TextBox>
					<%--<input id="user" type="text" class="input">--%>
				</div>
				<div class="group">
                    <asp:Button ID="btnsnpd" runat="server"  Text="Send Password" class="button" OnClick="btnsnpd_Click" />
					<%--<input type="submit" class="button" value="Reset Password">--%>
				</div>
				<div class="hr"></div>
                <div class="group">
                     <asp:Label ID="Label8" runat="server" Font-Italic="True" Font-Size="18px" ForeColor="#0033cc"></asp:Label>
				</div>
			</div>
		</div>
	</div>
</div>
        </div>
    </form>
</body>
</html>
