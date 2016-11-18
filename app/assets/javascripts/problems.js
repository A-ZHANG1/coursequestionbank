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
      event_handling('.history_list', '.supersede_form', '.minor_form', '.history_list');
      event_handling('.minorupdate_button', '.supersede_form', '.history_list', '.minor_form');

        problem.find('.btn-update').click(function() {
            console.log("Received");
            var pop = problem.find('.confirm-edit');
            pop.toggle();
            pop.find(".no-edit").on('click', function() {
                pop.hide();
            });
            return false;
        });

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

      function toggle_collection(click_toggle, operate_toggle, show_toggle){

          problem.find(click_toggle).click(function(){
          problem.find(operate_toggle).each(function(){
            if (operate_toggle == '.collection-button'){
              $(this).show();
            }
            else if(click_toggle == '.collection-button.btn-default'){
              $(this).hide();
            }
          })
          $(this).hide();
          //problem.find('.collections-less-toggle').show()
          show_behavior(show_toggle);
          return false;
        })
      }

      toggle_collection('button.collections-more-toggle', '.collection-button', '.collections-less-toggle')
      toggle_collection('button.collections-less-toggle', '.collection-button.btn-default', '.collections-more-toggle')


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





