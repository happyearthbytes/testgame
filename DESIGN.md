```cs
- MainScene (Node2D) [main_scene.gd]
  └── PlayerController (Node) [player_controller.gd]
      ├── PlayerEntity (Node2D) [player_entity.gd]
      |   ├── NavigationController (Node)
      |   ├── WeaponController (Node)
      |   ├── Sprite (Sprite2D)
      |   ├── AnimationController (AnimationPlayer)
      |   ├── InventoryManager (Node) [inventory_manager.gd]
      |   |   ├── ElementsInventory (Node) [elements_inventory.gd]
      |   |   |   └── ElementSlot (Node)
      |   |   ├── BlocksInventory (Node) [blocks_inventory.gd]
      |   |   |   └── BlockSlot (Node)
      |   |   ├── WeaponsInventory (Node) [weapons_inventory.gd]
      |   |   |   └── WeaponSlot (Node)
      |   |   └── ToolsInventory (Node) [tools_inventory.gd]
      |   |       └── ToolSlot (Node)
      |   └── InputHandler (Node) [input_handler.gd]
      |       ├── MovementInput (Input)
      |       ├── ActionInput (Input)
      |       └── InventoryManager (Node) [inventory_manager.gd]
      |           ├── ElementsInventory (Node) [elements_inventory.gd]
      |           |   └── ElementSlot (Node)
      |           ├── BlocksInventory (Node) [blocks_inventory.gd]
      |           |   └── BlockSlot (Node)
      |           ├── WeaponsInventory (Node) [weapons_inventory.gd]
      |           |   └── WeaponSlot (Node)
      |           └── ToolsInventory (Node) [tools_inventory.gd]
      |               └── ToolSlot (Node)
      └── MultiplayerManager (Node) [multiplayer_manager.gd]
          ├── PlayerNetworkController (Node)
          └── EnemyNetworkController (Node)
- EnemyManager (Node) [enemy_manager.gd]
  └── EnemyEntity (Node2D) [enemy_entity.gd]
      ├── Sprite (Sprite)
      ├── AnimationController (AnimationPlayer)
      ├── NavigationController (Node)
      ├── WeaponController (Node)
      └── EnemyAI (Node) [simple_enemy_ai.gd]
          └── EnemyBehavior (Node)
- BlockManager (Node) [block_manager.gd]
  └── BlockEntity (Node2D) [block_entity.gd]
      ├── BlockSprite (Sprite)
      └── BlockCollision (CollisionShape2D)
- WeaponManager (Node) [weapon_manager.gd]
  ├── WeaponEntity (Node2D) [weapon_entity.gd]
  |   ├── WeaponSprite (Sprite)
  |   └── WeaponCollision (CollisionShape2D)
  └── ProjectileEntity (Node2D) [projectile_entity.gd]
      ├── ProjectileSprite (Sprite)
      └── ProjectileCollision (CollisionShape2D)
- UIManager (Node) [ui_manager.gd]
  ├── HealthBar (TextureProgress)
  ├── ScoreLabel (Label)
  └── WeaponSelector (Node)
- AnimatedEntity (Node2D) [animated_entity.gd]
  ├── Sprite (Sprite)
  └── AnimationController (AnimationPlayer)
- InputHandler (Node) [input_handler.gd]
  ├── MovementInput (Input)
  └── ActionInput (Input)
- EnemyAI (Node) [enemy_ai.gd]
  ├── Pathfinding (PathFollow2D)
  └── AttackBehavior (Node)
- BlockEntity (Node2D) [block_entity.gd]
  ├── BlockSprite (Sprite)
  └── BlockCollision (CollisionShape2D)
- WeaponEntity (Node2D) [weapon_entity.gd]
  ├── WeaponSprite (Sprite)
  └── WeaponCollision (CollisionShape2D)
- ProjectileEntity (Node2D) [projectile_entity.gd]
  ├── ProjectileSprite (Sprite)
  └── ProjectileCollision (CollisionShape2D)
- Upgradable (Node) [upgradable.gd]
  └── UpgradeManager (Node)
- ProceduralTerrain (Node2D) [procedural_terrain.gd]
  ├── TerrainGenerator (Node)
  ├── TerrainLevelManager (Node)
  └── LadderBlock (Node2D)
      ├── Sprite (Sprite2D)
      └── CollisionShape2D (CollisionShape2D)
```

- CharacterEntity
  - NavigationController
  - WeaponController
  - InventoryManager
    - ElementsInventory
    - BlocksInventory
    - WeaponsInventory
    - ToolsInventory
- EnemyEntity
  - CharacterEntity
  - EnemyAI
- PlaceableBlockEntity
  - BlockSprite
  - BlockCollision
- MultiplayerManager
  - PlayerNetworkController
  - EnemyNetworkController
- EnemyAI:
  - EnemyBehavior
