<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Vendors.aspx.cs" Inherits="TheDog.Vendors" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <strong>
    <asp:Button ID="ButtonAddNewVendor" runat="server" Text="Add New" OnClick="ButtonAddNewVendor_Click" />
    </strong>
    <asp:DetailsView ID="DetailsViewVendorDetail" runat="server" AutoGenerateRows="False" 
        DataKeyNames="VendorID" DataSourceID="LinqDataSourceVendors" 
        CellPadding="4" 
        GridLines="None" Height="50px" Width="100%" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" />
        <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
        <EditRowStyle BackColor="#7C6F57" />
        <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="VendorID" HeaderText="VendorID" SortExpression="VendorID" InsertVisible="False" ReadOnly="True" />
            <asp:BoundField DataField="VendorName" HeaderText="VendorName" SortExpression="VendorName" />
            <asp:BoundField DataField="VendorAddress" HeaderText="VendorAddress" SortExpression="VendorAddress" />
            <asp:BoundField DataField="VendorCity" HeaderText="VendorCity" SortExpression="VendorCity" />
            <asp:BoundField DataField="VendorStateOrProvince" HeaderText="VendorStateOrProvince" SortExpression="VendorStateOrProvince" />
            <asp:BoundField DataField="VendorPostalCode" HeaderText="VendorPostalCode" SortExpression="VendorPostalCode" />
            <asp:BoundField DataField="ContactPerson" HeaderText="ContactPerson" SortExpression="ContactPerson" />
            <asp:BoundField DataField="OfficeNumber" HeaderText="OfficeNumber" SortExpression="OfficeNumber" />
            <asp:BoundField DataField="CellNumber" HeaderText="CellNumber" SortExpression="CellNumber" />
            <asp:BoundField DataField="VendorNotes" HeaderText="VendorNotes" SortExpression="VendorNotes" />
            <asp:BoundField DataField="InactiveDateTime" HeaderText="InactiveDateTime" SortExpression="InactiveDateTime" />
            <asp:BoundField DataField="RowDateTime" HeaderText="RowDateTime" SortExpression="RowDateTime" />
            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
    </asp:DetailsView>
    <asp:LinqDataSource ID="LinqDataSourceVendors" runat="server" 
        ContextTypeName="TheDog.DOGDataClassesDataContext" EntityTypeName="" TableName="Vendors" EnableDelete="True" EnableInsert="True" EnableUpdate="True" 
        OnInserted="LinqDataSourceVendors_Inserted">
    </asp:LinqDataSource>
</asp:Content>
