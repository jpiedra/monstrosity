BEACONS:
  - TO-DO:
    - 1: Set collision to BSP-only, not players or NPCs
    - 2: Spawning routines:
      - A: Max amount of NPCs per beacon 
      - B: Time limit for a Beacon's existence; kill its NPCs when it dies, too [IP]
      - C: Really, really make sure they don't spawn inside anything solid, prop or wall [IP]
    - 3: States:
      - A: Beacons should be automated in the following manner:
        - Spawned -> idle[green] state until captured[yellow] by a team, or goes to haste[blue]
        - Beacon(s) captured[yellow]; team caps beacon and scores, NPCs start spawning until...
          - warning[red]; beacon is about to be removed, get ready for the next one to Spawn
        - Beacon(s) haste[blue]; beacon hasn't been captured and is about to be removed...
          - captured[yellow] if captured before its removed; else, remove and Spawn new one elsewhere.
  - DONE:
    - 1: Make them float in-place (DONE, fall onto the ground when spawned... for now)
    - 2: Spawning routines
      - A: A table of NPCs each Beacon can spawn (DONE)
      - B: Randomly spawn said NPCs within a fixed radius of beacon (DONE)
    - 3: States
      - A: Halo appears around it, through walls; color based on state, initial or active (DONE)
