<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test2.aspx.cs" Inherits="RB.test2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 355px;
            position: absolute;
            top: 213px;
            left: 599px;
            height: 162px;
        }
    </style>
</head>
<body>
    <form runat="server">
   <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
         <asp:Button ID="btnShow" runat="server" Text="Show Modal Popup" />
<!-- ModalPopupExtender -->


        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="btnShow"
    CancelControlID="btnClose" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>


<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup"  Style="display: none " ScrollBars="Vertical" BorderStyle="Solid" BorderWidth="1px">
    <div style="height:400px">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                 <asp:HiddenField ID="hiddenTid" runat="server" />
            <legend>Registration Form</legend>
            <div class="form-group">
                <label for="txtFN">First Name</label>                     
                <asp:TextBox  CssClass="form-control" id="txtFN" placeholder="Enter First Name" runat="server" ></asp:TextBox>                
            </div>
            <div class="form-group">
                <label for="txtLN">Last Name</label>                     
                <asp:TextBox  CssClass="form-control" id="txtLN" placeholder="Enter Last Name" runat="server" ></asp:TextBox>                
            </div>
            <div class="form-group">
                <label for="role">Select Role</label>
                <asp:DropDownList ID="role" runat="server" CssClass="form-control">
                    <asp:ListItem Value="Teacher">Teacher</asp:ListItem>
                    <asp:ListItem>HOD</asp:ListItem>

                </asp:DropDownList>               
            </div>

            <div class="form-group">
                <label for="txtUid">Aadhar No.</label>                     
                <asp:TextBox  CssClass="form-control" id="txtUid" placeholder="Enter Aadhar No." runat="server" ></asp:TextBox>                
            </div>

            <div class="form-group">
                <label for="txtphone">Phone No.</label>                     
                <asp:TextBox  CssClass="form-control" id="txtphone" placeholder="Enter Phone No." runat="server" ></asp:TextBox>                
            </div>

            <div class="form-group">
                <label for="txtEmail">Email address</label>
                <asp:TextBox  type="email"  CssClass="form-control" id="txtEmail" aria-describedby="emailHelp" placeholder="Enter email" runat="server" ></asp:TextBox>                
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>

            <div class="form-group">
                <label for="txtUN">UserName</label>
                <asp:TextBox  type="email"  CssClass="form-control" id="txtUN" aria-describedby="UnHelp" placeholder="Enter UserName" runat="server" ></asp:TextBox>                
                <small id="UnHelp" class="form-text text-muted">UserName should be your First name and clg name e.g "jagannath@khalsa.com"</small>
                <asp:RequiredFieldValidator ID="RequiredFieldUN" runat="server" ForeColor="Red" ErrorMessage="UserName Required To Field" ControlToValidate="txtUN"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="txtpass">Password</label>
                <asp:TextBox  type="password"  CssClass="form-control" id="txtpass" placeholder="Enter Password" runat="server" ControlToValidate="password"></asp:TextBox>                               
                <asp:RequiredFieldValidator ID="RequiredFieldPass" runat="server" ForeColor="Red" ErrorMessage="Password Required To Field" ControlToValidate="txtpass"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label for="txtconPass">Confirm Password</label>
                <asp:TextBox  type="password"  CssClass="form-control" id="txtconPass" placeholder="Enter Confirm Password" runat="server" ></asp:TextBox>                               
            </div>
                <asp:CompareValidator ID="Comparepass" runat="server" ForeColor="Red" ErrorMessage="Passwords Does not match" ControlToValidate="txtpass" ControlToCompare="txtconPass"></asp:CompareValidator>
            
            

                <%--Do you like this product?&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" OnSelectedIndexChanged="OnSelectedIndexChanged">
                    <asp:ListItem Text="Please Select" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Yes" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No" Value="2"></asp:ListItem>
                </asp:DropDownList>--%>
            </ContentTemplate>

        </asp:UpdatePanel>
        <asp:Button ID="btnClose" runat="server" Text="Close" />
    </div>
    
</asp:Panel>

      </form> 
</body>
</html>
