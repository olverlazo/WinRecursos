var menus;
var todoMenus;
$(document).ready(function () {
    ObtenerSidebar();

    //Contraer();
});

function Expandir() {
    //$(".nav-stacked").css("display", "block");
    $(".treeview-menu").css("display", "block");
    $("#menu").css("display", "block");
}

function Contraer() {
    //$(".nav-stacked").css("display", "none");
    $(".treeview-menu").css("display", "none");
    $("#menu").css("display", "block");
}

function ObtenerTodoMenu() {
    //Genero el menú de ejemplo aqui
    //todoMenus = [
    //          { codigoMenu: 1, codigoMenuPadre: 0, icono: 'fa fa-dashboard fa-fw', link: '#', lugar: 1, menu: 'Computo y Tablets', mostrarEnMenu: true },
    //          { codigoMenu: 2, codigoMenuPadre: 0, icono: 'fa fa-bar-chart-o fa-fw', link: '#', lugar: 1, menu: 'Laptops', mostrarEnMenu: true },
    //          { codigoMenu: 3, codigoMenuPadre: 2, icono: 'fa fa-bar-chart-o fa-fw', link: '#', lugar: 1, menu: 'Laptops', mostrarEnMenu: true },
    //          { codigoMenu: 4, codigoMenuPadre: 2, icono: 'fa fa-bar-chart-o fa-fw', link: '#', lugar: 2, menu: 'Chromebooks', mostrarEnMenu: true },
    //          { codigoMenu: 5, codigoMenuPadre: 2, icono: 'fa fa-bar-chart-o fa-fw', link: '#', lugar: 3, menu: 'Gaming laptops', mostrarEnMenu: true },
    //          { codigoMenu: 6, codigoMenuPadre: 2, icono: 'fa fa-bar-chart-o fa-fw', link: '#', lugar: 4, menu: 'Desmontables y Touchscreen', mostrarEnMenu: true },
    //          { codigoMenu: 7, codigoMenuPadre: 0, icono: 'fa fa-bar-chart-o fa-fw', link: '#', lugar: 1, menu: 'Tablets', mostrarEnMenu: true },
    //          { codigoMenu: 8, codigoMenuPadre: 7, icono: 'fa fa-bar-chart-o fa-fw', link: '#', lugar: 1, menu: 'Lo mas vendidos', mostrarEnMenu: true },
    //          { codigoMenu: 9, codigoMenuPadre: 7, icono: 'fa fa-bar-chart-o fa-fw', link: '#', lugar: 2, menu: 'Lanzamientos', mostrarEnMenu: true },
    //          { codigoMenu: 10, codigoMenuPadre: 7, icono: 'fa fa-bar-chart-o fa-fw', link: '#', lugar: 3, menu: 'Convertibles 2 en 1', mostrarEnMenu: true },
    //          { codigoMenu: 11, codigoMenuPadre: 7, icono: 'fa fa-bar-chart-o fa-fw', link: '#', lugar: 4, menu: 'Accesorios de tablet', mostrarEnMenu: true },
    //          { codigoMenu: 12, codigoMenuPadre: 0, icono: 'fa fa-bar-chart-o fa-fw', link: '#', lugar: 1, menu: 'Computadoras de escritorio', mostrarEnMenu: false },
    //];

    //console.log(todoMenus)

    //Este es el código para obtenerlo con ajax desde el server

    $.ajax({
        async: false,
        type: "POST",
        url: "WebService.asmx/ObtenerTodoMenu",
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        //success: function (data) {
        //    console.log(data)
        //    console.log(data.d)
        //    todoMenus = data.d;
        //},
        //error: function (XMLHttpRequest, textStatus, errorThrown) {
        //    var err = eval("(" + XMLHttpRequest.responseText + ")");
        //    alert("Error!: " + err.Message)
        //}
        success: function (data, textStatus) {
            var jsonData = JSON.stringify(data.d);
            //if (!datos.data) {
            //    alert(datos.Message);
            //    return;
            //}
            todoMenus = JSON.parse(jsonData);
            console.log(todoMenus)
        },
        error: function (request, status, error) {
            alert(jQuery.parseJSON(request.responseText).Message);
        }
    });



}

