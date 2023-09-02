using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Common;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace ComboXbox
{
    /// <summary>
    /// Lógica de interacción para Actualizar.xaml
    /// </summary>
    public partial class Actualizar : Window
    {
        SqlConnection MyConnection;
        private int numId;
        public Actualizar(int auxId)
        {
            InitializeComponent();

            numId = auxId;

            string myConnectionString = ConfigurationManager.ConnectionStrings["ComboXbox.Properties.Settings.SQLDBConnectionString"].ConnectionString;
            MyConnection = new SqlConnection(myConnectionString);

            MuestraCategorias();
        }

        private void MuestraCategorias()
        {
            string consulta = "SELECT Categoria FROM Categorias";
            SqlDataAdapter MyDataAdapter = new SqlDataAdapter(consulta, MyConnection);

            using (MyDataAdapter)
            {
                DataTable MyTable = new DataTable();
                MyDataAdapter.Fill(MyTable);

                ActualizarCategoria.DisplayMemberPath = "Categoria";
                ActualizarCategoria.SelectedValuePath = "Id";
                ActualizarCategoria.ItemsSource = MyTable.DefaultView;
            }
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {
                string consulta = "UPDATE Productos SET Nombre = @NOMBRE, Descripcion = @DESCRIPCION, Categoria = @CATEGORIA WHERE Id =" + numId;

                SqlCommand MyCommand = new SqlCommand(consulta, MyConnection);
                
                MyConnection.Open();

                MyCommand.Parameters.AddWithValue("@NOMBRE", ActualizarNombre.Text);
                MyCommand.Parameters.AddWithValue("@DESCRIPCION", ActualizarDescripcion.Text);
                MyCommand.Parameters.AddWithValue("@CATEGORIA", ActualizarCategoria.Text);

                MyCommand.ExecuteNonQuery();

                MyConnection.Close();

                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
