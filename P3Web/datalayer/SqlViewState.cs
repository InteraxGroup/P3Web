using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using Paradigm3.datalayer;
using Paradigm3;

public class SqlViewStatePage : Page
{
    private const int DefaultViewStateTimeout = 20;
    private string _viewStateConnectionString;
    private TimeSpan _viewStateTimeout;

    public SqlViewStatePage() : base()
    {
        if (IsDesignMode)
            return;

        _viewStateConnectionString = ConfigurationManager.AppSettings["ViewStateConnectionString"];

        try
        {
            _viewStateTimeout = TimeSpan.FromMinutes(Convert.ToDouble(ConfigurationManager.AppSettings["ViewStateTimeout"]));
        }
        catch
        {
            _viewStateTimeout = TimeSpan.FromMinutes(DefaultViewStateTimeout);
        }
    }

    protected bool IsDesignMode
    {
        get { return (Context == null); }
    }

    protected bool IsSqlViewStateEnabled
    {
        get { return (_viewStateConnectionString != null && _viewStateConnectionString.Length > 0); }
    }

    public TimeSpan ViewStateTimeout
    {
        get { return _viewStateTimeout; }
        set { _viewStateTimeout = value; }
    }

    private string GetMacKeyModifier()
    {
        int value = TemplateSourceDirectory.GetHashCode() + GetType().Name.GetHashCode();

        if (ViewStateUserKey != null)
            return string.Concat(value.ToString(NumberFormatInfo.InvariantInfo), ViewStateUserKey);

        return value.ToString(NumberFormatInfo.InvariantInfo);
    }

    private LosFormatter GetLosFormatter()
    {
        if (EnableViewStateMac)
            return new LosFormatter(true, GetMacKeyModifier());

        return new LosFormatter();
    }

    private Guid GetViewStateGuid()
    {
        string viewStateKey;

        viewStateKey = Request.Form["__VIEWSTATEGUID"];

        if (viewStateKey == null || viewStateKey.Length < 1)
        {
            viewStateKey = Request.QueryString["__VIEWSTATEGUID"];

            if (viewStateKey == null || viewStateKey.Length < 1)
                return Guid.NewGuid();
        }

        try
        {
            return new Guid(viewStateKey);
        }
        catch (FormatException)
        {
            return Guid.NewGuid();
        }
    }

    protected override object LoadPageStateFromPersistenceMedium()
    {
        Guid viewStateGuid;
        byte[] rawData;

        if (IsDesignMode)
            return null;

        if (!IsSqlViewStateEnabled)
            return base.LoadPageStateFromPersistenceMedium();

        viewStateGuid = GetViewStateGuid();
        rawData = null;

        using (SqlConnection connection = new SqlConnection(_viewStateConnectionString))
        using (SqlCommand command = new SqlCommand("GetViewState", connection))
        {
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("@returnValue", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
            command.Parameters.Add("@viewStateId", SqlDbType.UniqueIdentifier).Value = viewStateGuid;

            connection.Open();

            using (SqlDataReader reader = command.ExecuteReader())
            {
                if (reader.Read())
                    rawData = (byte[])Array.CreateInstance(typeof(byte), reader.GetInt32(0));

                if (reader.NextResult() && reader.Read())
                    reader.GetBytes(0, 0, rawData, 0, rawData.Length);
            }
        }
        
        try
        {
            using (MemoryStream stream = new MemoryStream(rawData))
                return GetLosFormatter().Deserialize(stream);
        }
        catch(Exception ex)
        {
            P3Security.Do_Logout();
            Response.Redirect("~/");
            ClientScript.RegisterStartupScript(GetType(), "sessionend", "alert('" + ex.Message + "')", true);
            return ex;
        }
        
            
    }

    protected override void SavePageStateToPersistenceMedium(object viewState)
    {
        Guid viewStateGuid;
        HtmlInputHidden control;

        if (IsDesignMode)
            return;

        if (!IsSqlViewStateEnabled)
        {
            base.SavePageStateToPersistenceMedium(viewState);
            return;
        }

        viewStateGuid = GetViewStateGuid();

        using (MemoryStream stream = new MemoryStream())
        {
            GetLosFormatter().Serialize(stream, viewState);

            using (SqlConnection connection = new SqlConnection(_viewStateConnectionString))
            using (SqlCommand command = new SqlCommand("SetViewState", connection))
            {
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.Add("@returnValue", SqlDbType.Int).Direction = ParameterDirection.ReturnValue;
                command.Parameters.Add("@viewStateId", SqlDbType.UniqueIdentifier).Value = viewStateGuid;
                command.Parameters.Add("@value", SqlDbType.Image).Value = stream.ToArray();
                command.Parameters.Add("@timeout", SqlDbType.Int).Value = this._viewStateTimeout.TotalMinutes;

                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        control = FindControl("__VIEWSTATEGUID") as HtmlInputHidden;

        if (control == null)
            ClientScript.RegisterHiddenField("__VIEWSTATEGUID", viewStateGuid.ToString());
        else
            control.Value = viewStateGuid.ToString();
    }
}