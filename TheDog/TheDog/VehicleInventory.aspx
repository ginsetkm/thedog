<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="VehicleInventory.aspx.cs" Inherits="TheDog.VehicleInventory" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
        </Triggers>
        <ContentTemplate>
            <div style="clear:both; float:left;  padding:20px; margin:10px;">
                <asp:Label ID="LabelSearch" runat="server" Text="Search:"></asp:Label>
                <asp:TextBox ID="TextBoxSearch" runat="server"></asp:TextBox>
            </div>
            <div style=" float:right; padding:20px; margin:10px; margin-right:60px; vertical-align:central">
                <asp:Label ID="LabelVehicleOut" runat="server" Text="Vehicle Out:"></asp:Label>
                <asp:CheckBox ID="CheckBoxVehicleOut" runat="server" AutoPostBack="true" Height=20px   />
            </div>
            <asp:SqlDataSource ID="VehicleSqlDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DeviceonguardConnectionString %>" 
                SelectCommand="SELECT DealerInventory.DealerInventoryID, DealerInventory.StockNumber, DealerInventory.VIN, DealerInventory.VehicleYear, DealerInventory.VehicleMake ,DealerInventory.VehicleModel, DealerInventory.VehicleType, DealerInventory.VehicleColor, DealerInventory.VehicleMileage FROM DealerInventory">
            </asp:SqlDataSource>
            <asp:GridView ID="GridViewInventory" runat="server"  CssClass="gridclass"
                AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" 
                DataKeyNames="DealerInventoryID" DataSourceID="VehicleSqlDataSource" 
                CellPadding="10" ForeColor="#333333" GridLines="None" Width="95%"  HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:TemplateField HeaderText="Stock #" SortExpression="StockNumber">
                   <ItemTemplate>
                        <asp:LinkButton ID="StockButton" runat="server" CausesValidation="False" ToolTip="Click to open it" Text='<%# Bind("StockNumber") %>'  PostBackUrl='<%#Eval("DealerInventoryID","~/VehicleDetail.aspx?InventoryID={0}") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="VIN" SortExpression="VIN">
                    <ItemTemplate>
                        <asp:LinkButton ID="VINButton" runat="server" CausesValidation="False" ToolTip="Click to open it" Text='<%# Bind("VIN") %>'  PostBackUrl='<%#Eval("DealerInventoryID","~/VehicleDetail.aspx?InventoryID={0}") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Year" SortExpression="VehicleYear">
                    <ItemTemplate>
                        <asp:LinkButton ID="YearButton" runat="server" CausesValidation="False" ToolTip="Click to open it" Text='<%# Bind("VehicleYear") %>'  PostBackUrl='<%#Eval("DealerInventoryID","~/VehicleDetail.aspx?InventoryID={0}") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Make" SortExpression="VehicleMake" HeaderStyle-HorizontalAligN="Left">
                    <ItemTemplate>
                        <asp:LinkButton ID="VehicleMakeButton" runat="server" CausesValidation="False" ToolTip="Click to open it" Text='<%# Bind("VehicleMake") %>'  PostBackUrl='<%#Eval("DealerInventoryID","~/VehicleDetail.aspx?InventoryID={0}") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Model" SortExpression="VehicleModel" HeaderStyle-HorizontalAligN="Left">
                    <ItemTemplate>
                        <asp:LinkButton ID="VehicleModelButton" runat="server" CausesValidation="False" ToolTip="Click to open it" Text='<%# Bind("VehicleModel") %>'  PostBackUrl='<%#Eval("DealerInventoryID","~/VehicleDetail.aspx?InventoryID={0}") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Type" SortExpression="VehicleType" HeaderStyle-HorizontalAligN="Left">
                    <ItemTemplate>
                        <asp:LinkButton ID="VehicleTypeButton" runat="server" CausesValidation="False" ToolTip="Click to open it" Text='<%# Bind("VehicleType") %>'  PostBackUrl='<%#Eval("DealerInventoryID","~/VehicleDetail.aspx?InventoryID={0}") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Color" SortExpression="VehicleColor" HeaderStyle-HorizontalAligN="Left">
                    <ItemTemplate>
                        <asp:LinkButton ID="VehicleColorButton" runat="server" CausesValidation="False" ToolTip="Click to open it" Text='<%# Bind("VehicleColor") %>'  PostBackUrl='<%#Eval("DealerInventoryID","~/VehicleDetail.aspx?InventoryID={0}") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mileage" SortExpression="VehicleMileage">
                    <ItemTemplate>
                        <asp:LinkButton ID="ButtonVehicleMileage" runat="server" CausesValidation="False" ToolTip="Click to open it" Text='<%# Bind("VehicleMileage") %>'  PostBackUrl='<%#Eval("DealerInventoryID","~/VehicleDetail.aspx?InventoryID={0}") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Vehicle Out" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBoxVehicleOut" runat="server" />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
            </Columns>
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
            </asp:GridView>
            <asp:UpdateProgress runat="server">

            </asp:UpdateProgress>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
