name             'et_hadoop'
maintainer       'EverTrue, Inc.'
maintainer_email 'eric.herot@evertrue.com'
license          'All rights reserved'
description      'Installs/Configures et_hadoop'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.1.0'

depends 'hadoop', '= 2.0.2'
depends 'storage', '= 2.1.3'
depends 'pam', '= 1.0.1'
