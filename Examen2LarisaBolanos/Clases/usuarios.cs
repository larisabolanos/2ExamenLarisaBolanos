using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Examen2.Clases
{
    public class usuarios
    {
        

            public int nombre { get; set; }
            public int correoelectronico { get; set; }
            public string telefono { get; set; }
            public float usuarioid { get; set; }

            public usuarios() { }


            public static int Agregar(string nombre, float correoelectronico, int telefono)
            {
                int retorno = 0;

                SqlConnection Conn = new SqlConnection();
                try
                {
                    using (Conn = DBConn.obtenerConexion())
                    {
                        SqlCommand cmd = new SqlCommand("INGRESAR", Conn)
                        {
                            CommandType = CommandType.StoredProcedure
                        };
                        cmd.Parameters.Add(new SqlParameter("@nombre", nombre));
                        cmd.Parameters.Add(new SqlParameter("@PRECIO", correoelectronico));
                        cmd.Parameters.Add(new SqlParameter("@TIPO", telefono));

                        retorno = cmd.ExecuteNonQuery();
                    }
                }
                catch (System.Data.SqlClient.SqlException ex)
                {
                    retorno = -1;
                }
                finally
                {
                    Conn.Close();
                }

                return retorno;

            }
        }
    }