{capture assign="left"}  
  
  <center><img src="{url('assets/img/perfil')}/{$foto}" width="150" height="150"></center>
  <div class="well"> 
      <center><p>{$usuario->nombre}</p></center>
      <center><p>{$usuario->correo}</p></center>
  </div>
  
  <hr>
  
  <div class='row'>
      <center><h3>Amigos</h3></center>
      {foreach $amigos as $amigo}
          <div class='col-sm-4'>
              <a href='{url('perfil/ver')}/{$amigo->id}'> <img src='{url('/assets/img/perfil')}/{$amigo->id}.jpg' width='70' height='90'></a>
              <p>{$amigo->nombre}</p>
          </div>
      {/foreach}
      
  </div>
  {/capture}
{capture assign="right"}
  {Form::open(['url'=>'publicacion/crear'])}
  <textarea required name="publicacion" placeholder="¿Qué estás pensando?" rows="3" class="col-sm-12"></textarea>
  <input type='text' name='receptor' value='{$usuario->id}'>
  <button class="btn pull-right btn-success">Publicar</button>
  {Form::close()}
  <hr>
  <br>
  <br>
  <br>
  {foreach $publicaciones as $publicacion}
      <div class="well" style="word-break: break-all; margin-bottom: 5px; padding: 10px 5px; font-family: 'Oswald', sans-serif;">
        <button class="close" aria-hiden="true" style="margin-top: -10px;"><a href="{url('publicacion/eliminar')}/{$publicacion->id}">&times;</a></button>
        
        <img src="{url('assets/img/perfil')}/{$publicacion->usuario_id}.jpg" width="30" height="40">
        {$publicacion->publicacion}
      </div>
      <div>
          <span class="glyphicon glyphicon-comment"></span> Comentar
          <span class="glyphicon glyphicon-thumbs-up"></span> <span onclick="fb.meGusta({$publicacion->id})">Me gusta</span>
          <span class="glyphicon glyphicon-thumbs-up"></span> {Publicacion::likes($publicacion->id)} personas les gusta esto
          
          <div id="Comentarios-{$publicacion->id}">
              <div style="font-size: 10px; padding: 3px;" class="well well-sm col-sm-7">Esto es un comentario</div>
              <br>
              <br>                                        
              <textarea id="comentario-{$publicacion->id}" rows="1" placeholder="Escribe tu comentario..." class="col-sm-6"></textarea>
              <button class="btn btn-success btn-sm" onclick="fb.comentar({$publicacion->id})">Comentar</button>
          
      </div>    
       {foreachelse}
      <div class="alert alert-danger">
          No hay publicaciones
      </div>
  {/foreach}

  {/capture}
{capture assign="portada"}
  
  <img src="http://comutricolor.com/wp-content/uploads/2013/10/seleccion-colombia.png">
  
  {/capture}
  
  {include file="../masterpage/template.tpl" layout="two_columns"}