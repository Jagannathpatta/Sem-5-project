<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reportcard.aspx.cs" Inherits="RB.WebForm11" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 201px;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style6 {
            text-align: left;
        }
        .auto-style7 {
            width: 519px;
        }
        .auto-style8 {
            width: 457px;
        }
        .auto-style9 {
            height: 26px;
        }
        .auto-style10 {
            width: 100%;
            height: 221px;
        }
        .auto-style11 {
            width: 204px;
        }
        .auto-style12 {
            width: 1013px;
            height: 156px;
        }
        .auto-style13 {
            width: 1013px;
            text-align: center;
        }
        .auto-style23 {
            width: 110px;
        }
        .auto-style25 {
            width: 95px;
        }
        .auto-style29 {
            width: 100px;
        }
        .auto-style32 {
            height: 33px;
        }
        .auto-style33 {
            height: 24px;
        }
        .auto-style35 {
            width: 100%;
            height: 177px;
        }
        .auto-style43 {
            text-align: center;
            height: 26px;
        }
        .auto-style44 {
            height: 100px;
        }
        .auto-style45 {
            width: 100%;
            height: 106px;
        }
        .auto-style46 {
            text-align: left;
            width: 234px;
        }
        .auto-style47 {
            text-align: center;
            width: 515px;
        }
        .auto-style48 {
            height: 26px;
            width: 396px;
        }
        .auto-style49 {
            width: 259px;
        }
        .auto-style50 {
            width: 138px;
        }
        .auto-style51 {
            width: 258px;
        }
        .auto-style52 {
            width: 283px;
        }
        .auto-style53 {
            width: 100px;
            height: 34px;
        }
    </style>
    <link href="bootstrap.css" rel="stylesheet" />
</head>
<body style="height: 852px">
    <div class="jumbotron">
    <form id="form1" runat="server">
        <div>
            
             <asp:Button ID="print" CssClass="btn btn-info " runat="server" Text="Print" OnClick="print_Click" />
            <br />
            <br />
            <asp:Panel ID="Panel1" runat="server" Height="827px">
                <table class="auto-style1" border="1">
                    <tr>
                        <td class="auto-style2" >
                            <table class="auto-style10" border="1">
                                <tr>
                                    <td class="auto-style11" rowspan="2" style="border-color: #000000">&nbsp;</td>
                                    <td class="auto-style12" style="border-color: #000000"></td>
                                    <td rowspan="2" style="border-color: #000000"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style13" style="border-color: #000000">Grade Card</td>
                                </tr>
                                <tr>
                                    <td class="auto-style9" colspan="2" style="border-color: #000000">&nbsp;&nbsp; Programme :<asp:Label ID="lbprg" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style9" style="border-color: #000000">&nbsp;&nbsp; SEMESTER : &nbsp;<asp:Label ID="lbsem" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style8" style="border-color: #000000" >&nbsp;&nbsp; PRN / Reg.No. :&nbsp;<asp:Label ID="lbprn" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style7" style="border-color: #000000" >Examination Seat No. :&nbsp; 
                                        <asp:Label ID="lbstno" runat="server"></asp:Label>
                                    </td>
                                    <td style="border-color: #000000" >Month &amp; Year of Examination :&nbsp; 
                                        <asp:Label ID="lbEM" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="auto-style6" style="border-color: #000000" >&nbsp;&nbsp; Name of the Candidate :&nbsp;<asp:Label ID="lbname" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table class="auto-style35">
                                <tr>
                                    <td class="auto-style3" rowspan="2" style="border-color: #000000" colspan="8">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="col-11 table table-hover">
                                            <Columns>
                                                <asp:BoundField DataField="subCode" HeaderText="Course Code" />
                                                <asp:BoundField DataField="subName" HeaderText="Course Title" />
                                                <asp:BoundField DataField="CreErn" HeaderText="Course Credits" />
                                                <asp:BoundField DataField="Tgrd" HeaderText="TH" />
                                                <asp:BoundField DataField="Igrd" HeaderText="IA" />
                                                <asp:BoundField DataField="OVGrd" HeaderText="OVERALL" />
                                                <asp:BoundField DataField="CreErn" HeaderText="Credits Earned (C)" />
                                                <asp:BoundField DataField="GrdPt" HeaderText="Grade Points (G)" />
                                                <asp:BoundField DataField="cg" HeaderText="C x G" />
                                            </Columns>
                                        </asp:GridView>
                                    </td>
                                    <td class="auto-style53" style="border-color: #000000">SGPI=<br /> ΣCG / ΣC</td>
                                </tr>
                                <tr>
                                    <td class="auto-style29" style="border-color: #000000">
                                        <asp:Label ID="lbsgpi1" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style3" style="border-color: #000000">Total</td>
                                    <td style="border-color: #000000">&nbsp;</td>
                                    <td class="auto-style23" style="border-color: #000000">&nbsp;</td>
                                    <td class="auto-style23" style="border-color: #000000">&nbsp;</td>
                                    <td class="auto-style23" style="border-color: #000000">&nbsp;</td>
                                    <td class="auto-style25" style="border-color: #000000">&nbsp;</td>
                                    <td class="auto-style25" style="border-color: #000000">&nbsp;</td>
                                    <td class="auto-style25" style="border-color: #000000">&nbsp;</td>
                                    <td class="auto-style29" style="border-color: #000000">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style32">
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style48" style="border-color: #000000">&nbsp;Remarks :&nbsp;<asp:Label ID="lbremark" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style43" style="border-color: #000000">Credit Earned :<asp:Label ID="lbCrE" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style43" style="border-color: #000000">SGPI :<asp:Label ID="lbSgpi" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style43" style="border-color: #000000">Overall Grade:<asp:Label ID="lblOaG" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style33">
                            <table class="w-100">
                                <tr>
                                    <td style="border-color: #000000" class="auto-style49">Sem 1: Credit Earned :<asp:Label ID="lbces1" runat="server"></asp:Label>
                                    </td>
                                    <td style="border-color: #000000" class="auto-style50">SGPI :<asp:Label ID="lbsgpiS1" runat="server"></asp:Label>
                                    </td>
                                    <td style="border-color: #000000" class="auto-style49">Sem 2: Credit Earned :<asp:Label ID="lbces2" runat="server"></asp:Label>
                                    </td>
                                    <td style="border-color: #000000" class="auto-style50">SGPI :<asp:Label ID="lbsgpiS2" runat="server"></asp:Label>
                                    </td>
                                    <td style="border-color: #000000" class="auto-style51">Sem 3: Credit Earned :<asp:Label ID="lbces3" runat="server"></asp:Label>
                                    </td>
                                    <td style="border-color: #000000" class="auto-style50">SGPI :<asp:Label ID="lbsgpiS3" runat="server"></asp:Label>
                                    </td>
                                    <td style="border-color: #000000" class="auto-style52">Sem 4: Credit Earned :<asp:Label ID="lbces4" runat="server"></asp:Label>
                                    </td>
                                    <td style="border-color: #000000">SGPI :<asp:Label ID="lbsgpiS4" runat="server"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style44">
                            <table class="auto-style45">
                                <tr>
                                    <td class="auto-style46" style="border-color: #000000">&nbsp;Place : Mumbai<br /> &nbsp;Date : &nbsp;</td>
                                    <td class="auto-style3" style="border-color: #000000">Checked By:</td>
                                    <td class="auto-style47" style="border-color: #000000">Chairperson<br /> Examination Committee</td>
                                    <td class="auto-style3" style="border-color: #000000">PRINCIPAL</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>


            </asp:Panel>

            <br />
           
        </div>
    </form>
        </div>
</body>
</html>
