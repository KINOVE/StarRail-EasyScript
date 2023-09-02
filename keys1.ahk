#Include SRES.ahk
#HotIf StarRail.is_game_active() && (Scenes.IsTeamScene())
^A::Team.LastTeam()
^D::Team.NextTeam()
^Space::Team.Confirm()