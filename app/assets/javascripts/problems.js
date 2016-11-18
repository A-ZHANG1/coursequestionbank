



// buttons = ["collection", "bloom"]

// buttons.each do |button|
//   $("#{button}").click(function(){
//     $("#button}").hide()

//   })


var AdditionalHidden = {

  setup: function() {
    $('.additional').each(function() {
      var problem = $(this);
      
      function toggle_behavior(button_name){
        problem.find(button_name).toggle();
      }

      function hide_behavior(button_name){
        problem.find(button_name).hide();
      }

      function show_behavior(button_name){
        problem.find(button_name).show();
      }

      function event_handling(select_button, hide_button_one, hide_button_two, toggle_button){
        problem.find(select_button).click(function() {
        toggle_behavior(toggle_button);
        hide_behavior(hide_button_one);
        hide_behavior(hide_button_two);
        return false;
      });}

      event_handling('.supersede_button', '.history_list', '.minor_form', '.supersede_form');
      // problem.find('.supersede_button').click(function() {
      //   // problem.find('.supersede_form').toggle();
      //   // problem.find('.history_list').hide();
      //   // problem.find('.minor_form').hide();
      //   toggle_behavior('.supersede_form');
      //   hide_behavior('.history_list');
      //   hide_behavior('.minor_form');
      //   return false;
      // });

      event_handling('.history_list', '.supersede_form', '.minor_form', '.history_list');
      // problem.find('.history_button').click(function() {
      //   // problem.find('.supersede_form').hide();
      //   // problem.find('.history_list').toggle();
      //   // problem.find('.minor_form').hide();
      //   hide_behavior('.supersede_form');
      //   toggle_behavior('.history_list');
      //   hide_behavior('minor_form');
      //   return false;
      // });

        problem.find('.btn-update').click(function() {
            console.log("Received");
            var pop = problem.find('.confirm-edit');
            pop.toggle();
            pop.find(".no-edit").on('click', function() {
                pop.hide();
            });
            return false;
        });

        event_handling('.minorupdate_button', '.supersede_form', '.history_list', '.minor_form');
        // problem.find('.minorupdate_button').click(function() {
        //     // problem.find('.minor_form').toggle();
        //     // problem.find('.supersede_form').hide();
        //     // problem.find('.history_list').hide();
        //     toggle_behavior('.minor_form');
        //     hide_behavior('.supersede_form');
        //     hide_behavior('.history_list');
        //     return false;
        // });



      problem.find('.hide_checkbox').click(function() {
        // problem.find('.edit-Collections').show()
        // problem.find('.show_checkbox').show()
        show_behavior('.edit-Collections');
        show_behavior('.show_checkbox');
        $(this).hide();
        return false;
      });

      problem.find('.show_checkbox').click(function() {
        // problem.find('.edit-Collections').hide()
        // problem.find('.hide_checkbox').show()
        hide_behavior('.edit-Collections');
        show_behavior('.hide_checkbox');
        $(this).hide();
        return false;
      });


      problem.find('button.collections-more-toggle').click(function(){
        problem.find('.collection-button').each(function(){
          $(this).show();
        })
        $(this).hide();
        //problem.find('.collections-less-toggle').show()
        show_behavior('.collections-less-toggle');
        return false;
      })

      problem.find('button.collections-less-toggle').click(function(){
        problem.find('.collection-button.btn-default').each(function(){
          $(this).hide();
        })
        $(this).hide();
        //problem.find('.collections-more-toggle').show()
        show_behavior('.collections-more-toggle');
        return false;
      })


      var hide_collections_button = problem.find('button.collections-less-toggle')
      hide_collections_button.click(function(){
        //problem.find('.collection-button btn').toggle();
        toggle_behavior('.collections-button btn');
        return false;
      })

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


var ChangeCollections = {
  setup: function() {
    $('.collection-buttons').each(function() {
      var container = $(this);
      container.find('form').submit(function() {
        $.ajax({
          url: $(this).attr('action'),
          type: 'PUT',
          data: $(this).serialize()
        });

        var button = $(this).find('input[type="submit"]');

        if (button.hasClass('btn-info')) {
          button.removeClass('btn-info');
          button.addClass('btn-default');
        }
        else if (button.hasClass('btn-default')) {
          button.removeClass('btn-default');
          button.addClass('btn-info');
        }

        return false;
      });
    });
  }
};
$(ChangeCollections.setup);