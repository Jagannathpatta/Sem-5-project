<%@ Page Title="" Language="C#" MasterPageFile="~/TeacherSite.Master" AutoEventWireup="true" CodeBehind="EnterMarks.aspx.cs" Inherits="RB.WebForm12" %>
<%@ MasterType VirtualPath="~/TeacherSite.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="bootstrap.css" rel="stylesheet" />
    <style>
      abc {
            display:inline-flex !important;
        }
       
      ItemTemplate.delete {
            display:inline-flex !important;
        }

    </style>
    <div class="col-12">

       <div class="offset-1"> <h1>
            <asp:Label ID="lblyear" runat="server" Text=""></asp:Label>
            
            &nbsp;&nbsp;
            
            <asp:Label ID="lblSubname" runat="server" Text=""></asp:Label></h1></div>
        <br />

        <asp:GridView  ID="GridView1" cssclass="offset-1 col-10 "  runat="server" AutoGenerateColumns="False" DataKeyNames="GRno" AllowPaging="True"
            onRowCommand ="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing"
            OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting"
            ShowFooter="false" CellPadding="4" ForeColor="#333333">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#C5BBAF" />
            <FooterStyle BackColor="#283c63" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#283c63" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#283c63" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" Width="100px" Height="45px" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
           
            
            <Columns>
                 <asp:BoundField ControlStyle-CssClass="col-1" DataField="GRno" ReadOnly="true" HeaderText="GR No." />
                    <asp:BoundField ControlStyle-CssClass="col-1" DataField="stdID" ReadOnly="true" HeaderText="Roll No." />
                    <asp:BoundField ControlStyle-CssClass="col-1" DataField="FirstName" ReadOnly="true" HeaderText="First Name" />
                    <asp:BoundField ControlStyle-CssClass="col-1" DataField="LastName" ReadOnly="true" HeaderText="Last Name" />
                <%--<asp:TemplateField FooterStyle-Height="5px" FooterStyle-Width="10px" HeaderText="GRno." ItemStyle-VerticalAlign="NotSet" ItemStyle-HorizontalAlign="Center">     
                     <ItemTemplate>
                         
                    <asp:Label ID="GRno_Label" runat="server" Text='<%# Eval("GRno") %>' />
                           
                </ItemTemplate>
               <EditItemTemplate>
                  
                    <asp:Label ID="GRno_Label1" runat="server" Text='<%# Eval("GRno") %>' />
                      
                </EditItemTemplate>
                <FooterTemplate>
                    
                        <asp:TextBox ID="GRno_TextBox" runat="server"   />
                    
                   
                </FooterTemplate>

<FooterStyle Height="5px" Width="10px"></FooterStyle>

                      <HeaderStyle Height="5px" Width="10px" />
                    <ItemStyle HorizontalAlign="Center" Width="10px" Height="5px"></ItemStyle>

            </asp:TemplateField>
                                 
             <asp:TemplateField HeaderText="Std Id">
                <ItemTemplate>
                    <asp:Label ID="stdIDLabel" runat="server" Text='<%# Eval("stdID") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:Label ID="stdIDTextBox" runat="server" Text='<%# Eval("stdID") %>' />
                  
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
                    <asp:Label ID="FirstNameTextBox" runat="server" Text='<%# Eval("FirstName") %>' />
                    
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
                     <asp:Label ID="LastNameTextBox" runat="server" Text='<%# Eval("LastName") %>' />
                    
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="LastNameTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>--%>

            
             
            <asp:TemplateField HeaderText="Internals">
                <ItemTemplate>
                    <asp:Label ID="internalsLabel" runat="server" Text='<%# Eval("internals") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="internalsTextBox" placeholder="Marks out of 25" runat="server" Text='<%# Eval("internals") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="internalsTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField  HeaderText="Theory">
                <ItemTemplate>
                    <asp:Label ID="theoryLabel" runat="server" Text='<%# Eval("theory") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="theoryTextBox" placeholder="Marks out of 75" runat="server" Text='<%# Eval("theory") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="theoryTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>

            <asp:TemplateField  HeaderText="Practical">
                <ItemTemplate>
                    <asp:Label ID="practiclesLabel" runat="server" Text='<%# Eval("practicles") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="practiclesTextBox" placeholder="Marks out of 50" runat="server" Text='<%# Eval("practicles") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="practiclesTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>

            <%--<asp:TemplateField HeaderText="Phone No.">
                <ItemTemplate>
                    <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Eval("phone") %>' />
                </EditItemTemplate>
                <FooterTemplate>
                   <asp:TextBox ID="phoneTextBoxfooter" runat="server"   />
                </FooterTemplate>
            </asp:TemplateField>--%>

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

                 <asp:TemplateField >
                <ItemTemplate>
                    
                        <td>
                            <asp:Button runat="server"  cssclass="btn btn-info " ID="edit"  Text="Edit" CommandName="Edit"/>
                        </td>
                        <td>
                            <asp:Button runat="server" cssclass="btn btn-danger " ID="delete" Text="Delete" CommandName="Delete"/>
                        </td>
                    
                     
                    
                </ItemTemplate>
                <EditItemTemplate >
                    <td>
                    <asp:Button runat="server" cssclass="btn btn-info" ID="update" Text="Update" CommandName="Update"/> 
                    </td>
                    <td>
                    <asp:Button runat="server" cssclass="btn btn-danger" ID="cancel" Text="Cancel" CommandName="Cancel"/>
                    </td>
                </EditItemTemplate>
                <FooterTemplate>
                    <td>
                     <asp:Button runat="server" cssclass="btn btn-info" ID="addnew" Text="Add New" CommandName="AddNew"/>
                        </td>
                    <td>

                    </td>
                </FooterTemplate>
            </asp:TemplateField>
                
            </Columns>

        </asp:GridView>
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
        <asp:Label ID="sm" runat="server" Text="" ForeColor="YellowGreen"></asp:Label><asp:Label ID="fm" runat="server" Text="" ForeColor="Red"></asp:Label>
        </div>

</asp:Content>
