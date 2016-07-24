# Guide

## What you'll need

If you're using Ruby on your own machine - and not using Nitrous - then you need to check you have all of the following:

1. Recent **Ruby** installed: See [][INSTALL_RUBY.md]
3. A good text editor, e.g. [Atom](https://atom.io/).
2. Optionally, a **Git** implementation or client such as [GitHub for Desktop]()

## Install Sinatra

Sinatra is simple library that helps us build web applications.

1. In the **Terminal** (Terminal.app under *Applications/Utilities*) or **Command Prompt on Windows** (Command Prompt under *All Applications > Accessories > System Tools*), type or copy and paste the following without the comment:

  ```ruby
  gem install sinatra erubis
  gem install shotgun # on Mac/Linux/Nitrous only
  ```

  Wait for the installation to proceed. From now on we'll refer to **Terminal** and **Command Prompt on Windows** as **the terminal**.

## Step 1: building a Ruby app with server

1. Create a directory for your project.
2. Copy any HTML files from your previous project into the newly created directory.
3. Create a new subdirectory `step1`. You can do this in Windows Explorer, the Finder or your Editor. In a terminal you can do the following:

  _Windows_:

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

4. Create a new empty file `app.rb` in `step1` with your editor.
5. Open `index.html` and other `.html` files and adjust all paths to be absolute. This means links should be prefixed with a forward slash (`/`).
6. In the Terminal go into the `step1` directory:

  _Windows_:

  ```shell
  cd step1
  ```

  _Mac/Linux/Nitrous:_

  ```shell
  cd step1
  ```

7. Boot the application for the first time:

  _Windows_:

  ```shell
  ruby app.rb -o 0.0.0.0 -p 4567
  ```

  _Mac/Linux/Nitrous:_

  ```shell
  shotgun app.rb --host 0.0.0.0 --port 4567
  ```

  You can now visit your site for the first time. If you're running on Nitrous
  navigate to _Preview > Port 4567_. If you're running the code on your own
  computer then visit <http://localhost:4567>.

  To stop the server, press `Ctrl + C`.

  *Hint:* On Nitrous and Mac you can open tabs in the terminal.

## Step 2: enhanced templates

1. Go back into the root project directory and copy the `step1` directory as `step2`.

  _Windows_:

  ```shell
  cd ..
  Xcopy /E /I step2 step3
  ```

  On Mac:

  ```shell
  cd ..
  cp -R step2 step3
  ```

  *Tip*: You can do this in Finder.app or Windows Explorer if you prefer.

2. Change into `step2`, create a new directory `views`:

  _Windows_:

  ```shell
  cd ..
  Xcopy /E /I step2 step3
  ```

  On Mac:

  ```shell
  cd ..
  cp -R step2 step3
  ```

  *Tip*: You can do this in Finder.app or Windows Explorer if you prefer.

3. Copy `about.html` as `about.erb` in `views/`

  _Windows_:
  ```shell
  copy ..\about.html about.html
  ```

  On Mac:

  ```shell
  cp -R ../about.html about.html
  ```

  *Tip*: You can do this in Finder.app or Windows Explorer if you prefer.

3. Copy `index.html` as `index.erb` into `views/`.
4. Copy `styles.css` into `public/`.
5. Create a new file `layout.erb` in `views/` with your editor.
6. Copy and paste the contents of `index.html` into `layout.erb` with your editor.
7. Remove all HTML tags within your page area (but NOT navigation). In this example we use `<div id="page">`.
8. Copy and paste the following into `app.rb`:

  ```ruby
  require 'sinatra'

  get '/' do
    erb :index, layout: :layout
  end

  get '/about/?' do
    erb :about, layout: :layout
  end
  ```

9. Reboot, if necessary, and reload each page to check.

You will see all pages now look the same – clearly not desirable!

1. Now remove all HTML tags within your page area (but NOT navigation) in `layout.erb`.
  In this example we use `<div id="page">`
2. Instead, add a new ERB tag `<%= yield %>`. This results in the contents of your
  page to be inserted into the template.
3. Reboot, if necessary, and reload each page to check.

You should now see the page with the header twice – also not good!

1. In each `.erb` template, remove all the HTML tags from the the top up to the
  content. Similarly, do the same for the tags between content and the bottom of
  the file.
2. Reboot, if necessary, and reload each page to check.

You should now see the page as it is meant to be! Good work.

Before we go to Step 3, we'll quickly see how parameters work.

1. Add a new 'route' in `app.rb`:

  ```ruby
  get '/welcome/:name/?' do
    erb "<h1>Welcome to my site #{params[:name]}</h1>"
  end
  ```

2. Reboot, if necessary.
3. Visit </welcome/John> and you'll see the name printed in the browser. Change the parameter until your heart's content.
