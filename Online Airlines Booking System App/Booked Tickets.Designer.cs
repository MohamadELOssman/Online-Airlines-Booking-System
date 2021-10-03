namespace WindowsFormsApp2
{
    partial class Booked_Tickets
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Booked_Tickets));
            this.Booked_TickectsFP = new System.Windows.Forms.FlowLayoutPanel();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // Booked_TickectsFP
            // 
            this.Booked_TickectsFP.BackColor = System.Drawing.Color.White;
            this.Booked_TickectsFP.Location = new System.Drawing.Point(202, 179);
            this.Booked_TickectsFP.Name = "Booked_TickectsFP";
            this.Booked_TickectsFP.Size = new System.Drawing.Size(574, 436);
            this.Booked_TickectsFP.TabIndex = 0;
            this.Booked_TickectsFP.Paint += new System.Windows.Forms.PaintEventHandler(this.Booked_TickectsFP_Paint);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("SansSerif", 16F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.ForeColor = System.Drawing.Color.MidnightBlue;
            this.label2.Location = new System.Drawing.Point(330, 137);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(331, 26);
            this.label2.TabIndex = 2;
            this.label2.Text = "Find Your Booked Ticket HERE";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Transparent;
            this.label3.Location = new System.Drawing.Point(661, 204);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(0, 13);
            this.label3.TabIndex = 3;
            // 
            // Booked_Tickets
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(152)))), ((int)(((byte)(168)))), ((int)(((byte)(181)))));
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(978, 627);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.Booked_TickectsFP);
            this.Name = "Booked_Tickets";
            this.Text = "Booked_Tickets";
            this.Load += new System.EventHandler(this.Booked_Tickets_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.FlowLayoutPanel Booked_TickectsFP;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
    }
}