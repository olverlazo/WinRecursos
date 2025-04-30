<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="Organigrama.aspx.cs" Inherits="Organigrama" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="content-header">
      <h1>
          SERVICIOS
      </h1>

    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-3">
                <a class="btn btn-primary btn-block margin-bottom " data-toggle="modal" data-target="#modal-warning" id="Nuevo">Nuevo Servicio</a>
                <div class="box box-solid">
                    <div class="box-header with-border">
                        <h3 class="box-title">Arbol de Servicios</h3>
                    </div>
                    <div class="box-body">
                        <ul class="nav nav-pills nav-stacked">
                            <li>
                               <div id="treeview-disabled" class=""></div>
                            </li>
                        </ul>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /. box -->

                <!-- /.box -->
            </div>
            <!-- /.col -->
            <div class="col-md-9">
                <div class="box box-primary">
                    <div class="box-header with-border">
                        <h3 class="box-title">Personal</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                        <table id="TablePersona" class="table table-bordered table-hover">
                            <thead>
                                <th>Nombre y Apellidos</th>
                                <th>C.I.</th>
                                <th>Fecha de Nacimiento</th>
                                <th>Direccion</th>
                                <th>Telefono</th>
                                <th>Profecion</th>
                            </thead>
                        </table>

                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
  

     <!-- /.MODAL DATOS PACINTE-->
       
       
     <!-- treeview -->
    <script src="bower_components/jquery/dist/jquery.js"></script>
    <script src="js/bootstrap-treeview.js"></script>
    <script  type="text/javascript">
        $(function () {

            var defaultData = [
              {
                  text: 'Parent 1',
                  href: '#parent1',
                  tags: ['4'],
                  nodes: [
                    {
                        text: 'Child 1',
                        href: '#child1',
                        tags: ['2'],
                        nodes: [
                          {
                              text: 'Grandchild 1',
                              href: '#grandchild1',
                              tags: ['0']
                          },
                          {
                              text: 'Grandchild 2',
                              href: '#grandchild2',
                              tags: ['0']
                          }
                        ]
                    },
                    {
                        text: 'Child 2',
                        href: '#child2',
                        tags: ['0']
                    }
                  ]
              },
              {
                  text: 'Parent 2',
                  href: '#parent2',
                  tags: ['0']
              },
              {
                  text: 'Parent 3',
                  href: '#parent3',
                  tags: ['0']
              },
              {
                  text: 'Parent 4',
                  href: '#parent4',
                  tags: ['0']
              },
              {
                  text: 'Parent 5',
                  href: '#parent5',
                  tags: ['0']
              }
            ];

            var $disabledTree = $('#treeview-disabled').treeview({
                data: defaultData,
                //onNodeDisabled: function(event, node) {
                //  $('#disabled-output').prepend('<p>' + node.text + ' was disabled</p>');
                //},
                //onNodeEnabled: function (event, node) {
                //  $('#disabled-output').prepend('<p>' + node.text + ' was enabled</p>');
                //},
                //onNodeCollapsed: function(event, node) {
                //  $('#disabled-output').prepend('<p>' + node.text + ' was collapsed</p>');
                //},
                //onNodeUnchecked: function (event, node) {
                //  $('#disabled-output').prepend('<p>' + node.text + ' was unchecked</p>');
                //},
                onNodeUnselected: function (event, node) {
                    $('#disabled-output').prepend('<p>' + node.text + ' was unselected</p>');
                }
            });
        });
        </script>
</asp:Content>

