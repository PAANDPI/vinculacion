<div class="modal fade" style="background: rgba(11,48,73,0.8)" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog  modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Añadir discapacidad</h5>
                    </div>
                    <div class="modal-body">
                        <label>Categoria</label>
                        <select selected="selected" id="cmbIdCategoriDiscapacidad"  class="form-control">
                             <option value="" selected disabled hidden></option>
                            <option>CARGAR DATOS DE LA BD</option>
                            <option>Fisica</option>
                            <option>Sensorial</option>
                        </select>
                        <label>Nombre discapacidad</label>
                        <input id="txtNombreDiscapacidad" type="text" class="form-control" placeholder="Nombre de la discapacidad">
                        <hr>
                    </div>
                    <div class="modal-footer">
                        <button id="btnClickCerrar" type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                        <button id="btnGuardarDiscapacidad" type="button" class="btn btn-primary">Guardar discacidad</button>
                    </div>
                </div>
      </div>
</div>