<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleDetail.aspx.cs" Inherits="TheDog.VechicleDetail" %>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
        </Triggers>
        <ContentTemplate>
            <asp:SqlDataSource ID="SqlDataSourceVehicleDetailInfo" runat="server" ConnectionString="<%$ ConnectionStrings:DeviceonguardConnectionString %>" 
            SelectCommand="SELECT * FROM [DealerInventory] WHERE ([DealerInventoryID] = @DealerInventoryID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="DealerInventoryID" QueryStringField="InventoryID" Type="Int32" />
            </SelectParameters>
            </asp:SqlDataSource>
            <asp:DetailsView ID="DetailsViewVehicle" runat="server" AutoGenerateRows="False" CellPadding="4" DataKeyNames="DealerInventoryID" DataSourceID="SqlDataSourceVehicleDetailInfo" ForeColor="#333333" GridLines="None" Height="50px" Width="100%">
                <FieldHeaderStyle BackColor="#ccc" Font-Bold="True"  />
                <RowStyle BackColor="#EFF3FB" />
                <Fields>
                    <asp:TemplateField HeaderText="" SortExpression="StockNumber" ShowHeader="false">
                        <ItemTemplate>
                        <div style="text-align:right">
                            <asp:Button ID="ButtonCICO" runat="server" Text="" CssClass="mainbutton" OnClick="ButtonCICO_Click" />
                        </div>
                        <table  style="width:100%;padding:5px; margin:5px; height:40px; line-height:40px" class="maindatatable">
                            <tr>
                                <th>Stock:</th>
                                <td><asp:Label ID="Label1" runat="server" Text='<%# Bind("StockNumber") %>'></asp:Label></td>
                                <th>VIN:</th>
                                <td><asp:Label ID="Label8" runat="server" Text='<%# Bind("VIN") %>'></asp:Label></td>
                                <th>Year:</th>
                                <td><asp:Label ID="Label2" runat="server" Text='<%# Bind("VehicleYear") %>'></asp:Label></td>
                                <th>Make:</th>
                                <td><asp:Label ID="Label9" runat="server" Text='<%# Bind("VehicleMake") %>'></asp:Label></td>
                                <th>Model:</th>
                                <td><asp:Label ID="Label10" runat="server" Text='<%# Bind("VehicleModel") %>'></asp:Label></td>
                                <th>Type:</th>
                                <td><asp:Label ID="Label11" runat="server" Text='<%# Bind("VehicleType") %>'></asp:Label></td>
                                <th>Color:</th>
                                <td><asp:Label ID="Label12" runat="server" Text='<%# Bind("VehicleColor") %>'></asp:Label></td>
                                <th>Status: </th>
                                <td><asp:Label ID="LabelStatus" runat="server" Text=""></asp:Label></td>
                            </tr>
                        </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Fields>
            </asp:DetailsView>
            <br />
            <h2><asp:Label ID="LabelTitle" runat="server" Text="Check Out/In History" /></h2><br />
            <asp:SqlDataSource ID="SqlDataSourceCICOHistory" runat="server" ConnectionString="<%$ ConnectionStrings:DeviceonguardConnectionString %>" 
                SelectCommand="SELECT DealerInventoryCICO.DealerInventoryCICOID, DealerInventoryCICO.DealerInventoryID, DealerInventoryCICO.CheckOutEmployeeID, DealerInventoryCICO.CheckOutDateTime, DealerInventoryCICO.CheckOutKeyRFid, DealerInventoryCICO.CheckOutKeyDateTime, DealerInventoryCICO.CheckOutDealerTagRFid, DealerInventoryCICO.CheckOutDealerTagDateTime, DealerInventoryCICO.CheckOutDealerTagID, DealerInventoryCICO.CheckOutReason, DealerInventoryCICO.CheckOutContactID, DealerInventoryCICO.CheckOutVendorID, DealerInventoryCICO.CheckOutMileage, DealerInventoryCICO.CheckOutMilesPermitted, DealerInventoryCICO.CheckOutHoursPermitted, DealerInventoryCICO.CheckInEmployeeID, DealerInventoryCICO.CheckInDateTime, DealerInventoryCICO.CheckInKeyRFid, DealerInventoryCICO.CheckInKeyDateTime, DealerInventoryCICO.CheckInDealerTagRFid, DealerInventoryCICO.CheckInDealerTagDateTime, DealerInventoryCICO.CheckInMileage, DealerInventoryCICO.CheckInResult, DealerInventoryCICO.CheckInLicensePlateSold, DealerInventoryCICO.CheckInNotes, DealerInventoryCICO.RowDateTime, DealerTags.DealerTag, Employees.EmployeeFirstName, Employees.EmployeeLastName FROM DealerInventoryCICO INNER JOIN Employees ON DealerInventoryCICO.CheckOutEmployeeID = Employees.EmployeeID LEFT OUTER JOIN DealerTags ON DealerInventoryCICO.CheckOutDealerTagID = DealerTags.DealerTagID WHERE (DealerInventoryCICO.DealerInventoryID = @DealerInventoryID)"><SelectParameters>
                    <asp:QueryStringParameter Name="DealerInventoryID" QueryStringField="InventoryID" Type="Int32" /></SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridViewCICOHistory" runat="server"  CssClass="gridclass" 
                AllowPaging="True" AllowSorting="True" 
                DataKeyNames="DealerInventoryCICOID" DataSourceID="SqlDataSourceCICOHistory" 
                CellPadding="10" ForeColor="#333333" GridLines="None" Width="100%"  HorizontalAlign="Center" AutoGenerateColumns="False"><AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="CheckOutDateTime" HeaderText="Check Out Date" SortExpression="CheckOutDateTime" ItemStyle-HorizontalAlign="Center" DataFormatString="{0:g}">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="Empoloyee" SortExpression="DealerTag">
                    <ItemTemplate>
                        <asp:Label ID="LabelEmployee" runat="server" Text='<%# Eval("EmployeeFirstName") + " " + Eval("EmployeeLastName") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CheckOutReason" HeaderText="Reason" SortExpression="CheckOutReason" ItemStyle-HorizontalAlign="Center">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField ConvertEmptyStringToNull="False" HeaderText="DealerTag" SortExpression="DealerTag" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Label ID="LabelDealerTag" runat="server" Text='<%# Eval("DealerTag") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="CheckOutMileage" HeaderText="Mileage Out" SortExpression="CheckOutMileage" ItemStyle-HorizontalAlign="Center" />
                <asp:BoundField DataField="CheckInDateTime" HeaderText="Check In Date" SortExpression="CheckInDateTime" DataFormatString="{0:g}"/>
                <asp:BoundField DataField="CheckInMileage" HeaderText="Mileage In" SortExpression="CheckInMileage" ItemStyle-HorizontalAlign="Center"/>
                <asp:BoundField DataField="CheckInResult" HeaderText="Result" SortExpression="CheckInResult" ItemStyle-HorizontalAlign="Center"/>
            </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceCICO" runat="server" ConnectionString="<%$ ConnectionStrings:DeviceonguardConnectionString %>" 
                SelectCommand="SELECT * FROM [DealerInventoryCICO] WHERE ([DealerInventoryCICOID] = @DealerInventoryCICOID)" 
                InsertCommand="INSERT INTO [DealerInventoryCICO] ([DealerInventoryID], [CheckOutEmployeeID], [CheckInEmployeeID], [CheckOutDateTime], [CheckOutKeyRFid], [CheckOutKeyDateTime], [CheckOutDealerTagRFid], [CheckOutDealerTagDateTime], [CheckOutDealerTagID], [CheckOutReason], [CheckOutContactID], [CheckOutVendorID], [CheckOutMileage], [CheckOutMilesPermitted], [CheckOutHoursPermitted], [RowDateTime]) VALUES (@DealerInventoryID, @CheckOutEmployeeID, @CheckOutEmployeeID, @CheckOutDateTime, @CheckOutKeyRFid, @CheckOutKeyDateTime, @CheckOutDealerTagRFid, @CheckOutDealerTagDateTime, @CheckOutDealerTagID, @CheckOutReason, @CheckOutContactID, @CheckOutVendorID, @CheckOutMileage, @CheckOutMilesPermitted, @CheckOutHoursPermitted, @RowDateTime)" 
                UpdateCommand="UPDATE [DealerInventoryCICO] SET [CheckInEmployeeID] = @CheckInEmployeeID, [CheckInDateTime] = @CheckInDateTime, [CheckInKeyRFid] = @CheckInKeyRFid, [CheckInKeyDateTime] = @CheckInKeyDateTime, [CheckInDealerTagRFid] = @CheckInDealerTagRFid, [CheckInDealerTagDateTime] = @CheckInDealerTagDateTime, [CheckInMileage] = @CheckInMileage, [CheckInResult] = @CheckInResult, [CheckInLicensePlateSold] = @CheckInLicensePlateSold, [CheckInNotes] = @CheckInNotes WHERE [DealerInventoryCICOID] = @DealerInventoryCICOID">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="DealerInventoryCICOID" SessionField="DealerInventoryCICOID" Type="Int32" />
                </SelectParameters>
                <InsertParameters>
                    <asp:Parameter Name="DealerInventoryID" Type="Int32" />
                    <asp:Parameter Name="CheckOutEmployeeID" Type="Int32" />
                    <asp:Parameter Name="CheckOutDateTime" Type="DateTime" />
                    <asp:Parameter Name="CheckOutKeyRFid" Type="String" />
                    <asp:Parameter Name="CheckOutKeyDateTime" Type="DateTime" />
                    <asp:Parameter Name="CheckOutDealerTagRFid" Type="String" />
                    <asp:Parameter Name="CheckOutDealerTagDateTime" Type="DateTime" />
                    <asp:Parameter Name="CheckOutDealerTagID" Type="Int32" />
                    <asp:Parameter Name="CheckOutReason" Type="String" />
                    <asp:Parameter Name="CheckOutContactID" Type="Int32" />
                    <asp:Parameter Name="CheckOutVendorID" Type="Int32" />
                    <asp:Parameter Name="CheckOutMileage" Type="Int32" />
                    <asp:Parameter Name="CheckOutMilesPermitted" Type="Int32" />
                    <asp:Parameter Name="CheckOutHoursPermitted" Type="Int32" />
                    <asp:Parameter Name="RowDateTime" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CheckInEmployeeID" Type="Int32" />
                    <asp:Parameter Name="CheckInDateTime" Type="DateTime" />
                    <asp:Parameter Name="CheckInKeyRFid" Type="String" />
                    <asp:Parameter Name="CheckInKeyDateTime" Type="DateTime" />
                    <asp:Parameter Name="CheckInDealerTagRFid" Type="String" />
                    <asp:Parameter Name="CheckInDealerTagDateTime" Type="DateTime" />
                    <asp:Parameter Name="CheckInMileage" Type="Int32" />
                    <asp:Parameter Name="CheckInResult" Type="String" />
                    <asp:Parameter Name="CheckInLicensePlateSold" Type="String" />
                    <asp:Parameter Name="CheckInNotes" Type="String" />
                    <asp:Parameter Name="DealerInventoryCICOID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:FormView ID="FormViewCICO" runat="server" DataKeyNames="DealerInventoryCICOID" DataSourceID="SqlDataSourceCICO" 
                Visible="False" Width="100%" HorizontalAlign="Center" CellPadding="0" 
                OnItemInserting="FormViewCICO_ItemInserting" OnItemUpdating="FormViewCICO_ItemUpdating" OnItemCommand="FormViewCICO_ItemCommand" OnItemInserted="FormViewCICO_ItemInserted" OnItemUpdated="FormViewCICO_ItemUpdated" OnDataBound="FormViewCICO_DataBound" >
                <%-- Check Out Process - InsertTemplate --%>
                <InsertItemTemplate>
                    <asp:Table ID="CheckOutTable" runat="server" style="background-color:#b6b4b4; width: 100%; padding:20px; height:50px; align-content:center; " Visible="true">
                        <asp:TableRow>
                            <asp:TableHeaderCell>Swipe Vehicle Key:</asp:TableHeaderCell>
                            <asp:TableCell><asp:TextBox ID="CheckOutKeyRFidTextBox" runat="server" Text='<%# Bind("CheckOutKeyRFid") %>' /></asp:TableCell><asp:TableHeaderCell>Swipe DealerTag:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="CheckOutDealerTagRFidTextBox" runat="server" Text='<%# Bind("CheckOutDealerTagRFid") %>' /></asp:TableCell><asp:TableHeaderCell ColumnSpan="2" HorizontalAlign="Center" Height="30px">Check Out Reason:</asp:TableHeaderCell><asp:TableCell>
                                <asp:DropDownList ID="DropDownListCheckOutReason" runat="server" AutoPostBack="True" SelectedValue='<%# Bind("CheckOutReason") %>' OnSelectedIndexChanged="DropDownListCheckOutReason_SelectedIndexChanged" >
                                    <asp:ListItem Text="Test Drive" Value="Test Drive" Selected="True"> </asp:ListItem>
                                    <asp:ListItem Text="Vendor" Value="Vendor"></asp:ListItem>
                                </asp:DropDownList>
                            </asp:TableCell></asp:TableRow></asp:Table><asp:TextBox ID="ContactIDTextBox" runat="server" Text='<%# Bind("ContactID") %>' Visible="false" />
                    <asp:TextBox ID="VendorIDTextBox" runat="server" Text='<%# Bind("VendorID") %>' Visible="false" />
                    <div class="cicoleft">
                        <asp:Table ID="ContactTable" runat="server" CssClass="datatable" Visible="true">
                            <asp:TableRow><asp:TableCell ColumnSpan="2" CssClass="headertable"><h2>Contact Information</h2></asp:TableCell></asp:TableRow><asp:TableRow><asp:TableHeaderCell>Phone/DL</asp:TableHeaderCell><asp:TableCell>
                                    <asp:TextBox ID="FindTextBox" runat="server" Text="" />&nbsp;
                                    <asp:Button ID="ButtonSearchContact" runat="server" Text="F" Width="20px" Height="20px" OnClick="ButtonSearchContact_Click"/>&nbsp;
                                    <asp:Button ID="ButtonNewContact" runat="server" Text="Add New" CssClass="mainbutton" OnClick="ButtonNewContact_Click"/>
                                </asp:TableCell></asp:TableRow><asp:TableRow>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2" Width="100%">
                                    <asp:LinqDataSource ID="LinqDataSourceContacts" runat="server" ContextTypeName="TheDog.DOGDataClassesDataContext" 
                                        EnableInsert="True" EntityTypeName="" TableName="Contacts"
                                        OnInserted="LinqDataSourceContacts_Inserted" Where="ContactID == @ContactID" >
                                        <WhereParameters>
                                            <asp:SessionParameter DefaultValue="0" Name="ContactID" SessionField="ContactID" Type="Int32" />
                                        </WhereParameters>
                                    </asp:LinqDataSource>
                                    <asp:DetailsView ID="DetailsViewContactSelected" runat="server" 
                                        Width="100%" AutoGenerateRows="False" DefaultMode="ReadOnly" 
                                        EmptyDataText="" GridLines="None" 
                                        FieldHeaderStyle-Width="150px" FieldHeaderStyle-Font-Bold="true" FieldHeaderStyle-HorizontalAlign="Right" 
                                        DataKeyNames="ContactID" DataSourceID="LinqDataSourceContacts" 
                                        OnItemInserting="DetailsViewContactSelected_ItemInserting" OnItemInserted="DetailsViewContactSelected_ItemInserted"  >
                                        <Fields>
                                            <asp:BoundField DataField="ContactID" HeaderText="ContactID" SortExpression="ContactID" Visible="false" />
                                            <asp:BoundField DataField="DLNumber" HeaderText="DLNumber" SortExpression="DLNumber" />
                                            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="FirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' Width="110px"></asp:TextBox>&nbsp;
                                                    <asp:TextBox ID="MiddleTextBox" runat="server" Text='<%# Bind("MiddleName") %>' Width="50px"></asp:TextBox>&nbsp;
                                                    <asp:TextBox ID="LastNameTextBox" runat="server" Text='<%# Bind("LastName") %>' Width="110px"></asp:TextBox>
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="NameLabel" runat="server" Text='<%# String.Format("{0} {1} {2}",Eval("FirstName"), Eval("MiddleName"), Eval("LastName"))%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Address" SortExpression="VendorName">
                                                <InsertItemTemplate>
                                                    <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' Width="300px"></asp:TextBox><br />
                                                    <asp:TextBox ID="CityTextBox" runat="server" Text='<%# Bind("City") %>' Width="110px"></asp:TextBox>&nbsp;
                                                    <asp:TextBox ID="StateOrProvinceTextBox" runat="server" Text='<%# Bind("StateOrProvince") %>' Width="40px"></asp:TextBox>&nbsp;
                                                    <asp:TextBox ID="PostalCodeTextBox" runat="server" Text='<%# Bind("PostalCode") %>' Width="80px"></asp:TextBox>&nbsp;
                                                </InsertItemTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="AddressLabel" runat="server" Text='<%# String.Format("{0}. {1}, {2}, {3}",Eval("Address"), Eval("City"), Eval("StateOrProvince"), Eval("PostalCode"))%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="HomePhone" HeaderText="Home Phone #" SortExpression="HomePhone" />
                                            <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" SortExpression="EmailAddress" />
                                            <asp:TemplateField HeaderText="" SortExpression="StockNumber" ShowHeader="false" ItemStyle-HorizontalAlign="Center">
                                                <InsertItemTemplate>
                                                    <div style=" text-align:center;margin:5px; padding:5px;">
                                                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Add New" CssClass="mainbutton"/>&nbsp;
                                                        <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" CssClass="mainbutton" />
                                                    </div>
                                                </InsertItemTemplate>
                                            </asp:TemplateField>
                                        </Fields>
                                    </asp:DetailsView>
                                </asp:TableCell></asp:TableRow></asp:Table><asp:Table ID="VendorTable" runat="server" CssClass="datatable" Visible="false" >
                           <asp:TableHeaderRow><asp:TableCell ColumnSpan="2" CssClass="headertable"><h2>Vendor Information</h2></asp:TableCell></asp:TableHeaderRow><asp:TableRow>
                            <asp:TableHeaderCell Width="150px" HorizontalAlign="Left" >Vendor</asp:TableHeaderCell><asp:TableCell>
                                <asp:SqlDataSource ID="SqlDataSourceVendors" runat="server" ConnectionString="<%$ ConnectionStrings:DeviceonguardConnectionString %>" SelectCommand="SELECT * FROM [Vendors]"></asp:SqlDataSource>
                                <asp:DropDownList ID="DropDownListVendor" runat="server" AutoPostBack="True" DataSourceID="SqlDataSourceVendors"  
                                    DataTextField="VendorName" DataValueField="VendorID" ondatabound="DropDownListVendor_DataBound"></asp:DropDownList>&nbsp;&nbsp;
                                <asp:Button ID="ButtonNewVendor" runat="server" Text="Add New" CssClass="mainbutton" OnClick="ButtonNewVendor_Click" /></asp:TableCell></asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2" Width="100%">
                                    <asp:SqlDataSource ID="SqlDataSourceVendorSelected" runat="server" ConnectionString="<%$ ConnectionStrings:DeviceonguardConnectionString %>" 
                                        SelectCommand="SELECT * FROM [Vendors] WHERE ([VendorID] = @VendorID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="DropDownListVendor" Name="VendorID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:DetailsView ID="DetailsViewVendorSelected" runat="server" 
                                        Width="100%" AutoGenerateRows="False" DefaultMode="ReadOnly" 
                                        EmptyDataText="" GridLines="None"
                                        FieldHeaderStyle-Width="150px" FieldHeaderStyle-Font-Bold="true" FieldHeaderStyle-HorizontalAlign="Right" 
                                        DataKeyNames="VendorID" DataSourceID="SqlDataSourceVendorSelected" >
                                        <Fields>
                                            <asp:BoundField DataField="VendorID" HeaderText="" SortExpression="VendorID" ReadOnly="true" Visible="false" />
                                            <asp:TemplateField HeaderText="Address" SortExpression="VendorName">
                                                <ItemTemplate>
                                                    <asp:Label ID="AddressLabel" runat="server" Text='<%# String.Format("{0}. {1}, {2}, {3}",Eval("VendorAddress"), Eval("VendorCity"), Eval("VendorStateOrProvince"), Eval("VendorPostalCode"))%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ContactPerson" HeaderText="Main Contact" SortExpression="ContactPerson" />
                                            <asp:BoundField DataField="OfficeNumber" HeaderText="Office Phone #" SortExpression="OfficeNumber" />
                                            <asp:BoundField DataField="CellNumber" HeaderText="Cellular Phone #" SortExpression="CellNumber" />
                                        </Fields>
                                    </asp:DetailsView>
                                </asp:TableCell></asp:TableRow></asp:Table></div><div class="cicoright">
                        <asp:Table ID="CkeckoutData" runat="server" CssClass="datatable" >
                            <asp:TableRow><asp:TableCell ColumnSpan="2" CssClass="headertable"><h2>Check Vehicle Out</h2></asp:TableCell></asp:TableRow><asp:TableRow><asp:TableHeaderCell>Actual Mileage:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="CurrentMileageTextBox" runat="server" Text='<%# Bind("CheckOutMileage") %>' Width="100px" /></asp:TableCell></asp:TableRow><asp:TableRow><asp:TableHeaderCell>Miles Permitted:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="TextBoxMilesPermited" runat="server" Text='<%# Bind("CheckOutMilesPermitted") %>' Width="100px" /></asp:TableCell></asp:TableRow><asp:TableRow><asp:TableHeaderCell>Hours Permitted:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="TextBoxHoursPermited" runat="server" Text='<%# Bind("CheckOutHoursPermitted") %>' Width="100px" /><br /></asp:TableCell></asp:TableRow> 
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2" Width="100%">
                                    <div style=" text-align:center;margin:5px; padding:5px;">
                                        <asp:Button ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="mainbutton" Text="Check Out" />&nbsp;
                                        <asp:Button ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="cancelbutton" Text="Cancel" />
                                    </div>
                                </asp:TableCell></asp:TableRow></asp:Table></div></InsertItemTemplate><%-- Check In Process - EditTemplate --%><EditItemTemplate>
                        <asp:Table ID="CheckInTable" runat="server" style="background-color:#b6b4b4; width: 100%; padding:20px; height:50px; align-content:center; " Visible="true">
                            <asp:TableRow><asp:TableHeaderCell>Swipe Vehicle Key:</asp:TableHeaderCell><asp:TableCell><asp:Label ID="CheckOutKeyRFidLabel" runat="server" Text='<%# Eval("CheckOutKeyRFid") %>' /><asp:TextBox ID="CheckInKeyRFidTextBox" runat="server" Text='<%# Bind("CheckInKeyRFid") %>' /></asp:TableCell><asp:TableHeaderCell>Swipe DealerTag:</asp:TableHeaderCell><asp:TableCell><asp:Label ID="CheckOutDealerTagRFidLabel" runat="server" Text='<%# Eval("CheckOutDealerTagRFid") %>' /><asp:TextBox ID="CheckInDealerTagRFidTextBox" runat="server" Text='<%# Bind("CheckInDealerTagRFid") %>' /></asp:TableCell><asp:TableHeaderCell ColumnSpan="2" HorizontalAlign="Center" Height="30px">Check Out Reason:</asp:TableHeaderCell><asp:TableCell>
                                <asp:Label ID="LabelCheckOutReason" runat="server" Text='<%# Eval("CheckOutReason") %>' >
                                </asp:Label>
                            </asp:TableCell></asp:TableRow></asp:Table><div class="cicoleft" >
                        <asp:Table ID="ContactInTable" runat="server" CssClass="datatable" Visible="true">
                            <asp:TableRow><asp:TableCell ColumnSpan="2"><h2>Driver Information</h2></asp:TableCell></asp:TableRow><asp:TableRow>
                                <asp:TableCell ColumnSpan="2" Width="100%">
                                    <asp:Label ID="ContactIDLabel" runat="server" Text='<%# Eval("CheckOutContactID") %>'  Visible="false"/>
                                    <asp:SqlDataSource ID="SqlDataSourceContactID" runat="server" ConnectionString="<%$ ConnectionStrings:DeviceonguardConnectionString %>" 
                                        SelectCommand="SELECT * FROM [Contacts] WHERE ([ContactID] = @ContactID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="ContactIDLabel" Name="ContactID" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:DetailsView ID="DetailsViewContactID" runat="server" 
                                        Width="100%" AutoGenerateRows="False" DefaultMode="ReadOnly" 
                                        EmptyDataText="" GridLines="None" 
                                        FieldHeaderStyle-Width="150px" FieldHeaderStyle-Font-Bold="true" FieldHeaderStyle-HorizontalAlign="Right" 
                                        DataKeyNames="ContactID" DataSourceID="SqlDataSourceContactID"  >
                                        <Fields>
                                            <asp:BoundField DataField="ContactID" HeaderText="ContactID" SortExpression="ContactID" Visible="false" InsertVisible="False" ReadOnly="True" />
                                            <asp:BoundField DataField="DLNumber" HeaderText="DLNumber" SortExpression="DLNumber" />
                                            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="NameLabel" runat="server" Text='<%# String.Format("{0} {1} {2}",Eval("FirstName"), Eval("MiddleName"), Eval("LastName"))%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Address" SortExpression="VendorName">
                                                <ItemTemplate>
                                                    <asp:Label ID="AddressLabel" runat="server" Text='<%# String.Format("{0}. {1}, {2}, {3}",Eval("Address"), Eval("City"), Eval("StateOrProvince"), Eval("PostalCode"))%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="HomePhone" HeaderText="Home Phone #" SortExpression="HomePhone" />
                                            <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" SortExpression="EmailAddress" />
                                        </Fields>
                                    </asp:DetailsView>
                                </asp:TableCell></asp:TableRow></asp:Table><asp:Table ID="VendorInTable" runat="server" CssClass="datatable" >
                            <asp:TableHeaderRow><asp:TableCell><h2>Vendor Information</h2></asp:TableCell></asp:TableHeaderRow><asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="VendorIDLabel" runat="server" Text='<%# Eval("CheckOutVendorID") %>'  Visible="false"/>
                                    <asp:SqlDataSource ID="SqlDataSourceVendorID" runat="server" ConnectionString="<%$ ConnectionStrings:DeviceonguardConnectionString %>" 
                                        SelectCommand="SELECT * FROM [Vendors] WHERE ([VendorID] = @VendorID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="VendorIDLabel" Name="VendorID" PropertyName="Text" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:DetailsView ID="DetailsViewVendorID" runat="server" CssClass="detailsview" 
                                        Width="100%" AutoGenerateRows="False" DefaultMode="ReadOnly" 
                                        EmptyDataText="" GridLines="None" 
                                        FieldHeaderStyle-Width="150px" FieldHeaderStyle-Font-Bold="true" FieldHeaderStyle-HorizontalAlign="Right" 
                                        DataKeyNames="VendorID" DataSourceID="SqlDataSourceVendorID" >
                                        <Fields>
                                            <asp:BoundField DataField="VendorName" HeaderText="Name" SortExpression="VendorName" />
                                            <asp:TemplateField HeaderText="Address" SortExpression="VendorName">
                                                <ItemTemplate>
                                                    <asp:Label ID="AddressLabel" runat="server" Text='<%# String.Format("{0}. {1}, {2}, {3}",Eval("VendorAddress"), Eval("VendorCity"), Eval("VendorStateOrProvince"), Eval("VendorPostalCode"))%>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" SortExpression="ContactPerson" />
                                            <asp:BoundField DataField="OfficeNumber" HeaderText="Office Phone #" SortExpression="OfficeNumber" />
                                            <asp:BoundField DataField="CellNumber" HeaderText="Cellular Phone #" SortExpression="CellNumber" />
                                        </Fields>
                                    </asp:DetailsView>
                                </asp:TableCell></asp:TableRow></asp:Table></div><div class="cicoright">
                        <asp:Table ID="CheckInOutInfoData" runat="server" CssClass="datatable" >
                            <asp:TableRow><asp:TableCell ColumnSpan="2"><h2>Check Out Details</h2></asp:TableCell></asp:TableRow><asp:TableRow><asp:TableHeaderCell>Mileage Out:</asp:TableHeaderCell><asp:TableCell><asp:Label ID="CheckOutMileageLabel" runat="server" Text='<%# Eval("CheckOutMileage") %>' Width="100px" /></asp:TableCell></asp:TableRow><asp:TableRow><asp:TableHeaderCell>Miles Permitted:</asp:TableHeaderCell><asp:TableCell><asp:Label ID="CheckOutMilesPermittedLabel" runat="server" Text='<%# Eval("CheckOutMilesPermitted") %>' Width="100px" /></asp:TableCell></asp:TableRow><asp:TableRow><asp:TableHeaderCell>Hours Permitted:</asp:TableHeaderCell><asp:TableCell><asp:Label ID="CheckOutHoursPermittedLabel" runat="server" Text='<%# Eval("CheckOutHoursPermitted") %>' Width="100px" /><br /></asp:TableCell></asp:TableRow> 
                        </asp:Table>
                        <asp:Table ID="CkeckInData" runat="server" CssClass="datatable" >
                            <asp:TableRow><asp:TableCell ColumnSpan="2" CssClass="headertable"><h2>Check Vehicle In</h2></asp:TableCell></asp:TableRow><asp:TableRow><asp:TableHeaderCell>Mileage In:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="CheckInMileageTextBox" runat="server" Text='<%# Bind("CheckInMileage") %>' Width="100px" /></asp:TableCell></asp:TableRow><asp:TableRow><asp:TableHeaderCell>Check In Result:</asp:TableHeaderCell><asp:TableCell>
                                    <asp:DropDownList ID="DropDownListCheckInResult" runat="server" AutoPostBack="True" Width="200px" OnSelectedIndexChanged="DropDownListCheckInResult_SelectedIndexChanged" OnDataBound="DropDownListCheckInResult_DataBound" >
                                        <asp:ListItem Text="Active" Value="Active"> </asp:ListItem>
                                        <asp:ListItem Text="Conditioned" Value="Conditioned"></asp:ListItem>
                                        <asp:ListItem Text="Down Payment" Value="Down Payment"></asp:ListItem>
                                        <asp:ListItem Text="Price" Value="Price"></asp:ListItem>
                                        <asp:ListItem Text="Sold" Value="Sold"></asp:ListItem>
                                        <asp:ListItem Text="Switch Unit" Value="Switch Unit"></asp:ListItem>
                                        <asp:ListItem Text="Trade In" Value="Trade In"></asp:ListItem>
                                        <asp:ListItem Text="Unit" Value="Unit"></asp:ListItem>
                                        <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                                    </asp:DropDownList>
                                </asp:TableCell></asp:TableRow><asp:TableRow><asp:TableHeaderCell>Notes:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="TextBoxNotes" TextMode="MultiLine" runat="server" Text='<%# Bind("CheckInNotes") %>' Width="200px" Height="60px" /></asp:TableCell></asp:TableRow><asp:TableRow><asp:TableHeaderCell>License Plate:</asp:TableHeaderCell><asp:TableCell><asp:TextBox ID="TextBoxLicensePlate" runat="server" Text='<%# Bind("CheckInLicensePlateSold") %>'  Width="100px"/><br /></asp:TableCell></asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2"  Width="100%">
                                    <div style=" text-align:center;margin:5px; padding:5px;">
                                        <asp:Button ID="UpdateLinkButton" runat="server" CausesValidation="True" CssClass="mainbutton" CommandName="Update" Text="Check In" />&nbsp;
                                        <asp:Button ID="UpdateCancelButton" runat="server" CausesValidation="False" CssClass="cancelbutton" CommandName="Cancel" Text="Cancel" />
                                    </div>
                                </asp:TableCell></asp:TableRow></asp:Table></div></EditItemTemplate><%-- History Detail - ItemTemplate--%><ItemTemplate>
                    CheckOutEmployeeID: <asp:Label ID="CheckOutEmployeeIDLabel0" runat="server" Text='<%# Bind("CheckOutEmployeeID") %>' />
                    <br />
                    CheckOutDateTime: <asp:Label ID="CheckOutDateTimeLabel0" runat="server" Text='<%# Bind("CheckOutDateTime") %>' />
                    <br />
                    CheckOutReason: <asp:Label ID="CheckOutReasonLabel0" runat="server" Text='<%# Bind("CheckOutReason") %>' />
                    <br />
                    ContactID: <asp:Label ID="ContactIDLabel0" runat="server" Text='<%# Bind("CheckOutContactID") %>' />
                    <br />
                    VendorID: <asp:Label ID="VendorIDLabel0" runat="server" Text="" />
                    <br />
                    MileageOut: <asp:Label ID="MileageOutLabel0" runat="server" Text='<%# Bind("CheckOutMileage") %>' />
                    <br />
                    MilesPermitted: <asp:Label ID="MilesPermittedLabel0" runat="server" Text='<%# Bind("CheckOutMilesPermitted") %>' />
                    <br />
                    HoursPermitted: <asp:Label ID="HoursPermittedLabel0" runat="server" Text='<%# Bind("CheckOutHoursPermitted") %>' />
                    <br />
                    CheckInEmployeeID: <asp:Label ID="CheckInEmployeeIDLabel0" runat="server" Text='<%# Bind("CheckInEmployeeID") %>' />
                    <br />
                    CheckInDateTime: <asp:Label ID="CheckInDateTimeLabel0" runat="server" Text='<%# Bind("CheckInDateTime") %>' />
                    <br />
                    MileageIn: <asp:Label ID="MileageInLabel0" runat="server" Text='<%# Bind("CheckInMileage") %>' />
                    <br />
                    Result: <asp:Label ID="ResultLabel0" runat="server" Text='<%# Bind("CheckInResult") %>' />
                    <br />
                    Notes: <asp:Label ID="NotesLabel0" runat="server" Text='<%# Bind("CheckInNotes") %>' />
                    <br />
                </ItemTemplate>
            </asp:FormView>
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">

            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
