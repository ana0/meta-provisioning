 #!/bin/sh
  set -e

  ipfs config Datastore.StorageMax "20GB"
  ipfs config --json Datastore.StorageGCWatermark 90
  ipfs config --json Datastore.GCPeriod '"1h"'

  echo "ipfs config applied: StorageMax=20GB, GCWatermark=90, GCPeriod=1h"
