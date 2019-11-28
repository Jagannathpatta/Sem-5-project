<%@ Page Title="" Language="C#" MasterPageFile="~/Hodsite.Master" AutoEventWireup="true" CodeBehind="hodHome.aspx.cs" Inherits="RB.WebForm2" %>
<%@ MasterType VirtualPath="~/Hodsite.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="bootstrap.css" rel="stylesheet" />
    <p>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    </p>
    <p style="margin-left: 40px">

        &nbsp;<asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True" Font-Size="X-Large">Department</asp:Label>

    &nbsp;</p>
    <p style="margin-left: 40px">

        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="X-Large" Text="program"></asp:Label>

    </p>
    
      

        
 <div>

      <div style="padding-left:40px ; float:left ; width=49%">
     
         
         <legend>List of all Teachers</legend>
    
       
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CssClass="table table-hover" CellPadding="4" DataKeyNames="Tid" DataSourceID="SqlDataSource2" ForeColor="#333333"  Width="452px" AllowPaging="True" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Tid" HeaderText="Tid" InsertVisible="False" ReadOnly="True" SortExpression="Tid" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="Uid" HeaderText="Uid" SortExpression="Uid" />
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
        
   

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ResultsBuilderConnectionString %>" SelectCommand="SELECT [Tid], [FirstName], [LastName], [Uid] FROM [Teachers] WHERE (([deptID] = @deptID) AND ([collegeCode] = @collegeCode)) ORDER BY [Tid], [FirstName]">
            <SelectParameters>
                <asp:SessionParameter Name="deptID" SessionField="depId" Type="Int32" />
                <asp:SessionParameter Name="collegeCode" SessionField="clgCode" Type="Int32" />
            </SelectParameters>
          </asp:SqlDataSource>

    <br />
        <asp:Button ID="viewall0" runat="server" style="float:right" Text="View All" CssClass="btn btn-info" PostBackUrl="~/teachers.aspx"/>

      
    </div>

     <div  style="padding-left:10px ; float:right ;width=49% ; padding-right:140px " >
        <legend>List of Classes</legend>
    <br />
        
       
        <asp:GridView ID="GridView3" runat="server" CellPadding="4" CssClass="table table-hover" DataSourceID="SqlDataSource1" ForeColor="#333333"  AllowPaging="True" AutoGenerateColumns="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="classID" HeaderText="classID" InsertVisible="False" ReadOnly="True" SortExpression="classID" />
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
        
    
    

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ResultsBuilderConnectionString %>" SelectCommand="SELECT [classID], [year], [sem] FROM [Classes] WHERE ([deptID] = @deptID)">
            <SelectParameters>
                <asp:SessionParameter Name="deptID" SessionField="depId" Type="Int32" />
            </SelectParameters>
         </asp:SqlDataSource>
    <br />
    
        <asp:Button ID="viewall" CssClass="btn btn-info" runat="server" style="float:right" Text="View All" PostBackUrl="~/Classes.aspx" />
    </div>
  
  </div>
</asp:Content>

