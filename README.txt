                    Bitnami Odoo Stack 10.0.20170615-0
                  ============================


1. OVERVIEW

The Bitnami Project was created to help spread the adoption of freely
available, high quality, open source web applications. Bitnami aims to make
it easier than ever to discover, download and install open source software
such as document and content management systems, wikis and blogging
software.

You can learn more about Bitnami at https://bitnami.com

Odoo is a comprehensive suite of business applications including Sales,
CRM, Project management, Warehouse management, Manufacturing, Financial management,
Human Resources and more.

You can learn more about Odoo at http://www.odoo.com

The Bitnami Odoo Stack is an installer that greatly simplifies the
installation of Odoo and runtime dependencies. It includes ready-to-run
versions of Apache, SQLite, Python and Subversion. Odoo Stack is distributed for free
under the Apache 2.0 license. Please see the appendix for the specific
licenses of all open source components included.

You can learn more about Bitnami Stacks at https://bitnami.com/stacks/

Bitnami virtual machine images contain a minimal Linux operating system and a
fully configured Bitnami application stack. Running virtual machine images
requires a hypervisor such as VMWare or VirtualBox, so it is recommended for
system administrators and advanced users.

You can learn more about Bitnami Virtual Appliances at https://docs.bitnami.com

Bitnami Cloud Hosting simplifies the process of deploying open source
applications in the cloud. Which one click, you can launch applications in the
Amazon Cloud (with support for other clouds coming in the future.)

You can learn more about Bitnami Cloud Hosting at https://bitnami.com/cloud



2. FEATURES

- Easy to Install

Bitnami Stacks are built with one goal in mind: to make it as easy as
possible to install open source software. Our installers completely automate
the process of installing and configuring all of the software included in
each Stack, so you can have everything up and running in just a few clicks.

- Independent

Bitnami Stacks are completely self-contained, and therefore do not interfere
with any software already installed on your system. For example, you can
upgrade your system's PostgreSQL or Apache without fear of 'breaking' your
Bitnami Stack.

- Integrated

By the time you click the 'finish' button on the installer, the whole stack
will be integrated, configured and ready to go.

- Relocatable

Bitnami Stacks can be installed in any directory. This allows you to have
multiple instances of the same stack, without them interfering with each other.

3. COMPONENTS

Bitnami Odoo Stack ships with the following:

  - Odoo 10.0.20170615-0
  - Apache 2.4.26
  - PostgreSQL 9.6.3
  - Python 2.7.13

4. REQUIREMENTS

To install Bitnami Odoo Stack you will need:

    - Intel x86 or compatible processor
    - Minimum of 512 MB RAM
    - Minimum of 150 MB hard drive space
    - TCP/IP protocol support
    - Compatible operating systems:
      - An x86 or x64 Linux operating system.

5. INSTALLATION

The Bitnami Odoo Stack is distributed as a binary executable installer.
It can be downloaded from:

https://bitnami.com/stacks/

The downloaded file will be named something similar to:

bitnami-odoo-10.0.20170615-0-linux-installer.run on Linux or
bitnami-odoo-10.0.20170615-0-linux-x64-installer.run on Linux 64 bit or

On Linux, you will need to give it executable permissions:

chmod 755 bitnami-odoo-10.0.20170615-0-linux.run


To begin the installation process, double-click on that file, and you will
be greeted by the 'Welcome' screen.

The next screen is the Installation Folder, where you can select where Bitnami
stack will be installed. If the destination directory does not exist, it will
be created as part of the installation.

The next screen will prompt you for data necessary to create the initial
admin user:

Username and password: You will use this information to log-in into the
administrative interface. The password you provide here will also be used to
protect other parts of the installation. Please see the section named
"Usernames and Passwords" later in this document.

The next screen will vary, depending on whether the ports needed by the
bundled Apache and Subversion are already taken or not. The default listening port for
Apache is 8080 on Linux and 80 on Wndows and for Subversion is 3690. If those ports
are already in use by other applications, you will be prompted for alternate
ports to use.

The last screen will prompt you for data to create an initial project and to use
a Subversion repository. This repository will be created if a non existing
folder is entered in the field. Bear in mind that if you enter an existing
folder, it must contain a valid svn repository.

Once the information has been entered, the installation will proceed to copy
the files to the target installation directory and configure the different
components. One this process has been completed, you will see the
'Installation Finished' page. You can choose to launch Bitnami Odoo
Stack at this point. If you do so, your default web browser will open and
display the Welcome page for the Bitnami Odoo Stack.

If you received an error message during installation, please refer to
the Troubleshooting section.

The rest of this guide assumes that you installed Bitnami Odoo
Stack in /home/user/odoo-10.0.20170615-0 on Linux.

6. STARTING AND STOPPING BITNAMI ODOO STACK

The Bitnami Application Manager is a simple graphical interface included in
the stacks that can start and stop the Bitnami servers. It is are located
in the same installation directory.

To start the utility, double click the file named ‘manager-linux’,
from your file browser.

