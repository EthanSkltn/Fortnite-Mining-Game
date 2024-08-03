using { /Verse.org/Simulation }
using { /Fortnite.com/Devices }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /Fortnite.com/Game}
using { /Fortnite.com/Characters}
using { /Fortnite.com/Playspaces }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }
using { /Fortnite.com/UI }
using { /Fortnite.com }
using { /Verse.org }
using { /Verse.org/Colors }
using {/Fortnite.com/FortPlayerUtilities}
using { /Verse.org/Simulation/Tags}

using{UpgradeInterfaceFolder}

#new TODO:
#Remove the ability to waste brick on the checkpoint button
#Add more decorations to the map
#Add sounds to increase addiction
#Add vfx for rock breaking

#Add acolades
#Add gaining material interface https://www.youtube.com/watch?v=J8lcz479v5U uses progress bar

Spawner := class(tag){}

MaintainedPlayerStats :=class<final><persistable>:
    PlayerBrick : int = 0
    PlayerIncrementAmount : int = 1

    LevelOneUpgradeCost : int = 15
    LevelTwoUpgradeCost : int = 100
    LevelThreeUpgradeCost : int = 1200
    LevelFourUpgradeCost : int = 12000
    LevelFiveUpgradeCost : int = 120000
    LevelSixUpgradeCost : int = 1500000
    LevelSevenUpgradeCost : int = 21000000
    LevelEightUpgradeCost : int = 300000000
    LevelNineUpgradeCost : int = 4100000000
    LevelTenUpgradeCost : int = 54000000000


SetBrickMaintained<constructor>(OldStat:MaintainedPlayerStats)<transacts> := MaintainedPlayerStats:
    PlayerBrick := OldStat.PlayerBrick
    PlayerIncrementAmount := OldStat.PlayerIncrementAmount
    
    LevelOneUpgradeCost:=OldStat.LevelOneUpgradeCost
    LevelTwoUpgradeCost:=OldStat.LevelTwoUpgradeCost
    LevelThreeUpgradeCost:=OldStat.LevelThreeUpgradeCost
    LevelFourUpgradeCost:=OldStat.LevelFourUpgradeCost
    LevelFiveUpgradeCost:=OldStat.LevelFiveUpgradeCost
    LevelSixUpgradeCost:=OldStat.LevelSixUpgradeCost
    LevelSevenUpgradeCost:=OldStat.LevelSevenUpgradeCost
    LevelEightUpgradeCost:=OldStat.LevelEightUpgradeCost
    LevelNineUpgradeCost:=OldStat.LevelNineUpgradeCost
    LevelTenUpgradeCost:=OldStat.LevelTenUpgradeCost

var MaintainedMap:weak_map(player, MaintainedPlayerStats) = map{}

UpdateTotalBrickMaintained(Agent:agent,TotalBrick:int):void=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            if:
                OldData := MaintainedMap[PlayerObj]

                set MaintainedMap[PlayerObj] = MaintainedPlayerStats{
                    SetBrickMaintained<constructor>(OldData)
                    PlayerBrick:= TotalBrick
                }

#TD
UpdateUpgradeCostMaintained(Agent:agent,Level1Cost:int,Level2Cost:int,Level3Cost:int,Level4Cost:int,Level5Cost:int,Level6Cost:int,Level7Cost:int,Level8Cost:int,Level9Cost:int,Level10Cost:int):void=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            if:
                OldData := MaintainedMap[PlayerObj]
                set MaintainedMap[PlayerObj] = MaintainedPlayerStats{
                    SetBrickMaintained<constructor>(OldData)
                    LevelOneUpgradeCost:=Level1Cost
                    LevelTwoUpgradeCost:=Level2Cost
                    LevelThreeUpgradeCost:=Level3Cost
                    LevelFourUpgradeCost:=Level4Cost
                    LevelFiveUpgradeCost:=Level5Cost
                    LevelSixUpgradeCost:=Level6Cost
                    LevelSevenUpgradeCost:=Level7Cost
                    LevelEightUpgradeCost:=Level8Cost
                    LevelNineUpgradeCost:=Level9Cost
                    LevelTenUpgradeCost:=Level10Cost
                }
#TD
UpdateIncrementMaintained(Agent:agent,Increment:int):void=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            if:
                OldData := MaintainedMap[PlayerObj]

                set MaintainedMap[PlayerObj] = MaintainedPlayerStats{
                    SetBrickMaintained<constructor>(OldData)
                    PlayerIncrementAmount := Increment
                }

GetPlayerMaintainedTotalBrick(Agent:agent):int=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            return PlayerMaintained.PlayerBrick
        else return 0
    else return 0

GetPlayerUpgradeOneCostMaintained(Agent:agent):int=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            return PlayerMaintained.LevelOneUpgradeCost
        else return 15
    else return 15

GetPlayerUpgradeTwoCostMaintained(Agent:agent):int=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            return PlayerMaintained.LevelTwoUpgradeCost
        else return 100
    else return 100

GetPlayerUpgradeThreeCostMaintained(Agent:agent):int=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            return PlayerMaintained.LevelThreeUpgradeCost
        else return 1200
    else return 1200

GetPlayerUpgradeFourCostMaintained(Agent:agent):int=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            return PlayerMaintained.LevelFourUpgradeCost
        else return 12000
    else return 12000

GetPlayerUpgradeFiveCostMaintained(Agent:agent):int=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            return PlayerMaintained.LevelFiveUpgradeCost
        else return 120000
    else return 120000

GetPlayerUpgradeSixCostMaintained(Agent:agent):int=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            return PlayerMaintained.LevelSixUpgradeCost
        else return 1500000
    else return 1500000

GetPlayerUpgradeSevenCostMaintained(Agent:agent):int=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            return PlayerMaintained.LevelSevenUpgradeCost
        else return 21000000
    else return 21000000

GetPlayerUpgradeEightCostMaintained(Agent:agent):int=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            return PlayerMaintained.LevelEightUpgradeCost
        else return 300000000
    else return 300000000

GetPlayerUpgradeNineCostMaintained(Agent:agent):int=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            return PlayerMaintained.LevelNineUpgradeCost
        else return 4100000000
    else return 4100000000

GetPlayerUpgradeTenCostMaintained(Agent:agent):int=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            return PlayerMaintained.LevelTenUpgradeCost
        else return 54000000000
    else return 54000000000

GetPlayerIncrementMaintained(Agent:agent):int=
    if(PlayerObj:= player[Agent]):
        if(PlayerMaintained := MaintainedMap[PlayerObj]):
            return PlayerMaintained.PlayerIncrementAmount
        else return 1
    else return 1

