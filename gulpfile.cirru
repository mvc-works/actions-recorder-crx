
var
  gulp $ require :gulp
  sequence $ require :run-sequence
  exec $ . (require :child_process) :exec
  env $ object
    :dev true
    :main :http://localhost:8080/build/main.js
    :vendor :http://localhost:8080/build/vendor.js
    :style :http://localhost:8080/build/style.css

gulp.task :html $ \ (cb)
  var
    html $ require :./template
    fs $ require :fs
    assets
  if (not env.dev) $ do
    = assets $ require :./build/assets.json
    = env.main $ + :./build/ $ . assets.main 0
    = env.style $ + :./build/ $ . assets.main 1
    = env.vendor $ + :./build/ assets.vendor
  fs.writeFile :extension/index.html (html env) cb

gulp.task :del $ \ (cb)
  var
    del $ require :del
  del (array :build) cb
