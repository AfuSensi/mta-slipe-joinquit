-- Generated by CSharp.lua Compiler
local System = System
System.namespace("Slipe.Client.GameWorld", function (namespace)
  namespace.enum("SurfaceMaterialProperty", function ()
    return {
      Glass = 0,
      Stairs = 1,
      StepWaterSplash = 2,
      SoftLanding = 3,
      SteepSlope = 4,
      FootEffect = 5,
      SeeThrough = 6,
      ShootThrough = 7,
      Audio = 8,
      BulletEffect = 9,
      TyreGrip = 10,
      WetGrip = 11,
      CanClimb = 12,
      AdhesionGroup = 13,
      Roughness = 14,
      FractionEffect = 15,
      WheelEffect = 16,
      SkidmarkType = 17
    }
  end)

  -- <summary>
  -- Represents the type of a surface in GTA:SA
  -- </summary>
  namespace.enum("SurfaceMaterialType", function ()
    return {
      Default = 0,
      Tarmac = 1,
      FuckedTarmac = 2,
      ReallyFuckedTarmac = 3,
      Pavement = 4,
      FuckedPavement = 5,
      Gravel = 6,
      FuckedConcrete = 7,
      PaintedGround = 8,
      ShortLushGrass = 9,
      MediumLushGrass = 10,
      LongLushGrass = 11,
      ShortDryGrass = 12,
      MediumDryGrass = 13,
      LongDryGrass = 14,
      RoughGolfGrass = 15,
      SmoothGolfGrass = 16,
      SteepSlidyGrass = 17,
      SteepCliff = 18,
      Flowerbed = 19,
      Meadow = 20,
      WasteGround = 21,
      WoodlandGround = 22,
      Vegetation = 23,
      WetMud = 24,
      DryMud = 25,
      Dirt = 26,
      DirtTrack = 27,
      DeepSand = 28,
      MediumSand = 29,
      CompactSand = 30,
      AridSand = 31,
      MoreSand = 32,
      BeachSand = 33,
      BeachConcrete = 34,
      DryRock = 35,
      WetRock = 36,
      CliffRock = 37,
      RiverbedWater = 38,
      ShallowWater = 39,
      CornField = 40,
      Hedge = 41,
      WoodCrates = 42,
      SolidWood = 43,
      ThinWood = 44,
      Glass = 45,
      LargeGlassWindows = 46,
      LargeSmallWindows = 47,
      Empty1 = 48,
      Empty2 = 49,
      GarageDoor = 50,
      ThickMetalPlate = 51,
      ScaffoldPole = 52,
      LampPost = 53,
      MetalGate = 54,
      MetalChainFence = 55,
      Girder = 56,
      FireHydrant = 57,
      Container = 58,
      NewsVendor = 59,
      Wheelbase = 60,
      CardboardBox = 61,
      Ped = 62,
      Car = 63,
      CarPanel = 64,
      MovingCarPanel = 65,
      TransparentCloth = 66,
      Rubber = 67,
      Plastic = 68,
      TransparentStone = 69,
      WoodBench = 70,
      Carpet = 71,
      Floorboard = 72,
      WoodStairs = 73,
      Sand = 74,
      DenseSand = 75,
      AridSand2 = 76,
      CompactSand2 = 77,
      RockySand = 78,
      BeachSand2 = 79,
      ShortGrass = 80,
      MeadowGrass = 81,
      DryGrass = 82,
      Woodland = 83,
      WoodDense = 84,
      Roadside = 85,
      RoadsideDes = 86,
      Flowerbed2 = 87,
      WasteGround2 = 88,
      Concrete = 89,
      OfficeDesk = 90,
      Shelf1 = 91,
      Shelf2 = 92,
      Shelf3 = 93,
      RestaurantTable = 94,
      BarTable = 95,
      UnderwaterLush = 96,
      UnderwaterBarren = 97,
      UnderwaterCoral = 98,
      UnderwaterDeep = 99,
      Riverbed = 100,
      Rubble = 101,
      BedroomFloor = 102,
      KitchenFloor = 103,
      LivingFloor = 104,
      CorridorFloor = 105,
      SupermarketFloor = 106,
      FastFoodFloor = 107,
      SkankyFloor = 108,
      Mountain = 109,
      Marsh = 110,
      Bushy = 111,
      BushyMix = 112,
      BushyDry = 113,
      BushyMid = 114,
      WeeFlowerGrass = 115,
      DryTallGrass = 116,
      LushTallGrass = 117,
      GreenMixGrass = 118,
      BrownMixGrass = 119,
      LowGrass = 120,
      RockyGrass = 121,
      SmallTreeGrass = 122,
      RockyDirt = 123,
      WeedDirt = 124,
      WeedGrass = 125,
      RiverEdge = 126,
      Poolside = 127,
      ForestStumps = 128,
      ForestSticks = 129,
      ForestLeaves = 130,
      DesertRocks = 131,
      ForestDry = 132,
      SparseFlowers = 133,
      BuildingSite = 134,
      Docklands = 135,
      Industrial = 136,
      IndustrialJetty = 137,
      ConcreteLitter = 138,
      AlleyRubbish = 139,
      JunkyardPiles = 140,
      JunkyardGround = 141,
      Dump = 142,
      CactusDense = 143,
      AirportGround = 144,
      Cornfield = 145,
      LightGrass = 146,
      LighterGrass = 147,
      LighterGrass2 = 148,
      MidGrass1 = 149,
      MidGrass2 = 150,
      DarkGrass1 = 151,
      DarkGrass2 = 152,
      DarkGrassMix = 153,
      StoneRiverbed = 154,
      ShallowRiverbed = 155,
      WeedRiverbed = 156,
      Seaweed = 157,
      Door = 158,
      PlasticBarrier = 159,
      ParkGrass = 160,
      StoneStairs = 161,
      MetalStairs = 162,
      CarpetStairs = 163,
      MetalFloor = 164,
      ConcreteFloor = 165,
      BinBag = 166,
      ThinMetalSheet = 167,
      MetalBarel = 168,
      PlasticCone = 169,
      PlasticDumpster = 170,
      MetalDumpster = 171,
      WoodPicketFence = 172,
      WoodSlattedFence = 173,
      WoodRanch = 174,
      UnbreakableGlass = 175,
      HayBale = 176,
      Gore = 177,
      RailTrack = 178
    }
  end)
end)
