
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
                var clickOnEntry = function(event) {
                    target = $(event.target);
                    choice = $(this).find(":checkbox")
                    checked = choice.prop('checked');
                    if (target.is(':checkbox')) {
                        checked = !checked;
                    }
                    if (checked) {
                        $(this).on("mouseover", hoverOnEntry);
                        $(this).on("mouseleave", hoverOffEntry);
                    } else {
                        // unCheckAll($(this).parent());
                        $(this).mouseover();
                        $(this).off("mouseover");
                        $(this).off("mouseleave");
                    }
                    choice.prop('checked', !checked);
                    return;
                }

                var checkCorrect = function(checkButton) {

                    // check if studnet is correct
                    var correct = true
                    $(this).parent().find(".entrybox").each(function () {
                        // debugger
                        choice_correct = ($(this).attr('correct') == 'true') == $(this).find('input[type="checkbox"]').is(':checked')
                        correct = correct && choice_correct
                    })

                    // TO DO: add a ajax call

                    $(this).parent().find(".entrybox").each(function() {

                        if ($(this).find('input[type="checkbox"]').is(':checked')){
                            $(this).find('.entryexplain').show();
                            $(this).off("mouseover");
                            $(this).off("mouseleave");
                        }else{
                            $(this).find('.entryexplain').hide();
                            $(this).on("mouseover", hoverOnEntry);
                            $(this).on("mouseleave", hoverOffEntry);
                        }

                    });
                    // debugger
                    if (correct){
                        $(this).parent().find(".multiple-correct").css('border', '2px solid green');
                        $(this).parent().find(".multiple-correct").show();
                        $(this).parent().find(".multiple-wrong").hide();
                    }else{
                        $(this).parent().find(".multiple-wrong").css('border', '2px solid red');
                        $(this).parent().find(".multiple-correct").hide();
                        $(this).parent().find(".multiple-wrong").show();
                    }

                }

                var showCorrect = function (showButton) {
                    $(this).parent().find(".entrybox").each(function () {
                        if ($(this).attr('correct') == 'true'){
                            $(this).find('.entryexplain').show();
                            $(this).find('input[type = "checkbox"]').prop("checked", true);
                            $(this).css('border', '2px solid green');
                            $(this).off("mouseover");
                            $(this).off("mouseleave");
                        }else{
                            $(this).find('.entryexplain').hide();
                            $(this).find('input[type = "checkbox"]').prop("checked", false);
                            $(this).css('border', '1px solid grey');
                            $(this).on("mouseover");
                            $(this).on("mouseleave");
                        }


                    })
                }

                question.find(".show-answer").click(showCorrect);
                question.find(".entrybox").mouseover(hoverOnEntry);
                question.find(".entrybox").mouseleave(hoverOffEntry);
                // question.find(".entrybox.correctness").off("mouseover")
                // question.find(".entrybox.correctness").off("mouseleave")
                question.find(".entrybox").click(clickOnEntry);
                question.find(".check-answer").click(checkCorrect);

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
                // var attempt;

                var clickOnEntry = function(event) {
                    target = $(event.target);
                    choice = $(this).find(":radio");
                    checked = $(this).find(":radio").prop('checked');
                    if (target.is(':radio')) {
                        checked = !checked;
                    }
                    if (checked) {

                        $(this).on("mouseover", hoverOnEntry);
                        $(this).on("mouseleave", hoverOffEntry);
                    } else {
                        unCheckAll($(this).parent());
                        $(this).mouseover();
                        $(this).off("mouseover");
                        $(this).off("mouseleave");
                    }

                    choice.prop('checked', !checked);
                    result = $(this).attr('correct') === 'true'
                    attemptRecord = $(this).attr("answer_id")
                    return true;
                }

                var checkCorrect = function(checkButton) {


                    $(this).parent().find(".entrybox").each(function() {

                        if ($(this).find('input[type="radio"]').is(':checked')){
                            $(this).find('.entryexplain').show();
                            $(this).off("mouseover");
                            $(this).off("mouseleave");
                            if ($(this).attr('correct') === 'true')
                                $(this).css('border', '2px solid green');
                            else
                                $(this).css('border', '2px solid red');
                        }else{
                            $(this).find('.entryexplain').hide();
                            $(this).on("mouseover", hoverOnEntry);
                            $(this).on("mouseleave", hoverOffEntry);
                        }
                        // $(this).toggle()



                    });
                    problemName = $(this).parent().find("input").attr("name")

                    $.ajax({
                        url: "studentanswers",
                        type: 'POST',
                        data: {attempt: attemptRecord, problem_uid:problemName, correctness:result}
                    });
                    return false;
                }




                question.find(".entrybox").mouseover(hoverOnEntry);
                question.find(".entrybox").mouseleave(hoverOffEntry);
                question.find(".entrybox").click(clickOnEntry);
                question.find(".check-answer").click(checkCorrect)

            });

        });




        $('.fillin_question').each(function() {
            var question = $(this);
            question.ready(function() {

                var hoverOnEntry = function() {
                    $(this).css('border', '2px solid dodgerblue');
                }

                var checkCorrect = function(checkButton) {


                    correct = false;

                    if ($(this).parent().find(".students-answer").val() === $(this).parent().find("p.answer").text().trim()){
                        $(this).parent().find(".entrybox").css('border', '2px solid green');
                        $(this).parent().find(".fillin-correct").show()
                        $(this).parent().find(".fillin-wrong").hide()
                        correct = true;
                    }else{
                        $(this).parent().find(".entrybox").css('border', '2px solid red');
                        $(this).parent().find(".fillin-correct").hide()
                        $(this).parent().find(".fillin-wrong").show()
                    }





                }

                // question.find(".entrybox").mouseover(hoverOnEntry);
                // question.find(".entrybox").mouseleave(hoverOffEntry);
                // question.find(".entrybox").click(clickOnEntry);
                question.find(".entrybox").css('border', "None")
                question.find(".check-answer").click(checkCorrect)
            });

        });

    }
};
$(Question.setup);

//
// var studentAnswerTesting = {
//     setup: function() {
//         $('.student-answer').on('click', function() {
//             debugger
//             // $(this).parent().remove();
//             $.ajax({
//                 url: "student_answers",
//                 type: 'POST',
//                 data: $(this).serialize()
//             });
//             return false;
//         });
//     }
// };
// $(studentAnswerTesting.setup);

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
