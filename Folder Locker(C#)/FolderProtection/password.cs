using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Xml;

namespace FolderProtection
{
    public partial class password : Form
    {
        public string path;
        
        public password()
        {
            InitializeComponent();
     
        }

        private void button1_Click(object sender, EventArgs e)
        {
          //  if (textBox1.Text.Equals(textBox2.Text))
            //{
                XmlDocument xmldoc = new XmlDocument();
                XmlElement xmlelem;
                XmlNode xmlnode;
                XmlText xmltext;
                xmlnode = xmldoc.CreateNode(XmlNodeType.XmlDeclaration, "", "");
                xmldoc.AppendChild(xmlnode);
                xmlelem = xmldoc.CreateElement("", "ROOT", "");
               //xmltext = xmldoc.CreateTextNode(textBox1.Text);
                xmltext = xmldoc.CreateTextNode(textBox1.Text);
                xmlelem.AppendChild(xmltext);
                xmldoc.AppendChild(xmlelem);
                xmldoc.Save(path + "\\p.xml");
            
            //my stuff
                if (textBox1.Text != null)
                {
                    if (radioButton2.Checked)
                    {
                        //ecg 

                        // Create the MATLAB instance 
                        MLApp.MLApp matlab = new MLApp.MLApp();

                        // Change to the directory where the function is located 
                        matlab.Execute(@"cd C:\Users\Hp1\Desktop");

                        // Define the output 
                        object result = null;

                        // Call the MATLAB function myfunc
                        matlab.Feval("chk_inp", 1, out result, "C:/Users/Hp1/Desktop/ardiecg/train/" + textBox1.Text + ".txt");

                        // Display result 
                        object[] res = result as object[];

                        Console.WriteLine(res[0]);
                        //Console.WriteLine(res[1]);
                        //Console.ReadLine();

                        //ecg
                    }
                }
                else
                {
                    MessageBox.Show("Enter valid ID", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            
            
            //my stuff

                this.Close();
            //}
            /*else
            {
                MessageBox.Show("Two text do not match", "Error");
                textBox1.Clear();
                textBox2.Clear();
                textBox1.Focus();
            }*/
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

    }
}