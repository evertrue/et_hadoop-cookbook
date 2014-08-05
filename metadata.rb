name             'et_hadoop'
maintainer       'EverTrue, Inc.'
maintainer_email 'eric.herot@evertrue.com'
license          'All rights reserved'
description      'Installs/Configures et_hadoop'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.1.5'

depends 'hadoop', '= 2.0.4'
depends 'storage', '>= 2.1.5'
depends 'pam', '= 1.0.1'
