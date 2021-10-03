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
    public partial class Create_Account : Form
    {
        DataLayer dl;
        public Create_Account()
        {
            InitializeComponent();
            dl = new DataLayer(@".\SQLEXPRESS", "Project_DB");
        }

        private void guna2TextBox18_TextChanged(object sender, EventArgs e)
        {

        }

        private void guna2TextBox6_TextChanged(object sender, EventArgs e)
        {

        }

        private void guna2TextBox17_TextChanged(object sender, EventArgs e)
        {

        }

        private void Create_Account_Load(object sender, EventArgs e)
        {

        }

        private void Nationality_CA_TextChanged(object sender, EventArgs e)
        {

        }

        private void Add_city_CA_TextChanged(object sender, EventArgs e)
        {

        }

        private void guna2GradientPanel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void guna2Panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        private void guna2PictureBox1_Click(object sender, EventArgs e)
        {

        }

        private void guna2Button5_Click(object sender, EventArgs e)
        {

        }

        private void guna2Button2_Click(object sender, EventArgs e)
        {

        }

        private void Proname_CA_TextChanged(object sender, EventArgs e)
        {

        }

        private void Name_CA_TextChanged(object sender, EventArgs e)
        {

        }

        private void Age_CA_TextChanged(object sender, EventArgs e)
        {

        }

        private void Gender_CA_TextChanged(object sender, EventArgs e)
        {

        }

        private void guna2TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void Sign_Up_Button_Click(object sender, EventArgs e)
        {
            object[,] param = new object[2, 18];
            param[0, 0] = "@PCR_test"; param[1, 0] = "negative";
            param[0, 1] = "@PCR_date"; param[1, 1] = "2021 - 06 - 17";
            param[0, 2] = "@Name"; param[1, 2] = PName.Text;
            param[0, 3] = "@Proname"; param[1, 3] = Proname.Text;
            param[0, 4] = "@Gender"; param[1, 4] = Gender.Text;
            param[0, 5] = "@Age"; param[1, 5] = Age.Text;
            param[0, 6] = "@Nationality"; param[1, 6] = Nationality.Text;
            param[0, 7] = "@Balance"; param[1, 7] = Balance.Text;
            param[0, 8] = "@Mobile"; param[1, 8] = Mobile.Text;
            param[0, 9] = "@Email"; param[1, 9] = Email.Text;
            param[0, 10] = "@Address_country"; param[1, 10] = Address_Country.Text;
            param[0, 11] = "@Address_city"; param[1, 11] = Address_City.Text;
            param[0, 12] = "@Street"; param[1, 12] = Street.Text;
            param[0, 13] = "@House_num"; param[1, 13] = House_Number.Text;
            param[0, 14] = "@Floor"; param[1, 14] = Floor.Text;
            param[0, 15] = "@Postal_Code"; param[1, 15] = Postal_Code.Text;
            param[0, 16] = "@Username"; param[1, 16] = Username.Text;
            param[0, 17] = "@Password"; param[1, 17] = Password.Text;

            dl.ExecuteActionCommand("Create_Account", param);
            this.Hide();

        }
    }
}
