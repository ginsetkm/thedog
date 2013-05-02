using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheDog
{
    public partial class VechicleDetail : System.Web.UI.Page
    {
        private DOGDataClassesDataContext dc = new DOGDataClassesDataContext();

        private int CurrenInventoryID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["ContactID"] = 0;
            Session["DealerInventoryCICOID"] = 0;
            if (Request.QueryString["InventoryID"] != null)
            {
                int getInventoryID = 0;
                try
                {
                    getInventoryID = int.Parse(Request.QueryString["InventoryID"]);
                    if (getInventoryID > 0)
                    {
                        CurrenInventoryID = getInventoryID;
                        if ((from a in dc.DealerInventoryCICOs where a.DealerInventoryID == CurrenInventoryID && a.CheckInDateTime == null select a).Any())
                        {
                            var getCICOID = (from a in dc.DealerInventoryCICOs where a.DealerInventoryID == CurrenInventoryID && a.CheckInDateTime == null select a).FirstOrDefault();
                            Session["DealerInventoryCICOID"] = getCICOID.DealerInventoryCICOID;
                            Label LabelStatus = (Label)DetailsViewVehicle.FindControl("LabelStatus");
                            LabelStatus.Text = "Out";
                            Button ButtonCICO = (Button)DetailsViewVehicle.FindControl("ButtonCICO");
                            ButtonCICO.Text = "Check In";
                        }
                        else
                        {
                            Session["DealerInventoryCICOID"] = 0;
                            Label LabelStatus = (Label)DetailsViewVehicle.FindControl("LabelStatus");
                            LabelStatus.Text = "In";
                            Button ButtonCICO = (Button)DetailsViewVehicle.FindControl("ButtonCICO");
                            ButtonCICO.Text = "Check Out";
                        }
                        if (GridViewCICOHistory.Rows.Count > 0)
                            LabelTitle.Visible = true;
                        else
                            LabelTitle.Visible = false;
                    }
                }
                catch { }
            }
            else
            {
            }
        }

        protected void ButtonCICO_Click(object sender, EventArgs e)
        {
            Button ButtonCICO = (Button)DetailsViewVehicle.FindControl("ButtonCICO");

            if (ButtonCICO.Text == "Check Out")
            {
                GridViewCICOHistory.Visible = false;
                FormViewCICO.ChangeMode(FormViewMode.Insert);
                FormViewCICO.Visible = true;
                ButtonCICO.Visible = false;
                LabelTitle.Text = "Check Vehicle Out";
            }
            else
            {
                GridViewCICOHistory.Visible = false;
                ButtonCICO.Visible = false;
                
                var getCICOID = (from a in dc.DealerInventoryCICOs where a.DealerInventoryID == CurrenInventoryID && a.CheckInDateTime == null select a).FirstOrDefault();
                Session["DealerInventoryCICOID"] = getCICOID.DealerInventoryCICOID;
                FormViewCICO.DataBind();
                FormViewCICO.ChangeMode(FormViewMode.Edit);
                FormViewCICO.Visible = true;
                LabelTitle.Text = "Check Vehicle In";
            }
        }

        protected void DropDownListCheckOutReason_SelectedIndexChanged(object sender, EventArgs e)
        {
            Table ContactTable = (Table)FormViewCICO.FindControl("ContactTable");
            Table VendorTable = (Table)FormViewCICO.FindControl("VendorTable");
            Table CkeckoutData = (Table)FormViewCICO.FindControl("CkeckoutData");
            DropDownList DropDownListCheckOutReason = (DropDownList)FormViewCICO.FindControl("DropDownListCheckOutReason");
            CkeckoutData.Visible = true;
            if (DropDownListCheckOutReason.SelectedValue == "Test Drive")
            {
                ContactTable.Visible = true;
                VendorTable.Visible = false;
            }
            else
            {
                ContactTable.Visible = false;
                VendorTable.Visible = true;
            }
        }

        protected void DropDownListCheckInResult_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox TextBoxLicensePlate = (TextBox)FormViewCICO.FindControl("TextBoxLicensePlate");
            DropDownList DropDownListCheckInResult = (DropDownList)FormViewCICO.FindControl("DropDownListCheckInResult");
            if (DropDownListCheckInResult.SelectedValue == "Sold")
            {
                TextBoxLicensePlate.Enabled = true;
            }
            else
            {
                TextBoxLicensePlate.Enabled = false;
            }

        }

        protected void FormViewCICO_ItemInserting(object sender, FormViewInsertEventArgs e)
        {

            SqlDataSourceCICO.InsertParameters["DealerInventoryID"].DefaultValue = CurrenInventoryID.ToString();
            SqlDataSourceCICO.InsertParameters["CheckOutEmployeeID"].DefaultValue = "1";
            SqlDataSourceCICO.InsertParameters["CheckOutDateTime"].DefaultValue = DateTime.Now.ToString();
            SqlDataSourceCICO.InsertParameters["CheckOutKeyDateTime"].DefaultValue = DateTime.Now.ToString();
            SqlDataSourceCICO.InsertParameters["CheckOutDealerTagDateTime"].DefaultValue = DateTime.Now.ToString();
            SqlDataSourceCICO.InsertParameters["CheckOutDealerTagID"].DefaultValue = "";

            DetailsView DetailsViewContactSelected = (DetailsView)FormViewCICO.FindControl("DetailsViewContactSelected");
            DetailsView DetailsViewVendorSelected = (DetailsView)FormViewCICO.FindControl("DetailsViewVendorSelected");
            
            DropDownList DropDownListCheckOutReason = (DropDownList)FormViewCICO.FindControl("DropDownListCheckOutReason");
            if (DropDownListCheckOutReason.SelectedValue == "Test Drive")
            {
                SqlDataSourceCICO.InsertParameters["CheckOutContactID"].DefaultValue = DetailsViewContactSelected.DataKey.Value.ToString();
                SqlDataSourceCICO.InsertParameters["CheckOutVendorID"].DefaultValue = null;
            }
            else
            {
                SqlDataSourceCICO.InsertParameters["CheckOutContactID"].DefaultValue = null;
                SqlDataSourceCICO.InsertParameters["CheckOutVendorID"].DefaultValue = DetailsViewVendorSelected.DataKey.Value.ToString();
            }
            SqlDataSourceCICO.InsertParameters["RowDateTime"].DefaultValue = DateTime.Now.ToString();
        }

        protected void FormViewCICO_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            SqlDataSourceCICO.UpdateParameters["CheckInEmployeeID"].DefaultValue = "1";
            SqlDataSourceCICO.UpdateParameters["CheckInDateTime"].DefaultValue = DateTime.Now.ToString();
            SqlDataSourceCICO.UpdateParameters["CheckInKeyDateTime"].DefaultValue = DateTime.Now.ToString();
            SqlDataSourceCICO.UpdateParameters["CheckInDealerTagDateTime"].DefaultValue = DateTime.Now.ToString();
            DropDownList DropDownListCheckInResult = (DropDownList)FormViewCICO.FindControl("DropDownListCheckInResult");
            SqlDataSourceCICO.UpdateParameters["CheckInResult"].DefaultValue = DropDownListCheckInResult.SelectedValue;
        }
        protected void ButtonNewContact_Click(object sender, EventArgs e)
        {
            DetailsView DetailsViewContactSelected = (DetailsView)FormViewCICO.FindControl("DetailsViewContactSelected");
            if (DetailsViewContactSelected.CurrentMode == DetailsViewMode.ReadOnly)
                DetailsViewContactSelected.ChangeMode(DetailsViewMode.Insert);
        }
        protected void ButtonSearchContact_Click(object sender, EventArgs e)
        {
            TextBox FindTextBox = (TextBox)FormViewCICO.FindControl("FindTextBox");
            TextBox ContactIDTextBox = (TextBox)FormViewCICO.FindControl("ContactIDTextBox");
            DetailsView DetailsViewContactSelected = (DetailsView)FormViewCICO.FindControl("DetailsViewContactSelected");
            SqlDataSource SqlDataSourceContact = (SqlDataSource)FormViewCICO.FindControl("SqlDataSourceContact");
            
            //Search on Table by Phone or DL
            SqlDataSourceContact.SelectCommand = "SELECT * FROM CONTACTS WHERE [HomePhone] = " + FindTextBox.Text;

            DetailsViewContactSelected.DataBind();
            DetailsViewContactSelected.ChangeMode(DetailsViewMode.ReadOnly);
        }
        protected void ButtonNewVendor_Click(object sender, EventArgs e)
        {
        }
        protected void DropDownListCheckInResult_DataBound(object sender, EventArgs e)
        {
            DropDownList DropDownListCheckInResult = (DropDownList)FormViewCICO.FindControl("DropDownListCheckInResult");
            DropDownListCheckInResult.Items.Insert(0, new ListItem("[Select One]", String.Empty));
            DropDownListCheckInResult.SelectedValue = "";
        }
        protected void DropDownListVendor_DataBound(object sender, EventArgs e)
        {
            DropDownList DropDownListVendor = (DropDownList)FormViewCICO.FindControl("DropDownListVendor");
            DropDownListVendor.Items.Insert(0, new ListItem("[Select One]", String.Empty));
            DropDownListVendor.SelectedValue = "";
        }

        protected void FormViewCICO_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            if (e.CommandName == "Cancel")
            {
                Button ButtonCICO = (Button)DetailsViewVehicle.FindControl("ButtonCICO");
                ButtonCICO.Visible = true;
                GridViewCICOHistory.Visible = true;
                FormViewCICO.Visible = false;
            }
        }

        protected void FormViewCICO_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            FormViewCICO.Visible = false;
            
            Button ButtonCICO = (Button)DetailsViewVehicle.FindControl("ButtonCICO");
            ButtonCICO.Visible = true;
            GridViewCICOHistory.Visible = true;
            GridViewCICOHistory.DataBind();
            
            Label LabelStatus = (Label)DetailsViewVehicle.FindControl("LabelStatus");
            LabelStatus.Text = "Out";
            ButtonCICO.Text = "Check In";
            if (GridViewCICOHistory.Rows.Count > 0)
                LabelTitle.Visible = true;
            else
                LabelTitle.Visible = false;
        }

        protected void FormViewCICO_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            FormViewCICO.Visible = false;

            Button ButtonCICO = (Button)DetailsViewVehicle.FindControl("ButtonCICO");
            ButtonCICO.Visible = true;
            GridViewCICOHistory.Visible = true;
            GridViewCICOHistory.DataBind();

            Label LabelStatus = (Label)DetailsViewVehicle.FindControl("LabelStatus");
            LabelStatus.Text = "In";
            ButtonCICO.Text = "Check Out";
            if (GridViewCICOHistory.Rows.Count > 0)
                LabelTitle.Visible = true;
            else
                LabelTitle.Visible = false;
        }

        protected void FormViewCICO_DataBound(object sender, EventArgs e)
        {
            if (FormViewCICO.CurrentMode == FormViewMode.Edit)
            {
                Table VendorInTable = (Table)FormViewCICO.FindControl("VendorInTable");
                Table ContactInTable = (Table)FormViewCICO.FindControl("ContactInTable");
                Label LabelCheckOutReason = (Label)FormViewCICO.FindControl("LabelCheckOutReason");
                if (LabelCheckOutReason.Text == "Test Drive")
                {
                    VendorInTable.Visible = false;
                    ContactInTable.Visible = true;
                }
                else
                {
                    VendorInTable.Visible = true;
                    ContactInTable.Visible = false;
                }
            }
        }
        protected void DetailsViewContactSelected_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            SqlDataSource SqlDataSourceContact = (SqlDataSource)FormViewCICO.FindControl("SqlDataSourceContact");
            SqlDataSourceContact.InsertParameters["EmployeeID"].DefaultValue = "1";
            SqlDataSourceContact.InsertParameters["RowDateTime"].DefaultValue = DateTime.Now.ToString();
        }

        protected void DetailsViewContactSelected_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
        {
        }
        protected void LinqDataSourceContacts_Inserted(object sender, LinqDataSourceStatusEventArgs e)
        {
            DetailsView DetailsViewContactSelected = (DetailsView)FormViewCICO.FindControl("DetailsViewContactSelected");
            LinqDataSource LinqDataSourceContacts = (LinqDataSource)FormViewCICO.FindControl("LinqDataSourceContacts");
            Contact getnewContact = (Contact)e.Result;
            Session["ContactID"] = getnewContact.ContactID;
            DetailsViewContactSelected.DataBind();
            DetailsViewContactSelected.ChangeMode(DetailsViewMode.ReadOnly);

        }
        
    }
}