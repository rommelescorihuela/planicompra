$( document ).ready(function() {
    console.log( "ready!" );

    jQuery(function ($) {

        $("[data-dependency]").dependsOn()
    
        /*$("[data-dependency]").each(function () {
            $(this).dependsOn()
        });*/
    
    })
    
     $("#basecalculo-cantidad").blur(function(){
        costo=$("#basecalculo-costo").val();
        cantidad=$("#basecalculo-cantidad").val();
        total = parseFloat(costo) * parseFloat(cantidad);
        $("#basecalculo-monto_total").val(total);

        iva=$("#basecalculo-iva").val();
        total=$("#basecalculo-monto_total").val();
        iva_monto = parseFloat(iva) * parseFloat(total) / 100;
        $("#basecalculo-iva_monto").val(iva_monto);

        total_iva= parseFloat(total) + parseFloat(iva_monto);
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
});