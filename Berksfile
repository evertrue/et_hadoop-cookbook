source 'https://berks.evertrue.com'
source 'http://api.berkshelf.com'

metadata

cookbook 'hadoop',
         path: '../hadoop'

group :integration do
  cookbook 'et_tools'
  cookbook 'storage',
           path: '../storage'
  cookbook 'et_hostname'
  cookbook 'et_networking_basic'
end
