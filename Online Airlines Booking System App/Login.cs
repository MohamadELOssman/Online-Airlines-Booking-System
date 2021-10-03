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
    
    public partial class Login : Form
    {
        public static string Container_Status = "";
        public Ticket t = new Ticket();
        public static int Login_Id;
        public static int Passenger_Id;
        public int Login_Status=0;

        string Username, Password;
        DataLayer dl;

        public Login()
        {
            InitializeComponent();
            dl = new DataLayer(@".\SQLEXPRESS", "Project_DB");
        }
        
        private void guna2TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void guna2Button1_Click(object sender, EventArgs e)
        {
            Username = Username_TextBox.Text;
            Password = Password_TextBox.Text;
            string command = "SELECT dbo.User_Login('" + Username + "','" + Password + "')";
            Login_Status= (int)dl.GetValue(command);


            if (Login_Status == 1)
            {
                Wrong_Login.Text = "";
                command = "SELECT dbo.Get_Login_id('" + Username + "','" + Password + "')";
                Login_Id = (int)dl.GetValue(command);
                command = "SELECT dbo.Get_Passenger_ID('" + Login_Id + "')";
                Passenger_Id = (int)dl.GetValue(command);
                Principal p = new Principal();
                p.Show();
                this.Hide();
                l.Text = Login_Id.ToString();

            }

            else 
            {
                Wrong_Login.Text = "Wrong Username or Password";
            }

        }

        private void guna2Button2_Click(object sender, EventArgs e)
        {
            Create_Account c = new Create_Account();
            c.Show();
        }

        private void guna2GradientPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void Login_Load(object sender, EventArgs e)
        {



        }
    }
}