PlayerStats := class<unique>():
    var TotalBrick: int
    var BrickIncrementRate: int

    var LevelOneUpgradeCost : int
    var LevelTwoUpgradeCost : int
    var LevelThreeUpgradeCost : int
    var LevelFourUpgradeCost : int
    var LevelFiveUpgradeCost : int
    var LevelSixUpgradeCost : int
    var LevelSevenUpgradeCost : int
    var LevelEightUpgradeCost : int
    var LevelNineUpgradeCost : int
    var LevelTenUpgradeCost : int

    var CurrentUpgradePage : int

    var CurrentRockHits : int
    var CurrentFarmedThisRalley : int

    var Player: agent

    var AccolaceFirstHit :logic= false
    var AccolaceBarrierOneUnlocked:logic= false
    var AccolaceBarrierTwoUnlocked:logic= false
    var AccolaceBarrierThreeUnlocked:logic= false
    var AccolaceLevelOneRockBroken:logic= false
    var AccolaceLevelTwoRockBroken:logic= false
    var AccolaceLevelThreeRockBroken:logic= false

    SetAccolaceFirstHit():void=
        set AccolaceFirstHit = true

    SetAccolaceBarrierOneUnlocked():void=
        set AccolaceBarrierOneUnlocked = true

    SetAccolaceBarrierTwoUnlocked():void=
        set AccolaceBarrierTwoUnlocked = true

    SetAccolaceBarrierThreeUnlocked():void=
        set AccolaceBarrierThreeUnlocked = true

    SetAccolaceLevelOneRockBroken():void=
        set AccolaceLevelOneRockBroken = true

    SetAccolaceLevelTwoRockBroken():void=
        set AccolaceLevelTwoRockBroken = true

    SetAccolaceLevelThreeRockBroken():void=
        set AccolaceLevelThreeRockBroken = true
    
    SetIncrementCurrentRockHits():void=
        set CurrentRockHits = CurrentRockHits + 1

    SetIncrementCurrentRalley():void=
        set CurrentFarmedThisRalley = CurrentFarmedThisRalley + BrickIncrementRate

    ResourseFarmed(Agent:agent): void=
        set TotalBrick = TotalBrick + BrickIncrementRate
        UpdateTotalBrickMaintained(Agent, TotalBrick)
        
    IncreaseIncrementRate(Increase:int): void=
        set BrickIncrementRate = BrickIncrementRate + Increase
        UpdateIncrementMaintained(Player, BrickIncrementRate)
    
    GetTotalBrick():int=
        return TotalBrick

    GetBrickIncrementRate():int=
        return BrickIncrementRate

    GetCurrentPage():int=
        return CurrentUpgradePage

    SetTotalBrick(NewBrickAmount:int): void=
        set TotalBrick = NewBrickAmount

    SetBrickIncrementRate(NewBrickIncrementRate:int): void=
        set BrickIncrementRate = NewBrickIncrementRate

    SetCurrentPage(CurrentPage:int): void=
        set CurrentUpgradePage = CurrentPage

    UpgradeBrought(UpgradeCost:int): void=
        set TotalBrick = TotalBrick - UpgradeCost

    IncrementUpgradeCost(Level:int): void=
        if(Level = 1):
            set LevelOneUpgradeCost = LevelOneUpgradeCost + 2
        if(Level = 2):
            set LevelTwoUpgradeCost = LevelTwoUpgradeCost + 14
        if(Level = 3):
            set LevelThreeUpgradeCost = LevelThreeUpgradeCost + 180
        if(Level = 4):
            set LevelFourUpgradeCost = LevelFourUpgradeCost + 2400
        if(Level = 5):
            set LevelFiveUpgradeCost = LevelFiveUpgradeCost + 18000
        if(Level = 6):
            set LevelSixUpgradeCost = LevelSixUpgradeCost + 170000
        if(Level = 7):
            set LevelSevenUpgradeCost = LevelSevenUpgradeCost + 1700000
        if(Level = 8):
            set LevelEightUpgradeCost = LevelEightUpgradeCost + 17000000
        if(Level = 9):
            set LevelNineUpgradeCost = LevelNineUpgradeCost + 170000000
        if(Level = 10):
            set LevelTenUpgradeCost = LevelTenUpgradeCost + 1700000000
        UpdateUpgradeCostMaintained(Player, LevelOneUpgradeCost, LevelTwoUpgradeCost, LevelThreeUpgradeCost, 
                                            LevelFourUpgradeCost, LevelFiveUpgradeCost,
                                            LevelSixUpgradeCost,LevelSevenUpgradeCost,
                                            LevelEightUpgradeCost,LevelNineUpgradeCost,
                                            LevelTenUpgradeCost)
    
    GetUpgradeCost(Index:int): int=
        if(Index=1):
            return LevelOneUpgradeCost
        if(Index=2):
            return LevelTwoUpgradeCost
        if(Index=3):
            return LevelThreeUpgradeCost
        if(Index=4):
            return LevelFourUpgradeCost
        if(Index=5):
            return LevelFiveUpgradeCost
        if(Index=6):
            return LevelSixUpgradeCost
        if(Index=7):
            return LevelSevenUpgradeCost
        if(Index=8):
            return LevelEightUpgradeCost
        if(Index=9):
            return LevelNineUpgradeCost
        if(Index=10):
            return LevelTenUpgradeCost
        else:
            return 0

RockCategory := class<unique>():
    var RockHealth: int = 0
    var RockLevel: int = 1

    SetRockHealth(RockHealthGiven:int): void=
        set RockHealth = RockHealthGiven

    SetRockLevel(RockLevelGiven:int): void=
        set RockLevel = RockLevelGiven

    GetRockHealth():int=
        return RockHealth

    GetRockLevel():int=
        return RockLevel


RockIdentifier := class<unique>():
    var MaxRockHealth: int = 0
    var RockRemainingHealth: int = 0
    var RockLevel: int = 0

    SetRockLevel(RockLevelGiven:int): void=
        set RockLevel = RockLevelGiven

    GetRockLevel(): int=
        return RockLevel

    GetRockMaxHealth(): int=
        return MaxRockHealth

    GetRockCurrentHealth(): int=
        return RockRemainingHealth
    
    SetMaxRockHealth(MaxRockHealthGiven:int): void=
        set MaxRockHealth = MaxRockHealthGiven
        set RockRemainingHealth = MaxRockHealth

    RockFarmed(Agent:agent,PlayerMap:[player]PlayerStats,TriggeringDevice:prop_manipulator_device)<suspends>:void=
        var TotalBrick:int = 0
        if(PlayerExists := PlayerMap[Agent]):
            set TotalBrick = PlayerExists.GetTotalBrick()
        if(PlayerUI := GetPlayerUI[player[Agent]]):
            if(PlayerObj :=player[Agent]):
                if(PlayerExists := PlayerMap[Agent]):
                    set RockRemainingHealth = RockRemainingHealth - PlayerExists.GetBrickIncrementRate()
            if(RockRemainingHealth<=0):
                BrickHasBeenDestroyed()
                TriggeringDevice.HideProps()
                Sleep(3.0)
                TriggeringDevice.ShowProps()
                set RockRemainingHealth = MaxRockHealth
                
    BrickHasBeenDestroyed(): void=
        set RockRemainingHealth = 0
        
# Define the Handler1 class
Handler1 := class<unique>() {
    Device : mining_manager_device
    RockNumber : int
    TriggeringDevice : prop_manipulator_device

    HandlerFunctionLevelZero(Agent: agent): void =
        Device.HandleRockLevelZeroTriggered(RockNumber,Agent,TriggeringDevice)
        Device.RunHarvestedRock(Agent)

    HandlerFunctionLevelOne(Agent: agent): void =
        Device.HandleRockLevelOneTriggered(RockNumber,Agent,TriggeringDevice)
        Device.RunHarvestedRock(Agent)

    HandlerFunctionLevelTwo(Agent: agent): void=
        Device.HandleRockLevelTwoTriggered(RockNumber,Agent,TriggeringDevice)
        Device.RunHarvestedRock(Agent)

    HandlerFunctionLevelThree(Agent: agent): void=
        Device.HandleRockLevelThreeTriggered(RockNumber,Agent,TriggeringDevice)
        Device.RunHarvestedRock(Agent)
}

Handler2 := class<unique>() {
    Device : mining_manager_device

    HandlerUpgrade1(Message:widget_message): void=
        Device.RunUpgradeButtonsSelect(Message.Player,0,Message)

    HandlerUpgrade2(Message:widget_message): void=
        Device.RunUpgradeButtonsSelect(Message.Player,1,Message)

    HandlerUpgrade3(Message:widget_message): void=
        Device.RunUpgradeButtonsSelect(Message.Player,2,Message)

    HandlerUpgrade4(Message:widget_message): void=
        Device.RunUpgradeButtonsSelect(Message.Player,3,Message)

    HandlerUpgrade5(Message:widget_message): void=
        Device.RunUpgradeButtonsSelect(Message.Player,4,Message)

    HandlerExit(Message:widget_message): void=
        Device.RunUpgradeButtonsSelect(Message.Player,-1,Message)

    HandlerNextPage(Message:widget_message): void=
        Device.FowardPageButtonPressed(Message.Player)

    HandlerPreviousPage(Message:widget_message): void=
        Device.BackwardPageButtonPressed(Message.Player)
}

