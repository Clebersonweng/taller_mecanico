$(document)
.ready(
    function() {

        //contador para los detalles de la orden
       var contador = 0;

        // creo las filas tomando los valores de cada input
        var agregarProducto = function(idProd, nombreProd, cant) {
          return "<tr>" + 
            "<td>" + idProd + "</td>" + 
            "<td>" + nombreProd + "</td>" + 
            "<td>" + cant + "</td>" +
            "<td style='text-align: center'>"
             + "<a href='#'" + "id='quitar'>"
             + "<i class='icon-minus'></i>" + "</a>"+"</td>"+
            "<input type='hidden' name='order_master[order_details_attributes]["+contador+"][replacement_id]' value='"+idProd+"' />" + 
            "<input type='hidden' name='order_master[order_details_attributes]["+contador+"][quantity]' value='"+cant+"' />" + 
          "</tr>";
            
        };
        

$("#agregarProducto").on("click",function(event) {
         event.preventDefault();
          var producto = $("#order_detail_replacement option:selected");
          var cantidad = $("#quantity");
          if ($("#order_detail_replacement").val() == "") {
            return false;
          } else if (cantidad.val() == "") {
              return false;
          } else {
            var html = agregarProducto(producto.val(), producto.text(),
                cantidad.val());
                // carga los trs en la tabla
                $("#detalhes-container tbody:first")
                .append(html);
                // resetea los campos despues de  cada add
                $("#order_detail_replacement").val("");
                $("#quantity").val("");

            //incrementa al agregar cada fila
            contador++;
          }
});

$("#quitar").on("click", function(event) {
    event.preventDefault();
     $(this).parent().parent().remove();
     alert("levante");
});
     // aqui voy aguegando los detalles para despues recorrer
     // todo
$("#agregarProducto").on("click", function() {
        var filas = new Array();
        var hdnDetalles = $("#hdnDetalles");
        $("#tabla tbody tr").each(function(index) {
          var producto, precio;
          $(this).children("td").each(function(index2) {

            switch (index2) {
                case 0:
                producto = $(this).text();

                break;
                case 2:
                precio = $(this).text();
                break;

            }
        });
          filas.push(producto + '-' + precio);
          //console.log('las filas' + filas)
      });
        var detalles = filas.join('#');
        hdnDetalles.val(detalles);
});
                    // cierre de metodo

});