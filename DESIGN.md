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
PlayerManager [contains] ControllerHandler
PlayerManager {has} _on_local_player
  ]*instantiates*-> PlayerEntity
  <Connects> _on_game_Signal --signals--> PlayerEntity._on_game_event
  <Connects> ControllerHandler --signals--> PlayerEntity._on_ControlInput
# HTTPHandler
  HTTPHandler {'signal'} _on_http
  <from_env>  --[Emits]--> _action _on_http
PlayerManager [contains] HTTPHandler
PlayerManager {has} _on_remote_player
  ]*instantiates*-> PlayerEntity
  <Connects> _on_game_Signal --signals--> PlayerEntity._on_game_event
  <Connects> HTTPHandler --signals--> PlayerEntity._player_update
  <Connects> PlayerEntity._player_event --signals--> HTTPHandler._player_update
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
CharacterEntity [contains] CharacterActionManager
CharacterEntity [contains] CharacterAttributes
CharacterEntity [contains] AnimatedEntity
CharacterEntity {'signal'} _player_event
CharacterEntity {has} _on_player_event --[Emits]--> _player_event
CharacterEntity {has} _on_InputHandler --calls--> CharacterActionManager._on_input
CharacterEntity {has} _on_Configure --calls--> CharacterAttributes._configure
# CharacterActionManager
  CharacterActionManager {'signal'} _action
  CharacterActionManager {has} _on_input --[Emits]--> _action
CharacterEntity <Connects> CharacterActionManager --signals--> CharacterAttributes._on_action
CharacterEntity <Connects> CharacterActionManager --signals--> ._on_player_event
CharacterEntity <Connects> CharacterAttributes --signals--> CharacterBody._on_attribute
# CharacterBody
  CharacterBody {'signal'} _character_event
  <from_env> --[Emits]--> _character_event
CharacterEntity <Connects> CharacterBody --signals--> CharacterActionManager._on_character_event





# BaseEntity
BaseEntity [contains] PubSub publisher
BaseEntity [contains] BodyManager
BaseEntity [contains] Attributes
BaseEntity {'signal'} _entity_event
BaseEntity {has} _on_entity_event -> publisher.publish('event_name',data)
BaseEntity {has} _on_InputHandler --calls--> ActionManager._on_input
BaseEntity {has} _on_Configure --calls--> Attributes._configure

BaseEntity <Connects> ActionManager --signals--> Attributes._on_action
BaseEntity <Connects> ActionManager --signals--> ._on_player_event
BaseEntity <Connects> Attributes --signals--> BodyManager._on_attribute

BaseEntity [contains] 'virtual' ActionManager


# ActionManager
ActionManager [contains] PubSub
ActionManager {has} _on_input(input) -> process_input(input)
ActionManager {has} _base_ready() -> ...
ActionManager {has} _on_ready_() -> _base_ready() _custom_ready()

ActionManager [contains] 'virtual' pubids
ActionManager {'virtual'} _custom_ready() -> 
ActionManager {'virtual'} process_input(input)
  PubSub.publish{'action_type', data}


# BodyManager
BodyManager {has} new_body(body_config) // Adds collision shapes, animations, and areas etc...
  ]*instantiates*-> BodyType
  BodyType.config(body_config)
BodyManager {'signal'} _body_event
<from_env> --[Emits]--> _body_event

```


```cs


ID (mgr,inst)
  mgr=mgr
  inst=inst
  id=mgr+inst

# physical to virtual user cmds
input-m (id=G)
  input-key-m (key-s(host) -> input-s(host,input-v))
  input-mouse-m (key-s(host) -> input-s(host,input-v))
  input-touch-m (touch-s(host) -> input-s(host,input-v))
  input-http-m (http-s(host) -> input-s(host,input-v))
user-m (id=G)
  user-i (ID(mgr=id,inst=host))
user-t (id..host)
  player-m-i (ID(mgr=id,inst=1))
player-m-t (id..host)
  player-i (ID(mgr=id,inst=N))
  (input-s(host,input-v) -> input-s(self-id,input-v))
player-t (self-id=host.player-n)
  [character] entity-m-i (self-id=self-id.entity-m-N,manager-id=self-id,entity-type,)
  command-m-i
command-m-t
  input-v -> 

entity-m-t (self-id,manager-id,entity-type)
  [character] entity-i (manager-id==player-id,entity-type,entity-id==player-id.entity-N) [character]
entity-t (self-id,manager-id,entity-type)

  
user (uid) presses key "E" and is handled by input-key-m (im)
input-key-m (im) sends "uid.use-selected" to input-m (im)
input-m (im) sends "uid.use-selected" to command-m (uid)

command-m (uid) sends "use-selected" to entity-m (em)
entity-m (p-id) sends em-cmd-v "use weapon" to entity-i (p-id)
entity-i (p-id) sends ei-cmd-v "use weapon" to equipment-m (ei-id)
equipment-m (p-id) sends eqm-cmd-v "activate" to weapon-i (wi-id)
weapon (w-id) hits enemy (e-id)
enemy dies (enemyid)

player (playerid) gets enemy.point (enemyid)
```



```cs

..



# PubSub
PubSub {has} _publish('pubid',data)
PubSub {has} _set_sig('pubid',pub_sig)
PubSub {has} register_sub(sub)
SubSub {has} register_pub(pub)
PubSub {has} _get_sig('pubid')
SubSub {has} _subscribe('pubid',sub_cb)
# Publisher
Publisher {'virtual'} _publishes = {'ids':sig}
# Subscriber
Subscriber {'virtual'} _subscribes = {'ids':cb}

# BlockManager


<Connects> BlockEntity._block_event --signals--> xxxx


# BlockEntity
BlockEntity [contains] InputHandler
BlockEntity [contains] BlockBody
BlockEntity [contains] BlockActionManager
BlockEntity [contains] BlockAttributes
BlockEntity [contains] AnimatedEntity

BlockEntity {'signal'} _block_event
BlockEntity {has} _on_block_event --[Emits]--> _block_event
BlockEntity {has} _on_InputHandler --calls--> BlockActionManager._on_input
BlockEntity {has} _on_Configure --calls--> BlockAttributes._configure
# BlockActionManager
  BlockActionManager {'signal'} _action
  BlockActionManager {has} _on_input --[Emits]--> _action
BlockEntity <Connects> BlockActionManager --signals--> BlockAttributes._on_action
BlockEntity <Connects> BlockActionManager --signals--> ._on_block_event
BlockEntity <Connects> BlockAttributes --signals--> BlockBody._on_attribute


# BlockBody
  BlockBody {'signal'} _block_event
  <from_env> --[Emits]--> _block_event
BlockEntity <Connects> BlockBody --signals--> BlockActionManager._on_block_event



# AnimatedEntity

```