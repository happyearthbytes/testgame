```cs
- AnimatedEntity (Node2D) [animated_entity.gd]
  ├── Sprite (Sprite)
  ├── AnimationController (AnimationPlayer)
  └── Collision (CollisionShape2D)
- CharacterEntity (Node) [character_entity.gd]
  ├── Animations ('AnimatedEntity')
  ├── NavigationController (Node)
  └── ActionController (Node)
- PlayerEntity ('CharacterEntity') [player_entity.gd]
  ├── InputHandler (Node) [input_handler.gd]
  └── InventoryManager (Node) [inventory_manager.gd]
      ├── ElementsInventory (Node) [elements_inventory.gd]
      |   └── ElementSlot (Node)
      ├── BlocksInventory (Node) [blocks_inventory.gd]
      |   └── BlockSlot (Node)
      ├── WeaponsInventory (Node) [weapons_inventory.gd]
      |   └── WeaponSlot (Node)
      └── ToolsInventory (Node) [tools_inventory.gd]
          └── ToolSlot (Node)
- EnemyAI (Node) [enemy_ai.gd]
  └── EnemyBehavior (Node)
- EnemyEntity ('CharacterEntity') [enemy_entity.gd]
  └── EnemyAI ('EnemyAI')
- ProjectileEntity (Node2D) [projectile_entity.gd]
  └── Animations ('AnimatedEntity')
- WeaponEntity (Node2D) [weapon_entity.gd]
  ├── Animations ('AnimatedEntity')
  └── Projectile ('ProjectileEntity')
- BlockEntity (Node2D) [block_entity.gd]
  └── Animations ('AnimatedEntity')
- ToolEntity (Node2D) [tool_entity.gd]
  └── Animations ('AnimatedEntity')

- MainScene (Node2D) [main_scene.gd]
  ├── PlayerController (Node) [player_controller.gd]
  |   └── LocalPlayer ('PlayerEntity') [local_player.gd]
  ├── EnemyManager (Node) [enemy_manager.gd]
  |   └── Enemy_1 ('EnemyEntity')
  ├── ProceduralTerrain (Node2D) [procedural_terrain.gd]
  |   ├── TerrainGenerator (Node)
  |   └── TerrainLevelManager (Node)
  ├── MultiplayerManager (Node) [multiplayer_manager.gd]
  |   ├── PlayerNetworkController (Node)
  |   └── EnemyNetworkController (Node)
  ├── UIManager (Node) [ui_manager.gd]
  |   ├── HealthBar (TextureProgress)
  |   ├── ScoreLabel (Label)
  |   └── WeaponSelector (Node)
  ├── WeaponManager (Node) [weapon_manager.gd]
  |   └── Weapon_1 ('WeaponEntity')
  ├── BlockManager (Node) [block_manager.gd]
  |   └── Block_1 ('BlockEntity')
  └── ToolManager (Node) [tool_manager.gd]
      └── Tool_1 ('ToolEntity')
```