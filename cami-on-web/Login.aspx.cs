using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//Bibliotecas requeridas para la coneccion
using System.Data;
using System.Data.SqlClient;

namespace cami_on_web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            int ban = 1; //flag
            string pogUsuario, pogConstrasenia, usuario = "";

            //Crear la coneccion a la BD
            using (SqlConnection cadena = new SqlConnection("Data Source=COTHER-PC\\SQLEXPRESS; Initial Catalog=CAMI_ON; Integrated Security=True"))
            {
                cadena.Open();
                //conectarse al procedimiento almacenado "autentication"
                SqlCommand SQLCmd = new SqlCommand("autentication", cadena);
                //inddicar que se trata especificamente de un procedimiento almacenado
                SQLCmd.CommandType = CommandType.StoredProcedure;
                //pasar los parametros al procedimiento almacenado
                SQLCmd.Parameters.AddWithValue("@usuario", tbUsuario.Text);
                SQLCmd.Parameters.AddWithValue("@contrasenia", tbPassword.Text);
                //lector de datos en donde se guarda lo que arroja el procedimiento almacenado
                SqlDataReader resultado = SQLCmd.ExecuteReader();

                pogUsuario = tbUsuario.Text;
                pogConstrasenia = tbPassword.Text;

                //verificar si los campos estas vacios
                if (pogUsuario == "" || pogConstrasenia == "")
                {
                    //mandar mensaje en una alerta
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "javascript:alert('No puedes dejar Uduario y/o Contrsenia vacia, echale mas ganas');", true);
                }
                else
                {
                    if (!resultado.HasRows) //Evaluar si tenemos no se obtiene resultados
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "javascript:alert('Usuario o contrasenia incorrectos, echale mas ganas');", true);
                        ban = 0; //no hay resultados
                    }
                }

                if (ban != 0)
                {
                    if (resultado.HasRows)
                    {
                        //mientras se lean datos, vas a guardar en usuario lo que te encuentres en el dindice 0
                        while (resultado.Read())
                        {
                            usuario = resultado.GetString(0);
                        }
                        resultado.Close();

                        //Redireccionar a otra pagina, segun el usuario
                        if (usuario == "Administrador")
                        {
                            Response.Redirect("index.html");
                        }
                        if (usuario == "Invitado")
                        {
                            Response.Redirect("index.html");
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "javascript:alert('Bienvenido "+usuario+"!');", true);
                        }
                    }
                }
            };
        }
    }
}