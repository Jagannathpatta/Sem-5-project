<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test3.aspx.cs" Inherits="RB.test3" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 34%;
            height: 105px;
        }
        .auto-style2 {
            width: 166px;
        }
        .auto-style3 {
            margin-right: 345px;
        }
    </style>
    <link href="bootstrap.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div>
            
            <asp:GridView ID="GridView1" runat="server" cssclass="table table-hover" AutoGenerateColumns="False" DataKeyNames="classID,subCode" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="classID" HeaderText="classID" ReadOnly="True" SortExpression="classID" />
                    <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
                    <asp:BoundField DataField="deptID" HeaderText="deptID" SortExpression="deptID" />
                    <asp:BoundField DataField="sem" HeaderText="sem" SortExpression="sem" />
                    <asp:BoundField DataField="Tid" HeaderText="Tid" SortExpression="Tid" />
                    <asp:BoundField DataField="subCode" HeaderText="subCode" SortExpression="subCode" ReadOnly="True" />
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            
            <br />
            <br />
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">classId</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Height="30px" Width="182px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">year</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" Height="30px" Width="182px"></asp:TextBox>
                    </td>
                </tr>
                </table>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                        <asp:DropDownList ID="DropDownList1" AutoPostBack="true" runat="server">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                        </asp:DropDownList>
                   
                    Select those Subjects u want to assign teachers 
               
                
            
                        <asp:CheckBoxList ID="CheckBoxList1" AutoPostBack="true" runat="server" DataSourceID="SqlDataSource3" DataTextField="subName" DataValueField="subCode" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged">
                        </asp:CheckBoxList>
                    <br />
            
            <div class="form-group">
                   <asp:DropDownList ID="DDLteachers1" Visible="false" CssClass="custom-select" runat="server" DataSourceID="SqlDataSource4" DataTextField="FirstName" DataValueField="Tid"></asp:DropDownList>        
            </div>
            <div class="form-group">
                   <asp:DropDownList ID="DDLteachers7" Visible="false" CssClass="custom-select" runat="server" DataSourceID="SqlDataSource4" DataTextField="FirstName" DataValueField="Tid"></asp:DropDownList>        
            </div>
            <div class="form-group">
                   <asp:DropDownList ID="DDLteachers2" Visible="false" CssClass="custom-select" runat="server"  DataSourceID="SqlDataSource4" DataTextField="FirstName" DataValueField="Tid"></asp:DropDownList>        
            </div>
            <div class="form-group">
                   <asp:DropDownList ID="DDLteachers3" Visible="false" CssClass="custom-select" runat="server"  DataSourceID="SqlDataSource4" DataTextField="FirstName" DataValueField="Tid"></asp:DropDownList>        
            </div>
             <div class="form-group">
                   <asp:DropDownList ID="DDLteachers4" Visible="false" CssClass="custom-select" runat="server"  DataSourceID="SqlDataSource4" DataTextField="FirstName" DataValueField="Tid"></asp:DropDownList>        
            </div>
            <div class="form-group">
                   <asp:DropDownList ID="DDLteachers5" Visible="false" CssClass="custom-select" runat="server"  DataSourceID="SqlDataSource4" DataTextField="FirstName" DataValueField="Tid"></asp:DropDownList>        
            </div>
            <div class="form-group">
                   <asp:DropDownList ID="DDLteachers6" Visible="false" CssClass="custom-select" runat="server"  DataSourceID="SqlDataSource4" DataTextField="FirstName" DataValueField="Tid"></asp:DropDownList>        
            </div>
            <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
            <br />
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ResultsBuilderConnectionString %>" SelectCommand="SELECT [subName], [subCode] FROM [Subjects] WHERE (([sem] = @sem) AND ([deptID] = @deptID))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="sem" PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter DefaultValue="120" Name="deptID" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
                        <asp:DropDownList ID="DropDownList2"  runat="server" Visible="false" DataSourceID="SqlDataSource4" DataTextField="FirstName" DataValueField="Tid">
                        </asp:DropDownList>
                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <br />
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ResultsBuilderConnectionString %>" SelectCommand="SELECT [FirstName], [Tid] FROM [Teachers] WHERE (([deptID] = @deptID) AND ([collegeCode] = @collegeCode))">
                <SelectParameters>
                    <asp:Parameter DefaultValue="120" Name="deptID" Type="Int32" />
                    <asp:Parameter DefaultValue="101" Name="collegeCode" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ResultsBuilderConnectionString %>" DeleteCommand="TeacherDeleteById" DeleteCommandType="StoredProcedure" InsertCommand="TeacherCreateOrUpdate" InsertCommandType="StoredProcedure" SelectCommand="classViewAll" SelectCommandType="StoredProcedure" UpdateCommand="TeacherCreateOrUpdate" UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="Tid" Type="Int32" />
                    <asp:Parameter Name="Uid" Type="Int64" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Tid" Type="Int16" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Uid" Type="Int64" />
                    <asp:Parameter Name="role" Type="String" />
                    <asp:Parameter Name="collegeCode" Type="Int32" />
                    <asp:Parameter Name="deptID" Type="Int32" />
                    <asp:Parameter Name="userName" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="phone" Type="Int64" />
                    <asp:Parameter Name="email" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Tid" Type="Int16" />
                    <asp:Parameter Name="FirstName" Type="String" />
                    <asp:Parameter Name="LastName" Type="String" />
                    <asp:Parameter Name="Uid" Type="Int64" />
                    <asp:Parameter Name="role" Type="String" />
                    <asp:Parameter Name="collegeCode" Type="Int32" />
                    <asp:Parameter Name="deptID" Type="Int32" />
                    <asp:Parameter Name="userName" Type="String" />
                    <asp:Parameter Name="password" Type="String" />
                    <asp:Parameter Name="phone" Type="Int64" />
                    <asp:Parameter Name="email" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="auto-style3" DataKeyNames="classID,subCode" DataSourceID="SqlDataSource2" DefaultMode="Edit" Height="50px" Width="478px">
                <Fields>
                    <asp:BoundField DataField="classID" HeaderText="classID" ReadOnly="True" SortExpression="classID" />
                    <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
                    <asp:BoundField DataField="deptID" HeaderText="deptID" SortExpression="deptID" />
                    <asp:BoundField DataField="sem" HeaderText="sem" SortExpression="sem" />
                    <asp:BoundField DataField="Tid" HeaderText="Tid" SortExpression="Tid" />
                    <asp:BoundField DataField="subCode" HeaderText="subCode" SortExpression="subCode" ReadOnly="True" />
                </Fields>
            </asp:DetailsView>
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ResultsBuilderConnectionString %>" DeleteCommand="classDeleteById" DeleteCommandType="StoredProcedure" InsertCommand="classCreateOrUpdate" InsertCommandType="StoredProcedure" SelectCommand="classViewById" SelectCommandType="StoredProcedure" UpdateCommand="classCreateOrUpdate" UpdateCommandType="StoredProcedure">
                <DeleteParameters>
                    <asp:Parameter Name="classID" Type="Int32" />
                    <asp:Parameter Name="subCode" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="classID" Type="Int32" />
                    <asp:Parameter Name="year" Type="String" />
                    <asp:Parameter Name="deptID" Type="Int32" />
                    <asp:Parameter Name="sem" Type="Int32" />
                    <asp:Parameter Name="Tid" Type="Int16" />
                    <asp:Parameter Name="subCode" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="classID" PropertyName="Text" Type="Int32" />
                    <asp:ControlParameter ControlID="TextBox6" Name="subCode" PropertyName="Text" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="classID" Type="Int32" />
                    <asp:Parameter Name="year" Type="String" />
                    <asp:Parameter Name="deptID" Type="Int32" />
                    <asp:Parameter Name="sem" Type="Int32" />
                    <asp:Parameter Name="Tid" Type="Int16" />
                    <asp:Parameter Name="subCode" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                <asp:ListItem Value=" ">month</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </form>
</body>
</html>
