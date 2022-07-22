$( document ).ready(function() {
    console.log( "ready!" );

    jQuery(function ($) {

        //$("[data-dependency]").dependsOn()
    
        /*$("[data-dependency]").each(function () {
            $(this).dependsOn()
        });*/
    
    })
    
     $("#basecalculo-cantidad").blur(function(){
        costo=$("#basecalculo-costo").val();
        cantidad=$("#basecalculo-cantidad").val();
        total = parseFloat(costo) * parseFloat(cantidad);
        $("#basecalculo-monto_total").val(numberWithCommas(total));

        iva=$("#basecalculo-iva").val();
        total=$("#basecalculo-monto_total").val();
        iva_monto = parseFloat(iva) * parseFloat(total) / 100;
        $("#basecalculo-iva_monto").val(numberWithCommas(iva_monto));

        total_iva= parseFloat(total) + parseFloat(numberWithCommas(iva_monto));
        $("#basecalculo-total_iva").val(total_iva);

        total_iva = total_iva / 12;
        $("#basecalculo-enero").val(total_iva);

        $("#basecalculo-febrero").val(total_iva);

        $("#basecalculo-marzo").val(total_iva);

        $("#basecalculo-abril").val(total_iva);

        $("#basecalculo-mayo").val(total_iva);

        $("#basecalculo-junio").val(total_iva);

        $("#basecalculo-julio").val(total_iva);

        $("#basecalculo-agosto").val(total_iva);

        $("#basecalculo-septiembre").val(total_iva);

        $("#basecalculo-octubre").val(total_iva);

        $("#basecalculo-noviembre").val(total_iva);

        $("#basecalculo-diciembre").val(total_iva);

    });

    $('#accion-cantidad').keyup(function(){
        if($('#accion-cantidad').length > 0)
        {
            $('#meta').show();
        }
        else{
            $('#meta').hide();   
        }
    })

    $('#guardar').click(function(){
        cantidad = $('#accion-cantidad').val()
        enero = $('#accion-enero').val()
        febrero = $('#accion-febrero').val()
        marzo = $('#accion-marzo').val()
        abril = $('#accion-abril').val()
        mayo = $('#accion-mayo').val()
        junio = $('#accion-junio').val()
        julio = $('#accion-julio').val()
        agosto = $('#accion-agosto').val()
        septiembre = $('#accion-septiembre').val()
        octubre = $('#accion-octubre').val()
        noviembre = $('#accion-noviembre').val()
        diciembre = $('#accion-diciembre').val()
        totalmes = (parseFloat(enero)+parseFloat(febrero)+parseFloat(marzo)+parseFloat(abril)+parseFloat(mayo)+parseFloat(junio)+parseFloat(julio)+parseFloat(agosto)+parseFloat(septiembre)+parseFloat(octubre)+parseFloat(noviembre)+parseFloat(diciembre))
        total = parseFloat(cantidad) - parseFloat(totalmes)
        if(total != 0)
        {
            Swal.fire(
              'Error',
              'La distribucion de la meta es diferecte a la cantidad total de la meta',
              'error'
            )
        }
        else{   
            $("#formulario-ae").submit()
        }
    })

});
function numberWithCommas(x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    return parts.join(",");
}