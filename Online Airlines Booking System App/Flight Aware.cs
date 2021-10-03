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
    public partial class Flight_Aware : Form
    {
        DataLayer dl;
        DataTable Incoming_Flights_Table;
        DataTable Outgoing_Flights_Table;
        public Flight_Aware()
        {
            InitializeComponent();
            dl = new DataLayer(@".\SQLEXPRESS", "Project_DB");
        }

        private void Flight_Aware_Load(object sender, EventArgs e)
        {
            
            object[,] param = new object[2, 1];
            param[0, 0] = "@Login_id";
            param[1, 0] = Login.Login_Id;
            Incoming_Flights_Table = dl.GetData("Incoming_Flights", param, "Incoming_Flights_Table");
            Outgoing_Flights_Table = dl.GetData("Outgoing_Flights", param, "Outgoing_Flights_Table");

            FlightAwareForm[] incoming_flights = new FlightAwareForm[Incoming_Flights_Table.Rows.Count];
            for (int i = 0; i < Incoming_Flights_Table.Rows.Count; i++)
            {
                FlightAwareForm incoming_flight = new FlightAwareForm();
                incoming_flight.AIrline = Incoming_Flights_Table.Rows[i][0].ToString();
                incoming_flight.TIme= Incoming_Flights_Table.Rows[i][3].ToString();
                incoming_flight.Flight_Num = Incoming_Flights_Table.Rows[i][2].ToString();
                incoming_flight.DEp_Country = Incoming_Flights_Table.Rows[i][1].ToString();
                incoming_flight.ARr_Country = "";
                incoming_flight.Label2 = "";
                incoming_flights[i] = incoming_flight;

                Incoming_FlightsFP.Controls.Add(incoming_flight);
            }

            FlightAwareForm[] outgoing_flights = new FlightAwareForm[Outgoing_Flights_Table.Rows.Count];
            for (int i = 0; i < Outgoing_Flights_Table.Rows.Count; i++)
            {
                FlightAwareForm outgoing_flight = new FlightAwareForm();
                outgoing_flight.AIrline = Outgoing_Flights_Table.Rows[i][0].ToString();
                outgoing_flight.TIme = Outgoing_Flights_Table.Rows[i][3].ToString();
                outgoing_flight.Flight_Num = Outgoing_Flights_Table.Rows[i][2].ToString();
                outgoing_flight.DEp_Country = "";
                outgoing_flight.ARr_Country = Outgoing_Flights_Table.Rows[i][1].ToString();
                outgoing_flight.Label1 = "";
                outgoing_flights[i] = outgoing_flight;

                Outgoing_FlightsFP.Controls.Add(outgoing_flight);
            }
        }

        private void guna2GradientPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void Incoming_FlightsFP_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
