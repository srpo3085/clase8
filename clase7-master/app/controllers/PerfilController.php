<?php

class PerfilController extends BaseController {
    public function getIndex(){
        $amigos=usuario::all();
        $friends="";
            foreach($amigos as $amigo){
                $friends.="\"{$amigo->nombre}\",";
            }
            $friends=trim($friends,",");
            $usuario=Auth::user();
            
            
            $publicaciones=Publicacion::where('usuario_id',Auth::user()->id)
                    ->orderBy('id','desc')
                    ->get();
            
            
            $listOfriends = Usuario::find(Auth::user()->id)->misAmigos();
            return View::make('perfil.perfil')      //Esto no es así, no alcance a copiar
            ->with("nombre", Auth::user()->nombre)
            ->with("publicaciones", $publicaciones)
            ->with("friends", $friends)
            ->with("foto", Auth::user()->id.".jpg")
            ->with('amigos',$listOfriends)
            ->with('usuario',$usuario);
    }
    
    public function getVer($id){
        if($id==Auth::user()->id) return Redirect::to("/perfil");
        $usuario=usuario::find($id);
        $listOfriends = Usuario::find($id)->misAmigos();
        if($usuario){
            return View::make('perfil.perfil')
            ->with("nombre", $usuario->nombre)
           // ->with("publicaciones", $publicaciones)
           // ->with("s", $s)
            ->with("foto", $usuario->id.".jpg")
            ->with('amigos',$listOfriends )
            ->with('usuario',$usuario);
        }else{
            return Redirect::to("/perfil");
        }
    }
    public function getLogout(){
      Auth::logout();
      return Redirect::to("/");
        
    }
   /* public function missingMethod($parameters = array())
{
    return Redirect::to("/perfil");
}*/
    
}
