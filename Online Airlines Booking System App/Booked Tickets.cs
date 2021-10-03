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
    public partial class Booked_Tickets : Form
    {
        DataLayer dl;
        DataTable Booked_Tickects_Table;
        public Booked_Tickets()
        {
            InitializeComponent();
            dl = new DataLayer(@".\SQLEXPRESS", "Project_DB");
        }

        private void Booked_Tickets_Load(object sender, EventArgs e)
        {
            object[,] param = new object[2, 1];
            param[0, 0] = "@Login_id";
            param[1, 0] = Login.Login_Id;
            
            Booked_Tickects_Table = dl.GetData("Booked_Tickets_Description", param, "Booked_Tickects_Table");


            BookedTicketsForm[] booked_tickets = new BookedTicketsForm[Booked_Tickects_Table.Rows.Count];
            for (int i = 0; i < Booked_Tickects_Table.Rows.Count; i++)
            {
                BookedTicketsForm booked_ticket = new BookedTicketsForm();
                booked_ticket.Ticket_id = (int)Booked_Tickects_Table.Rows[i][0];
                booked_ticket.PNAME = Booked_Tickects_Table.Rows[i][28].ToString();
                booked_ticket.PNAme2= Booked_Tickects_Table.Rows[i][28].ToString();
                booked_ticket.DEp_Country = Booked_Tickects_Table.Rows[i][8].ToString();
                booked_ticket.DEp_Country2 = Booked_Tickects_Table.Rows[i][8].ToString();
                booked_ticket.ARr_Country = Booked_Tickects_Table.Rows[i][10].ToString();
                booked_ticket.ARr_Country2 = Booked_Tickects_Table.Rows[i][10].ToString();
                booked_ticket.Flight_Num = Booked_Tickects_Table.Rows[i][6].ToString();
                booked_ticket.Flight_Num2 = Booked_Tickects_Table.Rows[i][6].ToString();
                booked_ticket.DEp_Date = Booked_Tickects_Table.Rows[i][13].ToString();
                booked_ticket.DEp_Date2 = Booked_Tickects_Table.Rows[i][13].ToString();
                booked_ticket.Seat_Num = Booked_Tickects_Table.Rows[i][23].ToString();

                booked_tickets[i] = booked_ticket;

                Booked_TickectsFP.Controls.Add(booked_ticket);
            }
        }

        private void Booked_TickectsFP_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
