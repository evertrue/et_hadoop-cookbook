source 'https://berks.evertrue.com'
source 'https://api.berkshelf.com'

metadata

cookbook 'continuuity_hadoop',
         github: 'evertrue/hadoop_cookbook',
         tag: 'eherot/give_cookbook_unique_name'

group :integration do
  cookbook 'et_tools'
  cookbook 'storage',
           path: '../storage'
  cookbook 'et_hostname'
  cookbook 'et_networking_basic'
end
