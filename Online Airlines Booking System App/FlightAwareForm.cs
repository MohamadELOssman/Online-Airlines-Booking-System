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
    public partial class FlightAwareForm : UserControl
    {
        public string AIrline
        {
            get { return Airline.Text; }
            set { Airline.Text = value; }
        }
        public string Label1
        {
            get { return label1.Text; }
            set { label1.Text = value; }
        }
        public string Label2
        {
            get { return label2.Text; }
            set { label2.Text = value; }
        }
        public string TIme
        {
            get { return Time.Text; }
            set { Time.Text = value; }
        }
        public string Flight_Num
        {
            get { return Flight_num.Text; }
            set { Flight_num.Text = value; }
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

        public FlightAwareForm()
        {
            InitializeComponent();
        }

        private void FlightAwareForm_Load(object sender, EventArgs e)
        {

        }
    }
}
