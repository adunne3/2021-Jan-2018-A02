using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp.SamplePages
{
    public partial class ListViewODSCRUD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        #region MessageUserControl error handling for ods
        protected void SelectCheckForException(object sencder, ObjectDataSourceStatusEventArgs e)
        {
            MessageUserControl.HandleDataBoundException(e);
        }
        protected void InsertCheckForException(object sencder, ObjectDataSourceStatusEventArgs e)
        {
            if(e.Exception == null)
            {
                MessageUserControl.ShowInfo("Process success", "Album hs been added");
            }
            else
            {
                MessageUserControl.HandleDataBoundException(e);
            } 
        }
        protected void UpdateCheckForException(object sencder, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception == null)
            {
                MessageUserControl.ShowInfo("Process success", "Album has been updated");
            }
            else
            {
                MessageUserControl.HandleDataBoundException(e);
            }
        }
        protected void DeleteCheckForException(object sencder, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception == null)
            {
                MessageUserControl.ShowInfo("Process success", "Album has been removed");
            }
            else
            {
                MessageUserControl.HandleDataBoundException(e);
            }
        }
        #endregion
    }
}