# Guide

## What you'll need

If you're using Ruby on your own machine - and not using Cloudenvy - then you need to check you have all of the following:

1. Recent **Ruby** installed: See [][INSTALL_RUBY.md]
3. A good text editor, e.g. [Atom](https://atom.io/).
2. Optionally, a **Git** implementation or client such as [GitHub for Desktop]()

## Install Sinatra

Sinatra is simple library that helps us build web applications.

1. In the **Terminal** (Terminal.app under *Applications/Utilities*) or **Command Prompt on Windows** (Command Prompt under *All Applications > Accessories > System Tools*), type or copy and paste the following without the comment:

  ```ruby
  gem install sinatra erubis
  gem install shotgun # on Mac/Linux/Cloudenvy only
  ```

  Wait for the installation to proceed. From now on we'll refer to **Terminal** and **Command Prompt on Windows** as **the terminal**.

## Step 1: building a Ruby app with server

1. Create a directory for your project.
2. Copy any HTML files from your previous project into the newly created directory.
3. Create a new subdirectory `step1`. You can do this in Windows Explorer, the Finder or your Editor. In a terminal you can do the following:

  _Windows:_

  ```shell
  cd C:\Users\Documents/path\to\your\project\
  mkdir step1
  ```

  _Mac:_

  ```shell
  cd ~/path/to/your/project/
  mkdir step1
  ```

  **Tip:** use the tab for autocompletion when using terminal.

4. Create a new empty file `app.rb` in `step1` with your editor. Add one route for page in your website:

  ```ruby
  get '/' do
    File.read 'index.html'
  end
  get '/about/?' do
    File.read 'about.html'
  end
  ```

5. Open `index.html` and other `.html` files and adjust all paths to be absolute. This means links should be prefixed with a forward slash (`/`).
6. In the Terminal go into the `step1` directory:

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

  You can now visit your site for the first time. If you're running on Cloudenvy
  navigate to an address that looks like <http://node3.codenvy.io:33079/>. You can
  find the exact address in the Runtime configuration tab of your Workspace settings.

  If you're running the code on your own computer then visit <http://localhost:3000>.

  From now on in this tutorial, this URL will be referred to as <http://localhost:PORT>.

  To stop the server, press `Ctrl + C`.

  *Hint:* On Cloudenvy and Mac you can open tabs in the terminal.

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

3. Copy all your pages from root into views. For example `about.html` from root as `about.erb` in `views/`

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
5. Copy `styles.css` as well as image from root into `public/`.
6. Create a new file `layout.erb` in `views/` with your editor.
7. Copy and paste the contents of `index.html` into `layout.erb` with your editor.
8. Remove all HTML tags within your page area (but NOT navigation). In this example we use `<div id="page">`.
9. Copy and paste the following into `app.rb`; with a route for every page:

  ```ruby
  require 'sinatra'

  get '/' do
    erb :index, layout: :layout
  end

  get '/about/?' do
    erb :about, layout: :layout
  end
  ```

10. Reboot, if necessary, and reload each page to check.

You will see all pages now look the same – clearly not desirable!

### 2b. Making templates use a layout properly

1. Now remove all HTML tags within your page area (but NOT navigation) in `layout.erb`.
  In this example we use `<div id="page">`
2. Instead, add a new ERB tag `<%= yield %>`. This results in the contents of your
  page to be inserted into the template.
3. Reboot, if necessary, and reload each page to check.

You should now see the page with the header twice – also not good!

### 2c. Fixing the double header

1. In each `.erb` template, remove all the HTML tags from the the top up to the
  content. Similarly, do the same for the tags between content and the bottom of
  the file.
2. Reboot, if necessary, and reload each page to check.

You should now see the page almost as it is meant to be! However, the eagle-eyed among you may notice the menu doesn't highlight correctly. We'll solve this with some more code.

### 2d. Highlighting the active page

1. Add/change the `class` on the menu links in `layout.erb` as follows:

  ```erb
  <ul>
    <li><a class="<%= 'active' if '/' == active_page? %>" href="/">Home</a></li>
    <li><a class="<%= 'active' if '/about' == active_page? %>" href="/about">About</a></li>
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

We'll quickly see how parameters work.

1. Add a new 'route' in `app.rb`:

  ```ruby
  get '/welcome/:name/?' do
    erb "<h1>Welcome to my site #{params[:name]}</h1>"
  end
  ```

2. Reboot, if necessary.
3. Visit <http://YOUR-ADDRESS:PORT/welcome/John> and you'll see the name printed in the browser. Change the parameter until your heart's content.

## Step 3: deploying

1. Go back into the root project directory and copy the `step2` directory as `step3`.

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

2. Create a git repository for the `step3` project and commit the initial contents:

  _Windows and Mac/Linux/Cloudenvy_:

  ```shell
  git init
  # Add all files.
  git add .
  git commit -m "My first commit"
  ```

  *Tip*: You can do this in GitHub for Desktop, if you prefer.

3. Create a new file `Gemfile` with your editor. Copy and paste the following into `Gemfile`:

  ```ruby
  source 'https://rubygems.org'

  gem 'sinatra'
  gem 'erubis'
  ```

  This specifies dependencies, or in other words, the libraries that your app uses. They will be installed automatically on deployment.

4. Create a new file `config.ru` with your editor. Copy and paste the following into `config.ru`:

  ```ruby
  require './step3/app.rb'
  run Sinatra::Application
  ```

  This code tells Heroku what application should be run after deploying.

5. Finish off the process of specifying dependencies by running the `bundle` command, then commit:

  _Windows and Mac/Linux/Cloudenvy_:

  ```shell
  bundle install
  git add .
  git commit -m "Add Gemfile and config"
  ```

6. Sign Up for a _free_ account on [Heroku](https://heroku.com/).

7. Download and install [Heroku Toolbelt](https://toolbelt.heroku.com/) (no need to run the app).

8. Once Heroku Toolbelt is installed, you need to login in Terminal with the account details you specified and create an application. Decide a name for your application; if your application were named `osc-football-blog-app` then you would do the following:

  _Windows and Mac/Linux/Cloudenvy_:

  ```shell
  heroku login
  heroku create osc-football-blog-app --region eu
  ```

  After a brief moment you should see the following:

  ```
  Creating ⬢ osc-football-blog-app... done, region is eu
  https://osc-football-blog-app.herokuapp.com/ | https://git.heroku.com/osc-football-blog-app.git
  ```

  This means your application is now ready for deployment.

9. Deploy using the `git push` command.

  _Windows and Mac/Linux/Cloudenvy_:

  ```shell
  git push heroku master
  ```

  From now on to re-deploy you should be able to just use `git push heroku`.

10. Open up your application:

  _Windows and Mac/Linux_:

  `heroku open`

  _Cloudenvy_:

  Manually visit https://osc-football-blog-app.herokuapp.com/ in your browser.
