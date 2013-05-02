<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contacts.aspx.cs" Inherits="TheDog.Contacts" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="SqlDataSourceContacts" runat="server" ConnectionString="<%$ ConnectionStrings:DeviceonguardConnectionString %>" DeleteCommand="DELETE FROM [Contacts] WHERE [ContactID] = @ContactID" InsertCommand="INSERT INTO [Contacts] ([DLNumber], [Company], [JobTitle], [FirstName], [MiddleName], [LastName], [BirthdayYear], [Sex], [Height], [EmailAddress], [LeadSource], [LeadOriginalDate], [HomePhone], [BusinessPhone], [MobilePhone], [FaxNumber], [Address], [City], [StateOrProvince], [PostalCode], [Country], [WebPage], [ContactNotes], [StockNumber], [PreferredVehicleType], [PreferredVehicleYear], [PreferredVehicleMake], [PreferredVehicleModel], [EmployeeID], [Status], [ApptSet], [RowDateTime], [upsize_ts]) VALUES (@DLNumber, @Company, @JobTitle, @FirstName, @MiddleName, @LastName, @BirthdayYear, @Sex, @Height, @EmailAddress, @LeadSource, @LeadOriginalDate, @HomePhone, @BusinessPhone, @MobilePhone, @FaxNumber, @Address, @City, @StateOrProvince, @PostalCode, @Country, @WebPage, @ContactNotes, @StockNumber, @PreferredVehicleType, @PreferredVehicleYear, @PreferredVehicleMake, @PreferredVehicleModel, @EmployeeID, @Status, @ApptSet, @RowDateTime, @upsize_ts)" SelectCommand="SELECT * FROM [Contacts]" UpdateCommand="UPDATE [Contacts] SET [DLNumber] = @DLNumber, [Company] = @Company, [JobTitle] = @JobTitle, [FirstName] = @FirstName, [MiddleName] = @MiddleName, [LastName] = @LastName, [BirthdayYear] = @BirthdayYear, [Sex] = @Sex, [Height] = @Height, [EmailAddress] = @EmailAddress, [LeadSource] = @LeadSource, [LeadOriginalDate] = @LeadOriginalDate, [HomePhone] = @HomePhone, [BusinessPhone] = @BusinessPhone, [MobilePhone] = @MobilePhone, [FaxNumber] = @FaxNumber, [Address] = @Address, [City] = @City, [StateOrProvince] = @StateOrProvince, [PostalCode] = @PostalCode, [Country] = @Country, [WebPage] = @WebPage, [ContactNotes] = @ContactNotes, [StockNumber] = @StockNumber, [PreferredVehicleType] = @PreferredVehicleType, [PreferredVehicleYear] = @PreferredVehicleYear, [PreferredVehicleMake] = @PreferredVehicleMake, [PreferredVehicleModel] = @PreferredVehicleModel, [EmployeeID] = @EmployeeID, [Status] = @Status, [ApptSet] = @ApptSet, [RowDateTime] = @RowDateTime, [upsize_ts] = @upsize_ts WHERE [ContactID] = @ContactID">
        <DeleteParameters>
            <asp:Parameter Name="ContactID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="DLNumber" Type="String" />
            <asp:Parameter Name="Company" Type="String" />
            <asp:Parameter Name="JobTitle" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="MiddleName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="BirthdayYear" Type="Int16" />
            <asp:Parameter Name="Sex" Type="String" />
            <asp:Parameter Name="Height" Type="String" />
            <asp:Parameter Name="EmailAddress" Type="String" />
            <asp:Parameter Name="LeadSource" Type="String" />
            <asp:Parameter Name="LeadOriginalDate" Type="DateTime" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="BusinessPhone" Type="String" />
            <asp:Parameter Name="MobilePhone" Type="String" />
            <asp:Parameter Name="FaxNumber" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="StateOrProvince" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="WebPage" Type="String" />
            <asp:Parameter Name="ContactNotes" Type="String" />
            <asp:Parameter Name="StockNumber" Type="String" />
            <asp:Parameter Name="PreferredVehicleType" Type="String" />
            <asp:Parameter Name="PreferredVehicleYear" Type="Int32" />
            <asp:Parameter Name="PreferredVehicleMake" Type="String" />
            <asp:Parameter Name="PreferredVehicleModel" Type="String" />
            <asp:Parameter Name="EmployeeID" Type="Int32" />
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="ApptSet" Type="Boolean" />
            <asp:Parameter Name="RowDateTime" Type="DateTime" />
            <asp:Parameter Name="upsize_ts" Type="Object" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="DLNumber" Type="String" />
            <asp:Parameter Name="Company" Type="String" />
            <asp:Parameter Name="JobTitle" Type="String" />
            <asp:Parameter Name="FirstName" Type="String" />
            <asp:Parameter Name="MiddleName" Type="String" />
            <asp:Parameter Name="LastName" Type="String" />
            <asp:Parameter Name="BirthdayYear" Type="Int16" />
            <asp:Parameter Name="Sex" Type="String" />
            <asp:Parameter Name="Height" Type="String" />
            <asp:Parameter Name="EmailAddress" Type="String" />
            <asp:Parameter Name="LeadSource" Type="String" />
            <asp:Parameter Name="LeadOriginalDate" Type="DateTime" />
            <asp:Parameter Name="HomePhone" Type="String" />
            <asp:Parameter Name="BusinessPhone" Type="String" />
            <asp:Parameter Name="MobilePhone" Type="String" />
            <asp:Parameter Name="FaxNumber" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="City" Type="String" />
            <asp:Parameter Name="StateOrProvince" Type="String" />
            <asp:Parameter Name="PostalCode" Type="String" />
            <asp:Parameter Name="Country" Type="String" />
            <asp:Parameter Name="WebPage" Type="String" />
            <asp:Parameter Name="ContactNotes" Type="String" />
            <asp:Parameter Name="StockNumber" Type="String" />
            <asp:Parameter Name="PreferredVehicleType" Type="String" />
            <asp:Parameter Name="PreferredVehicleYear" Type="Int32" />
            <asp:Parameter Name="PreferredVehicleMake" Type="String" />
            <asp:Parameter Name="PreferredVehicleModel" Type="String" />
            <asp:Parameter Name="EmployeeID" Type="Int32" />
            <asp:Parameter Name="Status" Type="Int32" />
            <asp:Parameter Name="ApptSet" Type="Boolean" />
            <asp:Parameter Name="RowDateTime" Type="DateTime" />
            <asp:Parameter Name="upsize_ts" Type="Object" />
            <asp:Parameter Name="ContactID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="DetailsViewContactAddEdit" runat="server" AutoGenerateRows="False" DataKeyNames="ContactID" DataSourceID="SqlDataSourceContacts" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="DLNumber" HeaderText="DLNumber" SortExpression="DLNumber" />
            <asp:BoundField DataField="Company" HeaderText="Company" SortExpression="Company" />
            <asp:BoundField DataField="JobTitle" HeaderText="JobTitle" SortExpression="JobTitle" />
            <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
            <asp:BoundField DataField="MiddleName" HeaderText="MiddleName" SortExpression="MiddleName" />
            <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
            <asp:BoundField DataField="BirthdayYear" HeaderText="BirthdayYear" SortExpression="BirthdayYear" />
            <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
            <asp:BoundField DataField="Height" HeaderText="Height" SortExpression="Height" />
            <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
            <asp:BoundField DataField="LeadSource" HeaderText="LeadSource" SortExpression="LeadSource" />
            <asp:BoundField DataField="LeadOriginalDate" HeaderText="LeadOriginalDate" SortExpression="LeadOriginalDate" />
            <asp:BoundField DataField="HomePhone" HeaderText="HomePhone" SortExpression="HomePhone" />
            <asp:BoundField DataField="BusinessPhone" HeaderText="BusinessPhone" SortExpression="BusinessPhone" />
            <asp:BoundField DataField="MobilePhone" HeaderText="MobilePhone" SortExpression="MobilePhone" />
            <asp:BoundField DataField="FaxNumber" HeaderText="FaxNumber" SortExpression="FaxNumber" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
            <asp:BoundField DataField="StateOrProvince" HeaderText="StateOrProvince" SortExpression="StateOrProvince" />
            <asp:BoundField DataField="PostalCode" HeaderText="PostalCode" SortExpression="PostalCode" />
            <asp:BoundField DataField="Country" HeaderText="Country" SortExpression="Country" />
            <asp:BoundField DataField="WebPage" HeaderText="WebPage" SortExpression="WebPage" />
            <asp:BoundField DataField="ContactNotes" HeaderText="ContactNotes" SortExpression="ContactNotes" />
            <asp:BoundField DataField="StockNumber" HeaderText="StockNumber" SortExpression="StockNumber" />
            <asp:BoundField DataField="PreferredVehicleType" HeaderText="PreferredVehicleType" SortExpression="PreferredVehicleType" />
            <asp:BoundField DataField="PreferredVehicleYear" HeaderText="PreferredVehicleYear" SortExpression="PreferredVehicleYear" />
            <asp:BoundField DataField="PreferredVehicleMake" HeaderText="PreferredVehicleMake" SortExpression="PreferredVehicleMake" />
            <asp:BoundField DataField="PreferredVehicleModel" HeaderText="PreferredVehicleModel" SortExpression="PreferredVehicleModel" />
            <asp:TemplateField HeaderText="EmployeeID" SortExpression="EmployeeID">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("EmployeeID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
            <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
</asp:Content>
