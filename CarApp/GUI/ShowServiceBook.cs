using CarApp.BusinessLayer;
using CarApp.BusinessLayer.Operations;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CarApp.GUI
{
    public partial class ShowServiceBook : Form
    {
        public ShowServiceBook()
        {
            InitializeComponent();
            LoadDataInDataGrid();
        }
        private void dataGridView1_Load(object sender, EventArgs e)
        {

        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        private void LoadDataInDataGrid()
        {
            var result = new GetServiceTypes();
            OperationManager instance= new OperationManager();
            var operacija = instance.Exec(result);

        }
    }
}
