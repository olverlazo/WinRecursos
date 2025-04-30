<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="modalPru.aspx.cs" Inherits="modalPru" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

       
    

                    <div class="modal-dialog modal-mg">
                        <div class="modal-content">
                            <div class="modal-header" style="background-color: #00C0EF; font-weight: bold;">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title">Licencias de Personal</h4>
                            </div>
                            <div class="modal-body">

                                  <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <select id="tipo" name="tipo" class="inputin__fieldin" data-validate="required" data-validate-message="Tipo">
                                                    <option value="">--Seleccionar--</option>
                                                    <option value="0">Dias cuenta vacacion</option>
                                                    <option value="1">Vacacion</option>
                                                </select>
                                                <span class="inputin__labelin">Tipo</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>                                
                                <div class="row">
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <select id="listagestion" name="listagestion" class="inputin__fieldin" data-validate="required" data-validate-message="gestion" onchange="opcion()">
                                                   
                                                </select>
                                                <span class="inputin__labelin">Gestion</span>
                                            </label>
                                        </article>
                                    </div>

                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">                                          
                                                <label class="inputin">
                                                    <input class="inputin__fieldin" id="dias" type="text" data-validate="required" data-validate-message="dias" placeholder=" " maxlength="2" autocomplete="off" />
                                                    
                                                    <span class="inputin__labelin">Dias</span>
                                                </label>                                            
                                        </article>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-xs-12">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <textarea id="resumen" name="resumen" class="inputin__fieldin" data-validate="required" data-validate-message="Descripcion" rows="4" placeholder="Resumen..." maxlength="250"></textarea>
                                                <span class="inputin__labelin">Descripcion</span>
                                            </label>
                                        </article>
                                    </div>
                                </div>

                                <div class="row">
                                    
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Desde:</label>
                                                <div id="datepicker1" class="input-group date" data-date-format="dd/mm/yyyy">
                                                    <input id="indate1" class="form-control" type="text" readonly />
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </label>
                                        </article>
                                    </div>
                                    
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Hasta:</label>
                                                <div id="datepicker2" class="input-group date" data-date-format="dd/mm/yyyy">
                                                    <input id="indate2" class="form-control" type="text" readonly />
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </label>
                                        </article>
                                    </div>
                                </div>


                                   <div class="row">
                                    
                                    <div class="col-md-6">
                                        <article class="l-design-widhtin">
                                            <label class="inputin">
                                                <label>Fecha de incorporacion:</label>
                                                <div id="datepicker3" class="input-group date" data-date-format="dd/mm/yyyy">
                                                    <input id="indate3" class="form-control" type="text" readonly />
                                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                                </div>
                                            </label>
                                        </article>
                                    </div>
                                </div>
                            
                            </div>
                            
                        </div>
                        <div class="modal-footer" style="background-color: #00C0EF; font-weight: bold;">
                            <input type="submit" value="Guardar" id="GuardarDatos" class="btn btn-primary example-the-1" />
                            <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Cerrar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
       
  
    
        </asp:Content>

