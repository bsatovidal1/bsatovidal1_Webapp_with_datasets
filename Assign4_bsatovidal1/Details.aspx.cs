using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Assign4_bsatovidal1_library;
using Assign4_bsatovidal1_library._EmployeeTableAdapters;

namespace Assign4_bsatovidal1
{
    public partial class Details : System.Web.UI.Page
    {
        //Load into memory the Order Details table adapter, so I can change the text lblTotal
        private static _Employee dsEmployee = new _Employee();
        private static DataRow[] rows;
        Index index;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                index = (Index)Context.Handler;
                int id = index.GetID - 1;
                this.dvwCustomer.PageIndex = id;
            }
        }

        protected void gvwReceipt_SelectedIndexChanged(object sender, EventArgs e)
        {
            //select the Receipt id for the gvwOrderDetails
            int Param1 = Convert.ToInt32(gvwReceipt.SelectedValue);
            OrderDetailsTableAdapter daOrder = new OrderDetailsTableAdapter();
            try
            {
                daOrder.Fill(dsEmployee.OrderDetails, Param1);
            }
            catch { }
            int total = 0;
            rows = dsEmployee.OrderDetails.Select("");
            foreach (DataRow r in rows)
            {
                total += Convert.ToInt32(r.ItemArray[3]);
                
            }
            //Adding all the totals and displaying on lblTotal.
            lblTotal.Text = "Total is $" + total.ToString();
        }
    }
}