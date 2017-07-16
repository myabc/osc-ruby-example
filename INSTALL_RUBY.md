# Installing/Using a Ruby

## _Easier Option:_ Using Cloudenvy: Ruby in the Cloud

Follow the instructions in [Using a Cloud Service](http://guides.railsgirls.com/install#using-a-cloud-service),
but pick **Ruby** not **Ruby/Rails** from the template selection when creating
your first project.

## _More Advanced:_ Install Ruby on your Computer

### On Windows

1. Download **Ruby 2.2.5** from http://rubyinstaller.org/downloads/. If you have a
64-bit machine (check in _Start > Settings > Settings > About_), download **Ruby 2.2.5 (x64)**.
2. Run the installer with the default options *except* **Add Ruby Executables to your path**, which must be checked.
3. Test by running **Command Prompt** (in *Start > All Applications > Accessories > System > System Tools*) and typing the following:
  ```shell
  ruby -v
  ```

  You should see something similar to the following:
  ```shell
  ruby 2.2.5p0 (2015-12-25 revision 53280) [mingw]
  ```

### On Mac

The Mac actually comes with a Ruby built-in, but we'll install the latest and greatest ourselves.

* Open **Terminal.app**, which we'll refer to as the terminal from now on.
* Set up Homebrew by copying and pasting the following:
  ```shell
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  ```
  _Visit http://brew.sh/ for more informaton about Homebrew_

* Then install Ruby itself:
  ```shell
  brew install ruby
  ```
* Test by typing the following:
  ```shell
  ruby -v
  ```

  You should see something similar to the following:
  ```shell
  ruby 2.3.0p0 (2015-12-25 revision 53290) [x86_64-darwin15]
  ```

### Alternative Options

In the event the above options fail, don't despair. Check out
[Alternative Installment for all OS](http://guides.railsgirls.com/install#virtual-machine).

[Rails Girls](http://railsgirls.com/) also provides a very useful [Guide to installing Ruby along with the Rails Framework](http://guides.railsgirls.com/install).

_Visit https://www.ruby-lang.org/en/documentation/installation/ for more advanced information about installation options._
