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
    public partial class Best_Deal : UserControl
    {
        public bool details_button = false;
        public int Ticketid;
        DataLayer dl;
        public Best_Deal()
        {
            InitializeComponent();
            dl = new DataLayer(@".\SQLEXPRESS", "Project_DB");
        }

        
        public int TicketID
        {
            get { return Ticketid; }
            set { Ticketid = value; }
        }
        public string Dep_Time1
        {
            get { return Dep_time1.Text; }
            set { Dep_time1.Text = value; }
        }
        public string Dep_Time2
        {
            get { return Dep_time2.Text; }
            set { Dep_time2.Text = value; }
        }
        public string Airlines_Name1
        {
            get { return Airlines_name1.Text; }
            set { Airlines_name1.Text = value; }
        }
        public string Airlines_Name2
        {
            get { return Airlines_name2.Text; }
            set { Airlines_name2.Text = value; }
        }
        public string Arr_Time1
        {
            get { return Arr_time1.Text; }
            set { Arr_time1.Text = value; }
        }
        public string Arr_Time2
        {
            get { return Arr_time2.Text; }
            set { Arr_time2.Text = value; }
        }
        public string Flight_Type
        {
            get { return Flight_type.Text; }
            set { Flight_type.Text = value; }
        }
        public string Total_Time1
        {
            get { return Total_time1.Text; }
            set { Total_time1.Text = value; }
        }

        public string Total_Time2
        {
            get { return Total_time2.Text; }
            set { Total_time2.Text = value; }
        }
        public string Stop_Country1
        {
            get { return Stop_country1.Text; }
            set { Stop_country1.Text = value; }
        }

        public string Stop_Country2
        {
            get { return Stop_country2.Text; }
            set { Stop_country2.Text = value; }
        }

        public string Stop_City
        {
            get { return Stop_city.Text; }
            set { Stop_city.Text = value; }
        }

        public string Stop_Duration
        {
            get { return Stop_duration.Text; }
            set { Stop_duration.Text = value; }
        }
        public string PRice
        {
            get { return Price.Text; }
            set { Price.Text = value; }
        }
        public string Class_Type
        {
            get { return Class_type.Text; }
            set { Class_type.Text = value; }
        }
        public string Dep_Airport
        {
            get { return Dep_airport.Text; }
            set { Dep_airport.Text = value; }
        }
        public string Ar_Airport
        {
            get { return Ar_airport.Text; }
            set { Ar_airport.Text = value; }
        }
        private void Best_Deal_Load(object sender, EventArgs e)
        {
            this.Height = 90;
        }

        private void guna2Button2_Click(object sender, EventArgs e)
        {
            if (!details_button) { this.Height = 180; details_button = true; }
            else { this.Height = 90; details_button = false; }
        }

        private void guna2GradientPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            object[,] param = new object[2, 2];
            param[0, 0] = "@Passenger_id";
            param[1, 0] = Login.Passenger_Id;
            param[0, 1] = "@Ticket_id";
            param[1, 1] = Ticketid;
            dl.ExecuteActionCommand("Booking_Ticket", param);
            this.Hide();
        }
    }
}
