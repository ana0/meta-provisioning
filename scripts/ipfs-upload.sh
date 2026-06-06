  #!/bin/bash
  LOG=ipfs/pins.txt
  : > "$LOG"

  docker exec ipfs ipfs add -r /home/images       | tee -a "$LOG"
  docker exec ipfs ipfs add -r /home/metadata     | tee -a "$LOG"
  docker exec ipfs ipfs add -r /home/promptbaby   | tee -a "$LOG"

  docker exec ipfs ipfs add -w /home/misc/off-contract.json          | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/off.png                    | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/lifeforms-contract.json    | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/glitch.mp4                 | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/glitch-cover.gif           | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/glitch-metadata.json       | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/glitch-contract.json       | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/coinbg.jpg                 | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/clickmine-contract.json    | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/wildcards-contract.json    | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/touching-grass-animation.mp4 | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/touching-grass.jpg         | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/grid.mp4                   | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/grid-HD.mp4                | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/grid.png                   | tee -a "$LOG"
  docker exec ipfs ipfs add -w /home/misc/mirror-piece-square.jpg    | tee -a "$LOG"

  for f in ./clickmine/*; do
    docker exec ipfs ipfs add -w "/home/clickmine/$(basename "$f")" | tee -a "$LOG"
  done
