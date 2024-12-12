var posts=["undefined/使用安知鱼主题进行个性化配置，涵盖…/","undefined/hello-world/"];function toRandomPost(){
    pjax.loadUrl('/'+posts[Math.floor(Math.random() * posts.length)]);
  };