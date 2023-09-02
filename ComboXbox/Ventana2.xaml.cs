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
    /// Lógica de interacción para Ventana2.xaml
    /// </summary>
    public partial class Ventana2 : Window
    {
        SqlConnection MyConnection;
        public Ventana2()
        {
            InitializeComponent();

            string myConnectionString = ConfigurationManager.ConnectionStrings["ComboXbox.Properties.Settings.SQLDBConnectionString"].ConnectionString;

            MyConnection = new SqlConnection(myConnectionString);

            MuestraCategoria();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string consulta = "INSERT INTO Productos (Nombre, Descripcion, Categoria) VALUES (@NOMBRE, @DESCRIPCION, @CATEGORIA)";
            SqlCommand ComandoSql = new SqlCommand(consulta, MyConnection);

            MyConnection.Open();

            ComandoSql.Parameters.AddWithValue("@NOMBRE", InsertarNombre.Text);
            ComandoSql.Parameters.AddWithValue("@DESCRIPCION", InsertarDescripcion.Text);
            ComandoSql.Parameters.AddWithValue("@CATEGORIA", InsertarCategoria.Text);
            ComandoSql.ExecuteNonQuery();

            MyConnection.Close();
            this.Close();
        }

        private void MuestraCategoria()
        {
            string consulta = "SELECT Categoria FROM Categorias";
            SqlDataAdapter MyDataAdapter = new SqlDataAdapter(consulta, MyConnection);

            using (MyDataAdapter)
            {
                MyConnection.Open();

                DataTable MyTable = new DataTable();
                MyDataAdapter.Fill(MyTable);

                InsertarCategoria.DisplayMemberPath = "Categoria";
                InsertarCategoria.SelectedValuePath = "IdCateogria";
                InsertarCategoria.ItemsSource = MyTable.DefaultView;

                MyConnection.Close();
            }
        }
    }
}
