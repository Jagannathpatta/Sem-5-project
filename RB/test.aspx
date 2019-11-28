<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs"  EnableEventValidation="true"  Inherits="RB.test" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>
       <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="GRno" AllowPaging="True"
            onRowCommand ="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing"
            OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting"
            ShowFooter="True" CellPadding="4" ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
            <Columns>
                 
                <asp:TemplateField HeaderText="GRno.">     
                     <ItemTemplate>
                    <asp:Label ID="GRno_Label" runat="server" Text='<%# Eval("GRno") %>' />
                </ItemTemplate>
               <EditItemTemplate>
                    <asp:Label ID="GRno_Label1" runat="server" Text='<%# Eval("GRno") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="GRno_TextBox" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>
                 
                <asp:TemplateField HeaderText="Uid">
                <ItemTemplate>
                    <asp:Label ID="UidLabel" runat="server" Text='<%# Eval("Uid") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="Uidlabel1" runat="server" Text='<%# Eval("Uid") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="UidTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Std Id">
                <ItemTemplate>
                    <asp:Label ID="stdIDLabel" runat="server" Text='<%# Eval("stdID") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="stdIDTextBox" runat="server" Text='<%# Eval("stdID") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="stdIDTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="First Name">
                <ItemTemplate>
                    <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Eval("FirstName") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Eval("FirstName") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="FirstNameTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Last Name">
                <ItemTemplate>
                    <asp:Label ID="LastNameLabel" runat="server" Text='<%# Eval("LastName") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Eval("LastName") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="LastNameTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>

             <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Eval("email") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="emailTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Phone No.">
                <ItemTemplate>
                    <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Eval("phone") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="phoneTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>
             
            <asp:TemplateField HeaderText="User Name">
                <ItemTemplate>
                    <asp:Label ID="userNameLabel" runat="server" Text='<%# Eval("userName") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="userNameTextBox" runat="server" Text='<%# Eval("userName") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="userNameTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="password">
                <ItemTemplate>
                    <asp:Label ID="passwordLabel" runat="server" Text='<%# Eval("password") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Eval("password") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="passwordTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>

           

            <%--<asp:TemplateField HeaderText="College Code">
                <ItemTemplate>
                    <asp:Label ID="collegeCodeLabel" runat="server" Text='<%# Eval("collegeCode") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="collegeCodeTextBox" runat="server" Text='<%# Eval("collegeCode") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="collegeCodeTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Dept Id">
                <ItemTemplate>
                    <asp:Label ID="deptIDLabel" runat="server" Text='<%# Eval("deptID") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="deptIDTextBox" runat="server" Text='<%# Eval("deptID") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="deptIDTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Role">
                <ItemTemplate>
                    <asp:Label ID="roleLabel" runat="server" Text='<%# Eval("role") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="roleTextBox" runat="server" Text='<%# Eval("role") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="roleTextBoxfooter" runat="server" Text="Student" Enabled="false" />
                </FooterTemplate>
            </asp:TemplateField>--%>

                 <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button runat="server" cssclass="btn btn-info" ID="edit" Text="Edit" CommandName="Edit"/> <asp:Button runat="server" cssclass="btn btn-danger" ID="delete" Text="Delete" CommandName="Delete"/>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Button runat="server" cssclass="btn btn-info" ID="update" Text="Update" CommandName="Update"/> <asp:Button runat="server" cssclass="btn btn-danger" ID="cancel" Text="Cancel" CommandName="Cancel"/>
                </EditItemTemplate>
                <FooterTemplate>
                     <asp:Button runat="server" cssclass="btn btn-info" ID="addnew" Text="Add New" CommandName="AddNew"/>
                </FooterTemplate>
            </asp:TemplateField>

               
               
            </Columns>

        </asp:GridView>
        

        <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>
        <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" PopupControlID="Panel1" TargetControlID="LinkButton1"
    CancelControlID="btnClose" BackgroundCssClass="modalBackground"></ajaxToolkit:ModalPopupExtender>


