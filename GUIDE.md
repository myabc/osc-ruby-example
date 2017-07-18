# Guide

## What you'll need

If you’re using Ruby on your own machine then you need to check you have all of the following:

1. Recent **Ruby** installed: See [][INSTALL_RUBY.md]
2. A good text editor, e.g. [Atom](https://atom.io/) or [Sublime Text](https://www.sublimetext.com/)

## Install Sinatra

Sinatra is a simple library that helps us build web applications.

1. In the **Terminal** (Terminal.app under *Applications/Utilities*) or **Command Prompt on Windows** (Command Prompt under *All Applications > Accessories > System Tools*), type or copy and paste the following without the comment:

  ```ruby
  gem install sinatra erubis
  gem install shotgun # on Mac/Linux/Cloudenvy only
  ```

  Wait for the installation to proceed. From now on we’ll refer to **Terminal** and **Command Prompt on Windows** as **the terminal**.

## Step 1: building a Ruby app with server

3. Create a work space

  1. Create a new subdirectory `step1`. You can do this in Windows Explorer, the Finder or your Editor. In a terminal you can do the following:

  _Windows:_

  ```shell
  cd C:\Users\Documents\path\to\your\project\
  mkdir step1
  ```

  _Mac:_

  ```shell
  cd ~/path/to/your/project/
  mkdir step1
  ```

  **Tip:** use the tab for autocompletion when using terminal.

  2. Copy any HTML files from your previous project into the newly created directory.

4. Create a new empty file `app.rb` in `step1` with your editor. Add routes for pages in your website:

  ```ruby
  require 'sinatra'
  
  get '/' do
    File.read 'index.html'
  end
  get '/about/?' do
    File.read 'about.html'
  end
  ```

5. Open `index.html` and other `.html` files and adjust all paths to be absolute. This means links should be prefixed with a forward slash (`/`).

6. Create a `public` folder and copy `styles.css` (or your .css files) as well as all images from root into `public/`.

7. In the Terminal go into the `step1` directory:

  _Windows and Mac/Linux/Cloudenvy:_

  ```shell
  cd step1
  ```

7. Boot the application for the first time:

  _Windows:_

  ```shell
  ruby app.rb -o 0.0.0.0 -p 3000
  ```

  _Mac/Linux/Cloudenvy:_

  ```shell
  shotgun app.rb --host 0.0.0.0 --port 3000
  ```

  You can now visit your site for the first time.

  If you’re running the code on your own computer then visit <http://localhost:3000>.

  To stop the server, press `Ctrl + C`.

## Step 2: enhanced templates
### 2a. Converting pages to [ERb](http://www.stuartellis.eu/articles/erb/)

1. Go back into the root project directory and copy the `step1` directory as `step2`.

  _Windows:_

  ```shell
  cd ..
  Xcopy /E /I step2 step3
  ```

  _Mac/Linux/Cloudenvy:_

  ```shell
  cd ..
  cp -R step2 step3
  ```

  *Tip*: You can do this in Finder.app or Windows Explorer if you prefer.

2. Change into `step2`, create a new directory `views`:

  _Windows and Mac/Linux/Cloudenvy_:

  ```shell
  cd step2
  mkdir views
  ```

  *Tip*: You can do this in Finder.app or Windows Explorer if you prefer.

3. Copy all your pages from root into views and change their extension to `.erb`. For example `about.html` from root as `about.erb` in `views/`

  _Windows:_

  ```shell
  copy ..\about.html views\about.erb
  ```

  _Mac/Linux/Cloudenvy:_

  ```shell
  cp -R ../about.html views/about.erb
  ```

  *Tip*: You can do this in Finder.app or Windows Explorer if you prefer.

4. Copy `index.html` from root as `index.erb` into `views/` following the same method (if you did not do it before).

5. Create a new file `layout.erb` in `views/` with your editor.

6. Copy and paste the contents of `index.erb` (ex `index.html`) into `layout.erb` with your editor.

7. Copy and paste the following into `app.rb`; with a route for every page:

  ```ruby
  require 'sinatra'

  get '/' do
    erb :index, layout: :layout
  end

  get '/about/?' do
    erb :about, layout: :layout
  end
  ```

8. Reboot, if necessary, and reload each page to check.

You will see all pages now look the same – clearly not desirable!

### 2b. Making templates use a layout properly

1. Now, remove all HTML tags within your page area (but NOT navigation, sidebar or footer) in `layout.erb`.
  In this example we use `<div id="page">`

2. Instead, add a new ERb tag `<%= yield %>`. This results in the contents of your
  page to be inserted into the template.

3. Reboot, if necessary, and reload each page to check.

You should now see the page with the header twice – also not good!

### 2c. Fixing the double header

1. In each `.erb` template, remove all the HTML tags from the the top up to the
  content. Similarly, do the same for the tags between content and the bottom of
  the file.

2. Reboot, if necessary, and reload each page to check.

You should now see the page almost as it is meant to be! However, the eagle-eyed among you may notice the menu doesn’t highlight correctly. We’ll solve this with some more code.

### 2d. Highlighting the active page

1. Add/change the `class` on the menu links in `layout.erb` as follows:

  ```erb
  <ul>
    <li><a class="<%= 'active' if '/' == request.path_info %>" href="/">Home</a></li>
    <li><a class="<%= 'active' if '/about' == request.path_info %>" href="/about">About</a></li>
  </ul>
  ```

### 2e. Using ruby for inside the code

You can insert ruby code to address your needs. You will use `<% … %>` for ruby processes and `<%= … %>` to print ruby results.

1. Add current date:

  ```erb
  <div class="time">
    <p>
      <%= Time.now.strftime('%e') %> <%= Time.now.strftime('%h') %> <%= Time.now.strftime('%G') %>
    </p>
  </div>
  ```

2. Add a loop with images:

  ```erb
  <div class="oxford_images">
    <% 3.times do |i| %>
    <img src="<%= '/Oxford_view' + (i + 1).to_s + '.jpg' %>" />
    <% end %>
  </div>
  ```

### 2f. Handling parameters

We’ll quickly see how parameters work.

1. Add a new 'route' in `app.rb`:

  ```ruby
  get '/welcome/:name/?' do
    erb "<h1>Welcome to my site #{params[:name]}</h1>"
  end
  ```

  *Tip*: Notice we are writing ERb code directly in the `app.rb` file.

2. Reboot, if necessary.

3. Visit <http://localhost:3000/welcome/John> and you’ll see the name printed in the browser. Change the parameter until your heart’s content.
