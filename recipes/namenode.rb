include_recipe 'et_hadoop::default'
include_recipe 'hadoop::namenode'

# The deploy user must be allowed to copy files as mapred
# However, sudoers is damned hard, so we allow all actions as mapred
node.set['authorization']['sudo']['include_sudoers_d'] = true

sudo 'hadoop' do
  user node['hadoop']['deploy_user']
  runas node['hadoop']['mapred_user']
  nopasswd true
  commands ['ALL']
end
