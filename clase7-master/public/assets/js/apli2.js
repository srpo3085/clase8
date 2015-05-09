var fb = {
    
    meGusta : function(id){
        //alert('me gusta'+id);
        $.ajax({
                url: base_url + '/publicacion/megusta',
                type: 'POST',
                async: true,
                data: {
                        publicacion : id
                        },
                success: function(response){
                    console.Log(response);
                }              
            });
    },
    
    comentar: function(id) {
        var comentario = $("#comentario-" + id);
        if (comentario.val() != '') {
            $.ajax({
                url: 'publicacion/comentario',
                type: 'POST',
                async: true,
                data: {
                        usuario:1,
                        comentario:comentario.val()
                        },
                success: function(response){
                    alert("Se ejecuto correctamente");
                }
                //error: muestraError
            });
        } else {
            alert('Este campo es obligatorio');
        }
    }
};
