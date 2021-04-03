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
    public partial class Index : System.Web.UI.Page
    {
        private static _Employee dsEmployee = new _Employee();
        private static DataRow[] rows;

        static Index()
        {
            EmployeeTableAdapter daEmployee = new EmployeeTableAdapter();
            try
            {
                daEmployee.Fill(dsEmployee.Employee);
            }
            catch { }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Connect lblRole Text to the ddlEmployee's id? using page load?
        }

        protected void gvwReceipt_SelectedIndexChanged(object sender, EventArgs e)
        {
            //TextBoxUserID.Text = GridView1.SelectedRow.Cells[1].Text;
            //Using something like this to select the customer ID and transfer it to the Details page.
            Server.Transfer("~/Details.aspx");
        }

        protected void ddlEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            rows = dsEmployee.Employee.Select("id = " + this.ddlEmployee.SelectedValue);
            foreach (DataRow r in rows)
            {
                lblRole.Text = r.ItemArray[2].ToString();
            }
        }

        public int GetID
        {
            get { return Convert.ToInt32(gvwReceipt.SelectedRow.Cells[5].Text); }
        }
    }
}