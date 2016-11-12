var Supersession = {
  setup: function() {
    $('.supersede_form form').submit(function(e) {
      $.ajax({
          context: this,
          url: $(this).attr('action'),
          type: 'POST',
          data: $(this).serialize(),
          success: function(data, textStatus, jqXHR) {
            if (data.error === null)
              window.location.href = '/problems';
            else
              $(this).find('.message').text(data.error);
          }
      });
      return false;
    });
  }
};
$(Supersession.setup);


var AdditionalHidden = {
  setup: function() {
    $('.additional').each(function() {
      var problem = $(this);
      problem.find('.supersede_button').click(function() {
        problem.find('.supersede_form').toggle();
        problem.find('.history_list').hide();
        return false;
      });
      problem.find('.history_button').click(function() {
        problem.find('.supersede_form').hide();
        problem.find('.history_list').toggle();
        return false;
      });

      problem.find('.hide_checkbox').click(function() {
        problem.find('.edit-Collections').show()
        problem.find('.show_checkbox').show()
        $(this).hide();
        return false;
      });

      problem.find('.show_checkbox').click(function() {
        problem.find('.edit-Collections').hide()
        problem.find('.hide_checkbox').show()
        $(this).hide();
        return false;
      });


      // problem.find('button.collections-more-toggle').click(function(){
      //   problem.find('.collection-button').each(function(){
      //     $(this).show();
      //   })
      //   $(this).hide();
      //   problem.find('.collections-less-toggle').show()
      //
      //   return false;
      // })
      //
      // problem.find('button.collections-less-toggle').click(function(){
      //   problem.find('.collection-button.btn-default').each(function(){
      //     $(this).hide();
      //   })
      //   $(this).hide();
      //   problem.find('.collections-more-toggle').show()
      //   return false;
      // })


      // var hide_collections_button = problem.find('button.collections-less-toggle')
      // hide_collections_button.click(function(){
      //   problem.find('.collection-button btn').toggle();
      //   return false;
      // })

    });
  }
};
$(AdditionalHidden.setup);


var AddTags = {
  setup: function() {
    $('.add_tags_form').submit(function() {
      $.ajax({
        context: this,
        url: $(this).attr('action'),
        type: 'POST',
        data: $(this).serialize(),
        success: function(data) {
          $(this).parent().find('.tag_list').html(data);
          RemoveTags.setup();
        }
      });
      $(this)[0].reset();
      return false;
    });
  }
};
$(AddTags.setup);


var RemoveTags = {
  setup: function() {
    $('.remove_tag').submit(function() {
      $(this).parent().remove();
      $.ajax({
        url: $(this).attr('action'),
        type: 'POST',
        data: $(this).serialize()
      });
      return false;
    });
  }
};
$(RemoveTags.setup);


var ChangePrivacy = {
  setup: function() {
    $('.prob_privacy').submit(function() {
      var button = $(this).find('input[type="submit"]');
      var newValue = button.attr('value') === 'Public' ? 'Private' : 'Public';
      button.attr('value', newValue);
      $(this).find('input[name="privacy"]').attr('value', button.attr('value'));
      $.ajax({
        url: $(this).attr('action'),
        type: 'PUT',
        data: $(this).serialize()
      });
      return false;
    });
  }
};
$(ChangePrivacy.setup);


var SetObsolete = {
  setup: function() {
    $('.prob_obsolete').submit(function() {
      $.ajax({
        url: $(this).attr('action'),
        type: 'PUT',
        data: $(this).serialize()
      });
      var button = $(this).find('input[type="submit"]');
      var field = $(this).find('input[name="obsolete"]');
      var obsolete = field.attr('value') === '1';
      field.attr('value', obsolete ? '0' : '1');
      button.attr('value', obsolete ? 'Obsolete' : 'Mark obsolete');
      return false;
    });
  }
};
$(SetObsolete.setup);


var ChangeBloom = {
  setup: function() {
    $('.bloom-buttons').each(function() {
      var container = $(this);
      container.find('form').submit(function() {
        $.ajax({
          url: $(this).attr('action'),
          type: 'PUT',
          data: $(this).serialize()
        });

        var button = $(this).find('input[type="submit"]');
        var category = $(this).find('input[name="category"]').attr('value');

        // Reset all buttons to default action
        container.find('form').each(function() {
          var my_button = $(this).find('input[type="submit"]');
          var my_category_field = $(this).find('input[name="category"]');
          my_category_field.attr('value', my_button.attr('value'));
        });

        // Set 'none' action for current button if appropriate
        var category_field = $(this).find('input[name="category"]');
        if (category !== 'none')
          category_field.attr('value', 'none');

        // Stylize buttons based on action
        container.find('form').each(function() {
          var button = $(this).find('input[type="submit"]');
          var category = $(this).find('input[name="category"]').attr('value');
          button.removeClass('btn-default btn-info');
          if (category === 'none')
            button.addClass('btn-info');
          else
            button.addClass('btn-default');
        });

        return false;
      });
    });
  }
};
$(ChangeBloom.setup);


// var ChangeCollections = {
//   setup: function() {
//     $('.collection-buttons').each(function() {
//       var container = $(this);
//       container.find('form').submit(function() {
//         $.ajax({
//           url: $(this).attr('action'),
//           type: 'PUT',
//           data: $(this).serialize()
//         });
//
//         var button = $(this).find('input[type="submit"]');
//
//         if (button.hasClass('btn-info')) {
//           button.removeClass('btn-info');
//           button.addClass('btn-default');
//         }
//         else if (button.hasClass('btn-default')) {
//           button.removeClass('btn-default');
//           button.addClass('btn-info');
//         }
//
//         return false;
//       });
//     });
//   }
// };
// $(ChangeCollections.setup);

var ChangeCollectionsByCheckbox = {
  setup: function() {
    $('.collection-checkbox').each(function() {
      var container = $(this);
      container.click(function() {
        $.ajax({
          url: $(this).attr('action'),
          type: 'PUT',
          // success: ChangeCollectionsByCheckbox.editCollectionButton,
          data: {"collection": $(this).attr("collection")}

        });
        // update belongs to which collecion

        button_id = "#toggle_collection_" + $(this).attr("collection") + "_" + $(this).attr("problem")
        button_text = "#collection_text_" + $(this).attr("collection") + "_" + $(this).attr("problem")
        // debugger;

        var button = $(this).find('input[type="submit"]');

        debugger;
        if ($(this).attr("checked") == "checked") {
          $(this).attr('checked',false);
          $(button_text).hide();
        }
        else {
          $(this).attr('checked',true);
          $(button_text).show();
        }

        return true;
      });

    });
  }

};
$(ChangeCollectionsByCheckbox.setup);
