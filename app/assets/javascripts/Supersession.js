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
                        window.location.reload();
                    else
                        $(this).find('.message').text(data.error);
                }
            });
            return false;
        });
    }
};
$(Supersession.setup);


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