Alternatively, you can also start and stop the services manually, as explained below.

To start/stop/restart application from the command line on Linux you can use the included ctlscript.sh
utility, as shown below:

       ./ctlscript.sh (start|stop|restart)
       ./ctlscript.sh (start|stop|restart) subversion
       ./ctlscript.sh (start|stop|restart) apache

  start      - start the service(s)
  stop       - stop  the service(s)
  restart    - restart or start the service(s)

That will start Apache service. Once started, you can open your
browser and access the following URL on Linux:

http://127.0.0.1:8080

If you selected an alternate port during installation, for example 18080, the
URL will look like:

http://127.0.0.1:18080

If you are accessing the machine remotely, you will need to replace
127.0.0.1 with the appropriate IP address or hostname.


7. DIRECTORY STRUCTURE

The installation process will create several subfolders under the main
installation directory:

  manager-platform: Graphical Tool for managing servers
	apache2/: Apache Web server.
	python/: Python.
	postgresql/: PostgreSQL server folder.
	apps/odoo/: Odoo application folder.
		conf/: Odoo and Apache configuration files.
    data/: Odoo Data.
    log/: Odoo log files.
    scripts/: mod_wsgi configuration files.

8. DEFAULT USERNAMES AND PASSWORDS

The Odoo administrative user and password are the ones you set at
installation time.

9. TROUBLESHOOTING

You can find more information about this product at:

https://docs.bitnami.com

We also encourage you to post your questions and suggestions at:

https://community.bitnami.com

We also encourage you to sign up for our newsletter, which we'll use to
announce new releases and new stacks. To do so, just register at:
https://bitnami.com/newsletter.

9.1 Installer

# Installer Payload Error

If you get the following error while trying to run the installer from the
command line:

"Installer payload initialization failed. This is likely due to an
incomplete or corrupt downloaded file"

The installer binary is not complete, likely because the file was
not downloaded correctly. You will need to download the file and
repeat the installation process.

# Installer execution error on Linux

If you get the following error while trying to run the installer:

"Cannot open bitnami-odoo-10.0.20170615-0-linux.run: No application suitable for
automatic installation is available for handling this kind of file."

In some operatings systems you can change permissions with right click
properties -> permissions -> execution enable.

Or from the command line:

$ chmod 755 bitnami-odoo-10.0.20170615-0-linux.run

9.2 Apache

If you find any problem starting Apache, the first place you should check is
the Apache error log file:

/home/user/odoo/apache2/logs/error_log on Linux

Most errors are related to not being able to listen to the default port.
Make sure there are no other server programs listening at the same port
before trying to start Apache. Some programs, such as Skype, may also use
port 80.

You can find more info at http://docs.bitnami.com/?page=components&name=apache

9.3 Odoo

For any problem related to Odoo, please visit
https://www.odoo.com/forum

10. LICENSES

Apache Web Server is distributed under the Apache License v2.0, which
is located at http://www.apache.org/licenses/LICENSE-2.0

Python is distributed under the Python 2.7 License, which is located at
http://www.python.org/download/releases/2.7.6/license/

This product includes software developed by CollabNet (http://www.Collab.Net/).

Subversion is released under the terms of the Apache License, which is located
at http://svn.apache.org/repos/asf/subversion/trunk/LICENSE

SQLite has been dedicated to public domain by the authors. You can find more
about this at http://www.sqlite.org/copyright.html

Odoo is distributed under the LGPL3 License,
which is located at https://www.odoo.com/documentation/user/10.0/legal/licenses/licenses.html

curl is distributed under the Curl License, which is located at
http://curl.haxx.se/docs/copyright.html

expat is distributed under the MIT License, which is located at
http://www.jclark.com/xml/copying.txt

gd is distributed under the gd License, which is located at
http://www.boutell.com/gd/manual2.0.33.html

IMAP is distributed under the University of Washington Free-Fork
License, located at http://www.washington.edu/imap/legal.html

jpegsrc is distributed under The Independent JPEG Group's JPEG
software license, which is located at
http://dev.w3.org/cvsweb/Amaya/libjpeg/README?rev=1.2

libiconv is distributed under the Lesser General Public License
(LGPL), located at http://www.gnu.org/copyleft/lesser.html

zlib and libpng are distributed under zlib License, located at
http://www.zlib.net/zlib_license.html

ClearSilver is distributed under the Neotonic ClearSilver Software License,
located at http://www.clearsilver.net/license.hdf

libxml2 is distributed under the MIT license, located at
http://www.opensource.org/licenses/mit-license.php

mod_python is distributed under the Apache license, located at
http://www.apache.org/licenses/LICENSE-2.0

Pysqlite is distributed under the license located at
http://www.initd.org/openerpker/pysqlite/wiki/About

neon is distributed under the Lesser General Public License (LGPL), located at
http://www.gnu.org/copyleft/lgpl.html

Silvercity is distributed under the BSD License, located at
http://www.opensource.org/licenses/bsd-license.php

SWIG is distributed under the license located at
http://www.swig.org/copyright.html
