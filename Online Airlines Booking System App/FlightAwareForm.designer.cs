
namespace WindowsFormsApp2
{
    partial class FlightAwareForm
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label6 = new System.Windows.Forms.Label();
            this.Arr_Country = new System.Windows.Forms.Label();
            this.Dep_Country = new System.Windows.Forms.Label();
            this.Flight_num = new System.Windows.Forms.Label();
            this.Time = new System.Windows.Forms.Label();
            this.Airline = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(738, 36);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(35, 13);
            this.label6.TabIndex = 7;
            this.label6.Text = "label6";
            // 
            // Arr_Country
            // 
            this.Arr_Country.AutoSize = true;
            this.Arr_Country.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Arr_Country.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(64)))), ((int)(((byte)(0)))));
            this.Arr_Country.Location = new System.Drawing.Point(540, 28);
            this.Arr_Country.Name = "Arr_Country";
            this.Arr_Country.Size = new System.Drawing.Size(73, 13);
            this.Arr_Country.TabIndex = 12;
            this.Arr_Country.Text = "Arr_Country";
            // 
            // Dep_Country
            // 
            this.Dep_Country.AutoSize = true;
            this.Dep_Country.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Dep_Country.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(64)))), ((int)(((byte)(0)))));
            this.Dep_Country.Location = new System.Drawing.Point(361, 28);
            this.Dep_Country.Name = "Dep_Country";
            this.Dep_Country.Size = new System.Drawing.Size(80, 13);
            this.Dep_Country.TabIndex = 11;
            this.Dep_Country.Text = "Dep_Country";
            // 
            // Flight_num
            // 
            this.Flight_num.AutoSize = true;
            this.Flight_num.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Flight_num.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(64)))), ((int)(((byte)(0)))));
            this.Flight_num.Location = new System.Drawing.Point(192, 28);
            this.Flight_num.Name = "Flight_num";
            this.Flight_num.Size = new System.Drawing.Size(58, 13);
            this.Flight_num.TabIndex = 10;
            this.Flight_num.Text = "Flight No";
            // 
            // Time
            // 
            this.Time.AutoSize = true;
            this.Time.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Time.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(64)))), ((int)(((byte)(0)))));
            this.Time.Location = new System.Drawing.Point(112, 28);
            this.Time.Name = "Time";
            this.Time.Size = new System.Drawing.Size(34, 13);
            this.Time.TabIndex = 8;
            this.Time.Text = "Time";
            // 
            // Airline
            // 
            this.Airline.AutoSize = true;
            this.Airline.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Airline.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(64)))), ((int)(((byte)(0)))));
            this.Airline.Location = new System.Drawing.Point(24, 28);
            this.Airline.Name = "Airline";
            this.Airline.Size = new System.Drawing.Size(42, 13);
            this.Airline.TabIndex = 9;
            this.Airline.Text = "Airline";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(64)))), ((int)(((byte)(0)))));
            this.label1.Location = new System.Drawing.Point(290, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(34, 13);
            this.label1.TabIndex = 13;
            this.label1.Text = "From";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(64)))), ((int)(((byte)(0)))));
            this.label2.Location = new System.Drawing.Point(485, 28);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(22, 13);
            this.label2.TabIndex = 14;
            this.label2.Text = "To";
            // 
            // FlightAwareForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.Arr_Country);
            this.Controls.Add(this.Dep_Country);
            this.Controls.Add(this.Flight_num);
            this.Controls.Add(this.Time);
            this.Controls.Add(this.Airline);
            this.Controls.Add(this.label6);
            this.Name = "FlightAwareForm";
            this.Size = new System.Drawing.Size(631, 70);
            this.Load += new System.EventHandler(this.FlightAwareForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label Arr_Country;
        private System.Windows.Forms.Label Dep_Country;
        private System.Windows.Forms.Label Flight_num;
        private System.Windows.Forms.Label Time;
        private System.Windows.Forms.Label Airline;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
    }
}
