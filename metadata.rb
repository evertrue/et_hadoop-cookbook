name             'et_hadoop'
maintainer       'EverTrue, Inc.'
maintainer_email 'eric.herot@evertrue.com'
license          'All rights reserved'
description      'Installs/Configures et_hadoop'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '2.3.0'

depends 'hadoop', '= 2.1.1'
depends 'storage', '>= 2.1.7'
depends 'pam', '= 1.0.1'
depends 'sudo', '~> 2.1'
