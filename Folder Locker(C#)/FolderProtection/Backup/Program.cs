using System;
using System.Collections.Generic;
using System.Windows.Forms;

namespace FolderProtection
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main(string[] args)
        {
           
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Form1 f = new Form1();
            if (args.Length > 0)
                f.pathkey = args[0];
            Application.Run(f);
        }
    }
}