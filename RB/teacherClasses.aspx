<%@ Page Title="" Language="C#" MasterPageFile="~/TeacherSite.Master" AutoEventWireup="true" CodeBehind="teacherClasses.aspx.cs" Inherits="RB.WebForm10" %>
<%@ MasterType VirtualPath="~/TeacherSite.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="bootstrap.css" rel="stylesheet" />
    <div class="col-12">

        <div class="col=7" style="float:left ">
            
            <h3>List of Classes</h3>
                
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" DataKeyNames="classID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                     <asp:BoundField DataField="classID" HeaderText="Class Id" />
                    <asp:BoundField DataField="year" HeaderText="Acedemic Year" />
                    <asp:BoundField DataField="sem" HeaderText="Sem" />
                    <asp:BoundField DataField="subCode" HeaderText="Subject Code" />
                   <asp:BoundField DataField="subName" HeaderText="Subject Name" />
                   
                     <asp:CommandField SelectText="View" ShowSelectButton="True" />
                   
                </Columns>
                <EditRowStyle BackColor="#7C6F57" />
                <FooterStyle BackColor="#283c63" Font-Bold="True" ForeColor="White" />
                <HeaderStyle  BackColor="#283c63" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#283c63" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
                        
            
            <br />
        </div>

       
           
       
        
    </div>

            </asp:Content>