function ObtenerMenus(codigoMenu) {
    menus = [];
    $.each(todoMenus, function (i, v) {
        if (v.codigoMenuPadre == codigoMenu) {
            menus.push(v);
        }
    });
}


function GenerarMenus(codigoMenu, esSub) {
    var menuGenrado = '';
    if (esSub) {
        menuGenrado = '<ul class="treeview-menu">';
    }
    else {
        menuGenrado = '';
    }

    //Obtengo los menus papas
    ObtenerMenus(codigoMenu);

    if (menus != undefined) {
        $.each(menus, function (i, v) {
            if (v.mostrarEnMenu == 'true') {
                console.log(v.mostrarEnMenu)
                var subMenu = GenerarMenus(v.codigoMenu, true);
                if (subMenu.length == 0) {
                    menuGenrado += '<li><a href="' + v.link + '"><i class="' + v.icono + '"></i><span>' + v.menu + '</span></a>';
                } else {
                    menuGenrado += '<li class="treeview"><a href="' + v.link + '"><i class="' + v.icono + '"></i><span>' + v.menu + '</span><span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span></a>';
                    //menuGenrado += '<li class="treeview"><a href="' + v.link + '" class="dropdown-collapse"><i class="' + v.icono + '"></i><span>' + v.menu + '</span><i class="icon-angle-down angle-down"></i></a>';
                    menuGenrado += subMenu;
                }

                menuGenrado += '</li>';
            }
        });
    }
    menuGenrado += '</ul>'

    if (menuGenrado == '<ul class="treeview-menu"></ul>' || menuGenrado == '<ul class="treeview-menu"></ul>') {
        //if (menuGenrado == '<ul class="nav nav-stacked"></ul>' || menuGenrado == '<ul class="nav nav-stacked"></ul>') {
        menuGenrado = '';
    }

    return menuGenrado;
}

function ObtenerSidebar() {


    var menu = "";

    //MENU NAVEGACION
    var sidenav = '<ul class="sidebar-menu" data-widget="tree"> <li class="header">MENU PRINCIPAL</li>';


    ObtenerTodoMenu();
    var menuGenerado = GenerarMenus(0, false);
    sidenav += menuGenerado;

    sidenav += '';
    menu += sidenav;

    console.log(menu)
    //FIN ATAJOS
    $("#main-nav").append(menu);

}


/*
* --------------------------------------------------------------------------------------------------------------------
* main navigation toggling
* --------------------------------------------------------------------------------------------------------------------
*/

(function () {



    $(document).ready(function () {
        var body, click_event, content, nav, nav_toggler;
        nav_toggler = $("header .toggle-nav");
        nav = $("#main-nav");
        content = $("#content");
        body = $("body");
        click_event = (jQuery.support.touch ? "tap" : "click");
        $("#main-nav .dropdown-collapse").on(click_event, function (e) {
            var link, list;
            e.preventDefault();
            link = $(this);
            list = link.parent().find("> ul");
            if (list.is(":visible")) {
                if (body.hasClass("main-nav-closed") && link.parents("li").length === 1) {
                    false;
                } else {
                    link.removeClass("in");
                    list.slideUp(300, function () {
                        return $(this).removeClass("in");
                    });
                }
            } else {
                if (list.parents("ul.nav.nav-stacked").length === 1) {
                    $(document).trigger("nav-open");
                }
                link.addClass("in");
                list.slideDown(300, function () {
                    return $(this).addClass("in");
                });
            }
            return false;
        });
        if (jQuery.support.touch) {
            nav.on("swiperight", function (e) {
                return $(document).trigger("nav-open");
            });
            nav.on("swipeleft", function (e) {
                return $(document).trigger("nav-close");
            });
        }
        nav_toggler.on(click_event, function () {
            if (nav_open()) {
                $(document).trigger("nav-close");
            } else {
                $(document).trigger("nav-open");
            }
            return false;
        });
        $(document).bind("nav-close", function (event, params) {
            var nav_open;
            body.removeClass("main-nav-opened").addClass("main-nav-closed");
            return nav_open = false;
        });
        return $(document).bind("nav-open", function (event, params) {
            var nav_open;
            body.addClass("main-nav-opened").removeClass("main-nav-closed");
            return nav_open = true;
        });
    });

    this.nav_open = function () {
        return $("body").hasClass("main-nav-opened") || $("#main-nav").width() > 50;
    };


}).call(this);