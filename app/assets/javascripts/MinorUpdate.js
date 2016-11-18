// var MinorUpdate = {
//     setup: function() {
//         $('.minor_form form').submit(function(e) {
//             $.ajax({
//                 context: this,
//                 url: $(this).attr('action'),
//                 type: 'POST',
//                 data: $(this).serialize(),
//                 success: function(data, textStatus, jqXHR) {
//                     if (data.error === null)
//                         window.location.reload();
//                     else
//                         $(this).find('.message').text(data.error);
//                 }
//             });
//             return false;
//         });
//     }
// };
// $(MinorUpdate.setup);