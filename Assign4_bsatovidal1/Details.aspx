<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="Assign4_bsatovidal1.Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detail View</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2 id="headerCustomer">Customer</h2>
        </div>
        <hr />
        <div>
            <asp:DetailsView ID="dvwCustomer" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataKeyNames="id" DataSourceID="odsCustomerUpdate">
                <Fields>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="custFirst" HeaderText="custFirst" SortExpression="custFirst" />
                    <asp:BoundField DataField="custLast" HeaderText="custLast" SortExpression="custLast" />
                    <asp:BoundField DataField="custPhone" HeaderText="custPhone" SortExpression="custPhone" />
                    <asp:BoundField DataField="custAddress" HeaderText="custAddress" SortExpression="custAddress" />
                    <asp:BoundField DataField="custCity" HeaderText="custCity" SortExpression="custCity" />
                    <asp:BoundField DataField="custPostal" HeaderText="custPostal" SortExpression="custPostal" />
                    <asp:BoundField DataField="custEmail" HeaderText="custEmail" SortExpression="custEmail" />
                    <asp:CommandField ShowEditButton="True" />
                </Fields>
            </asp:DetailsView>
            <hr />
            <asp:GridView ID="gvwReceipt" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsReceiptUpdate" OnSelectedIndexChanged="gvwReceipt_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="ordNumber" HeaderText="ordNumber" SortExpression="ordNumber" />
                    <asp:BoundField DataField="ordDate" HeaderText="ordDate" SortExpression="ordDate" />
                    <asp:CheckBoxField DataField="ordPaid" HeaderText="ordPaid" SortExpression="ordPaid" />
                    <asp:TemplateField HeaderText="paymentID" SortExpression="paymentID">
                        <EditItemTemplate>
                            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'>
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="odsPayment" DataTextField="payType" DataValueField="id" SelectedValue='<%# Bind("paymentID") %>'>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="custID" HeaderText="custID" SortExpression="custID" />
                    <asp:BoundField DataField="empID" HeaderText="empID" SortExpression="empID" />
                </Columns>
            </asp:GridView>
        </div>
        <br />
        <br />
        <div>
            <asp:GridView ID="gvwOrderDetails" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="odsOrderDetail">
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="orlPrice" HeaderText="orlPrice" SortExpression="orlPrice" />
                    <asp:BoundField DataField="orlQuantity" HeaderText="orlQuantity" SortExpression="orlQuantity" />
                    <asp:BoundField DataField="lineTotal" HeaderText="lineTotal" ReadOnly="True" SortExpression="lineTotal" />
                    <asp:CheckBoxField DataField="orlOrderReq" HeaderText="orlOrderReq" SortExpression="orlOrderReq" />
                    <asp:BoundField DataField="receiptID" HeaderText="receiptID" SortExpression="receiptID" />
                    <asp:BoundField DataField="prodName" HeaderText="prodName" SortExpression="prodName" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblTotal" runat="server" Text="Total"></asp:Label>
        </div>
        <br />
        <br />
        <asp:ObjectDataSource ID="odsCustomerUpdate" runat="server" DataObjectTypeName="Assign4_bsatovidal1_library._Employee+CustomerDataTable" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Assign4_bsatovidal1_library._EmployeeTableAdapters.CustomerTableAdapter" UpdateMethod="Update"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsReceiptUpdate" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Assign4_bsatovidal1_library._EmployeeTableAdapters.ReceiptCRUDTableAdapter" UpdateMethod="Update">
            <SelectParameters>
                <asp:ControlParameter ControlID="dvwCustomer" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="ordNumber" Type="String" />
                <asp:Parameter Name="ordDate" Type="DateTime" />
                <asp:Parameter Name="ordPaid" Type="Boolean" />
                <asp:Parameter Name="paymentID" Type="Int32" />
                <asp:Parameter Name="custID" Type="Int32" />
                <asp:Parameter Name="empID" Type="Int32" />
                <asp:Parameter Name="Original_id" Type="Int32" />
                <asp:Parameter Name="Original_ordNumber" Type="String" />
                <asp:Parameter Name="Original_ordDate" Type="DateTime" />
                <asp:Parameter Name="Original_ordPaid" Type="Boolean" />
                <asp:Parameter Name="Original_paymentID" Type="Int32" />
                <asp:Parameter Name="Original_custID" Type="Int32" />
                <asp:Parameter Name="Original_empID" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsOrderDetail" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Assign4_bsatovidal1_library._EmployeeTableAdapters.OrderDetailsTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvwReceipt" Name="Param1" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsPayment" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="Assign4_bsatovidal1_library._EmployeeTableAdapters.PaymentTableAdapter"></asp:ObjectDataSource>
        <asp:HyperLink ID="hlkIndexBack" runat="server" NavigateUrl="~/Index.aspx">Back</asp:HyperLink>
    </form>
</body>
</html>
