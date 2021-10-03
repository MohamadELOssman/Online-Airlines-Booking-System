using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp2
{
    public partial class Home : Form
    {
        DataLayer dl;
        DataTable Best_Deals_Table;
        public Home()
        {
            InitializeComponent();
            dl = new DataLayer(@".\SQLEXPRESS", "Project_DB");
        }

        private void Home_Load(object sender, EventArgs e)
        {
            object[,] param = new object[2, 1];
            param[0, 0] = "@Login_id";
            param[1, 0] = Login.Login_Id;
            Best_Deals_Table = dl.GetData("BestDeals", param, "Best_Deals_Table");
            if (Best_Deals_Table.Rows.Count != 0)
            {
                Best_Deal[] deals = new Best_Deal[Best_Deals_Table.Rows.Count];
                for (int i = 0; i < Best_Deals_Table.Rows.Count; i++)
                {
                    Best_Deal deal = new Best_Deal();
                    deal.TicketID = (int)Best_Deals_Table.Rows[i][13];
                    deal.Dep_Time1 = Best_Deals_Table.Rows[i][1].ToString();
                    deal.Dep_Time2 = Best_Deals_Table.Rows[i][1].ToString();
                    deal.Arr_Time1 = Best_Deals_Table.Rows[i][2].ToString();
                    deal.Arr_Time2 = Best_Deals_Table.Rows[i][2].ToString();
                    deal.Airlines_Name1 = Best_Deals_Table.Rows[i][3].ToString();
                    deal.Airlines_Name2 = Best_Deals_Table.Rows[i][3].ToString();
                    deal.Total_Time1 = Best_Deals_Table.Rows[i][4].ToString();
                    deal.Total_Time2 = Best_Deals_Table.Rows[i][4].ToString();
                    deal.Stop_Country1 = Best_Deals_Table.Rows[i][5].ToString();
                    deal.Stop_Country2 = Best_Deals_Table.Rows[i][5].ToString();
                    deal.Stop_City = Best_Deals_Table.Rows[i][6].ToString();
                    deal.Stop_Duration = Best_Deals_Table.Rows[i][7].ToString();
                    deal.PRice = Best_Deals_Table.Rows[i][8].ToString();
                    deal.Flight_Type = Best_Deals_Table.Rows[i][9].ToString();
                    deal.Class_Type = Best_Deals_Table.Rows[i][10].ToString();
                    deals[i] = deal;
                    BestDealsFP.Controls.Add(deal);
                }
            }
        }

        private void BestDealsFP_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