# A Verse-authored creative device that can be placed in a level
mining_manager_device := class(creative_device):

    @editable
    AccolaceFirstHit:accolades_device = accolades_device{}
    @editable
    AccolaceBarrierOneUnlocked:accolades_device = accolades_device{}
    @editable
    AccolaceBarrierTwoUnlocked:accolades_device = accolades_device{}
    @editable
    AccolaceBarrierThreeUnlocked:accolades_device = accolades_device{}
    @editable
    AccolaceLevelOneRockBroken:accolades_device = accolades_device{}
    @editable
    AccolaceLevelTwoRockBroken:accolades_device = accolades_device{}
    @editable
    AccolaceLevelThreeRockBroken:accolades_device = accolades_device{}
    
    #FirstLevelRocks
    @editable
    RockZero1:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockOne1:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockOne2:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockOne4:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockOne5:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockOne6:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockOne7:prop_manipulator_device = prop_manipulator_device{}

    @editable
    RockTwo1:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockTwo2:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockTwo3:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockTwo4:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockTwo5:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockTwo6:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockTwo7:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockTwo8:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockTwo9:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockTwo10:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockTwo11:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockTwo12:prop_manipulator_device = prop_manipulator_device{}
    @editable
    RockTwo13:prop_manipulator_device = prop_manipulator_device{}

    @editable
    WelcomeUI:popup_dialog_device = popup_dialog_device{}

    @editable
    OminousBackground: audio_player_device = audio_player_device{}

    @editable
    RemoteUpgradeGranter:item_granter_device = item_granter_device{}

    @editable
    SpawnDevice:player_spawner_device = player_spawner_device{}

    @editable
    PlayerBrickAmount:hud_message_device = hud_message_device{}

    @editable
    HarvestUI:hud_message_device = hud_message_device{}

    @editable
    CostOfFirst5Upgrades:hud_message_device = hud_message_device{}

    @editable
    PlayerStatsBoard:billboard_device = billboard_device{}

    @editable
    BoarderToRoomOne:barrier_device = barrier_device{}

    @editable
    BoarderOneButton:button_device = button_device{}

    @editable
    BoarderOneButtonReturn:button_device = button_device{}

    @editable
    BoarderToRoomTwo:barrier_device = barrier_device{}

    @editable
    BoarderTwoButton:button_device = button_device{}

    @editable
    BoarderTwoButtonReturn:button_device = button_device{}

    @editable
    BoarderToRoomThree:barrier_device = barrier_device{}

    @editable
    BoarderThreeButton:button_device = button_device{}

    @editable
    BoarderThreeButtonReturn:button_device = button_device{}

    StatsMessage<localizes>(Score:int):message = "SCORE:\n {Score}"

