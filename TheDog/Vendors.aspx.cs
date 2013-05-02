using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TheDog
{
    public partial class Vendors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ButtonAddNewVendor_Click(object sender, EventArgs e)
        {
            DetailsViewVendorDetail.ChangeMode(DetailsViewMode.Insert);
        }

        protected void LinqDataSourceVendors_Inserted(object sender, LinqDataSourceStatusEventArgs e)
        {
            Vendor getnewvendor = (Vendor)e.Result;
            
            int getidnumber = getnewvendor.VendorID;

            if (getidnumber > 0)
                DetailsViewVendorDetail.ChangeMode(DetailsViewMode.ReadOnly);
        }
    }
}