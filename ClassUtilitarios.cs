using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI.WebControls;

namespace WebAppAgenda
{
    public class ClassUtilitarios
    {
        private SqlConnection _SqlConnection = new SqlConnection();
        private SqlDataAdapter _SqlDataAdapter = new SqlDataAdapter();
        private SqlConnectionStringBuilder _SqlConnectionStringBuilder = new SqlConnectionStringBuilder();

        private String GetConnectionString()
        {
            _SqlConnectionStringBuilder.DataSource = System.Configuration.ConfigurationManager.AppSettings.Get("_DataSource");
            _SqlConnectionStringBuilder.InitialCatalog = System.Configuration.ConfigurationManager.AppSettings.Get("_InitialCatalog");
            _SqlConnectionStringBuilder.UserID = System.Configuration.ConfigurationManager.AppSettings.Get("_UserID");
            _SqlConnectionStringBuilder.Password = System.Configuration.ConfigurationManager.AppSettings.Get("_Password");

            return _SqlConnectionStringBuilder.ConnectionString;
        }

        private void CloseConnection()
        {
            _SqlConnection.Close();
        }

        public DataSet GetDataSet(String SP)
        {
            try
            {
                _SqlConnection = new SqlConnection(GetConnectionString());

                _SqlDataAdapter = new SqlDataAdapter();
                SqlCommand _SqlCommand = _SqlConnection.CreateCommand();
                _SqlCommand.CommandText = SP;
                _SqlDataAdapter.SelectCommand = _SqlCommand;
                DataSet _DataSet = new DataSet();

                _SqlConnection.Open();
                _SqlDataAdapter.Fill(_DataSet);

                CloseConnection();

                return _DataSet;
            }
            catch
            {
                return null;
            }
        }

        public DataTable GetDataTable(String SP)
        {
            try
            {
                _SqlConnection = new SqlConnection(GetConnectionString());

                _SqlDataAdapter = new SqlDataAdapter();
                SqlCommand _SqlCommand = _SqlConnection.CreateCommand();
                _SqlCommand.CommandText = SP;
                _SqlDataAdapter.SelectCommand = _SqlCommand;
                DataSet _DataSet = new DataSet();

                _SqlConnection.Open();
                _SqlDataAdapter.Fill(_DataSet);

                CloseConnection();

                return _DataSet.Tables[0];
            }
            catch
            {
                return null;
            }
        }

        public Boolean ExecuteNonQuery(String SP)
        {
            try
            {
                _SqlConnection = new SqlConnection(GetConnectionString());

                _SqlDataAdapter = new SqlDataAdapter();
                SqlCommand _SqlCommand = _SqlConnection.CreateCommand();
                _SqlCommand.CommandText = SP;
                _SqlDataAdapter.SelectCommand = _SqlCommand;

                _SqlConnection.Open();
                _SqlCommand.ExecuteNonQuery();

                CloseConnection();

                return true;
            }
            catch
            {
                return false;
            }
        }

        public List<ClassNodo> GenerarListNodos(String SP, String CampoValor, String CampoTexto, String CampoId, String CampoDescripcion)
        {
            List<ClassNodo> _ListNodos = new List<ClassNodo>();

            ClassNodo _NodoCero = new ClassNodo();
            _NodoCero.valor = String.Empty;
            _NodoCero.texto = String.Empty;
            _ListNodos.Add(_NodoCero);

            try
            {

                foreach (DataRow _DataRow in GetDataTable(SP).Rows)
                {
                    ClassNodo _Nodo = new ClassNodo();
                    _Nodo.valor = _DataRow[CampoId].ToString();
                    _Nodo.texto = _DataRow[CampoDescripcion].ToString();
                    _ListNodos.Add(_Nodo);
                }
            }
            catch (System.NullReferenceException)
            {
                throw;
            }

            return _ListNodos;
        }

        public void CargarListBox(DropDownList _DropDownList, String SP, String CampoValor, String CampoTexto, String CampoId, String CampoDescripcion)
        {
            _DropDownList.Items.Clear();
            foreach (ClassNodo _ClassNodo in GenerarListNodos(SP, CampoValor, CampoTexto, CampoId, CampoDescripcion))
            {
                ListItem _ListItem = new ListItem(_ClassNodo.texto, _ClassNodo.valor);
                _DropDownList.Items.Add(_ListItem);
            }
            _DropDownList.SelectedIndex = -1;
        }

