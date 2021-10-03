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
    public partial class BookedTicketsForm : UserControl
    {
        public int Ticket_id;
        DataLayer dl;
        public int Ticket_Id
        {
            get { return Ticket_id; }
            set { Ticket_id = value; }
        }
        public string PNAME
        {
            get { return PName.Text; }
            set { PName.Text = value; }
        }
        public string DEp_Country
        {
            get { return Dep_Country.Text; }
            set { Dep_Country.Text = value; }
        }
        public string ARr_Country
        {
            get { return Arr_Country.Text; }
            set { Arr_Country.Text = value; }
        }
        public string Flight_Num
        {
            get { return Flight_num.Text; }
            set { Flight_num.Text = value; }
        }
        public string DEp_Date
        {
            get { return Dep_Date.Text; }
            set { Dep_Date.Text = value; }
        }
        public string Seat_Num
        {
            get { return Seat_num.Text; }
            set { Seat_num.Text = value; }
        }
        public string PNAme2
        {
            get { return PName2.Text; }
            set { PName2.Text = value; }
        }

        public string DEp_Country2
        {
            get { return Dep_Country2.Text; }
            set { Dep_Country2.Text = value; }
        }
        public string ARr_Country2
        {
            get { return Arr_Country2.Text; }
            set { Arr_Country2.Text = value; }
        }

        public string Flight_Num2
        {
            get { return Flight_num2.Text; }
            set { Flight_num2.Text = value; }
        }
        public string DEp_Date2
        {
            get { return Dep_Date2.Text; }
            set { Dep_Date2.Text = value; }
        }

        public BookedTicketsForm()
        {
            InitializeComponent();
            dl = new DataLayer(@".\SQLEXPRESS", "Project_DB");
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void BookedTicektsForm_Load(object sender, EventArgs e)
        {

        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            object[,] param = new object[2,1];
            param[0, 0] = "@Ticket_id"; param[1, 0] = Ticket_Id;
            dl.ExecuteActionCommand("Refund_Ticket", param);
            this.Hide();
        }
    }
}
