$('document').ready( function() {
  $('#staff_name').on("input", function () {
    var key = $('#staff_name').val()
    var clients = getRoles(localStorage.clients, key)
    if (clients.length == 1) {
      $('#staff_name').val(clients[0])
                      .selectRange(key.length, -1)
    }
  })
})

function getRoles(role, key) {
  return role.split(",").reduce(function (a,b) {
    if (b.toLowerCase().indexOf(key.toLowerCase())==0) {
      a.push(b)
    }
    return a
  }, [])
}

$.fn.selectRange = function(start, end) {
  if (end == -1) { end = this[0].value.length; }
  return this.each(function() {
    if (this.setSelectionRange) {
      this.focus();
      this.setSelectionRange(start, end);
    } else if (this.createTextRange) {
      var range = this.createTextRange();
      range.collapse(true);
      range.moveEnd('character', end);
      range.moveStart('charcter', start);
      range.select();
    }
  });
};
