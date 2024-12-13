var posts=["lohas/这是一篇新的博文/","lohas/这是四篇新的博文/","lohas/这是三篇新的博文/","lohas/这是二篇新的博文/"];function toRandomPost(){
    pjax.loadUrl('/'+posts[Math.floor(Math.random() * posts.length)]);
  };