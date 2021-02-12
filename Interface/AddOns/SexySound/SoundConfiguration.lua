local Region = GetLocale()
local MediaPath = [[Interface\AddOns\SexySound\Sound\]]
if Region == "zhTW" or Region == "zhCN" then
    MediaPath = MediaPath..[[Chinese\]]
else 
    MediaPath = MediaPath..[[English\]]
end
SpellMap = {
    [1] = {
        ["SpellID"] = 31884,  -- 復仇之怒
        ["AlertSound"] = MediaPath.."Avenging Wrath.mp3",
        ["Enable"] = true,
        ["Animation"] = {
            ["Path"] = "SPELLS\\Frostmourne_shatters.m2",
            ["Seq"] = 0,
            ["Time"] = .9,
            ["Position"] = {0,1,-40},
            ["Camera"] = 0,
            ["Scale"] = .25,
            ["Facing"] = 0
        }
    },
    [2] = {
        ["SpellID"] = 85696,  -- 狂熱精神
        ["AlertSound"] = MediaPath.."Zealotry.mp3",
        ["Enable"] = true,
        ["Animation"] = {
            ["Path"] = "SPELLS\\Intervenetrail.m2",
            ["Seq"] = 0,
            ["Time"] = 2.5,
            ["Position"] = {0.55,-0.4,20},
            ["Camera"] = 0,
            ["Scale"] = 3,
            ["Facing"] = math.pi *3 / 2
        }
    },
    [3] = {
        ["SpellID"] = 35395,  -- 十字軍打擊
        ["AlertSound"] = MediaPath.."Crusader Strike.mp3",
        ["Enable"] = false,
    },
    [4] = {
        ["SpellID"] = 853,  -- 制裁
        ["AlertSound"] = MediaPath.."Hammer of Justice.mp3",
        ["Enable"] = true,
    },
    [5] = {
        ["SpellID"] = 633,  -- 聖療
        ["AlertSound"] = MediaPath.."Lay on Hands.mp3",
        ["Enable"] = true,
    },
    [6] = {
        ["SpellID"] = 1022,  -- 保護
        ["AlertSound"] = MediaPath.."Hand of Protection.mp3",
        ["Enable"] = true,
    },
    [7] = {
        ["SpellID"] = 498,  -- 聖佑
        ["AlertSound"] = MediaPath.."Divine Protection.mp3",
        ["Enable"] = true,
    },
    [8] = {
        ["SpellID"] = 642,  -- 無敵
        ["AlertSound"] = MediaPath.."Divine Shield.mp3",
        ["Enable"] = true,
        ["Animation"] = {
            ["Path"] = "SPELLS\\Wrongfully_accused_impact.m2",
            ["Seq"] = 0,
            ["Time"] = 2.5,
            ["Position"] = {0.55,-.2,-100},
            ["Camera"] = 1,
            ["Scale"] = 0.25,
            ["Facing"] = 0
        }
    },
    [9] = {
        ["SpellID"] = 24275,  -- 飛錘斬殺
        ["AlertSound"] = MediaPath.."Hammer of Wrath.mp3",
        ["Enable"] = true,
    },
    [10] = {
        ["SpellID"] = 96231,  -- 責難
        ["AlertSound"] = MediaPath.."Rebuke.mp3",
        ["Enable"] = true,
    },
    [11] = {
        ["SpellID"] = 1044,  -- 自由
        ["AlertSound"] = MediaPath.."Hand of Freedom.mp3",
        ["Enable"] = true,
    },
    [12] = {
        ["SpellID"] = 86150,  -- 小金人 / 遠古守衛者
        ["AlertSound"] = MediaPath.."Guardian of Ancient Kings.mp3",
        ["Enable"] = true,
    },
    [13] = {
        ["SpellID"] = 6940,  -- 犧牲
        ["AlertSound"] = MediaPath.."Hand of Sacrifice.mp3",
        ["Enable"] = true,
    },
    [14] = {
        ["SpellID"] = 20066,  -- 懺悔
        ["AlertSound"] = MediaPath.."Repentance.mp3",
        ["Enable"] = true,
    },
    [15] = {
        ["SpellID"] = 20271,  -- Judgement of light
        ["AlertSound"] = MediaPath.."Judgement.mp3",
        ["Enable"] = false,
    },
    [16] = {
        ["SpellID"] = 53408,  -- Judgement of wisdom
        ["AlertSound"] = MediaPath.."Judgement.mp3",
        ["Enable"] = false,
    },
    [17] = {
        ["SpellID"] = 28730,  -- 奧洪
        ["AlertSound"] = MediaPath.."Arcane Torrent.mp3",
        ["Enable"] = true,
    },
    [18] = {
        ["SpellID"] = 85673,  -- 荣耀圣言
        ["AlertSound"] = MediaPath.."Word of Glory.mp3",
        ["Enable"] = true,
    },
    [19] = {
        ["SpellID"] = 53385,  -- Divine storm
        ["AlertSound"] = MediaPath.."Rebuke.mp3",
        ["Enable"] = true,
    },
}