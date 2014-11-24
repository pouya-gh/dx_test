# Instantiate the Bloodhound suggestion engine
posts = new Bloodhound
  datumTokenizer: (datum) ->
    Bloodhound.tokenizers.whitespace(datum.value)
  queryTokenizer: Bloodhound.tokenizers.whitespace
  remote:
    url: '/search?q=%QUERY'
    filter: (posts) ->
      # Map the remote source JSON array to a JavaScript array
      $.map(posts, (post) ->
        title: post.title,
        id: post.id,
        url: post.url
      )

# Initialize the Bloodhound suggestion engine
posts.initialize();

jQuery ->
  myTypeahead = $('#navbar-search-post').typeahead
    highlight: true
  ,
    displayKey: 'title'
    source: posts.ttAdapter()

  myTypeahead.on('typeahead:selected', (evt,data)->
    window.location.href = data.url;
  )
