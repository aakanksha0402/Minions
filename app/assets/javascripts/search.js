function NavController() {
  var searchField = $('#search-field');
  var searchResults = $('#search-results');
  var escape, selected;
  var links = searchResults.find('a');
  const SEARCH_API = searchField.data("url");

  searchField.keydown(function(e){
    switch (e.keyCode) {
      case 13:
          if (links[selected]) {links[selected].click();}
          break;
      case 38:
          if (selected > 0) {
              links[selected].classList.remove('selected');
              links[--selected].classList.add('selected');
          }
          break;
      case 40:
          if (links.length - 1 > selected) {
              links[selected].classList.remove('selected');
              links[++selected].classList.add('selected');
          }
          break;
          default: return true;
      }
    e.preventDefault();
  });

  searchField.on('keyup', debounce(search, 100));

  function search(e) {
    if (e.which > 8 && e.which < 48 || e.which === 90 || e.which === 91) {
      return false;
    } else if (this.value.length < 3) {
      searchResults.html('');
      return true;
    }

    var q = encodeURIComponent(searchField.val());
    var url = "${SEARCH_API}?q=${q}";
    $.get( url, function(data){
      var searchURL = "/search?q=${encode(searchField.val())}";
      searchResults.html('');
      searchResults.append(link("Search for '${searchField.val()}'", searchURL, 'selected'));
      selected = 0;
      var results = data;
      if (!results.length) return;
      searchResults.append('<li><hr></li>');
      for (var j in results) {
        searchResults.append(link(results[j].name, results[j].url));
      }
    });
  }

  function link(text, url, classname) {
    var a = '<a href='+ url +' class='+ classname + '>'+ text +'</a>'
    var li = '<li>' + a + '</li>'
    return li;
  }

  function encode(str) {
    return encodeURIComponent(str).replace(/%20/g, '+');
  }

  function debounce(fn, delay) {
    var timer = null;
    return function() {
        var context = this, args = arguments;
        clearTimeout(timer);
        timer = setTimeout(function() {
            fn.apply(context, args);
        }, delay);
    }
  }
};
