$(function() {

  function setDone(val) {
    $("#done").html(val);
  };
  
  function setNotDone(val) {
    $("#not-done").html(val);
  };

  // The taskHtml method takes in a Javascript representation
  // of the task and produces an HTML representation using
  // <li> tags
  function taskHtml(task) {
    var checkedStatus = task.done ? "checked" : "";
    var liClass = task.done ? "completed" : "";
    
    var liElement = '<li id="listItem-' + task.id + '" class="' + liClass + '">' + 
    '<a href="#"><i class="fa fa-minus-circle delete" data-id="' + task.id + '" aria-hidden="true" ></i></a>' +
    '<div class="view"><input class="toggle" type="checkbox"' + " data-id='" + 
    task.id + "'" + 
    checkedStatus + 
    ' /><label>' + 
    task.title + 
    '</label></div></li>';
    
    return liElement;
  };


  // toggleTask takes in an HTML representation of an event that fires
  // from an HTML representation of the toggle checkbox and performs
  // an API request to toggle the value of the 'done' field
  function toggleTask(e) {
    var itemId = $(e.target).data("id");
    var doneValue = Boolean($(e.target).is(':checked'));

    $.post("/tasks/" + itemId, {
      _method: "PUT",
      task: { done: doneValue }
    }).success(function(data) {

      var liHtml = taskHtml(data.task);
      var $li = $("#listItem-" + data.task.id);
      $li.replaceWith(liHtml); // writing over what was there previously
      $('.toggle').change(toggleTask);

      setDone(data.properties.completed);
      setNotDone(data.properties.incomplete);
    });
  };

  
  $.get("/tasks").success(function(data) {
    var htmlString = "";

    setDone(data.properties.completed);
    setNotDone(data.properties.incomplete);

    $.each(data.tasks, function (index,task) {
      htmlString += taskHtml(task);
    });

    var ulTodos = $('.todo-list');
    ulTodos.html(htmlString);

    $('.toggle').change(toggleTask);
    $('.delete').click(deleteTask);
  });


  function deleteTask(e) {
    var itemId = $(e.target).data("id");

    $.post("/tasks/" + itemId, {
      _method: "DELETE"
    }).success(function(data) {
      setDone(data.properties.completed);
      setNotDone(data.properties.incomplete);
      $("#listItem-" + data.task.id).remove();
    });
  };

  $('#new-form').submit(function(event) {
    event.preventDefault();
    var textbox = $('.new-todo');
    var payload = {
      task: {
        title: textbox.val()
      }
    };

    $.post("/tasks", payload).success(function(data) {
      debugger;

      var htmlString = taskHtml(data.task);
      var ulTodos = $('.todo-list');
      ulTodos.append(htmlString);
  
      $('.toggle').click(toggleTask);
      $('.delete').click(deleteTask);
      $('.new-todo').val('');

      setDone(data.properties.completed);
      setNotDone(data.properties.incomplete);
    });
  });
});