        public void CargarDropDownList(DropDownList _DropDownList, String _Select)
        {
            try
            {
                DataTable _DataTable = GetDataSet(_Select).Tables[0];
                if (_DataTable.Rows.Count > 0)
                {
                    _DropDownList.Items.Clear();

                    ListItem _ListItem = new ListItem(String.Empty, "0");
                    _DropDownList.Items.Add(_ListItem);

                    foreach (DataRow _DataRow in _DataTable.Rows)
                    {
                        _ListItem = new ListItem(_DataRow["descripcion"].ToString(), _DataRow["id"].ToString());
                        _DropDownList.Items.Add(_ListItem);
                    }
                }
            }
            catch(Exception _Exception)
            {
                throw (_Exception);
            }
        }

        public void CargarDropDownListSimple(DropDownList _DropDownList, String _Select, Boolean IniciaVacio)
        {
            try
            { 
                DataTable _DataTable = GetDataSet(_Select).Tables[0];
                if (_DataTable.Rows.Count > 0)
                {
                    _DropDownList.Items.Clear();

                    ListItem _ListItem = new ListItem(String.Empty, "0");
                    if (IniciaVacio)
                    {
                        _DropDownList.Items.Add(_ListItem);
                    }

                    foreach (DataRow _DataRow in _DataTable.Rows)
                    {
                        _ListItem = new ListItem(_DataRow["Descripcion"].ToString(), _DataRow["Duracion"].ToString());
                        _DropDownList.Items.Add(_ListItem);
                    }
                }
            }
            catch
            {
                throw;
            }
        }

        public void CargarDropDownListSeleccionando(DropDownList _DropDownList, String _Select, String _ValorBuscado, Boolean IniciaVacio)
        {
            try
            {
                DataTable _DataTable = GetDataSet(_Select).Tables[0];
                if (_DataTable.Rows.Count > 0)
                {
                    _DropDownList.Items.Clear();

                    ListItem _ListItem = new ListItem(String.Empty, "0");
                    if (IniciaVacio)
                    {
                        _DropDownList.Items.Add(_ListItem);
                    }

                    foreach (DataRow _DataRow in _DataTable.Rows)
                    {
                        _ListItem = new ListItem(_DataRow["Descripcion"].ToString(), _DataRow["Duracion"].ToString());
                        _DropDownList.Items.Add(_ListItem);
                        if (_ListItem.Value == _ValorBuscado)
                        {
                            //_OtroDropDownList.SelectedItem.Selected = false;
                            _ListItem.Selected = true;
                        }
                    }
                }
            }
            catch
            {
                throw;
            }
        }

        //public String Eliminar2Puntos(String Cadena)
        //{
        //    Cadena = Cadena.Replace(":", string.Empty);
        //    Int16 CadenaSin2Puntos = Int16.Parse(Cadena);
        //    String NuevaCadena = CadenaSin2Puntos.ToString();
        //    if (NuevaCadena.Length < 4)
        //    {
        //        NuevaCadena = "0" + NuevaCadena;
        //    }
        //    return (NuevaCadena);
        //}

        public String Agregar2Puntos(String Cadena)
        {
            if (Cadena.Length < 4)
                Cadena = "0" + Cadena;

            return (Cadena.Substring(0, 2) + ":" + Cadena.Substring(2, 2));
        }

        public String DayOfWeekSpanish(String _Day)
        {
            switch (_Day)
            {
                case "Monday":
                    _Day = "Lunes";
                    break;
                case "Tuesday":
                    _Day = "Martes";
                    break;
                case "Wednesday":
                    _Day = "Miercoles";
                    break;
                case "Thursday":
                    _Day = "Jueves";
                    break;
                case "Friday":
                    _Day = "Viernes";
                    break;
                case "Saturday":
                    _Day = "Sabado";
                    break;
                case "Sunday":
                    _Day = "Domingo";
                    break;
            }
            return _Day;
        }

        public bool ValidarCaracteresConEspacio(TextBox _TextBox, String _String)
        {
            byte[] _cadenaDesglosada = System.Text.Encoding.ASCII.GetBytes(_TextBox.Text);
            foreach (byte b in _cadenaDesglosada)
            {
                if (b < 48 || b > 57)
                    if (b < 65 || b > 90)
                        if (b < 97 || b > 122)
                        {
                            return false;
                        }
            }
            return true;
        }

    }


    public class ClassNodo
    {
        public String valor { get; set; }
        public String texto { get; set; }
    }

}