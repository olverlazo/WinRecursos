using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Net;
//using System.Diagnostics;
//using System.Globalization;


public partial class Default2 : System.Web.UI.Page
{
    private void GuardarArchivo(HttpPostedFile file)
    {
        // Se carga la ruta física de la carpeta temp del sitio
        string ruta = Server.MapPath("~/temp");

        // Si el directorio no existe, crearlo
        if (!Directory.Exists(ruta))
            Directory.CreateDirectory(ruta);

        string archivo = String.Format("{0}\\{1}", ruta, file.FileName);

        // Verificar que el archivo no exista
        if (File.Exists(archivo))
            //MensajeError(String.Format("Ya existe una imagen con nombre\"{0}\".", file.FileName));
            Label2.Text = String.Format("Ya existe una imagen con nombre\"{0}\".", file.FileName);
        else
        {
            file.SaveAs(archivo);
        }
    }


    protected void cargarImagen_Click(object sender, EventArgs e)
    {
        try
        {
            if (fileUploader1.HasFile)
            {
                // Se verifica que la extensión sea de un formato válido
                string ext = fileUploader1.PostedFile.FileName;
                ext = ext.Substring(ext.LastIndexOf(".") + 1).ToLower();
                //string[] formatos = new string[] { "jpg", "jpeg", "bmp", "png", "gif" };
                string[] formatos = new string[] { "pdf"};
                if (Array.IndexOf(formatos, ext) < 0)
                    //ShowMessage("Formato de imagen inválido.");
                    Label2.Text = "Formato de imagen inválido.";
                else 
                    GuardarArchivo(fileUploader1.PostedFile);
            }
            else
                //ShowMessage("Seleccione un archivo del disco duro.");
                Label2.Text = "Seleccione un archivo del disco duro.";
        }
        catch (Exception ex)
        {
            //ShowMessage(ex.Message);
            Label2.Text = ex.Message;
        }
    }



 
}