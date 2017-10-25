using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace FolderProtection
{
    public partial class checkpassword : Form
    {
        public string pass;
        public bool status;
        public checkpassword()
        {
            status = false;
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            if (textBox1.Text.Equals(pass))
            {
                status = true;
                this.Close();
            }
            else
            {
                MessageBox.Show("Incorrect Password!!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                status = false;
            }
           
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}