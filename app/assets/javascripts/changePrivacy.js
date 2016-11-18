// var ChangePrivacy = {
//   setup: function() {
//     $('.prob_privacy').submit(function() {
//       var button = $(this).find('input[type="submit"]');
//       var newValue = button.attr('value') === 'Public' ? 'Private' : 'Public';
//       button.attr('value', newValue);
//       $(this).find('input[name="privacy"]').attr('value', button.attr('value'));
//       $.ajax({
//         url: $(this).attr('action'),
//         type: 'PUT',
//         data: $(this).serialize()
//       });
//       return false;
//     });
//   }
// };
// $(ChangePrivacy.setup);

