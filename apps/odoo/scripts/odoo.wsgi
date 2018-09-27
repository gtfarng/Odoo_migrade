#!/opt/bitnami/python/bin/python
# WSGI Handler sample configuration file.
#
# Change the appropriate settings below, in order to provide the parameters
# that would normally be passed in the command-line.
# (at least conf['addons_path'])
#
# For generic wsgi handlers a global application is defined.
# For uwsgi this should work:
#   $ uwsgi_python --http :9090 --pythonpath . --wsgi-file odoo-wsgi.py
#
# For gunicorn additional globals need to be defined in the Gunicorn section.
# Then the following command should run:
#   $ gunicorn odoo:service.wsgi_server.application -c odoo-wsgi.py

import os
os.environ['PYTHON_EGG_CACHE'] = "/opt/bitnami/apps/odoo/tmp/egg_cache"
import odoo

#----------------------------------------------------------
# Common
#----------------------------------------------------------
odoo.multi_process = True

# Additional check for Odoo configuration file
config_file = "/opt/bitnami/apps/odoo/conf/odoo-server.conf"
if not os.path.exists(config_file):
    print "Config file '%s' not found " % (config_file)
    sys.exit()
else:
    odoo.tools.config.parse_config(['-c', config_file])

# Equivalent of --load command-line option
odoo.conf.server_wide_modules = ['web']
conf = odoo.tools.config

# Path to the Odoo Addons repository (comma-separated for
# multiple locations)
# conf['addons_path'] = '../../addons/trunk,../../web/trunk/addons'

# Optional database config if not using local socket
#conf['db_name'] = 'mycompany'
#conf['db_host'] = 'localhost'
#conf['db_user'] = 'foo'
#conf['db_port'] = 5432
#conf['db_password'] = 'secret'

#----------------------------------------------------------
# Generic WSGI handlers application
#----------------------------------------------------------
application = odoo.service.wsgi_server.application

odoo.service.server.load_server_wide_modules()
