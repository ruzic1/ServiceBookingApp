using CarApp.BusinessLayer;
using CarApp.BusinessLayer.DTO;
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
            var options = new GetServiceTypes();
            OperationManager instance = new OperationManager();
            var operacija=instance.Exec(options);

            //this.comboBox2.DataSource = operacija.Data.ToList();
            var dataSource = operacija.Data.ToList();

            var firstElement = new ServiceTypeDTO
            {
                Id = 0,
                Name = "Ništa od navedenog"
            };

            dataSource.Insert(0,firstElement);
            //this.comboBox2.DataSource = null;
            this.comboBox2.DisplayMember = "Name";
            this.comboBox2.ValueMember = "Id";
            this.comboBox2.DataSource = dataSource;
            //this.comboBox2.Refresh();
            //this.comboBox2.Invalidate();

            this.comboBox2.SelectedItem = firstElement;
            //this.comboBox2.SelectedItem = firstElement;
            //this.comboBox2.DisplayMember = "Name";
            //this.btnFinishService.Enabled = false;
            //this.comboBox2.SelectedItem= firstItem;
            //this.comboBox2.DisplayMember = "Name";
            //this.btnFinishService.Enabled = false;

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
            var result = new GetServices();
            result.Keyword = this.textBox1.Text;
            OperationManager instance = new OperationManager();
            var operacija = instance.Exec(result);
            if (operacija.IsSuccessful)
            {
                //Console.WriteLine(operacija);
                dataGridView1.DataSource = operacija.Data;
            }
            else
            {
                Console.WriteLine("Nije definisano");
            }

        }

        private void button3_Click(object sender, EventArgs e)
        {
            LoadDataInDataGrid();
        }
    }
}
