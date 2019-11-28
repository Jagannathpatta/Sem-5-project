<%@ Page Title="" Language="C#" MasterPageFile="~/Hodsite.Master" AutoEventWireup="true" CodeBehind="students1.aspx.cs" Inherits="RB.WebForm6" %>
<%@ MasterType VirtualPath="~/Hodsite.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="bootstrap.css" rel="stylesheet" />
    
    <div class="col-12">
        <asp:GridView ID="GridView1" cssclass="table table-hover" class="col-5"    style="overflow:hidden; box-sizing:content-box; " runat="server" AutoGenerateColumns="false" DataKeyNames="GRno" AllowPaging="true"
            onRowCommand ="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing"
            OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting"
            ShowFooter="true" CellPadding="4" ForeColor="#333333" GridLines="None" Height="16px" Width="16px">
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

        <asp:Label ID="sm" runat="server" Text="" ForeColor="YellowGreen"></asp:Label><asp:Label ID="fm" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>
</asp:Content>
