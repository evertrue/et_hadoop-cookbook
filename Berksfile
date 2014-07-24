source 'https://berks.evertrue.com'
source 'https://api.berkshelf.com'

metadata

cookbook 'hadoop',
         github: 'continuuity/hadoop_cookbook'

group :integration do
  cookbook 'et_tools'
  cookbook 'storage',
           path: '../storage'
  cookbook 'et_hostname'
  cookbook 'et_networking_basic'
end
