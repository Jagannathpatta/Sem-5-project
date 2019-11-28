<%@ Page Title="" Language="C#" MasterPageFile="~/Hodsite.Master" AutoEventWireup="true" CodeBehind="WebForm7.aspx.cs" Inherits="RB.WebForm7" %>
<%@ MasterType VirtualPath="~/Hodsite.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="bootstrap.css" rel="stylesheet" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     <%--<label for="FileUpload1">Upload Excel Fiel</label>
    
    <asp:FileUpload ID="FileUpload1" runat="server" />

    <asp:Button ID="Button1" runat="server" Text="Save to SQL Server" OnClick="Button1_Click" />
    <br />
    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>--%>

    <div class="col-6" style="float:right">

            <asp:HiddenField ID="HiddenField1" runat="server" />
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>

                
            <div class="form-row">
                <div class="form-group col-2">
                <label for="txtCid">Class ID</label>                     
                <asp:TextBox  CssClass="form-control" Enabled="false" id="txtCid" placeholder="Enter ClassId" runat="server" ></asp:TextBox>                
            </div>

            <div class="form-group col-2">
                <label for="sem">Select Class</label>
                <asp:DropDownList ID="clsyr" runat="server" CssClass="form-control">
                    <asp:ListItem>FY</asp:ListItem>
                    <asp:ListItem>SY</asp:ListItem>
                    <asp:ListItem>TY</asp:ListItem>
                </asp:DropDownList>               
            </div>
                <div class="form-group col-2">
                <label for="sem">Select Year</label>
                <asp:DropDownList ID="yr" runat="server" AutoPostBack="true" OnSelectedIndexChanged="yr_SelectedIndexChanged" CssClass="form-control">                    
                </asp:DropDownList>               
            </div>

                <div class="form-group col-3">
                <label for="txtAY">Academic Year</label>                     
                <asp:TextBox  CssClass="form-control" Enabled="false" id="txtAY" placeholder="Enter AcademicYear" runat="server" ></asp:TextBox>                
            </div>
                 <div class="form-group col-7">
                <label for="sem">Select Semester</label>
                <asp:DropDownList ID="sem"  runat="server" CssClass="form-control">
                    <asp:ListItem Value="1">SEM 1</asp:ListItem>
                    <asp:ListItem Value="2">SEM 2</asp:ListItem>
                    <asp:ListItem Value="3">SEM 3</asp:ListItem>
                    <asp:ListItem Value="4">SEM 4</asp:ListItem>
                    <asp:ListItem Value="5">SEM 5</asp:ListItem>
                    <asp:ListItem Value="6">SEM 6</asp:ListItem>
                </asp:DropDownList>               
            </div>

                <asp:Button ID="btncls" CssClass="btn btn-outline-info" runat="server" Text="Save"  />

                </div>
            
                    </ContentTemplate>
            </asp:UpdatePanel>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
            
           

            <div class="form-row">
                
            <%--<div class="form-group">
                <div class="custom-control custom-checkbox">
                    <label class="custom-control-label" for="customCheck1">Check the subjects you want to assign Teachers.</label>
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="subName" DataValueField="subCode" OnSelectedIndexChanged="CheckBoxList1_SelectedIndexChanged"> </asp:CheckBoxList>
                    
            </div>  --%>  
           <%--     <asp:Panel ID="Panel1" Visible="false" runat="server">
                
                <div class="form-check col-7" style="padding-left:15px">
                    <label class="form-check-label" for="RadioButtonList1">Check the subjects you want to assign Teachers.</label>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="form-check-input" AutoPostBack="True" DataSourceID="SqlDataSource2"  DataTextField="subName" DataValueField="subCode"></asp:RadioButtonList>
                    
            </div> 
            
                </asp:Panel>--%>
                <asp:Panel ID="Panel2" Visible="false" cssclass="col-6" runat="server">
                    
                <div class="form-group ">
                <label >Subject</label>  
                    <asp:TextBox  CssClass="form-control" Enabled="false" id="txtsubcode"  runat="server" ></asp:TextBox>
                <asp:TextBox  CssClass="form-control" Enabled="false" id="txtsub"  runat="server" ></asp:TextBox> 
                   
            </div>
                </asp:Panel>

              <%--  <div class="form-group col-4 ">
                   <label class="custom-control-label" for="DropDownList1">Select the Teacher  </label>
                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="FirstName" DataValueField="Tid"></asp:DropDownList>
                </div>
                </div>
            </div>--%>
                <asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" CellPadding="4"  ForeColor="#333333" >
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="subCode" HeaderText="SubCode" />
                         <asp:BoundField DataField="subName" HeaderText="Sub Name" />
                        
                        
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:DropDownList ID="DropDownList1" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="FirstName" DataValueField="Tid"></asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
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

                
            </ContentTemplate>

            </asp:UpdatePanel>

            <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                <ContentTemplate>
            <div style="margin-bottom:50px ; float:right">
            <asp:Button ID="btnSave" CssClass="btn btn-outline-info" runat="server" Text="Save" OnClick="btnSave_Click" />

            <asp:Button ID="btnDelete" CssClass="btn btn-outline-info" runat="server" Text="Delete" OnClick="btnDelete_Click" />

            <asp:Button ID="btnClear" CssClass="btn btn-outline-info" runat="server" Text="Clear" OnClick="btnClear_Click" />
                
            <br />

            <asp:Label ID="susTxt" runat="server" Text="" ForeColor="YellowGreen"></asp:Label>
            <asp:Label ID="failTxt" runat="server" Text="" ForeColor="Red"></asp:Label>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ResultsBuilderConnectionString %>" SelectCommand="SELECT [subCode], [subName] FROM [Subjects] WHERE (([deptID] = @deptID) AND ([sem] = @sem))">
                <SelectParameters>
                    <asp:SessionParameter Name="deptID" SessionField="depId" Type="Int32" />
                    <asp:ControlParameter ControlID="sem" Name="sem" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ResultsBuilderConnectionString %>" SelectCommand="SELECT * FROM [Teachers] WHERE (([deptID] = @deptID) AND ([collegeCode] = @collegeCode)) ORDER BY [Tid], [FirstName]">
                <SelectParameters>
                    <asp:SessionParameter Name="deptID" SessionField="depId" Type="Int32" />
                    <asp:SessionParameter Name="collegeCode" SessionField="clgCode" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
                </div>
                 </ContentTemplate>

            </asp:UpdatePanel>
            
        </div>

    <div class="col-4" style="float:left ; padding-left:0px">
            <legend>List of Classes</legend>
            <br />
            <asp:GridView ID="grid" runat="server" CssClass="table table-hover" AllowPaging="true" OnPageIndexChanging="grid_PageIndexChanging" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="classID" HeaderText="ClassID" />
                    <asp:BoundField DataField="year" HeaderText="Academic Year" />
                    <asp:BoundField DataField="sem" HeaderText="Sem" />
                    <asp:BoundField DataField="subCode" HeaderText="SubCode" />
                   <asp:BoundField DataField="subName" HeaderText="Sub Name" />
                    <asp:BoundField DataField="FirstName" HeaderText="Teacher" />
                    <asp:CommandField SelectText="View" ShowSelectButton="True" />
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

</asp:Content>
