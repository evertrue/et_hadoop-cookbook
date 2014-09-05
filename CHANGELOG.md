## 2.2.3

* Set property mapred.tasktracker.reducer.tasks.maximum

## 2.2.2

* Rename mapred.map.tasks config property to mapred.tasktracker.map.tasks.maximum

## 2.2.1

* Set mapred.map.tasks to # CPUs

## 2.2.0

* Bump storage v2.1.7
* Move encrypted_data_bag_secret_key_path to a place where it actually gets called
* Bump image_id to ami-b66ca0de (in .kitchen.cloud.yml)
* Bump hadoop to v2.1.0

## 2.1.6

* Remove extra slash from file URL
* Relax version constrant for storage to allow use of new version (2.1.6) -- now requiring aws credentials data bag
* Bump hadoop to v2.0.4

## 2.1.5

* Bump hadoop v2.0.3

## 2.1.4

* Use one storage array for tmp instead of two

## 2.1.3

* Switch to URL-style path for data_root
* Bump storage version v2.1.5

## 2.1.2

* Bump storage version v2.1.4

## 2.1.1

* Bump hadoop v2.0.2

## 2.1.0

* Add PAM management cookbook

## 2.0.1

* Only grab hadoop cookbook from the path when doing integration testing
* Bump hadoop v2.0.1

## 2.0.0

* Cleaned up the layout of the test harness
* Attach two volumes to each vagrant instance and build a test harness (including namenode/datanode cluster) to test it.
* Bump hadoop to v2.0.0 to support multiple data storage directories

## 1.1.6

* Bump hadoop v1.2.7

## 1.1.5

* Bump hadoop v1.2.6

## 1.1.4

* Bump hadoop v1.2.5

## 1.1.3

* Bump hadoop v1.2.4
* [PLATFORM-394](https://evertroops.atlassian.net/browse/PLATFORM-394) - Add jdk.xml.entityExpansionLimit option to HADOOP_OPTS

## 1.1.2

* Bump hadoop v1.2.3

## 1.1.1

* Bump hadoop v1.2.2

## 1.1.0

* Bump hadoop v1.2.1

## 1.0.3

* Bump hadoop v1.1.2
* Add `node['hadoop']['local_fqdn']` node attribute
* Remove redundant box URL definiton from kitchen yaml

## 1.0.2

* ??

## 1.0.1

* First rev
