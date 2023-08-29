using System;
using System.Collections.Generic;
using System.Configuration;
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
        SqlConnection myConnection;
        private int numId;
        public Actualizar(int auxId)
        {
            InitializeComponent();

            numId = auxId;

            string myConnectionString = ConfigurationManager.ConnectionStrings["ComboXbox.Properties.Settings.SQLDBConnectionString"].ConnectionString;
            myConnection = new SqlConnection(myConnectionString);
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {
                string consulta = "UPDATE Productos SET Nombre = @NOMBRE, Descripcion = @DESCRIPCION, Categoria = @CATEGORIA WHERE Id =" + numId;

                SqlCommand myCommand = new SqlCommand(consulta, myConnection);
                
                myConnection.Open();

                myCommand.Parameters.AddWithValue("@NOMBRE", ActualizarNombre.Text);
                myCommand.Parameters.AddWithValue("@DESCRIPCION", ActualizarDescripcion.Text);
                myCommand.Parameters.AddWithValue("@CATEGORIA", ActualizarCategoria.Text);

                myCommand.ExecuteNonQuery();

                myConnection.Close();

                this.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }
    }
}
