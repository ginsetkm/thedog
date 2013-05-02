<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CICOHistory.aspx.cs" Inherits="TheDog.CICOHistory" %>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <div style="padding:20px; margin:10px;">
                <asp:Label ID="LabelSearch" runat="server" Text="Search:"></asp:Label>
                <asp:TextBox ID="TextBoxSearch" runat="server"></asp:TextBox>
            </div>
            <br /><h2><asp:Label ID="LabelTitle" runat="server" Text="Check Out/In History" /></h2><br />
            <asp:SqlDataSource ID="SqlDataSourceCICOHistory" runat="server" ConnectionString="<%$ ConnectionStrings:DeviceonguardConnectionString %>" 
                SelectCommand="SELECT DealerInventoryCICO.DealerInventoryCICOID, DealerInventoryCICO.DealerInventoryID, DealerInventoryCICO.CheckOutEmployeeID, DealerInventoryCICO.CheckOutDateTime, DealerInventoryCICO.CheckOutKeyRFid, DealerInventoryCICO.CheckOutKeyDateTime, DealerInventoryCICO.CheckOutDealerTagRFid, DealerInventoryCICO.CheckOutDealerTagDateTime, DealerInventoryCICO.CheckOutDealerTagID, DealerInventoryCICO.CheckOutReason, DealerInventoryCICO.CheckOutContactID, DealerInventoryCICO.CheckOutVendorID, DealerInventoryCICO.CheckOutMileage, DealerInventoryCICO.CheckOutMilesPermitted, DealerInventoryCICO.CheckOutHoursPermitted, DealerInventoryCICO.CheckInEmployeeID, DealerInventoryCICO.CheckInDateTime, DealerInventoryCICO.CheckInKeyRFid, DealerInventoryCICO.CheckInKeyDateTime, DealerInventoryCICO.CheckInDealerTagRFid, DealerInventoryCICO.CheckInDealerTagDateTime, DealerInventoryCICO.CheckInMileage, DealerInventoryCICO.CheckInResult, DealerInventoryCICO.CheckInLicensePlateSold, DealerInventoryCICO.CheckInNotes, DealerInventoryCICO.RowDateTime, DealerTags.DealerTag, Employees.EmployeeFirstName, Employees.EmployeeLastName, DealerInventory.StockNumber FROM DealerInventoryCICO INNER JOIN Employees ON DealerInventoryCICO.CheckOutEmployeeID = Employees.EmployeeID INNER JOIN DealerInventory ON DealerInventoryCICO.DealerInventoryID = DealerInventory.DealerInventoryID LEFT OUTER JOIN DealerTags ON DealerInventoryCICO.CheckOutDealerTagID = DealerTags.DealerTagID">
            </asp:SqlDataSource>
            <asp:GridView ID="GridViewCICOHistory" runat="server"  CssClass="gridclass" 
                AllowPaging="True" AllowSorting="True" 
                DataKeyNames="DealerInventoryCICOID" DataSourceID="EntityDataSourceCICOHistory" 
                CellPadding="10" ForeColor="#333333" GridLines="None" Width="100%"  HorizontalAlign="Center" AutoGenerateColumns="False"><AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="StockNumber" HeaderText="StockNumber" ItemStyle-HorizontalAlign="Center" />
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
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:TemplateField>
                <asp:BoundField DataField="CheckOutMileage" HeaderText="Mileage Out" SortExpression="CheckOutMileage" ItemStyle-HorizontalAlign="Center" >
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="CheckInDateTime" HeaderText="Check In Date" SortExpression="CheckInDateTime" DataFormatString="{0:g}" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="CheckInMileage" HeaderText="Mileage In" SortExpression="CheckInMileage" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
                <asp:BoundField DataField="CheckInResult" HeaderText="Result" SortExpression="CheckInResult" ItemStyle-HorizontalAlign="Center">
                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                </asp:BoundField>
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
</asp:Content>