<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" align="center" Style="display: none " ScrollBars="Vertical" BorderStyle="Solid" BorderWidth="1px">
    <div style="height:400px">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                  
            <legend>Registration Form</legend>

            <div class="form-group">
                <label for="txtGRno">GR No.</label>                     
                <asp:TextBox  CssClass="form-control" id="txtGRno" placeholder="Enter GRno." runat="server" ></asp:TextBox> 
                
            </div>

            <div class="form-group">
                <label for="txtUid">Aadhar No.</label>                     
                <asp:TextBox  CssClass="form-control" id="txtUid" placeholder="Enter Aadhar No." runat="server" ></asp:TextBox>                
            </div>

            <div class="form-group">
                <label for="txtSid">Std id.</label>                     
                <asp:TextBox  CssClass="form-control" id="txtSid" placeholder="Enter GRno." runat="server" ></asp:TextBox>                
            </div>

            <div class="form-group">
                <label for="txtFN">First Name</label>                     
                <asp:TextBox  CssClass="form-control" id="txtFN" placeholder="Enter First Name" runat="server" ></asp:TextBox>                
            </div>
            <div class="form-group">
                <label for="txtLN">Last Name</label>                     
                <asp:TextBox  CssClass="form-control" id="txtLN" placeholder="Enter Last Name" runat="server" ></asp:TextBox>                
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
            


            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="btnClose" runat="server" Text="Close" />
    </div>
    
