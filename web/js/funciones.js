$( document ).ready(function() {

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
        if(total > 0)
        {
            Swal.fire(
              'Error',
              'La distribucion de la meta es menor a la cantidad total de la meta',
              'error'
            )
        }
        else if(total < 0)
        {
            Swal.fire(
              'Error',
              'La distribucion de la meta es mayor a la cantidad total de la meta',
              'error'
            )
        }
        else if(total == 0){   
            $("#formulario-ae").submit()
        }
    })

    
    $(".dynamicform_wrapper").on("beforeInsert", function(e, item) {
        console.log("beforeInsert");
    });

    $(".dynamicform_wrapper").on("afterInsert", function(e, item) {
        console.log("afterInsert");
        console.log(e);
        console.log(item);
        var valor = $('#miDiv #miCampo').val();
        $('#unidadmedida-'+valor+'-enero').val(0);
        $('#unidadmedida-'+valor+'-febrero').val(0);
        $('#unidadmedida-'+valor+'-marzo').val(0);
        $('#unidadmedida-'+valor+'-abril').val(0);
        $('#unidadmedida-'+valor+'-mayo').val(0);
        $('#unidadmedida-'+valor+'-junio').val(0);
        $('#unidadmedida-'+valor+'-julio').val(0);
        $('#unidadmedida-'+valor+'-agosto').val(0);
        $('#unidadmedida-'+valor+'-septiembre').val(0);
        $('#unidadmedida-'+valor+'-octubre').val(0);
        $('#unidadmedida-'+valor+'-noviembre').val(0);
        $('#unidadmedida-'+valor+'-diciembre').val(0);
        var valor = parseFloat(valor) + parseFloat(1);
        $('#miDiv #miCampo').val(valor);
    });

    $(".dynamicform_wrapper").on("beforeDelete", function(e, item) {
        if (! confirm("Esta seguro que desea borrar este elemento?")) {
            return false;
        }
        var valor = $('#miDiv #miCampo').val();
        var valor = parseFloat(valor) - parseFloat(1);
        $('#miDiv #miCampo').val(valor);
        return true;
    });

    $(".dynamicform_wrapper").on("afterDelete", function(e) {
        console.log("Deleted item!");
    });

    $(".dynamicform_wrapper").on("limitReached", function(e, item) {
        alert("Limit reached");
    });

    $("#poa-id_tipo").on("change",function(){
        console.log($("#poa-id_tipo").val());
        if ($("#poa-id_tipo").val() == 1){
            $("#proyecto").html("Hello World");
        }
        else if ($("#poa-id_tipo").val() == 2){
            $("#proyecto").html("hhjjj");
        }
    })

    $('#submit-act').click(function(){
        var valor = $('#miDiv #miCampo').val();
        for (var i = 0; i < valor; i++) {
            total = $('#unidadmedida-'+i+'-total').val()
            enero = $('#unidadmedida-'+i+'-enero').val()
            febrero = $('#unidadmedida-'+i+'-febrero').val()
            marzo = $('#unidadmedida-'+i+'-marzo').val()
            abril = $('#unidadmedida-'+i+'-abril').val()
            mayo = $('#unidadmedida-'+i+'-mayo').val()
            junio = $('#unidadmedida-'+i+'-junio').val()
            julio = $('#unidadmedida-'+i+'-julio').val()
            agosto = $('#unidadmedida-'+i+'-agosto').val()
            septiembre = $('#unidadmedida-'+i+'-septiembre').val()
            octubre = $('#unidadmedida-'+i+'-octubre').val()
            noviembre = $('#unidadmedida-'+i+'-noviembre').val()
            diciembre = $('#unidadmedida-'+i+'-diciembre').val()
            totalmes = (parseFloat(enero)+parseFloat(febrero)+parseFloat(marzo)+parseFloat(abril)+parseFloat(mayo)+parseFloat(junio)+parseFloat(julio)+parseFloat(agosto)+parseFloat(septiembre)+parseFloat(octubre)+parseFloat(noviembre)+parseFloat(diciembre))
            diferencia = parseFloat(total) - parseFloat(totalmes)
            if(diferencia > 0)
            {
                Swal.fire(
                  'Error',
                  'La distribucion de la meta:<b> '+$('#unidadmedida-'+i+'-unidadmedida').val()+'</b><br> es <b>menor</b> a la cantidad total de la meta',
                  'error'
                )
                $('#unidadmedida-'+i+'-total').focus()
                return false;
            }
            else if(diferencia < 0)
            {
                Swal.fire(
                  'Error',
                  'La distribucion de la meta:<b> '+$('#unidadmedida-'+i+'-unidadmedida').val()+'</b><br> es <b>mayor</b> a la cantidad total de la meta',
                  'error'
                )
                $('#unidadmedida-'+i+'-total').focus()
                return false;
            } 
        } 
        $("#dynamic-form-actividades").submit()
    })

});
function numberWithCommas(x) {
    var parts = x.toString().split(".");
    parts[0] = parts[0].replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    return parts.join(",");
}

function validar(data){
    var campo =  data.id.split("-");
    var campototal = campo[0]+'-'+campo[1]+'-total';
    var enero =campo[0]+'-'+campo[1]+'-enero';
    var febrero =campo[0]+'-'+campo[1]+'-febrero';
    var marzo =campo[0]+'-'+campo[1]+'-marzo';
    var abril =campo[0]+'-'+campo[1]+'-abril';
    var mayo =campo[0]+'-'+campo[1]+'-mayo';
    var junio =campo[0]+'-'+campo[1]+'-junio';
    var julio =campo[0]+'-'+campo[1]+'-julio';
    var agosto =campo[0]+'-'+campo[1]+'-agosto';
    var septiembre =campo[0]+'-'+campo[1]+'-septiembre';
    var octubre =campo[0]+'-'+campo[1]+'-octubre';
    var noviembre =campo[0]+'-'+campo[1]+'-noviembre';
    var diciembre =campo[0]+'-'+campo[1]+'-diciembre';
    total = $('#'+campototal).val();
    mestotal = parseInt($('#'+enero).val())+parseInt($('#'+febrero).val())+parseInt($('#'+marzo).val())+parseInt($('#'+abril).val())+parseInt($('#'+mayo).val())+parseInt($('#'+junio).val())+parseInt($('#'+julio).val())+parseInt($('#'+agosto).val())+parseInt($('#'+septiembre).val())+parseInt($('#'+octubre).val())+parseInt($('#'+noviembre).val())+parseInt($('#'+diciembre).val());
    console.log(total);
    console.log(mestotal);
}