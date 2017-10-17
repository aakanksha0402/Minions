const NavController = function() {
  let searchField = $('#search-field');
  let searchResults = $('#search-results');
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

    let q = encodeURIComponent(searchField.val());
    let url = `${SEARCH_API}?q=${q}`;
    $.get( url, function(data){
      let searchURL = `/search?q=${encode(searchField.val())}`;
      searchResults.html('');
      searchResults.append(link(`Search for '${searchField.val()}'`, searchURL, 'selected'));
      selected = 0;
      let results = data;
      if (!results.length) return;
      searchResults.append('<li><hr></li>');
      for (let j in results) {
        searchResults.append(link(results[j].name, results[j].url));
      }
    });
  }

  function link(text, url, classname = '') {
    let a = '<a href='+ url +' class='+ classname + '>'+ text +'</a>'
    let li = '<li>' + a + '</li>'
    return li;
  }

  function encode(str) {
    return encodeURIComponent(str).replace(/%20/g, '+');
  }

  function debounce(fn, delay) {    
    let timer = null;
    return function() {
        let context = this, args = arguments;
        clearTimeout(timer);
        timer = setTimeout(function() {
            fn.apply(context, args);
        }, delay);
    }
  }
};
