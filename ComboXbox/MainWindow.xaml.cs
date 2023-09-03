//using MySql.Data.MySqlClient;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace ComboXbox
{
    //TODO: Se resolvio el error de categoria en el CRUD, actualizar vista para agregar administrador de categorias.

    public partial class MainWindow : Window
    {
        SqlConnection MyConnection;
        
        public MainWindow()
        {
            InitializeComponent();

            string myConnectionString = ConfigurationManager.ConnectionStrings["ComboXbox.Properties.Settings.SQLDBConnectionString"].ConnectionString;

            MyConnection = new SqlConnection(myConnectionString);

            MostrarCategorias();
            //MuestraProductos();
        }

        private void MuestraProductos()
        {
            try
            {
                string consulta = "SELECT * FROM Productos WHERE Categoria = @CATEGORIASELECTED ORDER BY Nombre";
                SqlCommand MyCommand = new SqlCommand(consulta, MyConnection);
                SqlDataAdapter MyDataAdapter = new SqlDataAdapter(MyCommand);

                using (MyDataAdapter)
                {
                    MyCommand.Parameters.AddWithValue("@CATEGORIASELECTED", boxCategoria.SelectedValue);

                    DataTable TableProducto = new DataTable();

                    MyDataAdapter.Fill(TableProducto);

                    productInfoListBox.DisplayMemberPath = "Nombre";
                    productInfoListBox.SelectedValuePath = "Id";
                    productInfoListBox.ItemsSource = TableProducto.DefaultView;
                }
            }catch (Exception ex)
            {
                //MessageBox.Show(ex.ToString);
                MessageBox.Show("Error en el programa:\n" + ex);
            }
        }

        private void MuestraInfoProducto()
        {
            try
            {
                string consulta = "SELECT Descripcion FROM Productos WHERE Id = @ProductoId";
                SqlCommand CommandSQL = new SqlCommand(consulta, MyConnection);
                SqlDataAdapter MyDataAdapter = new SqlDataAdapter(CommandSQL);

                using (MyDataAdapter)
                {
                    CommandSQL.Parameters.AddWithValue("@ProductoId", productInfoListBox.SelectedValue);
                    
                    DataTable TableProductos = new DataTable();

                    MyDataAdapter.Fill(TableProductos);

                    productInfoSelected.DisplayMemberPath = "Descripcion";
                    productInfoSelected.SelectedValuePath = "Id";
                    productInfoSelected.ItemsSource = TableProductos.DefaultView;
               
                }
            }
            catch (Exception ex)
            {
                //MessageBox.Show(ex.ToString);
                MessageBox.Show("Error en el programa " + ex);
            }
        }

        private void MuestraDisponibilidad()
        {
            try
            {
                string consulta = "SELECT CONCAT('Disponibilidad local: ', [Disponibilidad Local], '\nDisponibilidad Miami: '," +
                    " [Disponibilidad Miami]) AS DispCompleta FROM Almacen A INNER JOIN Productos P ON A.Id = P.Id WHERE A.Id = @ProductoId";

                SqlCommand CommandSQL = new SqlCommand(consulta, MyConnection);
                SqlDataAdapter myDataAdapter = new SqlDataAdapter(CommandSQL);

                using (myDataAdapter)
                {
                    CommandSQL.Parameters.AddWithValue("@ProductoId", productInfoListBox.SelectedValue);
                    DataTable TableProductos = new DataTable();

                    myDataAdapter.Fill(TableProductos);

                    ProductDisponibilidad.DisplayMemberPath = "DispCompleta";
                    ProductDisponibilidad.SelectedValuePath = "Id";
                    ProductDisponibilidad.ItemsSource = TableProductos.DefaultView;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error en el programa: \n" + ex);
            }
        }

        private void MostrarCategorias()
        {
            try
            {
                string consulta = "SELECT Categoria FROM Categorias";
                SqlDataAdapter myDataAdapter = new SqlDataAdapter(consulta, MyConnection);

                using (myDataAdapter)
                {
                    DataTable TablaDatos = new DataTable();
                    myDataAdapter.Fill(TablaDatos);

                    boxCategoria.DisplayMemberPath = "Categoria";
                    boxCategoria.SelectedValuePath = "Categoria";
                    boxCategoria.ItemsSource = TablaDatos.DefaultView;
                }
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        } 

        private void productInfoListBox_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            MuestraInfoProducto();
            MuestraDisponibilidad();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            try
            {
                string consulta = "DELETE FROM Productos WHERE ID=@PRODUCTO";

                SqlCommand CommandSql = new SqlCommand(consulta, MyConnection);
                MyConnection.Open();

                CommandSql.Parameters.AddWithValue("@PRODUCTO", productInfoListBox.SelectedValue);

                CommandSql.ExecuteNonQuery();

                MuestraProductos();

                MyConnection.Close();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            Ventana2 InsertarVentana = new Ventana2();
            InsertarVentana.ShowDialog();

            MuestraProductos();
        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            Actualizar ActualizarVentana = new Actualizar((int)productInfoListBox.SelectedValue);

            try
            {
                string consulta = "SELECT Nombre, Descripcion, Categoria FROM Productos WHERE Id = @SelectedId";

                SqlCommand myCommandSql = new SqlCommand(consulta, MyConnection);
                SqlDataAdapter myDataAdapter = new SqlDataAdapter(myCommandSql);

                using (myDataAdapter)
                {
                    myCommandSql.Parameters.AddWithValue("@SelectedId", productInfoListBox.SelectedValue);

                    DataTable TablaProductos = new DataTable();
                    myDataAdapter.Fill(TablaProductos);

                    ActualizarVentana.ActualizarNombre.Text = TablaProductos.Rows[0]["Nombre"].ToString();
                    ActualizarVentana.ActualizarDescripcion.Text = TablaProductos.Rows[0]["Descripcion"].ToString();
                    ActualizarVentana.ActualizarCategoria.Text = TablaProductos.Rows[0]["Categoria"].ToString();
                }

                ActualizarVentana.ShowDialog();
            }
            catch
            {
                MessageBox.Show("Selecciones un producto.");
            }

            MuestraProductos();
        }

        private void boxCategoria_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            MuestraProductos();
        }
    }
}
