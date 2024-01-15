```cs
- AnimatedEntity (Node2D) [animated_entity.gd]
  ├── Sprite (Sprite)
  ├── AnimationController (AnimationPlayer)
  └── Collision (CollisionShape2D)
- CharacterEntity (Node2D) [character_entity.gd]
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

- Game (Node2D) [game.gd]
  ├── PlayerController (Node2D) [player_controller.gd]
  |   └── LocalPlayer ('PlayerEntity') [local_player.gd]
  ├── EnemyManager (Node) [enemy_manager.gd]
  |   └── Enemy_1 ('EnemyEntity')
  |   └── Enemy_2 ('EnemyEntity')
  ├── MultiplayerManager (Node) [multiplayer_manager.gd]
  |   ├── PlayerNetworkController (Node)
  |   └── EnemyNetworkController (Node)
  ├── ProceduralTerrain (Node2D) [procedural_terrain.gd]
  |   ├── TerrainGenerator (Node)
  |   └── TerrainLevelManager (Node)
  ├── UIManager (Node) [ui_manager.gd]
  |   ├── HealthBar (TextureProgress)
  |   └── WeaponSelector (Node)
  ├── WeaponManager (Node) [weapon_manager.gd]
  |   └── Weapon_1 ('WeaponEntity')
  |   └── Weapon_2 ('WeaponEntity')
  ├── BlockManager (Node) [block_manager.gd]
  |   └── Block_1 ('BlockEntity')
  |   └── Block_2 ('BlockEntity')
  └── ToolManager (Node) [tool_manager.gd]
      └── Tool_1 ('ToolEntity')
      └── Tool_2 ('ToolEntity')
```


```cs
- AnimatedEntity (Node2D) [animated_entity.gd]
  ├── AnimationController (AnimationPlayer)
- PlayerEntity ('CharacterEntity') [player_entity.gd]
  └── InventoryManager (Node) [inventory_manager.gd]
      ├── ElementsInventory (Node) [elements_inventory.gd]
      |   └── ElementSlot (Node)
      ├── BlocksInventory (Node) [blocks_inventory.gd]
      |   └── BlockSlot (Node)
      ├── WeaponsInventory (Node) [weapons_inventory.gd]
      |   └── WeaponSlot (Node)
      └── ToolsInventory (Node) [tools_inventory.gd]
          └── ToolSlot (Node)
- ProjectileEntity (Node2D) [projectile_entity.gd]
  └── Animations ('AnimatedEntity')
- WeaponEntity (Node2D) [weapon_entity.gd]
  ├── Animations ('AnimatedEntity')
  └── Projectile ('ProjectileEntity')
- BlockEntity (Node2D) [block_entity.gd]
  └── Animations ('AnimatedEntity')
- ToolEntity (Node2D) [tool_entity.gd]
  └── Animations ('AnimatedEntity')

- Game (Node2D) [game.gd]
  ├── ProceduralTerrain (Node2D) [procedural_terrain.gd]
  |   ├── TerrainGenerator (Node)
  |   └── TerrainLevelManager (Node)
  ├── UIManager (Node) [ui_manager.gd]
  |   ├── HealthBar (TextureProgress)
  |   └── WeaponSelector (Node)
  ├── WeaponManager (Node) [weapon_manager.gd]
  |   └── Weapon_1 ('WeaponEntity')
  |   └── Weapon_2 ('WeaponEntity')
  ├── BlockManager (Node) [block_manager.gd]
  |   └── Block_1 ('BlockEntity')
  |   └── Block_2 ('BlockEntity')
  ├── MultiplayerManager (Node) [multiplayer_manager.gd]
  |   ├── PlayerNetworkController (Node)
  |   └── EnemyNetworkController (Node)
  └── ToolManager (Node) [tool_manager.gd]
      └── Tool_1 ('ToolEntity')
      └── Tool_2 ('ToolEntity')

```

```cs

# PlayerManager
# ControllerHandler
  ControllerHandler {'signal'} _on_controller
  <from_env>  --[Emits]--> _action _on_controller
# HTTPHandler
  HTTPHandler {'signal'} _on_http
  <from_env>  --[Emits]--> _action _on_http
PlayerManager [contains] ControllerHandler
PlayerManager [contains] HTTPHandler
PlayerManager {has} _on_local_player
  ]*instantiates*-> PlayerEntity
  <Connects> _on_game_Signal --signals--> PlayerEntity._on_game_event
  <Connects> ControllerHandler --signals--> PlayerEntity._on_ControlInput
PlayerManager {has} _on_remote_player
  ]*instantiates*-> PlayerEntity
  <Connects> _on_game_Signal --signals--> PlayerEntity._on_game_event
  <Connects> HTTPHandler --signals--> PlayerEntity._player_update
  <Connects> PlayerEntity._player_event --signals--> HTTPHandler._player_update
LocalPlayer <Connects> ControllerHandler --signals--> PlayerEntity._on_ControllerHandler
# PlayerEntity
PlayerEntity [contains] InputHandler
PlayerEntity [contains] CharacterEntity
PlayerEntity {has} _player_update --calls--> (overrides) // remote player support
PlayerEntity {has} _player_event                         // remote player support
PlayerEntity {has} _on_ControlInput --calls--> InputHandler._on_command
PlayerEntity {has} _on_game_event --calls--> InputHandler._on_game_signal
# InputHandler
  InputHandler {'signal'} _on_command
PlayerEntity <Connects> InputHandler --signals--> CharacterEntity._on_InputHandler
PlayerEntity {has} _on_ready --calls-->
  CharacterEntity._on_Configure
  PlayerEntity <Connects> CharacterEntity._player_event --signals--> ._player_event
# CharacterEntity
CharacterEntity [contains] CharacterBody
CharacterEntity [contains] ActionManager
CharacterEntity [contains] AnimatedEntity
CharacterEntity {'signal'} _player_event
CharacterEntity {has} _on_player_event --[Emits]--> _player_event
CharacterEntity {has} _on_InputHandler --calls--> ActionManager._on_input
CharacterEntity {has} _on_Configure --calls--> CharacterAttributes._configure
# ActionManager
  ActionManager {'signal'} _action
  ActionManager {has} _on_input --[Emits]--> _action
CharacterEntity <Connects> ActionManager --signals--> CharacterAttributes._on_action
CharacterEntity <Connects> ActionManager --signals--> ._on_player_event
CharacterEntity <Connects> CharacterAttributes --signals--> CharacterBody._on_attribute
# CharacterBody
  CharacterBody {'signal'} _on_character_event
  <from_env> --[Emits]--> _on_character_event
CharacterEntity <Connects> CharacterBody --signals--> ActionManager._on_




```