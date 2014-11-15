// Instantiate the Bloodhound suggestion engine
var posts = new Bloodhound({
    datumTokenizer: function (datum) {
        return Bloodhound.tokenizers.whitespace(datum.value);
    },
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
        url: '/search?q=%QUERY',
        filter: function (posts) {
            // Map the remote source JSON array to a JavaScript array
            return $.map(posts, function (post) {
                return {
                    title: post.title,
                    id: post.id,
                    image: post.image.image.small.url
                };
            });
        }
    }
});

// Initialize the Bloodhound suggestion engine
posts.initialize();

function search_template(data) {
  template = [
    '<a href="#">',
    '<strong>' + data.title + '</strong>',
    '<img src="' + data.image + '">',
    '</a>'
  ].join('');

  return template;
}
 
$(document).on('ready page:load', function() {
  var myTypeahead = $('#navbar-search-post').typeahead(null, {
    displayKey: 'value',
    source: posts.ttAdapter(),
    templates: {
        empty: [
          '<div class="empty-message">',
          'unable to find any Best Picture winners that match the current query',
          '</div>'
        ].join('\n'),
        suggestion: function(data) { return search_template(data); }
      }
  });

  myTypeahead.on('typeahead:selected',function(evt,data){
    window.location.href = data.url;
  });
});