</asp:Panel>
        <asp:Label ID="sm" runat="server" Text="" ForeColor="YellowGreen"></asp:Label><asp:Label ID="fm" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br />
       
    </form>
   <%-- <div>
        <div style="width:24% ; float:left ;padding-left:10px">
            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="GRno." DataSourceID="SqlDataSource1" DefaultMode="Insert">
                <EditItemTemplate>
                    GRno.:
                    <asp:Label ID="GRno_Label1" runat="server" Text='<%# Eval("GRno.") %>' />
                    <br />
                    stdID:
                    <asp:TextBox ID="stdIDTextBox" runat="server" Text='<%# Bind("stdID") %>' />
                    <br />
                    FirstName:
                    <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                    <br />
                    LastName:
                    <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                    <br />
                    Uid:
                    <asp:TextBox ID="UidTextBox" runat="server" Text='<%# Bind("Uid") %>' />
                    <br />
                    userName:
                    <asp:TextBox ID="userNameTextBox" runat="server" Text='<%# Bind("userName") %>' />
                    <br />
                    password:
                    <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                    <br />
                    email:
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <br />
                    phone:
                    <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                    <br />
                    collegeCode:
                    <asp:TextBox ID="collegeCodeTextBox" runat="server" Text='<%# Bind("collegeCode") %>' />
                    <br />
                    deptID:
                    <asp:TextBox ID="deptIDTextBox" runat="server" Text='<%# Bind("deptID") %>' />
                    <br />
                    role:
                    <asp:TextBox ID="roleTextBox" runat="server" Text='<%# Bind("role") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    GRno.:
                    <asp:TextBox ID="GRno_TextBox" runat="server" Text='<%# Bind("GRno.") %>' />
                    <br />
                    stdID:
                    <asp:TextBox ID="stdIDTextBox" runat="server" Text='<%# Bind("stdID") %>' />
                    <br />
                    FirstName:
                    <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' />
                    <br />
                    LastName:
                    <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' />
                    <br />
                    Uid:
                    <asp:TextBox ID="UidTextBox" runat="server" Text='<%# Bind("Uid") %>' />
                    <br />
                    userName:
                    <asp:TextBox ID="userNameTextBox" runat="server" Text='<%# Bind("userName") %>' />
                    <br />
                    password:
                    <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                    <br />
                    email:
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <br />
                    phone:
                    <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                    <br />
                    collegeCode:
                    <asp:TextBox ID="collegeCodeTextBox" runat="server" Text='<%# Bind("collegeCode") %>' />
                    <br />
                    deptID:
                    <asp:TextBox ID="deptIDTextBox" runat="server" Text='<%# Bind("deptID") %>' />
                    <br />
                    role:
                    <asp:TextBox ID="roleTextBox" runat="server" Text='<%# Bind("role") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    GRno.:
                    <asp:Label ID="GRno_Label" runat="server" Text='<%# Eval("GRno.") %>' />
                    <br />
                    stdID:
                    <asp:Label ID="stdIDLabel" runat="server" Text='<%# Bind("stdID") %>' />
                    <br />
                    FirstName:
                    <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>' />
                    <br />
                    LastName:
                    <asp:Label ID="LastNameLabel" runat="server" Text='<%# Bind("LastName") %>' />
                    <br />
                    Uid:
                    <asp:Label ID="UidLabel" runat="server" Text='<%# Bind("Uid") %>' />
                    <br />
                    userName:
                    <asp:Label ID="userNameLabel" runat="server" Text='<%# Bind("userName") %>' />
                    <br />
                    password:
                    <asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />
                    <br />
                    email:
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                    <br />
                    phone:
                    <asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("phone") %>' />
                    <br />
                    collegeCode:
                    <asp:Label ID="collegeCodeLabel" runat="server" Text='<%# Bind("collegeCode") %>' />
                    <br />
                    deptID:
                    <asp:Label ID="deptIDLabel" runat="server" Text='<%# Bind("deptID") %>' />
                    <br />
                    role:
                    <asp:Label ID="roleLabel" runat="server" Text='<%# Bind("role") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
        </div>
        <div style="width:74% ; float:right">

            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="GRno." DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    <asp:BoundField DataField="GRno." HeaderText="GRno." ReadOnly="True" SortExpression="GRno." />
                    <asp:BoundField DataField="stdID" HeaderText="stdID" SortExpression="stdID" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:BoundField DataField="Uid" HeaderText="Uid" SortExpression="Uid" />
                    <asp:BoundField DataField="userName" HeaderText="userName" SortExpression="userName" />
                    <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                    <asp:BoundField DataField="phone" HeaderText="phone" SortExpression="phone" />
                    <asp:BoundField DataField="collegeCode" HeaderText="collegeCode" SortExpression="collegeCode" />
                    <asp:BoundField DataField="deptID" HeaderText="deptID" SortExpression="deptID" />
                    <asp:BoundField DataField="role" HeaderText="role" SortExpression="role" />
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>

        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ResultsBuilderConnectionString %>" DeleteCommand="StudentDeleteByID" DeleteCommandType="StoredProcedure" InsertCommand="StudentCreateOrUpdate" InsertCommandType="StoredProcedure" SelectCommand="StudentViewAll" SelectCommandType="StoredProcedure" UpdateCommand="StudentCreateOrUpdate" UpdateCommandType="StoredProcedure">
            <DeleteParameters>
                <asp:Parameter Name="GRno" Type="Int32" />
                <asp:Parameter Name="Uid" Type="Int64" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Uid" Type="Int64" />
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="collegeCode" Type="Int32" />
                <asp:Parameter Name="deptID" Type="Int32" />
                <asp:Parameter Name="userName" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="phone" Type="Int64" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="stdID" Type="Int32" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="GRno" Type="Int32" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="deptID" SessionField="depID" Type="Int32" />
                <asp:SessionParameter Name="collegeCode" SessionField="clgCode" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Uid" Type="Int64" />
                <asp:Parameter Name="role" Type="String" />
                <asp:Parameter Name="collegeCode" Type="Int32" />
                <asp:Parameter Name="deptID" Type="Int32" />
                <asp:Parameter Name="userName" Type="String" />
                <asp:Parameter Name="password" Type="String" />
                <asp:Parameter Name="phone" Type="Int64" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="stdID" Type="Int32" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="GRno" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </div>--%>
</body>
</html>
