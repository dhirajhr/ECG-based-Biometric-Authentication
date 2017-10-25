using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.IO;
using System.Xml;

namespace FolderProtection
{
    public partial class Form1 : Form
    {
        public string status;
        //bool flag = true;
        string[] arr;
        private string _pathkey;
        public Form1()
        {
            InitializeComponent();
            arr = new string[6];
            status = "";
            arr[0] = ".{2559a1f2-21d7-11d4-bdaf-00c04f60b9f0}";
            arr[1] = ".{21EC2020-3AEA-1069-A2DD-08002B30309D}";
            arr[2] = ".{2559a1f4-21d7-11d4-bdaf-00c04f60b9f0}";
            arr[3] = ".{645FF040-5081-101B-9F08-00AA002F954E}";
            arr[4] = ".{2559a1f1-21d7-11d4-bdaf-00c04f60b9f0}";
            arr[5] = ".{7007ACC7-3202-11D1-AAD2-00805FC1270E}";
        }
        public string pathkey
        {
            get { return _pathkey; }
            set { _pathkey=value; }
        }
         private void button1_Click(object sender, EventArgs e)
        {
            if (radioButton1.Checked)
                status = arr[0];
            else if (radioButton2.Checked)
                status = arr[1];
            else if (radioButton3.Checked)
                status = arr[2];
            else if (radioButton4.Checked)
                status = arr[3];
            else if (radioButton5.Checked)
                status = arr[4];
            else if (radioButton6.Checked)
                status = arr[5];

            if (folderBrowserDialog1.ShowDialog() == DialogResult.OK)
            { 
                
                DirectoryInfo d = new DirectoryInfo(folderBrowserDialog1.SelectedPath);
                string selectedpath = d.Parent.FullName + d.Name;
                if (folderBrowserDialog1.SelectedPath.LastIndexOf(".{") == -1)
                {
                    if (checkBox1.Checked)
                        setpassword(folderBrowserDialog1.SelectedPath);
                    if (!d.Root.Equals(d.Parent.FullName))
                    d.MoveTo(d.Parent.FullName + "\\" + d.Name + status);
                    else d.MoveTo(d.Parent.FullName + d.Name + status);
                    textBox1.Text = folderBrowserDialog1.SelectedPath;
                    pictureBox1.Image = Image.FromFile(Application.StartupPath + "\\lock.jpg");
                }
                else
                {
                    status = getstatus(status);
                    bool s = false;
                     s=checkpassword();
                   // bool s = true;
                    if (s)
                    {
                        //File.SetAttributes(folderBrowserDialog1.SelectedPath + "\\p.xml", FileAttributes.Normal);
                        
                       File.Delete(folderBrowserDialog1.SelectedPath + "\\p.xml");
                       // File.SetAttributes(folderBrowserDialog1.SelectedPath + "\\p.xml", FileAttributes.Normal);
 
                        d.MoveTo(folderBrowserDialog1.SelectedPath.Substring(0, folderBrowserDialog1.SelectedPath.LastIndexOf(".")));
                       textBox1.Text = folderBrowserDialog1.SelectedPath.Substring(0, folderBrowserDialog1.SelectedPath.LastIndexOf("."));
                        pictureBox1.Image = Image.FromFile(Application.StartupPath + "\\unlock.jpg");
                    }
                }
            }
        }
        
        private bool checkpassword()
        {
            XmlTextReader read;
            if(pathkey ==null)
            read = new XmlTextReader(folderBrowserDialog1.SelectedPath + "\\p.xml");
            else
            read = new XmlTextReader(pathkey + "\\p.xml");
            if (read.ReadState == ReadState.Error)
            {
                read.Close();
                return true;
            }
            else
            {
                try
                {
                    while (read.Read())
                        if (read.NodeType == XmlNodeType.Text)
                        {
                            checkpassword c = new checkpassword();
                            c.pass = read.Value;
                            if (c.ShowDialog() == DialogResult.OK)
                            {
                                read.Close();
                                return c.status;
                            }


                        }
                }
                catch(Exception ex) { 
                    read.Close();//editedd at 2:00am
                    //Console.WriteLine();
                    System.Diagnostics.Debug.WriteLine(ex.ToString());
                    return true; }

            }
            read.Close();
            return false;
        }

        private Boolean setpassword(string path)
        {
            password p = new password();
            p.path = path;
            p.ShowDialog();
            return true;
        }
        private string getstatus(string stat)
        {
            for (int i = 0; i < 6; i++)
                if (stat.LastIndexOf(arr[i]) != -1)
                    stat = stat.Substring(stat.LastIndexOf("."));
            return stat;
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            if (this.pathkey != null)
            {
                
                    DirectoryInfo d = new DirectoryInfo(pathkey);
                    string selectedpath = d.Parent.FullName + d.Name;
                    if (pathkey.LastIndexOf(".{") == -1)
                    {
                        textBox1.Text=pathkey;
                        DialogResult r;
                        r = MessageBox.Show("Do You want to set password ? ", "Question?", MessageBoxButtons.YesNo);
                        if (r == DialogResult.Yes)
                        {
                            setpassword(pathkey);
                        }
                        status = arr[0];
                        if (!d.Root.Equals(d.Parent.FullName))
                            d.MoveTo(d.Parent.FullName + "\\" + d.Name + status);
                        else d.MoveTo(d.Parent.FullName + d.Name + status);
                        pictureBox1.Image = Image.FromFile(Application.StartupPath + "\\lock.jpg");
                    }
                    else
                    {
                    status = getstatus(status);
                    bool s=checkpassword();
                    if (s)
                    {
                        File.Delete(pathkey + "\\p.xml");
                        d.MoveTo(pathkey.Substring(0, pathkey.LastIndexOf(".")));
                        textBox1.Text = pathkey.Substring(0, pathkey.LastIndexOf("."));
                        pictureBox1.Image = Image.FromFile(Application.StartupPath + "\\unlock.jpg");
                    }
                }
            }
        }

    }
}