#Setting up variables for player UI (Text for cost will be the text on the button)

    var MaybeUpgradeUIPerPlayer : [player]?canvas = map{}

    var MaybeBaseUIPerPlayer : [player]?canvas = map{}

    UpgradeButton1:button_quiet = button_quiet{}
    UpgradeButton2:button_quiet = button_quiet{}
    UpgradeButton3:button_quiet = button_quiet{}
    UpgradeButton4:button_quiet = button_quiet{}
    UpgradeButton5:button_quiet = button_quiet{}
    ExitUI:button_loud = button_loud{}

    NextPageButton:button_quiet = button_quiet{}
    PreviousPageButton:button_quiet = button_quiet{}

    UpgradeUIBackground:texture_block = texture_block{DefaultImage:=Final_of_blue_GUI,DefaultDesiredSize := vector2{X := 1900.0,Y:=1070.0}}

    ForceRow1Text:text_block = text_block{}
    ForceRow2Text:text_block = text_block{}
    ForceRow3Text:text_block = text_block{}
    ForceRow4Text:text_block = text_block{}
    ForceRow5Text:text_block = text_block{}

    ForceValueRow1Text:text_block = text_block{}
    ForceValueRow2Text:text_block = text_block{}
    ForceValueRow3Text:text_block = text_block{}
    ForceValueRow4Text:text_block = text_block{}
    ForceValueRow5Text:text_block = text_block{}

    LevelText:text_block = text_block{}
    UpgradeText:text_block = text_block{}
    TitleText:text_block = text_block{}
    
    PlayerForceText:text_block = text_block{}
    UIBrickAmountText:text_block = text_block{}

    CurrentRockHealthBar: slider_regular = slider_regular{}
    TotalFarmedThisRalley:text_block = text_block{}
    BrickGainedFromHit:text_block = text_block{}

    var LevelOneUpgradeCost : int = 15
    var LevelTwoUpgradeCost : int = 100
    var LevelThreeUpgradeCost : int = 1200
    var LevelFourUpgradeCost : int = 12000
    var LevelFiveUpgradeCost : int = 120000
    var LevelSixUpgradeCost : int = 1500000
    var LevelSevenUpgradeCost : int = 21000000
    var LevelEightUpgradeCost : int = 300000000
    var LevelNineUpgradeCost : int = 4100000000
    var LevelTenUpgradeCost : int = 54000000000

    var PlayerMap : [player]PlayerStats = map{}

    var RockMap : [int]RockCategory = map{}

    var RockIdentifierMap : [string]RockIdentifier = map{}

    ConvertToMessage<localizes>(String:string):message = "{String}"

    @editable
    RemoteSignalRecivor:signal_remote_manager_device = signal_remote_manager_device{}

    # Runs when the device is started in a running game
    OnBegin<override>()<suspends>: void =
        SetUpRockLevels()
        SpawnDevice.SpawnedEvent.Subscribe(OnPlayerAdded)
        RemoteSignalRecivor.PrimarySignalEvent.Subscribe(AssignUpgradeHUD)
        BoarderOneButton.InteractedWithEvent.Subscribe(DropBoarderOne)
        BoarderOneButtonReturn.InteractedWithEvent.Subscribe(DropBoarderOneReturn)
        BoarderTwoButton.InteractedWithEvent.Subscribe(DropBoarderTwo)
        BoarderTwoButtonReturn.InteractedWithEvent.Subscribe(DropBoarderTwoReturn)
        BoarderThreeButton.InteractedWithEvent.Subscribe(DropBoarderThree)
        BoarderThreeButtonReturn.InteractedWithEvent.Subscribe(DropBoarderThreeReturn)
        WelcomeUI.RespondingButtonEvent.Subscribe(HideWelcomeUI)
        OminousBackground.Play()
        RockZero1.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=0,TriggeringDevice:=RockZero1}.HandlerFunctionLevelZero)
        RockOne1.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=1,TriggeringDevice:=RockOne1}.HandlerFunctionLevelOne)
        RockOne2.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=2,TriggeringDevice:=RockOne2}.HandlerFunctionLevelOne)
        RockOne4.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=4,TriggeringDevice:=RockOne4}.HandlerFunctionLevelOne)
        RockOne5.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=5,TriggeringDevice:=RockOne5}.HandlerFunctionLevelOne)
        RockOne6.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=6,TriggeringDevice:=RockOne6}.HandlerFunctionLevelOne)
        RockOne7.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=7,TriggeringDevice:=RockOne7}.HandlerFunctionLevelOne)
        RockTwo1.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=10,TriggeringDevice:=RockTwo1}.HandlerFunctionLevelTwo)
        RockTwo2.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=11,TriggeringDevice:=RockTwo2}.HandlerFunctionLevelTwo)
        RockTwo3.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=12,TriggeringDevice:=RockTwo3}.HandlerFunctionLevelTwo)
        RockTwo4.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=13,TriggeringDevice:=RockTwo4}.HandlerFunctionLevelTwo)
        RockTwo5.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=14,TriggeringDevice:=RockTwo5}.HandlerFunctionLevelTwo)
        RockTwo6.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=15,TriggeringDevice:=RockTwo6}.HandlerFunctionLevelTwo)
        RockTwo7.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=16,TriggeringDevice:=RockTwo7}.HandlerFunctionLevelTwo)
        RockTwo8.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=17,TriggeringDevice:=RockTwo8}.HandlerFunctionLevelTwo)
        RockTwo9.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=18,TriggeringDevice:=RockTwo9}.HandlerFunctionLevelTwo)
        RockTwo10.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=19,TriggeringDevice:=RockTwo10}.HandlerFunctionLevelTwo)
        RockTwo11.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=20,TriggeringDevice:=RockTwo11}.HandlerFunctionLevelTwo)
        RockTwo12.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=21,TriggeringDevice:=RockTwo12}.HandlerFunctionLevelTwo)
        RockTwo13.DamagedEvent.Subscribe(Handler1{Device:=Self, RockNumber:=22,TriggeringDevice:=RockTwo13}.HandlerFunctionLevelTwo)

        UpgradeButton1.OnClick().Subscribe(Handler2{Device:=Self}.HandlerUpgrade1)
        UpgradeButton2.OnClick().Subscribe(Handler2{Device:=Self}.HandlerUpgrade2)
        UpgradeButton3.OnClick().Subscribe(Handler2{Device:=Self}.HandlerUpgrade3)
        UpgradeButton4.OnClick().Subscribe(Handler2{Device:=Self}.HandlerUpgrade4)
        UpgradeButton5.OnClick().Subscribe(Handler2{Device:=Self}.HandlerUpgrade5)
        ExitUI.OnClick().Subscribe(Handler2{Device:=Self}.HandlerExit)
        NextPageButton.OnClick().Subscribe(Handler2{Device:=Self}.HandlerNextPage)
        PreviousPageButton.OnClick().Subscribe(Handler2{Device:=Self}.HandlerPreviousPage)
    
        # Function to handle when a player is added

    OnPlayerAdded(NewPlayer: agent): void =
        RemoteUpgradeGranter.GrantItem(NewPlayer)
        if (PlayerObj := player[NewPlayer]):
            if (PlayerExists := PlayerMap[NewPlayer]):
                # Player already in map, nothing to do
            else:
                TTotalBrick:=GetPlayerMaintainedTotalBrick(NewPlayer)
                TIncrementRate := GetPlayerIncrementMaintained(NewPlayer)
                Player:=PlayerObj
                TLevelOneUpgradeCost:= GetPlayerUpgradeOneCostMaintained(NewPlayer)
                TLevelTwoUpgradeCost := GetPlayerUpgradeTwoCostMaintained(NewPlayer)
                TLevelThreeUpgradeCost := GetPlayerUpgradeThreeCostMaintained(NewPlayer)
                TLevelFourUpgradeCost := GetPlayerUpgradeFourCostMaintained(NewPlayer)
                TLevelFiveUpgradeCost:= GetPlayerUpgradeFiveCostMaintained(NewPlayer)
                TLevelSixUpgradeCost:= GetPlayerUpgradeSixCostMaintained(NewPlayer)
                TLevelSevenUpgradeCost := GetPlayerUpgradeSevenCostMaintained(NewPlayer)
                TLevelEightUpgradeCost := GetPlayerUpgradeEightCostMaintained(NewPlayer)
                TLevelNineUpgradeCost := GetPlayerUpgradeNineCostMaintained(NewPlayer)
                TLevelTenUpgradeCost:= GetPlayerUpgradeTenCostMaintained(NewPlayer)
                if(set PlayerMap[PlayerObj] = PlayerStats{TotalBrick:=TTotalBrick,
                                                            BrickIncrementRate:=TIncrementRate,
                                                            Player:=Player,
                                                            LevelOneUpgradeCost:=TLevelOneUpgradeCost,
                                                            LevelTwoUpgradeCost:=TLevelTwoUpgradeCost,
                                                            LevelThreeUpgradeCost:=TLevelThreeUpgradeCost,
                                                            LevelFourUpgradeCost:=TLevelFourUpgradeCost,
                                                            LevelFiveUpgradeCost:=TLevelFiveUpgradeCost,
                                                            LevelSixUpgradeCost:=TLevelSixUpgradeCost,
                                                            LevelSevenUpgradeCost:=TLevelSevenUpgradeCost,
                                                            LevelEightUpgradeCost:=TLevelEightUpgradeCost,
                                                            LevelNineUpgradeCost:=TLevelNineUpgradeCost,
                                                            LevelTenUpgradeCost:=TLevelTenUpgradeCost,
                                                            CurrentUpgradePage:=0,
                                                            CurrentRockHits:=0,
                                                            CurrentFarmedThisRalley:=0}):
                    if (AgentStats := PlayerMap[PlayerObj]):
                        Amount:="{ShortenLargeNumber(GetPlayerMaintainedTotalBrick(NewPlayer))}"
                        PlayerBrickAmount.SetText(ConvertToMessage(Amount))
                        FirstPlayer := NewPlayer
                    if(not MaintainedMap[PlayerObj]):
                        if (set MaintainedMap[PlayerObj] = MaintainedPlayerStats{}):
                    WelcomeUI.Show(NewPlayer)

    HideWelcomeUI(Agent:agent,Index:int): void=
        WelcomeUI.Hide(Agent)
              
    CreateBaseUIForPlayer(Agent:agent,MaxHealth:float,CurrentHealth:float): void=
        if (AgentStats := PlayerMap[Agent]):
            AgentStats.SetIncrementCurrentRalley()
            AgentStats.SetIncrementCurrentRockHits()
        UpdateBaseInterfaceText(Agent,MaxHealth,CurrentHealth)
        if(InPlayer := player[Agent], PlayerUI := GetPlayerUI[InPlayer]):
            NewUI:= MakeBaseUI(Agent)
            PlayerUI.AddWidget(NewUI)
            if(set MaybeBaseUIPerPlayer[InPlayer] = option{NewUI}){}
            spawn:
                RockHealthbarRemoveTimer(Agent)

    RockHealthbarRemoveTimer(Agent:agent)<suspends>: void=
        if (AgentStats := PlayerMap[Agent]):
            Previous := AgentStats.CurrentRockHits
            Sleep(3.0)
            if(Previous=AgentStats.CurrentRockHits):
                set AgentStats.CurrentRockHits = 0
                set AgentStats.CurrentFarmedThisRalley = 0
                HidePlayerBaseUI(Agent)

    HidePlayerBaseUI(Agent:agent): void=

        if(Player := player[Agent]):
            if(PlayerUI:=GetPlayerUI[Player], MyUI:=MaybeBaseUIPerPlayer[Player]?):
                PlayerUI.RemoveWidget(MyUI)
                if(set MaybeBaseUIPerPlayer[Player] = false){}

    MakeBaseUI(Agent:agent): canvas =      
        MyCanvas: canvas = canvas:
            Slots := array:
                canvas_slot:
                    Widget := CurrentRockHealthBar
                    Anchors := anchors{Minimum := vector2{X := 0.3, Y := 0.05}, Maximum := vector2{X := 0.7, Y := 0.2}}
                    Offsets := margin{}
                canvas_slot:
                    Widget := TotalFarmedThisRalley
                    Anchors := anchors{Minimum := vector2{X := 0.6, Y := 0.6}, Maximum := vector2{X := 0.7, Y := 0.65}}
                    Offsets := margin{}
                canvas_slot:
                    Widget := BrickGainedFromHit
                    Anchors := anchors{Minimum := vector2{X := 0.6, Y := 0.55}, Maximum := vector2{X := 0.7, Y := 0.59}}
                    Offsets := margin{}
                    
    UpdateBaseInterfaceText(Agent:agent,MaxHealth:float,CurrentHealth:float): void=
        if (AgentStats := PlayerMap[Agent]):
            Print("{CurrentHealth}")
            CurrentRockHealthBar.SetMinValue(0.0)
            CurrentRockHealthBar.SetMaxValue(MaxHealth)
            CurrentRockHealthBar.SetValue(CurrentHealth)
            BrickGainedFromHit.SetText(ConvertToMessage(("+{ShortenLargeNumber(AgentStats.GetBrickIncrementRate())}")))
            TotalFarmedThisRalley.SetText(ConvertToMessage(("{ShortenLargeNumber(AgentStats.CurrentFarmedThisRalley)} (x{AgentStats.CurrentRockHits})")))


    UpdateRockHealthBar(Agent:agent,RockName:[]char):void=
        if (RockIdentity := RockIdentifierMap[RockName]):
            MaxHealth := RockIdentity.GetRockMaxHealth() * 1.0
            CurrentHealth :=RockIdentity.GetRockCurrentHealth() * 1.0
            CreateBaseUIForPlayer(Agent,MaxHealth,CurrentHealth)
            if(CurrentHealth<=0.0):
                CheckIfRockFistTime(Agent,RockIdentity.RockLevel)
        


    CreateUpgradeUIForPlayer(Agent:agent): void=
        UpdateUpgradeInterfaceText(Agent)
        if(InPlayer := player[Agent], PlayerUI := GetPlayerUI[InPlayer]):
            NewUI:= MakeUpgradeUI(Agent)
            PlayerUI.AddWidget(NewUI,player_ui_slot{InputMode:=ui_input_mode.All})
            if(set MaybeUpgradeUIPerPlayer[InPlayer] = option{NewUI}){}

    ShowPlayerUpgradeUI(Agent:agent): void=
        CreateUpgradeUIForPlayer(Agent)  

    HidePlayerUpgradeUI(Agent:agent): void=
        if(Player := player[Agent]):
            if(PlayerUI:=GetPlayerUI[Player], MyUI:=MaybeUpgradeUIPerPlayer[Player]?):
                PlayerUI.RemoveWidget(MyUI)
                if(set MaybeUpgradeUIPerPlayer[Player] = false){}

    MakeUpgradeUI(Agent:agent): canvas =
        Print("Canvas created")
        Button1_Text : string = "Cost: "
        Button1_Size : vector2 = vector2{X := 400.0, Y := 100.0}
        
        Button2_Text : string = "Cost: "
        Button2_Size : vector2 = vector2{X := 400.0, Y := 100.0}
        
        Button3_Text : string = "Cost: "
        Button3_Size : vector2 = vector2{X := 400.0, Y := 100.0}
        
        Button4_Text : string = "Cost: "
        Button4_Size : vector2 = vector2{X := 400.0, Y := 100.0}
        
        Button5_Text : string = "Cost: "
        Button5_Size : vector2 = vector2{X := 400.0, Y := 100.0}
    
        Button6_Text : string = "Exit"
        Button6_Size : vector2 = vector2{X := 400.0, Y := 150.0}

        MyCanvas: canvas = canvas:
            Slots := array:
                canvas_slot:
                    Widget := UpgradeUIBackground
                    Anchors := anchors{Minimum := vector2{X := 0.0, Y := 0.0}, Maximum := vector2{X := 1.0, Y := 1.0}}
                    Offsets := margin{}
                canvas_slot:
                    Widget := PlayerForceText
                    Anchors := anchors{Minimum := vector2{X := 0.0, Y := 0.0}, Maximum := vector2{X := 0.0, Y := 0.0}}
                    Offsets := margin{Top := 87.0,Left:=131.0}
                canvas_slot:
                    Widget := UIBrickAmountText
                    Anchors := anchors{Minimum := vector2{X := 0.0, Y := 0.0}, Maximum := vector2{X := 0.0, Y := 0.0}}
                    Offsets := margin{Top := 175.0,Left:=131.0}
                canvas_slot:
                    Widget := UpgradeButton1
                    Anchors := anchors{Minimum := vector2{X := 0.35, Y := 0.34}, Maximum := vector2{X := 0.75, Y := 0.41}}
                canvas_slot:
                    Widget := UpgradeButton2
                    Anchors := anchors{Minimum := vector2{X := 0.35, Y := 0.44}, Maximum := vector2{X := 0.75, Y := 0.51}}
                canvas_slot:
                    Widget := UpgradeButton3
                    Anchors := anchors{Minimum := vector2{X := 0.35, Y := 0.54}, Maximum := vector2{X := 0.75, Y := 0.61}}
                canvas_slot:
                    Widget := UpgradeButton4
                    Anchors := anchors{Minimum := vector2{X := 0.35, Y := 0.64}, Maximum := vector2{X := 0.75, Y := 0.71}}
                canvas_slot:
                    Widget := UpgradeButton5
                    Anchors := anchors{Minimum := vector2{X := 0.35, Y := 0.74}, Maximum := vector2{X := 0.75, Y := 0.81}}
                canvas_slot:
                    Widget := ExitUI
                    Anchors := anchors{Minimum := vector2{X := 0.4, Y := 0.92}, Maximum := vector2{X := 0.6, Y := 0.97}}
                canvas_slot:
                    Widget := NextPageButton
                    Anchors := anchors{Minimum := vector2{X := 0.52, Y := 0.85}, Maximum := vector2{X := 0.75, Y := 0.89}}
                canvas_slot:
                    Widget := PreviousPageButton
                    Anchors := anchors{Minimum := vector2{X := 0.25, Y := 0.85}, Maximum := vector2{X := 0.48, Y := 0.89}}
                canvas_slot:
                    Widget := ForceRow1Text
                    Anchors := anchors{Minimum := vector2{X := 0.1, Y := 0.34}, Maximum := vector2{X := 0.2, Y := 0.41}}
                canvas_slot:
                    Widget := ForceRow2Text
                    Anchors := anchors{Minimum := vector2{X := 0.1, Y := 0.44}, Maximum := vector2{X := 0.2, Y := 0.51}}
                canvas_slot:
                    Widget := ForceRow3Text
                    Anchors := anchors{Minimum := vector2{X := 0.1, Y := 0.54}, Maximum := vector2{X := 0.2, Y := 0.61}}
                canvas_slot:
                    Widget := ForceRow4Text
                    Anchors := anchors{Minimum := vector2{X := 0.1, Y := 0.64}, Maximum := vector2{X := 0.2, Y := 0.71}}
                canvas_slot:
                    Widget := ForceRow5Text
                    Anchors := anchors{Minimum := vector2{X := 0.1, Y := 0.74}, Maximum := vector2{X := 0.2, Y := 0.81}}
                canvas_slot:
                    Widget := ForceValueRow1Text
                    Anchors := anchors{Minimum := vector2{X := 0.23, Y := 0.34}, Maximum := vector2{X := 0.3, Y := 0.41}}
                canvas_slot:
                    Widget := ForceValueRow2Text
                    Anchors := anchors{Minimum := vector2{X := 0.23, Y := 0.44}, Maximum := vector2{X := 0.3, Y := 0.51}}
                canvas_slot:
                    Widget := ForceValueRow3Text
                    Anchors := anchors{Minimum := vector2{X := 0.23, Y := 0.54}, Maximum := vector2{X := 0.3, Y := 0.61}}
                canvas_slot:
                    Widget := ForceValueRow4Text
                    Anchors := anchors{Minimum := vector2{X := 0.23, Y := 0.64}, Maximum := vector2{X := 0.3, Y := 0.71}}
                canvas_slot:
                    Widget := ForceValueRow5Text
                    Anchors := anchors{Minimum := vector2{X := 0.23, Y := 0.74}, Maximum := vector2{X := 0.3, Y := 0.81}}
                canvas_slot:
                    Widget := LevelText
                    Anchors := anchors{Minimum := vector2{X := 0.23, Y := 0.26}, Maximum := vector2{X := 0.23, Y := 0.31}}
                canvas_slot:
                    Widget := UpgradeText
                    Anchors := anchors{Minimum := vector2{X := 0.4, Y := 0.26}, Maximum := vector2{X := 0.4, Y := 0.31}}
                canvas_slot:
                    Widget := TitleText
                    Anchors := anchors{Minimum := vector2{X := 0.1, Y := 0.26}, Maximum := vector2{X := 0.1, Y := 0.31}}
            
        return MyCanvas

    UpdateUpgradeInterfaceText(Agent:agent): void=
        if (AgentStats := PlayerMap[Agent]):
            CP := AgentStats.GetCurrentPage()
            UpgradeButton1.SetText(ConvertToMessage("Cost: {ShortenLargeNumber(AgentStats.GetUpgradeCost(CP+1))}"))
            UpgradeButton2.SetText(ConvertToMessage("Cost: {ShortenLargeNumber(AgentStats.GetUpgradeCost(CP+2))}"))
            UpgradeButton3.SetText(ConvertToMessage("Cost: {ShortenLargeNumber(AgentStats.GetUpgradeCost(CP+3))}"))
            UpgradeButton4.SetText(ConvertToMessage("Cost: {ShortenLargeNumber(AgentStats.GetUpgradeCost(CP+4))}"))
            UpgradeButton5.SetText(ConvertToMessage("Cost: {ShortenLargeNumber(AgentStats.GetUpgradeCost(CP+5))}"))
            ExitUI.SetText(ConvertToMessage("Exit"))
        
            ForceRow1Text.SetText(ConvertToMessage("Force {CP+1}"))
            ForceRow2Text.SetText(ConvertToMessage("Force {CP+2}"))
            ForceRow3Text.SetText(ConvertToMessage("Force {CP+3}"))
            ForceRow4Text.SetText(ConvertToMessage("Force {CP+4}"))
            ForceRow5Text.SetText(ConvertToMessage("Force {CP+5}"))
        
            ForceValueRow1Text.SetText(ConvertToMessage(("{DivideLevel(AgentStats.GetUpgradeCost(CP+1),CP+1)}")))
            ForceValueRow2Text.SetText(ConvertToMessage(("{DivideLevel(AgentStats.GetUpgradeCost(CP+2),CP+2)}")))
            ForceValueRow3Text.SetText(ConvertToMessage(("{DivideLevel(AgentStats.GetUpgradeCost(CP+3),CP+3)}")))
            ForceValueRow4Text.SetText(ConvertToMessage(("{DivideLevel(AgentStats.GetUpgradeCost(CP+4),CP+4)}")))
            ForceValueRow5Text.SetText(ConvertToMessage(("{DivideLevel(AgentStats.GetUpgradeCost(CP+5),CP+5)}")))
        
            PreviousPageButton.SetText(ConvertToMessage("◄"))
            NextPageButton.SetText(ConvertToMessage("►"))

            TitleText.SetText(ConvertToMessage("Title"))
            UpgradeText.SetText(ConvertToMessage("Upgrade"))
            LevelText.SetText(ConvertToMessage("Level"))

            PlayerForceText.SetText(ConvertToMessage("{ShortenLargeNumber(AgentStats.GetBrickIncrementRate())}"))
            UIBrickAmountText.SetText(ConvertToMessage("{ShortenLargeNumber(AgentStats.GetTotalBrick())}"))

    UpdateHUDBrickCounter(PlayerS:PlayerStats):void=
        Amount:=ConvertToMessage(ShortenLargeNumber(PlayerS.GetTotalBrick()))
        PlayerBrickAmount.SetText(Amount)

    RunHarvestedRock(Agent:agent): void=
        if (AgentStats := PlayerMap[Agent]):
            Print("+{AgentStats.GetBrickIncrementRate()}")
                  
    DropBoarderOne(Agent:agent): void=
        if (AgentStats := PlayerMap[Agent]):
            Amount := AgentStats.GetTotalBrick()
            if(Amount>=1000):
                AgentStats.UpgradeBrought(1000)
                BoarderToRoomOne.AddToIgnoreList(Agent)
                UpdateHUDBrickCounter(AgentStats)
                CheckIfBoarderDropped(Agent,1)

    DropBoarderTwo(Agent:agent): void=
        if (AgentStats := PlayerMap[Agent]):
            Amount := AgentStats.GetTotalBrick()
            if(Amount>=500000):
                AgentStats.UpgradeBrought(500000)
                BoarderToRoomTwo.AddToIgnoreList(Agent)
                UpdateHUDBrickCounter(AgentStats)
                CheckIfBoarderDropped(Agent,2)

    DropBoarderThree(Agent:agent): void=
        if (AgentStats := PlayerMap[Agent]):
            Amount := AgentStats.GetTotalBrick()
            if(Amount>=1000000000):
                AgentStats.UpgradeBrought(1000000000)
                BoarderToRoomThree.AddToIgnoreList(Agent)
                UpdateHUDBrickCounter(AgentStats)
                CheckIfBoarderDropped(Agent,3)

    DropBoarderOneReturn(Agent:agent): void=
        BoarderToRoomOne.AddToIgnoreList(Agent)

    DropBoarderTwoReturn(Agent:agent): void=
        BoarderToRoomTwo.AddToIgnoreList(Agent)

    DropBoarderThreeReturn(Agent:agent): void=
        BoarderToRoomThree.AddToIgnoreList(Agent)

    CheckFirstHit(Agent:agent):void=
        if (AgentStats := PlayerMap[Agent]):
            if(AgentStats.AccolaceFirstHit=true):
            else:
                AccolaceFirstHit.Award(Agent)
                AgentStats.SetAccolaceFirstHit()

    CheckIfRockFistTime(Agent:agent,RockLevel:int):void=
        if (AgentStats := PlayerMap[Agent]):
            if(RockLevel=1):
                if(AgentStats.AccolaceLevelOneRockBroken=true):
                else:
                    AccolaceLevelOneRockBroken.Award(Agent)
                    AgentStats.SetAccolaceLevelOneRockBroken()
            if(RockLevel=2):
                if(AgentStats.AccolaceLevelTwoRockBroken=true):
                else:
                    AccolaceLevelTwoRockBroken.Award(Agent)
                    AgentStats.SetAccolaceLevelTwoRockBroken()
            if(RockLevel=3):
                if(AgentStats.AccolaceLevelThreeRockBroken=true):
                else:
                    AccolaceLevelThreeRockBroken.Award(Agent)
                    AgentStats.SetAccolaceLevelThreeRockBroken()

    CheckIfBoarderDropped(Agent:agent,index:int):void=
        if (AgentStats := PlayerMap[Agent]):
            if(index=1):
                if(AgentStats.AccolaceBarrierOneUnlocked=true):
                else:
                    AccolaceBarrierOneUnlocked.Award(Agent)
                    AgentStats.SetAccolaceBarrierOneUnlocked()
            if(index=2):
                if(AgentStats.AccolaceBarrierTwoUnlocked=true):
                else:
                    AccolaceBarrierTwoUnlocked.Award(Agent)
                    AgentStats.SetAccolaceBarrierTwoUnlocked()
            if(index=3):
                if(AgentStats.AccolaceBarrierThreeUnlocked=true):
                else:
                    AccolaceBarrierThreeUnlocked.Award(Agent)
                    AgentStats.SetAccolaceBarrierThreeUnlocked()

    HandleRockLevelZeroTriggered(RockNumber: int, Agent: agent,TriggeringDevice:prop_manipulator_device): void =
        CheckFirstHit(Agent)
        FindRockInRockIdentifier(RockNumber,0)
        if (PlayerObj := player[Agent]):
            if (AgentStats := PlayerMap[PlayerObj]):
                AgentStats.ResourseFarmed(Agent)
                UpdateHUDBrickCounter(AgentStats)
                RockName:="RockNumber{RockNumber}"
                if (RockIdentity := RockIdentifierMap[RockName]):
                    spawn:
                        RockIdentity.RockFarmed(Agent,PlayerMap,TriggeringDevice)
    # Function to handle rock trigger events
    HandleRockLevelOneTriggered(RockNumber: int, Agent: agent,TriggeringDevice:prop_manipulator_device): void =
        CheckFirstHit(Agent)
        FindRockInRockIdentifier(RockNumber,1)
        if (PlayerObj := player[Agent]):
            if (AgentStats := PlayerMap[PlayerObj]):
                AgentStats.ResourseFarmed(Agent)
                UpdateHUDBrickCounter(AgentStats)
                RockName:="RockNumber{RockNumber}"
                if (RockIdentity := RockIdentifierMap[RockName]):
                    spawn:
                        RockIdentity.RockFarmed(Agent,PlayerMap,TriggeringDevice)
                    UpdateRockHealthBar(Agent,RockName)
                            
    
    HandleRockLevelTwoTriggered(RockNumber: int, Agent: agent,TriggeringDevice:prop_manipulator_device): void =
        CheckFirstHit(Agent)
        FindRockInRockIdentifier(RockNumber,2)
        if (PlayerObj := player[Agent]):
            if (AgentStats := PlayerMap[PlayerObj]):
                AgentStats.ResourseFarmed(Agent)
                UpdateHUDBrickCounter(AgentStats)
                RockName:="RockNumber{RockNumber}"
                if (RockIdentity := RockIdentifierMap[RockName]):
                    spawn:
                        RockIdentity.RockFarmed(Agent,PlayerMap,TriggeringDevice)
                    UpdateRockHealthBar(Agent,RockName)

    HandleRockLevelThreeTriggered(RockNumber: int, Agent: agent,TriggeringDevice:prop_manipulator_device): void =
        CheckFirstHit(Agent)
        FindRockInRockIdentifier(RockNumber,3)
        if (PlayerObj := player[Agent]):
            if (AgentStats := PlayerMap[PlayerObj]):
                AgentStats.ResourseFarmed(Agent)
                UpdateHUDBrickCounter(AgentStats)
                RockName:="RockNumber{RockNumber}"
                if (RockIdentity := RockIdentifierMap[RockName]):
                    spawn:
                        RockIdentity.RockFarmed(Agent,PlayerMap,TriggeringDevice)
                    UpdateRockHealthBar(Agent,RockName)

    # Function to find rock in rock identifier
    FindRockInRockIdentifier(RockNumber: int,RockLevel:int):void=
        RockName := "RockNumber{RockNumber}"
        for (Key->Value : RockIdentifierMap):
            if(Key = RockName):
                return

        # Rock identifier not found
        if (set RockIdentifierMap[RockName] = RockIdentifier{}):
            if (RockIdentity := RockIdentifierMap[RockName]):
                RockIdentity.SetRockLevel(RockLevel)
                CurrentRockLevel:=RockIdentity.GetRockLevel()
                if(IdentityOfLevel:=RockMap[CurrentRockLevel]):
                    Health := IdentityOfLevel.GetRockHealth()
                    RockIdentity.SetMaxRockHealth(Health)

    SetUpRockLevels(): void=
        if(set RockMap[0] = RockCategory{}):
            if(RockType := RockMap[0]):
                RockType.SetRockHealth(1000000000000000000)
                RockType.SetRockLevel(1)
        if(set RockMap[1] = RockCategory{}):
            if(RockType := RockMap[1]):
                RockType.SetRockHealth(5000)
                RockType.SetRockLevel(1)
        if(set RockMap[2] = RockCategory{}):
            if(RockType := RockMap[2]):
                RockType.SetRockHealth(1000000)
                RockType.SetRockLevel(2)
        if(set RockMap[3] = RockCategory{}):
            if(RockType := RockMap[3]):
                RockType.SetRockHealth(1000000000)
                RockType.SetRockLevel(3)

    AssignUpgradeHUD(Agent:agent):void=
        UpdateUpgradeInterfaceText(Agent)
        ShowPlayerUpgradeUI(Agent)
    
    FowardPageButtonPressed(Agent:agent):void=
        if(AgentStats := PlayerMap[Agent]):
            var Page:int=AgentStats.GetCurrentPage()
            if(Page<5):
                set Page = Page+5
            else:
                set Page = 0
            AgentStats.SetCurrentPage(Page)
        UpdateUpgradeInterfaceText(Agent)

    BackwardPageButtonPressed(Agent:agent):void=
        if(AgentStats := PlayerMap[Agent]):
            var Page:int=AgentStats.GetCurrentPage()
            if(Page>=5):
                set Page = Page-5
            else:
                set Page = 5
            AgentStats.SetCurrentPage(Page)
        UpdateUpgradeInterfaceText(Agent)

    DivideLevel(Number:int,Level:int): int=
        if(Level=1):
            if(Final := Ceil((Number-15)/2)):
                return Final
            else:
                return 1
        if(Level=2):
            if(Final := Ceil((Number-100)/14)):
                return Final
            else:
                return 1
        if(Level=3):
            if(Final := Ceil((Number-1200)/180)):
                return Final
            else:
                return 1
        if(Level=4):
            if(Final := Ceil((Number-12000)/2400)):
                return Final
            else:
                return 1
        if(Level=5):
            if(Final := Ceil((Number-120000)/18000)):
                return Final
            else:
                return 1
        if(Level=6):
            if(Final := Ceil((Number-1500000)/170000)):
                return Final
            else:
                return 1
        if(Level=7):
            if(Final := Ceil((Number-21000000)/1700000)):
                return Final
            else:
                return 1
        if(Level=8):
            if(Final := Ceil((Number-300000000)/17000000)):
                return Final
            else:
                return 1
        if(Level=9):
            if(Final := Ceil((Number-4100000000)/17000000)):
                return Final
            else:
                return 1
        if(Level=10):
            if(Final := Ceil((Number-54000000000)/17000000)):
                return Final
            else:
                return 1
        else:
            return 1

    
    RunUpgradeButtonsSelect(Agent:agent, index: int,Message:widget_message): void=
        if(index=-1):
            HidePlayerUpgradeUI(Agent)
        else:
            if(AgentStats := PlayerMap[Agent]):
                CP := AgentStats.GetCurrentPage()
                if(index+CP=0):
                    RunUpgradeButtonLevel1(Agent)
                if(index+CP=1):
                    RunUpgradeButtonLevel2(Agent)
                if(index+CP=2):
                    RunUpgradeButtonLevel3(Agent)
                if(index+CP=3):
                    RunUpgradeButtonLevel4(Agent)
                if(index+CP=4):
                    RunUpgradeButtonLevel5(Agent)
                if(index+CP=5):
                    RunUpgradeButtonLevel6(Agent)
                if(index+CP=6):
                    RunUpgradeButtonLevel7(Agent)
                if(index+CP=7):
                    RunUpgradeButtonLevel8(Agent)
                if(index+CP=8):
                    RunUpgradeButtonLevel9(Agent)
                if(index+CP=9):
                    RunUpgradeButtonLevel10(Agent)
                Amount:="{ShortenLargeNumber(AgentStats.GetTotalBrick())}"
                PlayerBrickAmount.SetText(ConvertToMessage(Amount))
                UpdateUpgradeInterfaceText(Agent)
    
    RunUpgradeButtonLevel1(Agent:agent):void=
        if (AgentStats := PlayerMap[Agent]):
            TotalAgentBrick := AgentStats.GetTotalBrick()
            CostForAgent := AgentStats.GetUpgradeCost(1)
            if(TotalAgentBrick >= CostForAgent):
                AgentStats.UpgradeBrought(AgentStats.LevelOneUpgradeCost)
                AgentStats.IncreaseIncrementRate(1)
                AgentStats.IncrementUpgradeCost(1)
                Print("3")

    RunUpgradeButtonLevel2(Agent:agent):void=
        if (AgentStats := PlayerMap[Agent]):
            TotalAgentBrick := AgentStats.GetTotalBrick()
            CostForAgent := AgentStats.GetUpgradeCost(2)
            if(TotalAgentBrick >= CostForAgent):
                AgentStats.UpgradeBrought(AgentStats.LevelTwoUpgradeCost)
                AgentStats.IncreaseIncrementRate(10)
                AgentStats.IncrementUpgradeCost(2)

    RunUpgradeButtonLevel3(Agent:agent):void=
        if (AgentStats := PlayerMap[Agent]):
            TotalAgentBrick := AgentStats.GetTotalBrick()
            CostForAgent := AgentStats.GetUpgradeCost(3)
            if(TotalAgentBrick >= CostForAgent):
                AgentStats.UpgradeBrought(AgentStats.LevelThreeUpgradeCost)
                AgentStats.IncreaseIncrementRate(80)
                AgentStats.IncrementUpgradeCost(3)

    RunUpgradeButtonLevel4(Agent:agent):void=
        if (AgentStats := PlayerMap[Agent]):
            TotalAgentBrick := AgentStats.GetTotalBrick()
            CostForAgent := AgentStats.GetUpgradeCost(4)
            if(TotalAgentBrick >= CostForAgent):
                AgentStats.UpgradeBrought(AgentStats.LevelFourUpgradeCost)
                AgentStats.IncreaseIncrementRate(500)
                AgentStats.IncrementUpgradeCost(4)

    RunUpgradeButtonLevel5(Agent:agent):void=
        if (AgentStats := PlayerMap[Agent]):
            TotalAgentBrick := AgentStats.GetTotalBrick()
            CostForAgent := AgentStats.GetUpgradeCost(5)
            if(TotalAgentBrick >= CostForAgent):
                AgentStats.UpgradeBrought(AgentStats.LevelFiveUpgradeCost)
                AgentStats.IncreaseIncrementRate(2500)
                AgentStats.IncrementUpgradeCost(5)

    RunUpgradeButtonLevel6(Agent:agent):void=
        if (AgentStats := PlayerMap[Agent]):
            TotalAgentBrick := AgentStats.GetTotalBrick()
            CostForAgent := AgentStats.GetUpgradeCost(6)
            if(TotalAgentBrick >= CostForAgent):
                AgentStats.UpgradeBrought(AgentStats.LevelSixUpgradeCost)
                AgentStats.IncreaseIncrementRate(15000)
                AgentStats.IncrementUpgradeCost(6)

    RunUpgradeButtonLevel7(Agent:agent):void=
        if (AgentStats := PlayerMap[Agent]):
            TotalAgentBrick := AgentStats.GetTotalBrick()
            CostForAgent := AgentStats.GetUpgradeCost(7)
            if(TotalAgentBrick >= CostForAgent):
                AgentStats.UpgradeBrought(AgentStats.LevelSevenUpgradeCost)
                AgentStats.IncreaseIncrementRate(80000)
                AgentStats.IncrementUpgradeCost(7)

    RunUpgradeButtonLevel8(Agent:agent):void=
        if (AgentStats := PlayerMap[Agent]):
            TotalAgentBrick := AgentStats.GetTotalBrick()
            CostForAgent := AgentStats.GetUpgradeCost(8)
            if(TotalAgentBrick >= CostForAgent):
                AgentStats.UpgradeBrought(AgentStats.LevelEightUpgradeCost)
                AgentStats.IncreaseIncrementRate(450000)
                AgentStats.IncrementUpgradeCost(8)

    RunUpgradeButtonLevel9(Agent:agent):void=
        if (AgentStats := PlayerMap[Agent]):
            TotalAgentBrick := AgentStats.GetTotalBrick()
            CostForAgent := AgentStats.GetUpgradeCost(9)
            if(TotalAgentBrick >= CostForAgent):
                AgentStats.UpgradeBrought(AgentStats.LevelNineUpgradeCost)
                AgentStats.IncreaseIncrementRate(4100000)
                AgentStats.IncrementUpgradeCost(9)

    RunUpgradeButtonLevel10(Agent:agent):void=
        if (AgentStats := PlayerMap[Agent]):
            TotalAgentBrick := AgentStats.GetTotalBrick()
            CostForAgent := AgentStats.GetUpgradeCost(10)
            if(TotalAgentBrick >= CostForAgent):
                AgentStats.UpgradeBrought(AgentStats.LevelTenUpgradeCost)
                AgentStats.IncreaseIncrementRate(32000000)
                AgentStats.IncrementUpgradeCost(10)

