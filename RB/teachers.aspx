<%@ Page Title="" Language="C#" MasterPageFile="~/Hodsite.Master" AutoEventWireup="true" CodeBehind="teachers.aspx.cs" Inherits="RB.WebForm5" %>
<%@ MasterType VirtualPath="~/Hodsite.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="bootstrap.css" rel="stylesheet" />

    <div class="col-12">

        <div class="col-8" style="float:left ; padding-left:30px ">
            <legend style="padding-bottom:10px; padding-top:10px">List of all Teachers</legend>
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" cssclass="table table-hover" DataKeyNames="Tid" AllowPaging="True" CellPadding="4" ForeColor="#333333" OnSelectedIndexChanged="grid_SelectedIndexChanged"   >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Tid" HeaderText="Teacher ID" />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                    <asp:BoundField DataField="role" HeaderText="Role" />
                    <asp:BoundField DataField="Uid" HeaderText="Aadhar No." />
                    <asp:BoundField DataField="email" HeaderText="Email ID" />
                    <asp:BoundField DataField="phone" HeaderText="Contact No." />
                    
                    <asp:CommandField SelectText="View" ShowSelectButton="True" />
                    
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#283c63" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#283c63" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#283c63" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
        </div>

        <div class="col-4" style="width:45% ; float:right ;padding-left:10px ; padding-right:30px">
            <asp:HiddenField ID="hiddenTid" runat="server" />
            <legend style="padding-bottom:10px; padding-top:10px">Registration Form</legend>
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
                <asp:TextBox TextMode="Number"  CssClass="form-control" id="txtUid" placeholder="Enter Aadhar No." runat="server" ></asp:TextBox>  
                <small><asp:RegularExpressionValidator ForeColor="Red" ID="RegularExpressionValidator1" 
                        runat="server" ErrorMessage="*Enter valid Aadhar number" 
                        ControlToValidate="txtUid" 
                            ValidationExpression= "^[0-9]{16}$"></asp:RegularExpressionValidator></small>
            </div>

            <div class="form-group">
                <label for="txtphone">Phone No.</label>                     
                <asp:TextBox TextMode="Phone" CssClass="form-control" id="txtphone" placeholder="Enter Phone No." runat="server" ></asp:TextBox>
                <small><asp:RegularExpressionValidator  ForeColor="Red" ID="RegularExpressionValidator2" 
                        runat="server" ErrorMessage="*Enter valid Phone number" 
                        ControlToValidate="txtphone" 
                             ValidationExpression= "^[0-9]{10}$"></asp:RegularExpressionValidator></small>
            </div>

            <div class="form-group">
                <label for="txtEmail">Email address</label>
                <asp:TextBox   Type="email"  CssClass="form-control" id="txtEmail" aria-describedby="emailHelp" placeholder="Enter email" runat="server" ></asp:TextBox>                
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
            </div>

            <div class="form-group">
                <label for="txtUN">UserName</label>
                <asp:TextBox  Type="email"   CssClass="form-control" Text="" id="txtUN" aria-describedby="UnHelp" placeholder="Enter UserName" runat="server" ></asp:TextBox>                
                <small id="UnHelp" class="form-text text-muted">UserName should be your First name and clg name e.g "jagannath@khalsa.com"</small>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldUN" runat="server" ForeColor="Red" ErrorMessage="UserName Required To Field" ControlToValidate="txtUN"></asp:RequiredFieldValidator>--%>
            </div>

            <div class="form-group">
                <label for="txtpass">Password</label>
                <asp:TextBox  type="password" Text="" CssClass="form-control" id="txtpass" placeholder="Enter Password" runat="server" ControlToValidate="password"></asp:TextBox>                               
                <%--<asp:RequiredFieldValidator ID="RequiredFieldPass" runat="server" ForeColor="Red" ErrorMessage="Password Required To Field" ControlToValidate="txtpass"></asp:RequiredFieldValidator>--%>
            </div>

            <div class="form-group">
                <label for="txtconPass">Confirm Password</label>
                <asp:TextBox  type="password"  CssClass="form-control" id="txtconPass" placeholder="Enter Confirm Password" runat="server" ></asp:TextBox>      
                <small> <asp:CompareValidator ID="Comparepass" runat="server" ForeColor="Red" ErrorMessage="*Passwords Does not match" ControlToValidate="txtpass" ControlToCompare="txtconPass"></asp:CompareValidator></small>
            </div>
               
            
            
            <br />
           
            <asp:Button ID="btnSave" CssClass="btn btn-success" runat="server"  Text="Submit" OnClick="btnSave_Click" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button ID="btnDelete" CssClass="btn btn-primary" runat="server"   Text="Delete" OnClick="btnDelete_Click" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button ID="btnClear" CssClass="btn btn-secondary" runat="server"   Text="Clear" OnClick="btnClear_Click" />
            <br />
            <asp:Label ID="txtSuc" runat="server" ForeColor="YellowGreen" Text=""></asp:Label>
            <asp:Label ID="txtFail" runat="server" ForeColor="Red" Text=""></asp:Label>
            <br />
            <br />
        </div>
        
    </div>
</asp:Content>
