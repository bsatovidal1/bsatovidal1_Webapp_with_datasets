<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Assign4_bsatovidal1.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Select Employee</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Select Employee:</h2>
            <asp:DropDownList ID="ddlEmployee" runat="server" AutoPostBack="True" DataSourceID="odsEmployee" DataTextField="employeeFull" DataValueField="id" Height="27px" OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged" Width="188px">
                <asp:ListItem>Employee</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblRole" runat="server" Text="Role"></asp:Label>
        </div>
        <hr />
        <div>
            <asp:GridView ID="gvwReceipt" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsReceipt" OnSelectedIndexChanged="gvwReceipt_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="ordNumber" HeaderText="ordNumber" SortExpression="ordNumber" />
                    <asp:BoundField DataField="ordDate" HeaderText="ordDate" SortExpression="ordDate" />
                    <asp:CheckBoxField DataField="ordPaid" HeaderText="ordPaid" SortExpression="ordPaid" />
                    <asp:BoundField DataField="custID" HeaderText="custID" SortExpression="custID" />
                    <asp:BoundField DataField="empID" HeaderText="empID" SortExpression="empID" />
                    <asp:BoundField DataField="customerFull" HeaderText="customerFull" ReadOnly="True" SortExpression="customerFull" />
                    <asp:BoundField DataField="custPhone" HeaderText="custPhone" SortExpression="custPhone" />
                </Columns>
            </asp:GridView>
        </div>
        <asp:ObjectDataSource ID="odsEmployee" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Assign4_bsatovidal1_library._EmployeeTableAdapters.EmployeeTableAdapter"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsReceipt" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Assign4_bsatovidal1_library._EmployeeTableAdapters.ReceiptTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlEmployee" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:HyperLink ID="hlkDetails" runat="server" NavigateUrl="~/Details.aspx" Visible="False">Details</asp:HyperLink>
    </form>
</body>
</html>
