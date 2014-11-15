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
                    value: post.title
                };
            });
        }
    }
});

// Initialize the Bloodhound suggestion engine
posts.initialize();
 
$(document).ready(function() {
  $('#navbar-search-post').typeahead(null, {
    displayKey: 'value',
    source: posts.ttAdapter()
  });
});
