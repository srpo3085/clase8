<?php


class Publicacion extends Eloquent{
    protected $table='publicacion';

    public function freshTimestamp(){
        return date('Y-m-d h:m:s');
    }
    
    public static function likes($id){
        return Megusta::where('publicacion_id',$id)
                ->count();
    }
}