using ADO.NetExtend.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ADO.NetExtend
{
    public partial class ADONetExtendUi : Form
    {
        string connectionString;
        SqlConnection sqlConnection;
        SqlCommand sqlCommand;
        string commandString;
        public ADONetExtendUi()
        {
            InitializeComponent();
            connectionString = @"Server=MDSHAHADAT; Database=StudentDB; Integrated Security=true;";
            sqlConnection = new SqlConnection(connectionString);
        }

        private void ADONetExtendUi_Load(object sender, EventArgs e)
        {
            LoadDepartment();
        }
        private void LoadDepartment()
        {
            commandString = @"Select * From Departments";
            sqlCommand = new SqlCommand(commandString, sqlConnection);
            sqlConnection.Open();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                departmentComboBox.DataSource = dataTable;
            }
            sqlConnection.Close();


        }

        private void SaveButton_Click(object sender, EventArgs e)
        {
            Student student = new Student();
            student.RollNo = Convert.ToInt32(rollNoTextBox.Text);
            student.Name = nameTextBox.Text;
            student.Age = Convert.ToInt32(ageTextBox.Text);
            student.DepartmentID =Convert.ToInt32( departmentComboBox.SelectedValue);
            student.Address = addressTextBox.Text;
            sqlConnection.Open();
            commandString = @"Insert Into Students(RollNo, Name, Age, DepartmentID, Address) Values ('"+student.RollNo+"','"+student.Name+"','"+student.Age+"','"+student.DepartmentID+"','"+student.Address+"')";
            sqlCommand = new SqlCommand(commandString, sqlConnection);

            int isExecuted = sqlCommand.ExecuteNonQuery();
            if (isExecuted > 0)
            {
                MessageBox.Show("Information Saved!");
            }
            else MessageBox.Show("Failed!");
            sqlConnection.Close();
        }

        private void ShowButton_Click(object sender, EventArgs e)
        {
            commandString = @"Select * From StudentsView";
            sqlCommand = new SqlCommand(commandString, sqlConnection);
            sqlConnection.Open();
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
            DataTable dataTable = new DataTable();
            sqlDataAdapter.Fill(dataTable);
            if (dataTable.Rows.Count > 0)
            {
                displayDataGridView.DataSource = dataTable;
            }
            sqlConnection.Close();
        }
    }
}
