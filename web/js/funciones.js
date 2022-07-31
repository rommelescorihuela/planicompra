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
        costo1=costo.replace(/\./g, '');
        costo2=costo1.replace(",",".")

        cantidad=$("#basecalculo-cantidad").val();
        subtotal = parseFloat(costo2) * parseFloat(cantidad);
        $("#basecalculo-monto_total").val(numberWithCommas(subtotal.toFixed(0)));
        iva=$("#basecalculo-iva").val();
        

        iva_monto = parseFloat(iva) * parseFloat(subtotal) / 100;
        $("#basecalculo-iva_monto").val(numberWithCommas(iva_monto.toFixed(0)));

        total_iva= parseFloat(subtotal) + parseFloat(iva_monto);
        $("#basecalculo-total_iva").val(numberWithCommas(total_iva.toFixed(0)));

        mensual = (total_iva / 12).toFixed(0);
        $("#basecalculo-enero").val(numberWithCommas(mensual));

        $("#basecalculo-febrero").val(numberWithCommas(mensual));

        $("#basecalculo-marzo").val(numberWithCommas(mensual));

        $("#basecalculo-abril").val(numberWithCommas(mensual));

        $("#basecalculo-mayo").val(numberWithCommas(mensual));

        $("#basecalculo-junio").val(numberWithCommas(mensual));

        $("#basecalculo-julio").val(numberWithCommas(mensual));

        $("#basecalculo-agosto").val(numberWithCommas(mensual));

        $("#basecalculo-septiembre").val(numberWithCommas(mensual));

        $("#basecalculo-octubre").val(numberWithCommas(mensual));

        $("#basecalculo-noviembre").val(numberWithCommas(mensual));

        $("#basecalculo-diciembre").val(numberWithCommas(mensual));

    });


    $("#basecalculo-guardar").click(function(){

        enero = $("#basecalculo-enero").val();

        febrero = $("#basecalculo-febrero").val();

        marzo = $("#basecalculo-marzo").val();

        abril = $("#basecalculo-abril").val();

        mayo = $("#basecalculo-mayo").val();

        junio = $("#basecalculo-junio").val();

        julio = $("#basecalculo-julio").val();

        agosto = $("#basecalculo-agosto").val();

        septiembre = $("#basecalculo-septiembre").val();

        octubre = $("#basecalculo-octubre").val();

        noviembre = $("#basecalculo-noviembre").val();

        diciembre = $("#basecalculo-diciembre").val();

        total_mensual = parseFloat(enero.replace(/\./g, ''))+parseFloat(febrero.replace(/\./g, ''))+parseFloat(marzo.replace(/\./g, ''))+parseFloat(abril.replace(/\./g, ''))+parseFloat(mayo.replace(/\./g, ''))+parseFloat(junio.replace(/\./g, ''))+parseFloat(julio.replace(/\./g, ''))+parseFloat(agosto.replace(/\./g, ''))+parseFloat(septiembre.replace(/\./g, ''))+parseFloat(octubre.replace(/\./g, ''))+parseFloat(noviembre.replace(/\./g, ''))+parseFloat(diciembre.replace(/\./g, ''))

        total = $("#basecalculo-total_iva").val().replace(/\./g, '');

        diferencia = total_mensual - total
        console.log(diferencia)
        if(diferencia > 0 ){   
            Swal.fire(
                'Error',
                'La distribucion de gastos mensual es mayor al total calculado por favor reste la cantidad de: '+Math.abs(diferencia)+' de manera total o distribuida en el mes o los meses que desee',
                'error'
            )
        }
        else if(diferencia < 0 ){
            Swal.fire(
                'Error',
                'La distribucion de gastos mensual es menor al total calculado por favor adicione la cantidad de: '+Math.abs(diferencia)+' de manera total o distribuida en el mes o los meses que desee',
                'error'
            )
        }
        else if(diferencia == 0)
        {
            $("#basecalculo-formulario").submit();
        }
     })

    $("#basecalculo-borrar").click(function(){
        $("#basecalculo-enero").val(numberWithCommas(0));

        $("#basecalculo-febrero").val(numberWithCommas(0));

        $("#basecalculo-marzo").val(numberWithCommas(0));

        $("#basecalculo-abril").val(numberWithCommas(0));

        $("#basecalculo-mayo").val(numberWithCommas(0));

        $("#basecalculo-junio").val(numberWithCommas(0));

        $("#basecalculo-julio").val(numberWithCommas(0));

        $("#basecalculo-agosto").val(numberWithCommas(0));

        $("#basecalculo-septiembre").val(numberWithCommas(0));

        $("#basecalculo-octubre").val(numberWithCommas(0));

        $("#basecalculo-noviembre").val(numberWithCommas(0));

        $("#basecalculo-diciembre").val(numberWithCommas(0));
    })
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
              'La distribucion de la meta es diferente a la cantidad total de la meta',
              'error'
            )
        }
        else{   
            $("#formulario-ae").submit()
        }
    })

    
    $(".dynamicform_wrapper").on("beforeInsert", function(e, item) {
        console.log("beforeInsert");
    });

    $(".dynamicform_wrapper").on("afterInsert", function(e, item) {
        console.log("afterInsert");
    });

    $(".dynamicform_wrapper").on("beforeDelete", function(e, item) {
        if (! confirm("Are you sure you want to delete this item?")) {
            return false;
        }
        return true;
    });

    $(".dynamicform_wrapper").on("afterDelete", function(e) {
        console.log("Deleted item!");
    });

    $(".dynamicform_wrapper").on("limitReached", function(e, item) {
        alert("Limit reached");
    });


});
function numberWithCommas(x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    return parts.join(",");
}