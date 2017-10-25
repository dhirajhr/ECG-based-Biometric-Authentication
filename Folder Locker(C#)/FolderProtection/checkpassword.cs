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
                
                //ecg 

                // Create the MATLAB instance 
                MLApp.MLApp matlab = new MLApp.MLApp();

                // Change to the directory where the function is located 
                matlab.Execute(@"cd C:\Users\Hp1\Desktop");

                // Define the output 
                object result = null;

                // Call the MATLAB function myfunc
                matlab.Feval("chk_general", 0, out result);// show dialog of arduino
                matlab.Feval("dwt_test", 2, out result, textBox1.Text + ".txt", "C:/Users/Hp1/Desktop/ardiecg/test/"+textBox1.Text+".txt", "C:/Users/Hp1/Desktop/ardiecg/train");
              //  int milliseconds = 5000;
               //  System.Threading.Thread.Sleep(milliseconds);
                // Display result 
                object[] res = result as object[];

               // Console.WriteLine(res[0]);
                //Console.WriteLine(res[1]);
                System.Diagnostics.Debug.WriteLine(res[0]);
                System.Diagnostics.Debug.WriteLine(res[1]);
                //Console.ReadLine();
                if ((textBox1.Text+".txt").Equals(res[0]))
                {
                    status = true;
                    this.Close();
                }
                //ecg
                else {
                  //  int milliseconds = 10000;
                  //  System.Threading.Thread.Sleep(milliseconds);
              
                    System.Threading.Thread.Sleep(5000);
                    MessageBox.Show("Signal Not Identified!!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    status = false;
                }

    
            
            }
            else
            {
              //  int milliseconds = 10000;
                System.Threading.Thread.Sleep(5000);
                MessageBox.Show("Signal Not Identified!!", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                status = false;
            }
           
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void checkpassword_Load(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }
    }
}