  #!/bin/sh
  # Runs on every container start, BEFORE the ipfs daemon launches.
  # `ipfs config` operates directly on the repo file, so it doesn't need the daemon running.
  # These commands are idempotent.
  set -e

  ipfs config Datastore.StorageMax "20GB"
  ipfs config Datastore.StorageGCWatermark 90
  ipfs config --json Datastore.GCPeriod '"1h"'

  echo "ipfs config applied: StorageMax=20GB, GCWatermark=90, GCPeriod=1h"
