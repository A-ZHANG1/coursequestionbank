
var Question = {
    setup: function() {
        $('.select_multiple_question').each(function() {
            var question = $(this);
            question.ready(function() {
                var hoverOnEntry = function() {
                    $(this).css('border', '2px solid dodgerblue');
                }
                var hoverOffEntry = function() {
                    $(this).css('border', '1px solid grey');
                }
                var unCheckAll = function(entrysDiv) {
                    $(entrysDiv).find(".entrybox").each(function() {
                        $(this).on("mouseover", hoverOnEntry);
                        $(this).on("mouseleave", hoverOffEntry);
                        $(this).mouseleave();
                    });
                }
                var clickOnEntry = function() {
                    choice = $(this).find(":checkbox")
                    if (choice.is(':checked')) {
                        choice.prop('checked', false);
                        $(this).on("mouseover", hoverOnEntry);
                        $(this).on("mouseleave", hoverOffEntry);
                    } else {
                        // unCheckAll($(this).parent());
                        $(this).mouseover();
                        choice.prop('checked', true);
                        $(this).off("mouseover");
                        $(this).off("mouseleave");
                    }
                    return false;
                }

                var checkCorrect = function(entrysDiv) {
                    var keys = [false, false, false, true];
                    $(entrysDiv).find(".entrybox").each(function() {
                        var entryNum = problem.attr('id').split(/-/);
                        console.log(entryNum);
                    });

                }

                question.find(".entrybox").mouseover(hoverOnEntry);
                question.find(".entrybox").mouseleave(hoverOffEntry);
                question.find(".entrybox").click(clickOnEntry);
            });

        });

        $('.multiple_choice_question').each(function() {
            var question = $(this);
            question.ready(function() {
                var hoverOnEntry = function() {
                    $(this).css('border', '2px solid dodgerblue');
                }
                var hoverOffEntry = function() {
                    $(this).css('border', '1px solid grey');
                }
                var unCheckAll = function(entrysDiv) {
                    $(entrysDiv).find(".entrybox").each(function() {
                        $(this).on("mouseover", hoverOnEntry);
                        $(this).on("mouseleave", hoverOffEntry);
                        $(this).mouseleave();
                    });
                }
                var clickOnEntry = function() {
                    choice = $(this).find(":radio");
                    if (choice.is(':checked')) {
                        choice.prop('checked', false);
                        $(this).on("mouseover", hoverOnEntry);
                        $(this).on("mouseleave", hoverOffEntry);
                    } else {
                        unCheckAll($(this).parent());
                        $(this).mouseover();
                        choice.prop('checked', true);
                        $(this).off("mouseover");
                        $(this).off("mouseleave");
                    }
                    return true;
                }

                var checkCorrect = function(entrysDiv) {
                    var keys = [false, false, false, true];
                    $(entrysDiv).find(".entrybox").each(function() {
                        var entryNum = problem.attr('id').split(/-/);
                        console.log(entryNum);
                    });
                }

                question.find(".entrybox").mouseover(hoverOnEntry);
                question.find(".entrybox").mouseleave(hoverOffEntry);
                question.find(".entrybox").click(clickOnEntry);
            });

        });

    }
};
$(Question.setup);



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

                button_text = "#collection_text_" + $(this).attr("collection") + "_" + $(this).attr("problem")

                var button = $(this).find('input[type="submit"]');

                if ($(this).attr("checked") === "checked") {
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


