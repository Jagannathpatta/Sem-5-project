<%@ Page Title="" Language="C#" MasterPageFile="~/TeacherSite.Master" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="RB.WebForm13" %>
<%@ MasterType VirtualPath="~/TeacherSite.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="bootstrap.css" rel="stylesheet" />
    <div class="col-11">
        
        <h1>
            <asp:Label ID="lblyear" runat="server" Text=""></asp:Label>
            
            &nbsp;&nbsp;
            
            <asp:Label ID="lblSubname" runat="server" Text=""></asp:Label></h1>
        <br />
        <asp:Panel ID="Panel1" CssClass="col-7" runat="server" Visible="false">
             <div class="alert alert-dismissible alert-success">
                 <asp:Button ID="Button1"  cssclass="close" data-dismiss="alert" runat="server" Text="X" OnClick="Button1_Click" />
             <%--<button type="button" class="close" data-dismiss="alert">&times;</button>--%>
            <strong>Well done!</strong> You successfully Uploaded the file.
            </div>                 
                 </asp:Panel>
               <asp:Panel ID="Panel2" CssClass="col-7" runat="server" Visible="false">
             <div class="alert alert-dismissible alert-danger">
                 <asp:Button ID="Button2"  cssclass="close" data-dismiss="alert" runat="server" Text="X" OnClick="Button1_Click" />
             <%--<button type="button" class="close" data-dismiss="alert">&times;</button>--%>
            <strong>Opps!</strong> Student Already added into the class.
                 <asp:Label ID="flbl" runat="server" Text=""></asp:Label>
            </div>                 
                 </asp:Panel>
        <div class="col-5" style="float:left ; margin-left:45px">
        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="GRno" DataSourceID="SqlDataSource1" ForeColor="#333333" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="GRno" HeaderText="GRno" ReadOnly="True" SortExpression="GRno" />
                <asp:BoundField DataField="stdID" HeaderText="stdID" SortExpression="stdID" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:CommandField ButtonType="Button" SelectText="Add" ShowSelectButton="True" />
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ResultsBuilderConnectionString %>" SelectCommand="SELECT [GRno], [stdID], [FirstName], [LastName] FROM [Students] WHERE (([collegeCode] = @collegeCode) AND ([deptID] = @deptID)) ORDER BY [GRno], [stdID]">
            <SelectParameters>
                <asp:SessionParameter Name="collegeCode" SessionField="clgCode" Type="Int32" />
                <asp:SessionParameter Name="deptID" SessionField="depId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
            </div>


        <div class="col-4" style="float:right ; margin-right:45px">
            <strong>Students Already In Class</strong>
            <asp:GridView ID="GridView2" runat="server" CssClass="table table-hover" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="GRno" HeaderText="GRno" SortExpression="GRno" />
                    <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                    <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                    <asp:CommandField SelectText="Remove" ShowSelectButton="True" />
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
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ResultsBuilderConnectionString %>" SelectCommand="StudentsAlreadyInClass" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="clsid" SessionField="clsid" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>


            <asp:Button ID="btnAddMarks" CssClass="btn btn-info" PostBackUrl="~/EnterMarks.aspx" runat="server" Text="Add Marks" />
        </div>


    </div>

</asp:Content>