ShortenLargeNumber(Number:int):string=
    VAR := ToString(Number)
    if(3<VAR.Length):
        if(4<VAR.Length):
            if(5<VAR.Length):
                if(6<VAR.Length):
                    if(7<VAR.Length):
                        if(8<VAR.Length):
                            if(9<VAR.Length):
                                if(10<VAR.Length):
                                    if(11<VAR.Length):
                                        if(12<VAR.Length):
                                            if(13<VAR.Length):
                                                if(14<VAR.Length):
                                                    if(15<VAR.Length):
                                                        if(16<VAR.Length):
                                                            if(17<VAR.Length):
                                                                if(Num1:=VAR[0]):
                                                                    if(Num2:=VAR[1]):
                                                                        if(Num3:=VAR[2]):
                                                                            if(Num4:=VAR[3]):
                                                                                return "{Num1,Num2,Num3}.{Num4}Q"
                                                            if(Num1:=VAR[0]):
                                                                if(Num2:=VAR[1]):
                                                                    if(Num3:=VAR[2]):
                                                                        if(Num4:=VAR[3]):
                                                                            return "{Num1,Num2}.{Num3,Num4}Q"
                                                        if(Num1:=VAR[0]):
                                                            if(Num2:=VAR[1]):
                                                                if(Num3:=VAR[2]):
                                                                    if(Num4:=VAR[3]):
                                                                        return "{Num1}.{Num2,Num3}Q"
                                                    if(Num1:=VAR[0]):
                                                        if(Num2:=VAR[1]):
                                                            if(Num3:=VAR[2]):
                                                                if(Num4:=VAR[3]):
                                                                    return "{Num1,Num2,Num3}.{Num4}T"
                                                if(Num1:=VAR[0]):
                                                    if(Num2:=VAR[1]):
                                                        if(Num3:=VAR[2]):
                                                            if(Num4:=VAR[3]):
                                                                return "{Num1,Num2}.{Num3,Num4}T"
                                            if(Num1:=VAR[0]):
                                                if(Num2:=VAR[1]):
                                                    if(Num3:=VAR[2]):
                                                        if(Num4:=VAR[3]):
                                                            return "{Num1}.{Num2,Num3}T" 
                                        if(Num1:=VAR[0]):
                                            if(Num2:=VAR[1]):
                                                if(Num3:=VAR[2]):
                                                    if(Num4:=VAR[3]):
                                                        return "{Num1,Num2,Num3}.{Num4}B"
                                    if(Num1:=VAR[0]):
                                        if(Num2:=VAR[1]):
                                            if(Num3:=VAR[2]):
                                                if(Num4:=VAR[3]):
                                                    return "{Num1,Num2}.{Num3,Num4}B"  
                                if(Num1:=VAR[0]):
                                    if(Num2:=VAR[1]):
                                        if(Num3:=VAR[2]):
                                            if(Num4:=VAR[3]):
                                                return "{Num1}.{Num2,Num3}B" 
                            if(Num1:=VAR[0]):
                                if(Num2:=VAR[1]):
                                    if(Num3:=VAR[2]):
                                        if(Num4:=VAR[3]):
                                            return "{Num1,Num2,Num3}.{Num4}M"
                        if(Num1:=VAR[0]):
                            if(Num2:=VAR[1]):
                                if(Num3:=VAR[2]):
                                    if(Num4:=VAR[3]):
                                        return "{Num1,Num2}.{Num3,Num4}M" 
                    if(Num1:=VAR[0]):
                        if(Num2:=VAR[1]):
                            if(Num3:=VAR[2]):
                                if(Num4:=VAR[3]):
                                    return "{Num1}.{Num2,Num3}M" 
                if(Num1:=VAR[0]):
                    if(Num2:=VAR[1]):
                        if(Num3:=VAR[2]):
                            if(Num4:=VAR[3]):
                                return "{Num1,Num2,Num3}.{Num4}K" 
            if(Num1:=VAR[0]):
                if(Num2:=VAR[1]):
                    if(Num3:=VAR[2]):
                        if(Num4:=VAR[3]):
                            return "{Num1,Num2}.{Num3,Num4}K" 
        if(Num1:=VAR[0]):
            if(Num2:=VAR[1]):
                if(Num3:=VAR[2]):
                    if(Num4:=VAR[3]):
                        return "{Num1}.{Num2,Num3}K"               
    return "{VAR}"