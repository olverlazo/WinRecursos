var currentUpdateEvent;
var addStartDate;
var addEndDate;
var globalAllDay;

//修改時,穫取值
// 涂聚文 Geovin Du edit 20170417
function updateEvent(event, element) {
    //alert(event.description);

    if ($(this).data("qtip")) $(this).qtip("destroy");

    currentUpdateEvent = event;

    $('#updatedialog').dialog('open');
    $("#eventName").val(event.title);
    $("#eventDesc").val(event.description);
    $("#eventId").val(event.id);
    $("#eventStart").val("" + $.fullCalendar.formatDate(event.start, "YYYY-MM-DD HH:mm")); //text $.fullCalendar.formatDate(event.start, "YYYY-MM-DD HH:mm")
    $("#eventStart").datetimepicker({ timeInput: true, changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd', timeFormat: 'HH:mm', hourMin: 5, hourMax: 24, hourGrid: 3, minuteGrid: 15 }); //timeInput: true,
    //$("#eventStart").datetimepicker('setDate', (new Date())); 
    if (event.end === null) {
        $("#eventEnd").val(""); //text
    }
    else {
        $("#eventEnd").val("" + $.fullCalendar.formatDate(event.end, "YYYY-MM-DD HH:mm")); //text  event.end.toLocaleString()
        $("#eventEnd").datetimepicker({ timeInput: true, changeMonth: true, changeYear: true, dateFormat: 'yy-mm-dd', timeFormat: 'HH:mm', hourMin: 5, hourMax: 24, hourGrid: 3, minuteGrid: 15 }); //
    }

    return false;
}

function updateSuccess(updateResult) {
    //alert(updateResult);
}

function deleteSuccess(deleteResult) {
    //alert(deleteResult);
}

function addSuccess(addResult) {
    // if addresult is -1, means event was not added
    //    alert("added key: " + addResult);

    if (addResult != -1) {
        $('#calendar').fullCalendar('renderEvent',
						{
						    title: $("#addEventName").val(),
						    start: addStartDate,
						    end: addEndDate,
						    id: addResult,
						    description: $("#addEventDesc").val(),
						    allDay: globalAllDay
						},
						true // make the event "stick"
					);


        $('#calendar').fullCalendar('unselect');
    }
}

function UpdateTimeSuccess(updateResult) {
    //alert(updateResult);
}
//
$("#addEventStartDate").datetimepicker({
    timeInput: true,
    changeMonth: true,
    changeYear: true,
    dateFormat: 'yy-mm-dd',

    timeFormat: 'HH:mm', hourMin: 5, hourMax: 24, hourGrid: 3, minuteGrid: 15
});
//
$("#addEventEndDate").datetimepicker({
    timeInput: true,
    changeMonth: true,
    changeYear: true,
    dateFormat: 'yy-mm-dd',
    timeFormat: 'HH:mm', hourMin: 5, hourMax: 24, hourGrid: 3, minuteGrid: 15
}); 

//選擇時，穫取值
function selectDate(start, end, allDay) {
    //$('#addEventStartDate').datetimepicker();
    $('#addDialog').dialog('open');
    $("#addEventStartDate").val("" + $.fullCalendar.formatDate(start, "YYYY-MM-DD HH:mm")); //text //標簽span $.fullCalendar.formatDate(start, "yyyy/MM/dd HH:mm");
    $("#addEventEndDate").val("" + $.fullCalendar.formatDate(end, "YYYY-MM-DD HH:mm")); //text $.fullCalendar.formatDate(end, "yyyy/MM/dd HH:mm");
    //$("#addEventStartDate").datetimepicker('setDate', $.fullCalendar.formatDate(start, "YYYY-MM-DD HH:mm")); //設置值,日期格式還存在不相符問題
    addStartDate = start;
    addEndDate = end;
    globalAllDay = allDay;
    //alert(allDay);
}

function updateEventOnDropResize(event, allDay) {

    //alert("allday: " + allDay);
    var eventToUpdate = {
        id: event.id,
        start: event.start
    };

    if (event.end === null) {
        eventToUpdate.end = eventToUpdate.start;
    }
    else {
        eventToUpdate.end = event.end;
    }

    var endDate;
    if (!event.allDay) {
        endDate = new Date(eventToUpdate.end + 60 * 60000);
        endDate = endDate.toJSON();
    }
    else {
        endDate = eventToUpdate.end.toJSON();
    }

    eventToUpdate.start = eventToUpdate.start.toJSON();
    eventToUpdate.end = eventToUpdate.end.toJSON(); //endDate;
    eventToUpdate.allDay = event.allDay;

    PageMethods.UpdateEventTime(eventToUpdate, UpdateTimeSuccess);
}

function eventDropped(event, dayDelta, minuteDelta, allDay, revertFunc) {
    if ($(this).data("qtip")) $(this).qtip("destroy");

    updateEventOnDropResize(event);
}

function eventResized(event, dayDelta, minuteDelta, revertFunc) {
    if ($(this).data("qtip")) $(this).qtip("destroy");

    updateEventOnDropResize(event);
}
//隻可輸入數字，字母，中文，中文標點符號 20170417 塗聚文 EDIT
function checkForSpecialChars(stringToCheck) {
    var pattern = /[^A-Za-z0-9 |\u4e00-\u9fa5|\u3002|\uff1f|\uff01|\uff0c|\u3001|\uff1b|\uff1a|\u201c|\u201d|\u2018|\u2019|\uff08|\uff09|\u300a|\u300b|\u3008|\u3009|\u3010|\u3011|\u300e|\u300f|\u300c|\u300d|\ufe43|\ufe44|\u3014|\u3015|\u2026|\u2014|\uff5e|\ufe4f|\uffe5]/;  //A-Za-z0-9 
    return pattern.test(stringToCheck);
}
//是否整天時間
function isAllDay(startDate, endDate) {
    var allDay;

    if (startDate.format("HH:mm:ss") == "00:00:00" && endDate.format("HH:mm:ss") == "00:00:00") {
        allDay = true;
        globalAllDay = true;
    }
    else {
        allDay = false;
        globalAllDay = false;
    }

    return allDay;
}
//提示內容
function qTipText(start, end, description) {
    var text;

    if (end !== null)
        text = "<strong>Start:</strong> " + start.format("YYYY-MM-DD hh:mm T") + "<br/><strong>End:</strong> " + end.format("YYYY-MM-DD hh:mm T") + "<br/><br/>" + description;
    else
        text = "<strong>Start:</strong> " + start.format("YYYY-MM-DD hh:mm T") + "<br/><strong>End:</strong><br/><br/>" + description;

    return text;
}

$(document).ready(function () { 

    // update Dialog 修改，刪除
    $('#updatedialog').dialog({
        autoOpen: false,
        width: 470,
        buttons: {
            "update": function () {
                //alert(currentUpdateEvent.title);
                var eventToUpdate = {
                    id: currentUpdateEvent.id,
                    title: $("#eventName").val(),
                    description: $("#eventDesc").val()
                };

                if (checkForSpecialChars(eventToUpdate.title) || checkForSpecialChars(eventToUpdate.description)) {
                    alert("please enter characters: 可輸入數字，字母，中文，中文標點符號, 空格");
                }
                else {
                    PageMethods.UpdateEvent(eventToUpdate, updateSuccess);
                    $(this).dialog("close");

                    currentUpdateEvent.title = $("#eventName").val();
                    currentUpdateEvent.description = $("#eventDesc").val();
                    $('#calendar').fullCalendar('updateEvent', currentUpdateEvent);
                }

            },
            "delete": function () {

                if (confirm("do you really want to delete this event?")) {

                    PageMethods.deleteEvent($("#eventId").val(), deleteSuccess);
                    $(this).dialog("close");
                    $('#calendar').fullCalendar('removeEvents', $("#eventId").val());
                }
            }
        }
    });

    //add dialog 添加
    $('#addDialog').dialog({
        autoOpen: false,
        width: 470,
        buttons: {
            "Add": function () {
                //alert("sent:" + addStartDate.format("dd-MM-yyyy hh:mm:ss tt") + "==" + addStartDate.toLocaleString());
                var eventToAdd = {
                    title: $("#addEventName").val(),
                    description: $("#addEventDesc").val(),
                    start: addStartDate.toJSON(), //addStartDate.toJSON()
                    end:addEndDate.toJSON(),
                    allDay: isAllDay(addStartDate, addEndDate)
                };

                if (checkForSpecialChars(eventToAdd.title) || checkForSpecialChars(eventToAdd.description)) {
                    alert("please enter characters: 可輸入數字，字母，中文，中文標點符號, 空格");
                }
                else {
                    //alert("sending " + eventToAdd.title);

                    PageMethods.addEvent(eventToAdd, addSuccess);
                    $(this).dialog("close");
                }
            }
        }
    });

 