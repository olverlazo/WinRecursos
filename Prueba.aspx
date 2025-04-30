<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Prueba.aspx.vb" Inherits="Prueba" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <meta charset="utf-8"/>
  <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
  <title>.::Sistema Integrado de RRHH::.</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"/>
  <link rel="stylesheet" type="text/css" href="static/css/Style400.css" th:href="@{/css/Style400.css}"/>
       <script src="SimpleAjaxUploader.js"></script>
    <link href="ajax/libs/jqueryui/1.12.1/themes/cupertino/jquery-ui.min.css" rel="stylesheet" />
    <link href="ajax/libs/fullcalendar/3.1.1/fullcalendar.min.css" rel="stylesheet" />
    <link href="ajax/libs/qtip2/3.0.3/jquery.qtip.min.css" rel="stylesheet" />   
    <link rel="stylesheet" media="all" type="text/css" href="ajax/libs/timepicker/jquery-ui-timepicker-addon.css" /> 
    <link rel="stylesheet" href="ajax/libs/formValidator/css/validationEngine.jquery.css" type="text/css"  media="screen" charset="utf-8" />

    <style type='text/css'>
        body
        {
            margin-top: 40px;
            text-align: center;
            font-size: 14px;
            font-family: "Lucida Grande" ,Helvetica,Arial,Verdana,sans-serif;
        }
        #calendar
        {
            width: 900px;
            margin: 0 auto;
        }
        /* css for timepicker */
        .ui-timepicker-div dl
        {
            text-align: left;
        }
        .ui-timepicker-div dl dt
        {
            height: 25px;
        }
        .ui-timepicker-div dl dd
        {
            margin: -25px 0 10px 65px;
        }
        .style1
        {
            width: 100%;
        }
        
        /* table fields alignment*/
        .alignRight
        {
        	text-align:right;
        	padding-right:10px;
        	padding-bottom:10px;
        }
        .alignLeft
        {
        	text-align:left;
        	padding-bottom:10px;
        }
    </style>

</head>
<body>
     <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <div id="calendar">
    </div>
    <div id="updatedialog" style="font: 70% 'Trebuchet MS', sans-serif; margin: 50px;display: none;"
        title="Update or Delete Event">
        <table class="style1">
            <tr>
                <td class="alignRight">
                    Name:</td>
                <td class="alignLeft">
                    <input id="eventName" type="text" size="33" /><br /></td>
            </tr>
            <tr>
                <td class="alignRight">
                    Description:</td>
                <td class="alignLeft">
                    <textarea id="eventDesc" cols="30" rows="3" ></textarea></td>
            </tr>
            <tr>
                <td class="alignRight">
                    Start:</td>
                <td class="alignLeft">
                    <input id="eventStart"  name="eventStart" value="" /></td>
            </tr>
            <tr>
                <td class="alignRight">
                    End: </td>
                <td class="alignLeft">
                    <input id="eventEnd" name="eventEnd" value=""/><input type="hidden" id="eventId" /></td>
            </tr>
        </table>
    </div>
    <div id="addDialog" style="font: 70% 'Trebuchet MS', sans-serif; margin: 50px;" title="Add Event">
    <table class="style1">
            <tr>
                <td class="alignRight">
                    Name:</td>
                <td class="alignLeft">
                    <input id="addEventName" type="text" size="33" /><br /></td>
            </tr>
            <tr>
                <td class="alignRight">
                    Description:</td>
                <td class="alignLeft">
                    <textarea id="addEventDesc" cols="30" rows="3" ></textarea></td>
            </tr>
            <tr>
                <td class="alignRight">
                    Start:</td>
                <td class="alignLeft">
                    <input id="addEventStartDate" class="validate[required,funcCall[validate2time]]" name="addEventStartDate" value=""/></td>
            </tr>
            <tr>
                <td class="alignRight">
                    End:</td>
                <td class="alignLeft">
                    <input id="addEventEndDate" class="validate[required,funcCall[validate2time]]" name="addEventEndDate" value=""/></td>
            </tr>
        </table>
        
    </div>
    <div runat="server" id="jsonDiv" />
    <input type="hidden" id="hdClient" runat="server" />
    </form>

    <script src="ajax/libs/moment.js/2.18.1/moment.min.js" type="text/javascript"></script>
    <script src="ajax/libs/jquery/3.1.1/jquery.min.js" type="text/javascript"></script>
    <script src="ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" type="text/javascript"></script>
    <script src="ajax/libs/qtip2/3.0.3/jquery.qtip.min.js" type="text/javascript"></script>
     <script type="text/javascript" src="ajax/libs/timepicker/jquery-ui-timepicker-addon.js"></script>
     <script type="text/javascript" src="ajax/libs/timepicker/i18n/jquery-ui-timepicker-addon-i18n.min.js"></script>
     <script type="text/javascript" src="ajax/libs/timepicker/i18n/jquery-ui-timepicker-zh-CN.js"></script>
     <script type="text/javascript" src="ajax/libs/timepicker/jquery-ui-sliderAccess.js"></script>
    <script src="ajax/libs/fullcalendar/3.1.1/fullcalendar.min.js" type="text/javascript"></script>
    <script src='ajax/libs/fullcalendar/3.1.1/locale-all.js' type="text/javascript"></script>
        <script src="ajax/libs/formValidator/js/jquery.validationEngine.js" type="text/javascript"></script>
     <script src="ajax/libs/formValidator/js/languages/jquery.validationEngine-zh_CN.js" type="text/javascript"></script>  
     <script src="ajax/libs/jqueryui/1.12.1/ui/i18n/datepicker-zh-CN.js" type="text/javascript"></script>
    <script src="scripts/calendarscriptTime.js" type="text/javascript"></script>

    <script src="js/calendarscriptTime.js"></script>
</body>
</html>
