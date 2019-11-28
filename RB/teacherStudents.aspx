<%@ Page Title="" Language="C#" MasterPageFile="~/TeacherSite.Master" AutoEventWireup="true" CodeBehind="teacherStudents.aspx.cs" Inherits="RB.WebForm9" %>
<%@ MasterType VirtualPath="~/TeacherSite.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="bootstrap.css" rel="stylesheet" />

     <div class="col-12">
          <div class="col-12">
              <br />
               <h4 class="col-7"> <strong>To Add the Students of Whole class Upload the Excel File Here.</strong></h4>  <h4><strong class="col-4" style="float:right">To Add a Single Student fill the Student Details Here.</strong></h4>
              <br />
              <h5><strong>Download a excel templet file to upload data.<asp:LinkButton ID="btnDownload" runat="server" OnClick="btnDownload_Click">Click Here</asp:LinkButton></strong></h5>
                <label for="FileUpload1">Upload Excel Fiel :</label>
                <asp:FileUpload ID="FileUpload1" runat="server" />                                          
                 <asp:Button  ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" />  

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
            <strong>Opps!</strong> Something Went wrong while uploading the file.
                 <asp:Label ID="flbl" runat="server" Text=""></asp:Label>
            </div>                 
                 </asp:Panel>
              
             </div>


         <div class="col-4" style="float:right ; height:100% ; overflow:auto;">
             
            <asp:HiddenField ID="hiddenTid" runat="server" />
            <legend style="padding-bottom:10px; padding-top:10px">Student Details</legend>
            <div class="container ">
           <div class="form-group row ">
                <label class="col-form-label" for="txtGRno">GR No.</label> 
                
                <asp:TextBox TextMode="Number" cssClass="form-control" id="txtGRno" placeholder="Enter GR No." runat="server" ></asp:TextBox>
                   
             </div>
            <div class="form-group row ">
                <label  for="txtsid">Roll No.</label>        
                
                <asp:TextBox TextMode="Number"  CssClass="form-control" id="txtsid" placeholder="Enter Roll No." runat="server" ></asp:TextBox>                
             </div>
                

            <div class="form-group row ">
                <label for="txtFN">First Name</label>                 
                   
                <asp:TextBox   CssClass="form-control" id="txtFN" placeholder="Enter First Name" runat="server" ></asp:TextBox>                
             
           </div>
                <div class="form-group row ">
                <label  for="txtLN">Last Name</label>     
                        
                <asp:TextBox  CssClass="form-control" id="txtLN" placeholder="Enter Last Name" runat="server" ></asp:TextBox>                
                  
                    </div>

            <div class="form-group row ">
                <label  for="txtUid">Aadhar No.</label>   
                            
                <asp:TextBox  CssClass="form-control" id="txtUid" placeholder="Enter Aadhar No." runat="server" ></asp:TextBox>                
            <small><asp:RegularExpressionValidator ForeColor="Red" ID="RegularExpressionValidator1" 
                        runat="server" ErrorMessage="*Enter valid Aadhar number" 
                        ControlToValidate="txtUid" 
                            ValidationExpression= "^[0-9]{16}$"></asp:RegularExpressionValidator></small>
                </div>
            
                <div class="form-group row ">
                <label  for="txtphone">Phone No.</label>       
                                
                <asp:TextBox  CssClass="form-control" id="txtphone" placeholder="Enter Phone No." runat="server" ></asp:TextBox>                
           <small><asp:RegularExpressionValidator  ForeColor="Red" ID="RegularExpressionValidator2" 
                        runat="server" ErrorMessage="*Enter valid Phone number" 
                        ControlToValidate="txtphone" 
                             ValidationExpression= "^[0-9]{10}$"></asp:RegularExpressionValidator></small>
            </div>
            
                    <div class="form-group row ">
                <label  for="txtEmail">Email address</label>
                                   
                <asp:TextBox   Type="email"  CssClass="form-control" id="txtEmail" aria-describedby="emailHelp" placeholder="Enter email" runat="server" ></asp:TextBox>                
                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
             
            </div>
          <div class="form-group row ">
                <label  for="txtUN">UserName</label>
                                       
                <asp:TextBox  Type="email"   CssClass="form-control" id="txtUN" aria-describedby="UnHelp" placeholder="Enter UserName" runat="server" ></asp:TextBox>                
                <small id="UnHelp" class="form-text text-muted">UserName should be your First name and clg name e.g "jagannath@khalsa.com"</small>
                <%--<asp:RequiredFieldValidator ID="RequiredFieldUN" runat="server" ForeColor="Red" ErrorMessage="UserName Required To Field" ControlToValidate="txtUN"></asp:RequiredFieldValidator>--%>
             
              </div>
            <div class="form-group row ">
                <label  for="txtpass">Password</label>
                                            
                <asp:TextBox  type="password" Text="" CssClass="form-control" id="txtpass" placeholder="Enter Password" runat="server" ControlToValidate="password"></asp:TextBox>                               
                <%--<asp:RequiredFieldValidator ID="RequiredFieldPass" runat="server" ForeColor="Red" ErrorMessage="Password Required To Field" ControlToValidate="txtpass"></asp:RequiredFieldValidator>--%>
             
            </div>
            <div class="form-group row ">
                <label for="txtconPass">Confirm Password</label>
                                               
                <asp:TextBox  type="password"  CssClass="form-control" id="txtconPass" placeholder="Enter Confirm Password" runat="server" ></asp:TextBox>                               
                  
                <small><asp:CompareValidator ID="Comparepass" runat="server" ForeColor="Red" ErrorMessage="*Passwords Does not match" ControlToValidate="txtpass" ControlToCompare="txtconPass"></asp:CompareValidator></small>
            </div>
            
            
           
            <asp:Button ID="btnSave" CssClass="btn btn-primary" runat="server"  Text="Submit" OnClick="btnSave_Click" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button ID="btnDelete" CssClass="btn btn-primary" runat="server"   Text="Delete" OnClick="btnDelete_Click" />

            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <asp:Button ID="btnClear" CssClass="btn btn-primary" runat="server"   Text="Clear" OnClick="btnClear_Click" />
                </div>
            <br />
            <asp:Label ID="txtSuc" runat="server" ForeColor="YellowGreen" Text=""></asp:Label>
            <asp:Label ID="txtFail" runat="server" ForeColor="Red" Text=""></asp:Label>
            <br />
            <br />
        <%--</div>--%>
        </div>

        <div class="col-8" style="float:left" ><%--style="width:49% ; float:left ; padding-left:80px "--%>

            <legend style="padding-bottom:10px; padding-top:10px">List of all Students</legend>
            <div style="height:80% ;overflow:auto;">
            <asp:GridView ID="grid" runat="server" AutoGenerateColumns="False" cssclass="table table-hover"  DataKeyNames="GRno" CellPadding="4" ForeColor="#333333"  OnSelectedIndexChanged="grid_SelectedIndexChanged" >
                <AlternatingRowStyle BackColor="White" />
               <Columns>
                   <asp:BoundField DataField="GRno" HeaderText="GR No." />
                    <asp:BoundField DataField="stdID" HeaderText="Roll No." />
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" />
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
        </div>

        <%--<div style="width:45% ; float:right ;padding-left:10px ; padding-right:20px">--%>
    


        
    </div>
</asp:Content>
