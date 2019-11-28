<%@ Page Title="" Language="C#" MasterPageFile="~/TeacherSite.Master" AutoEventWireup="true" CodeBehind="teacherHome.aspx.cs" Inherits="RB.WebForm3" %>
<%@ MasterType VirtualPath="~/TeacherSite.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="bootstrap.css" rel="stylesheet" />
    <p>

        &nbsp;&nbsp;

    </p>
<p style="margin-left: 40px">

        &nbsp;

        <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True" Font-Size="X-Large">Faculty</asp:Label>

    </p>
    <p style="margin-left: 40px">

        &nbsp;&nbsp;
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>

    </p>
   
       
        
       
    
    <div>

         <div class="col-4" style="padding-left: 40px ; float:left ; margin-left:100px">
             <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="Medium" Text="List of Classes"></asp:Label>
             <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" CssClass="table table-hover">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="classID" HeaderText="classID" SortExpression="classID" />
                <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
                <asp:BoundField DataField="sem" HeaderText="sem" SortExpression="sem" />
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

             <asp:Button ID="viewall" CssClass="btn btn-info" runat="server" PostBackUrl="~/teacherClasses.aspx" Text="View All" />
        </div>


       <%--  <div class="col-5" style="padding-left:40px ; float:right ; margin-right:100px">
             <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Medium" Text="List of Subjects"></asp:Label>
             <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="subCode" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="subCode" HeaderText="subCode" ReadOnly="True" SortExpression="subCode" />
                <asp:BoundField DataField="subName" HeaderText="subName" SortExpression="subName" />
                <asp:BoundField DataField="sem" HeaderText="sem" SortExpression="sem" />
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

              <asp:Button ID="viewall0" CssClass="btn btn-info" runat="server" Text="View All" />
        </div>--%>

    </div>
       
  
    

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ResultsBuilderConnectionString %>" SelectCommand="SELECT [classID], [year], [sem] FROM [Classes] WHERE ([Tid] = @Tid) ORDER BY [sem]">
            <SelectParameters>
                <asp:SessionParameter Name="Tid" SessionField="tid" Type="Int16" />
            </SelectParameters>
    </asp:SqlDataSource>
    
  
        

    
    

       
        
        
   
       
    

     
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ResultsBuilderConnectionString %>" SelectCommand="SELECT [subCode], [subName], [sem] FROM [Subjects] WHERE ([deptID] = @deptID) ORDER BY [subCode], [sem]">
            <SelectParameters>
                <asp:SessionParameter Name="deptID" SessionField="depId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    
       

    
   

 

      
</asp:Content>
