require! {
  'path'
}


module.exports =

  entry:
    main: path.resolve 'app/client'


  devtool: \source-map


  output:
    path: path.resolve __dirname, '../public/assets'
    public-path: '/assets/'
    filename: '[name].js'

    # Output file paths to comments (These get compiled away in production)
    pathinfo: yes


  resolve:
    extensions:
      * ''
      * '.js'
      * '.ls'
      * '.styl'
      * '.css'


  module:
    loaders:
      * test: /\.ls$/ loader: \livescript
      * test: /\.styl$/ loader: \style!css!stylus
      * test: /\.css$/ loader: \style!css
      * test: /\.(?:svg|eot|ttf|woff2?|png)$/ loader: \file
