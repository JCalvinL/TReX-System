-- TReX.config
-- System config

local send							= send
local cc							= TReX.config.cc or "##"
local g 							= "<dark_slate_gray:black>"
local b 							= "<blue:black>"
        
TReX.config.onpromptfuncs = {}

TReX.graphic = [[<white>

                  (O)
                   /|						
                   o<M      
                  /:M+=-------------------------------------,,,,,,
    (O)[]XXXXXXXXI{<white>+}::<===<{H}>==<>==<>==<>==<>==<>==<>==<>------------>
                  \:W+=-------------------------------------''''''
                   o<W
                   \|
                  (O)
       
]]

-- MENUS
TReX.menus = {
main = ""..
TReX.graphic..[[   
<white>			      TReX  

<light_slate_grey> 			     ]]..TReX.myVersion..[[

<dim_grey>          
		about			api
		help file 		setup
		prompt			bugs
		lust			precache		
		tree			settings
		mount list		prios				
		defup			inventory
		keepup			clan info
		defs			projects (todo)
		development
		
]].."",

-- HELP

misc = ""..   
TReX.graphic..[[
<white>			Misc 
            	
<white>	System Commands:<gray>

<gray>	Playlist <LightSlateGray>	[<gray>	on<LightSlateGray>	|<gray>	off<LightSlateGray>	]
<gray>	Daydream
  

]].."", 

-- SETUP
setup = ""..   
TReX.graphic..[[
<white>			Setup

<gray>	Step 1) <dim_grey>	Download Mudlet 3.7.1 or greater.
<gray>	Step 2) <dim_grey>	Create NEW profile. Enable GMCP. Enable FORCE COMPRESSION OFF.
<gray>	Step 3) <dim_grey>	Package TReX.mpackage or Zip file in the package manager.
<gray>	Step 4) <dim_grey>	Empty Pipes.
<gray>	Step 5) <dim_grey>	QQ and RESTART mudlet Mudlet 3.7.1 or greater.
<gray>	Step 6) <dim_grey>	DO, 'trex' into the mudlet cmd bar.
<gray>	Step 7) <dim_grey>	FIND the 'setup' alias on the TReX menu list
<gray>	Step 8) <dim_grey>	TYPE 'setup' into your mudlet command bar.                           
<gray>	Step 9) <dim_grey>	TYPE 'install'
<gray>	Step 10) <dim_grey>	Configure TReX system settings.
<gray>	Step 11) <dim_grey>	QQ and RESTART mudlet Mudlet 3.7.1 or greater.
<gray>  Step 12) <dim_grey> Ask around for an invite to the TReX clan ANYONE can invite.

<gray>	You Tube:
<white>	https://www.youtube.com/watch?v=Bwxqzt-qKFo&t=11s


	<gray>	- <dim_grey>	Toggle defences with DD
	<gray>	- <dim_grey>	Look through your aliases, 
	<gray>	- <dim_grey>	Play with the menus. 
 

]].."", 

-- ABOUT
about = ""..
TReX.graphic..[[
<white>			About
<dim_grey>

	What is TReX?  It is a very powerful healing system designed to be light
	and comfortable and making using serverside curing as comfortable and 
	seemless as possible. It uses gmcp to track afflictions and just about 
	everything gmcp can track up-to-date. 

<gray>	
	
	Here's a list of some of the features that comprise the system.
	
          <white>-<dim_grey>GMCP affliction tracking.
          <white>-<dim_grey>GMCP class change detection.
          <white>-<dim_grey>GMCP dragon form detection.
          <white>-<dim_grey>Interactive Prompt.
          <white>-<dim_grey>Mount Handling.
          <white>-<dim_grey>Event Handling.	

<gray>	For the up-to-date version, see: 
		
]].."",

-- DEVELOPMENT
development = ""..
TReX.graphic..[[
<white>			Development
<dim_grey>
	TReX was started in October 2015, by me (Nehmrah) with the help of some individuals
	without whose help the project wouldn't have been possible.  A big thanks
	to the following people/players! :
	 
<LightSlateGray>	Inspired By:<white>	Vadimuses, Carmain, Nemutaur
<LightSlateGray>	The Brains:<white>	Mindshell, Jhui, Seragorn
<LightSlateGray>	Developers:<white>	Nehmrah, Klendathu, Keneanung, Oblive
<LightSlateGray>	Testers:<white>	Lucianus, Driden, Invictus, Roagnak, Dajio, Drefan, Deladan,
		Aegoth, Daslin .. and others!

]].."\n\n",

-- API
api = ""..
TReX.graphic..[[
<white>			API

<white>*<dim_grey>IN DEVELOPMENT<white>*
	
<white>You can ask around for an invite to the TReX clan ANYONE can invite.
]].."", 

-- BUG
bug = ""..
TReX.graphic..[[
<white>			Bugs

<gray>	Step 1) <dim_grey>	Click the link below to create a new issue.
 
<gray>	Step 2) <dim_grey>	Check the Issue list for your bug to see if it has already been issued.

<gray>	Step 3) <dim_grey>	Use images if possible and give as much information as to what is causing the issue.

]].."",

-- PROJECTS
projects = ""..
TReX.graphic..[[
<white>			Projects

<gray>	Step 1) <dim_grey>	Click the link below to create a new project.
 
<gray>	Step 2) <dim_grey>	Check the Projects list on git for your desired project/update/idea/change 
		to see if it has already been listed as a to-do.
		
<gray>	Step 3) <dim_grey>	Try to be clear on what it is you would like added or changed, and provide any 
		available examples.

]].."",

-- HELP
help = ""..
TReX.graphic..[[
<white>			Help

<white>*<dim_grey>IN DEVELOPMENT<white>*
	
<white>You can ask around for an invite to the TReX clan ANYONE can invite.

<dim_grey>System Commands:<gray>
]].."",

-- CLAN
clan = ""..
TReX.graphic..[[
<white>			Clan

<white>*<dim_grey>IN DEVELOPMENT<white>*
	
<white>You can ask around for an invite to the TReX clan ANYONE can invite.
]].."",

}

registerAnonymousEventHandler("login load", "TReX.config.login_load")

TReX.logout=function()

	if table.contains({t.inv.inv}, "coins") then
	 send("put "..t.inv["coins"].id.." in "..t.inv["pack"].id, false)
	end

	TReX.defs.reset()
	t.serverside["settings"].sys_loaded = false
	send("config prompt all") -- set prompt back to normal prompt
	send("curing defences off")
	expandAlias("dismount")
	huntToggle("off") -- hunting off
	expandAlias("hsave") -- hunting save
	send("inr all", false)
	setBorderBottom(0)
	TReX.config.saveSettings(true)
	TReX.serverside.container:hide()

end

TReX.config.login_load=function(event)



	TReX.config.loadSettings() 
	
	
		
		
		if t.serverside["settings"].installed then

			t.def={}
			t.defs={}
			
			--settings
			TReX.serverside.login_settings() 
			TReX.prios.default_settings()
			TReX.prios.reset() 
			TReX.defs.login()  
			TReX.class.reset()   
			TReX.class.skill_check()
			TReX.prios.login_reset()    
			TReX.pipes.settings()   
		 
			--prompt
			send("config prompt custom PROMPTCAPTURE")  
			send("curing status", false) 
			deletep = false
			t.send("citizens")
			TReX.tgt.set("", "none")
			
			
			--serverside config
			if not TReX.config.cc then 
				t.send("config",false)  
			end

				TReX.config.saveSettings()
 
				tempTimer(1, [[t.serverside["settings"].sys_loaded = true]])   
				tempTimer(30, [[TReX.inv.set_id_table()]])
				playSoundFile(getMudletHomeDir().. [[/TReX/TReX.mp3]])  
			
			
				if t.serverside.settings.affbar then
					setBorderBottom(27)
					setMiniConsoleFontSize("TReX.serverside.middle", 12)
					TReX.serverside.container:show()
					t.serverside.gmcpAffShow()
				else
					setBorderBottom(0)
					TReX.serverside.container:hide()
				end
				
				t.send("settarget none")
				t.send("target nothing")
			
		else
			t.serverside.green_echo("TReX not installed, or the file is corrupt; best to reinstall.", false)
		end

		
end

TReX.config.install=function()

	--install
	TReX.defs.list()
	TReX.class.skill_set()
	TReX.serverside.settings() 
	TReX.serverside.tree_by_class()	
	TReX.prios.default_settings()
	TReX.prios.reset()
	TReX.precache.settings() 
	TReX.stats.settings()
	TReX.pipes.settings()
	TReX.config.settings()
	TReX.config.score_sheet()
	--TReX.config.color_sheet()
	--TReX.config.saveDefences()
	--if gmcp.Char.Status.name == "Nehmrah" then TReX.config.allowtells() end
	send("config",false)
	send("empty pipes",false)
	t.serverside.prompt_capture = "config prompt all"
	send(t.serverside.prompt_capture)
	t.serverside["settings"].installed = true
	TReX.config.saveSettings()
	
	expandAlias("trex")

end


TReX.debugMessage=function(message, content)
	if not t.serverside["settings"].debugEnabled then return end
	cecho(string.format("\n<white>[%s]: %s", (debug.getinfo(2).name or "TReX"), message))
	if content then
		display(content)
	end -- if
end -- func

TReX.percentOfValue=function(percent, value)
	result = percent/100 * value
	return result
end

TReX.config.spairs=function(t, order)

    -- collect the keys
    local keys = {}
    for k in pairs(t) do keys[#keys+1] = k end

    -- if order function given, sort by it by passing the table and keys a, b,
    -- otherwise just sort the keys 
    if order then
        table.sort(keys, function(a,b) return order(t, a, b) end)
    else
        table.sort(keys)
    end

    -- return the iterator function
    local i = 0
    return function()
        i = i + 1
        if keys[i] then
            return keys[i], t[keys[i]]
        end
    end
end

TReX.color_rift_percentage=function(perc)  
--print(perc)
	if perc < 1 then
		return "<brown>"
	elseif perc <= 250 then
		return "<red>"
	elseif perc <= 500 then
		return "<dark_orange>"
	elseif perc <= 1500 then
		return "<yellow>"
	else
		return "<DarkKhaki>"
	end
end

TReX.config.deepcopy=function(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

TReX.config.onprompt=function()
	TReX.serverside.BlackoutDetection()
	if isPrompt() then
		--raiseEvent("TReX prompt")
	end
end


TReX.config.bloodleech=function()
	TReX.config.onprompt_beforeaction_add("deleteLine", function() end)
end

-- this is for blackout, havnt finished it.
TReX.config.setup_prompt=function()
  if line == "-" or line:find("^%-%d+%-$") or line == " Vote-" then
    --t.bals.bal = true
   -- t.bals.eq = true

   --for monks below
   -- t.bals.rightarm = true
   -- t.bals.leftarm = true
  else
    t.bals.bal = false
    t.bals.eq = false
  end
end

TReX.config.highlight=function(self, colour, background, specifics)
	if not specifics then
		if not background then
			selectString(line, 1)
			fg(colour)
			resetFormat()
		else
			selectString(line, 1)
			fg(colour)
			bg(background)
			resetFormat()
		end
	else
		if not background then
			selectString(specifics, 1)
			fg(colour)
			resetFormat()
		else
			selectString(specifics, 1)
			fg(colour)
			bg(background)
			resetFormat()
		end
	end
end

TReX.config.curingEcho=function(type, ailment)
	if t.serverside["settings"].echos then
		if type == "herb" then
			TReX.deleteLineP()	
			--cecho("\n<"..echoSettings.herbColour..">" ..ailment:title().. " Cured!-")
		elseif type == "salve" then
			TReX.deleteLineP()	
			cecho("\n<"..echoSettings.salveColour..">" ..ailment:title().. " Cured!-")
		elseif type == "restoration" then
			TReX.deleteLineP()	
			cecho("\n<"..echoSettings.restorationColour..">"..ailment:title().." Cured!-")
		elseif type == "focus" then
			TReX.deleteLineP()	
			cecho("\n<"..echoSettings.focusColour..">"..ailment:title().." Cured!-")
		elseif type == "smoke" then
			TReX.deleteLineP()	
			cecho("\n<"..echoSettings.smokeColour..">"..ailment:title().." Cured!-")
		elseif type == "passive" then
			TReX.deleteLineP()
			cecho("\n<"..echoSettings.passiveColour..">"..ailment:title().." Cured!-")
		end
	end
end

TReX.config.showMounts=function()

	echo("\n")
	cecho("\n\t<white>Mount List")
	echo("\n")
	for k,v in pairs(mount_list) do 
		if v.number == t.serverside["settings_default"].mount then
			--echo("\n - ") cecho("<light_blue>Current<white>: "..k..""..t.serverside["settings_default"].mount)
			echo("\n - ") cecho("<light_blue>Current<white>: "..t.serverside["settings_default"].mount)
		end
	end
	--echo("\n - ") echoLink("Current Mount: "..t.serverside["settings_default"].mount, "clearCmdLine() appendCmdLine'mount add '", "mount add <name> <id>")
	echo("\n - ") echoLink("Add Mount", "clearCmdLine() appendCmdLine'mount add '", "mount add <name> <id>")
	echo("\n - ") echoLink("Remove Mount", "clearCmdLine() appendCmdLine'mount remove '", "mount remove <name>")
	echo("\n")

local sortMount = {}

  for k,v in pairs(mount_list) do
		sortMount[#sortMount+1] = k
		table.sort(sortMount)
  end

	local x = 0
	 			 
		for i, n in ipairs(sortMount) do
				x = x + 1

		     	d = "<dim_grey>[<white>"


		 		if mount_list[n].enabled then
		 			d = d .. " <light_blue>+ "
		 		else
		 			d = d .. " <red>- "
		 		end


	     		d = d .. "<dim_grey>]<white> " 


				if (x-1)%3 == 0 then
					echo("\n")
				end  
		
		   	local nWithSpace = n:title()

				if nWithSpace:len() < 25 and (x-1) %3~=2 then
					local pad = 25 - nWithSpace:len()
					nWithSpace = nWithSpace .. string.rep(" ", pad)
				elseif nWithSpace:len() > 25 then
					nWithSpace = nWithSpace:cut(25)
		     	end
	 
			local command
				fg("white")
				cecho(d)
			
			local command = [[TReX.config.mount_list_toggle("]]..n..[[")]]
			echoLink(nWithSpace, command, "Toggle " .. n:title(), true)

		end
		
		echo"\n"
		deletep=false
			if not table.contains({prompt_sent}, "sent") then
				table.insert(prompt_sent, "sent")
			end
		TReX.stats.custom_prompt()

end

TReX.config.mount_list_toggle=function(variable)

if type(mount_list[variable].enabled) == "boolean" then
	if toggle ~= nil then
		mount_list[variable].enabled = verify(toggle)
	else
		mount_list[variable].enabled = not mount_list[variable].enabled
	end

		if mount_list[variable].enabled then -- if toggling to true
			mount_list[variable].enabled = true
			
			for k,v in pairs(mount_list) do
				if v.enabled then
					TReX.config.set_mount(v.number)						
						--v.number = t.serverside["settings_default"].mount
				end
			end		
	
		else

				t.send("curing mount 0")
				mount_list[variable].enabled = false
				t.serverside["settings_default"].mount = "No"
			
		end
	
		TReX.config.showMounts()
		echo"\n\n"
		deletep=false
			if not table.contains({prompt_sent}, "sent") then
				table.insert(prompt_sent, "sent")
			end
		TReX.stats.custom_prompt()
	end 
end

TReX.config.echo=function(what, command, popup) -- sorry this is an echo
t.serverside.cmd_prompt = getLineCount()
	what = "<yellow>[<white>†<yellow>]<reset><white> " .. what
	-- apply newline if required
	moveCursorEnd("main")
	--if string.sub(line, 1, 1) ~= "" then what = "\n"..what end
	if getCurrentLine() ~= "" then what = "\n"..what end
		if command then
			cechoLink(what, command, popup or "", true)
		else
			cecho(what)
		end
		
end -- func

TReX.config.display=function(what, command, popup) -- another echo
t.serverside.cmd_prompt = getLineCount()
	what = "<red>[<white>†<red>]<reset><white> "..what
	-- apply newline if required
	moveCursorEnd("main")
	--if string.sub(line, 1, 1) ~= "" then what = "\n"..what end
	if getCurrentLine() ~= "" then what = "\n"..what end
		if command then
			cechoLink(what, command, popup or "", true)
		else
			cecho(what)
		end

end

TReX.config.ppause=function(arg)
	if arg == "on" then
		send("curing off", false)
		send("curing defences off", false)
		t.serverside["settings"].paused = true
		t.serverside["settings_default"].defences = "No"
	else
		send("curing on", false)
		send("curing defences on", false)
		t.serverside["settings"].paused = false
		t.serverside["settings_default"].defences = "Yes"
	end			
end


TReX.config.pause=function () -- your hard tem pause
	if not t.serverside["settings"].paused then
		send("curing off", false)
		t.serverside["settings"].paused = true
		if t.serverside["settings_default"].defences == "Yes" then
			t.serverside["settings_default"].defences = "No"
			send("curing defences off", false)
		end
	else		
		send("curing on", false)
		t.serverside["settings"].paused = false
			if t.serverside["settings_default"].defences == "No" then
				t.serverside["settings_default"].defences = "Yes"
				send("curing defences on", false)
			end
			t.send("plist", false)
	end -- if
end -- func

TReX.config.settings=function() -- this is the settings file, what needs to happen here is it needs to be put into a one time hard vinstall type thing, right now it just runs everytime. I havent done it yet. This could be your file though, the config file.
		
	t.config.settings_default = {

		time_out 					= 30,	
		plants 						= "Yes",
		prompt 						= "all",
		map_show 					= "none",
		page_length 				= 250,
		screen_width 				= 0,
		use_queueing 				= "No",
		loyal_slain_msg 			= "Yes",
		show_self_in_who 			= "Yes",
		show_queue_alerts 			= "Yes",
		command_separator  			= "cmdsep",
		mxp							= "Yes",
			
	}
		
	t.config.settings_dict = {

		Yes							= "on",
		No 							= "off",
		cmdsep 						= "##",
		plants 						= "plants",
		prompt  					= "prompt",
		map_show 					= "mapshow",
		time_out 					= "timeout",
		roomdesc 					= "brief", -- testing
		page_length 				= "pagelength",
		screen_width 				= "screenwidth",
		use_queueing 				= "usequeueing",
		loyal_slain_msg 			= "loyalslainmsg",
		show_self_in_who			= "showselfinwho",
		show_queue_alerts 			= "showqueuealerts",
		command_separator  			= "commandseparator",

		
		
	}

	for k,v in pairs(t.config.settings_default) do
		if isPrompt() then deleteFull() end
  		t.send("config " ..(t.config.settings_dict[k] or k).. " " ..(t.config.settings_dict[v] or v), false)
	end
	
end

-- CONFIG 'SCORE' SHEET	
TReX.config.score_sheet=function()	
	t.config.score_sheet = {
		character 				= {enabled = true},
		about 					= {enabled = true},
		vitals 					= {enabled = true},
		statistics 				= {enabled = true},
		resources 				= {enabled = true},
	}
	for k,v in pairs(t.config.score_sheet) do
		if v.enabled then
			t.send("config scoreshow add " ..tostring(k), false)
		end
	end

end
	
-- CONFIG 'COLOUR' SETTINGS
TReX.config.color_sheet=function()		

	t.config.color_sheet = {

		--SPECIAL	
		H1						= {fg = 11, bg = 0, enabled = true},	
		H2						= {fg = 3,  bg = 0, enabled = true},	
		H3						= {fg = 2,  bg = 0, enabled = true},	
		H4						= {fg = 6,  bg = 0, enabled = true},
		deathsight				= {fg = 9,  bg = 0, enabled = true},
		balance 				= {fg = 6,  bg = 0, enabled = true},	
		affmessages				= {fg = 6,  bg = 0, enabled = true},
	
		--COMMUNICATION
		says					= {fg = 14, bg = 0, enabled = true},	
		shouts					= {fg = 6,  bg = 0, enabled = true},	
		tells					= {fg = 11, bg = 0, enabled = true},	
		HNT 					= {fg = 11, bg = 0, enabled = true},
		citytells				= {fg = 7,  bg = 0, enabled = true},
		ordertells 				= {fg = 7,  bg = 0, enabled = true},	
		newbie					= {fg = 10, bg = 0, enabled = true},
		emotes 					= {fg = 7,  bg = 0, enabled = true},
		arenatells 				= {fg = 7,  bg = 0, enabled = true},
		market 					= {fg = 7,  bg = 0, enabled = true},
		partytells 				= {fg = 7,  bg = 0, enabled = true},
		armytells 				= {fg = 7,  bg = 0, enabled = true},
		grouptells 				= {fg = 7,  bg = 0, enabled = true},
		riddletalk 				= {fg = 8,  bg = 0, enabled = true},
		shiprace 				= {fg = 8,  bg = 0, enabled = true},
		messages 				= {fg = 3,  bg = 0, enabled = true},
		mail_Messages 			= {fg = 7,  bg = 0, enabled = true},
		news_Messages 			= {fg = 7,  bg = 0, enabled = true},
		rage_Messages 			= {fg = 7,  bg = 0, enabled = true},
		--clantells 			= {fg = 7,  bg = 0, enabled = true},

		-- ROOM DESCRIPTION
		room_title 				= {fg = 10,  bg = 0, enabled = true},
		room_desc 				= {fg = 15,  bg = 0, enabled = true},
		things					= {fg = 6,  bg = 0, enabled = true},
		plant 					= {fg = 5,  bg = 0, enabled = true},
		players 				= {fg = 11, bg = 0, enabled = true},
		exits 					= {fg = 3,  bg = 0, enabled = true},

	}	
	
	for k,v in pairs(t.config.color_sheet) do
		if v.enabled then
			t.send("config colour " ..tostring(k).. " " ..v.fg.." "..v.bg)
		end
	end

end	

TReX.config.allowtells=function() 

 	TReX.config.allowtells = {
	
 	"Ysela",
 	"Seragorn",
 	"Emett",
 	"Laetetia",
 	"Herenicus",
	"Driden",
 	"Mindshell",
 	"Lucianus",
 	 --"" = , -- leaving empty for immediate in game need.
		
 	}
	
	t.send("allowtells remove all", false)
	t.send("config allowtells off", false)
	t.send("config tellsoffmsg I am currently away. Please send me a quick message.", false)

		for k,v in pairs(TReX.config.allowtells) do
			t.send("allowtells add " ..v)
		end	-- for
		
end


TReX.config.compass=function(flee_direction) -- this is nice thing I am working on.


if not t.serverside.flee_started then  
	t.serverside.flee_started = true
end
		
t.serverside.flee_direction = flee_direction 

	if (t.affs.brokenrightleg or t.affs.damagedrightleg or t.affs.mangledrightleg) 
	and not (t.affs.brokenleftleg or t.affs.damagedleftleg or t.affs.mangledleftleg) 
	and not t.affs.prone 
	then
		t.send(TReX.rewield(t.inv["cane"].id, "l"))
	end
	
	if (t.affs.brokenleftleg or t.affs.damagedleftleg or t.affs.mangledleftleg) 
	and not (t.affs.brokenrightleg or t.affs.damagedrightleg or t.affs.mangledrightleg) 
	and not t.affs.prone 
	then
		t.send(TReX.rewield(t.inv["cane"].id, "l"))
	end

--if already fleeing return
if t.serverside.flee_started then  -- if already tumbling check	--return 
	--if hitting a wall, door, etc.. reset
	if t.serverside.flee_direction == gmcp.Room.WrongDir then 
		t.serverside.flee_started = false
		if isPrompt() then t.serverside.myecho("!WRONG DIRECTION!") end
			return
	end
		
end
		--if sitting from manual sit, override and stand
	if t.serverside["settings"].override then 
		t.serverside["settings"].override = false
	end

		if TReX.s.class == "Bard" and not t.serverside.flying then
			t.serverside.movemethod = "cq all##queue prepend eqbal backflip"
		else
			t.serverside.movemethod = "cq all##queue prepend eqbal go"
		end	
	
	if not(TReX.serverside.inslowcuringmode()) and not t.affs.aeon and not t.affs.prone then
		send(t.serverside.movemethod.." "..t.serverside.flee_direction)
		enableTimer("flee started")
	else

		afftest = {"mangledleftleg", "brokenleftleg", "mangledleftarm", "brokenleftarm", "mangledrightleg", "brokenrightleg"
				  ,"mangledrightarm", "brokenrightarm", "bound", "impaled", "paralysis", "webbed", "roped", "disrupt", "stun"
				  ,"prone", "pacified", "peace", "Lovers", "entangled", "transfixation","retardation"
				  ,}
		
		for i = 1, #afftest, 1 do
			if t.affs[afftest[i]] then
				if TReX.s.class == "Bard" then
					t.serverside.movemethod = "cq all##somersault"
				else
					t.serverside.movemethod = "cq all##tumble"
				end
			end
		end
		
		send(t.serverside.movemethod.." "..t.serverside.flee_direction)
		
	end
		
		if (t.serverside["settings"].debugEnabled) then TReX.debugMessage("( TReX.compass )") end
end



TReX.config.evade=function(backflip_direction) -- this is nice thing I am working on.

t.bard.voicecraft.aria_watch = false

if TReX.s.class=="Serpent" and not t.serverside.backflip_started and not t.affs.dizziness then 
	t.serverside.backflip_started = true
end

t.serverside.backflip_direction = backflip_direction  

	if (t.affs.brokenrightleg or t.affs.damagedrightleg or t.affs.mangledrightleg) 
	and not (t.affs.brokenleftleg or t.affs.damagedleftleg or t.affs.mangledleftleg) 
	and not t.affs.prone 
	then
		TReX.rewield(t.inv["cane"].id, "l")
	end
	
	if (t.affs.brokenleftleg or t.affs.damagedleftleg or t.affs.mangledleftleg) 
	and not (t.affs.brokenrightleg or t.affs.damagedrightleg or t.affs.mangledrightleg) 
	and not t.affs.prone 
	then
		TReX.rewield(t.inv["cane"].id, "l")
	end

		--if sitting from manual sit, override and stand
		if TReX.serverside.am_free() and TReX.serverside.am_functional() then
			if t.serverside["settings"].override then
				t.send("curing queue add stand", false)
			end
		end

-- if already fleeing return
if t.serverside.backflip_started then  
	-- if hitting a wall, door, etc.. reset
	if t.serverside.backflip_direction == gmcp.Room.WrongDir  then 
		t.serverside.backflip_started = false
		if isPrompt() then t.serverside.myecho("!WRONG DIRECTION!") end
			return
	end
		
end
	
	if TReX.s.class=="Serpent" and t.serverside.evade_started and t.bals.bal and not t.affs.dizziness then
		enableTimer("backflip started")
		send("cq all##queue prepend eqbal evade "..t.serverside.backflip_direction) -- if not broken legs or no walls then just move direction
	else
		send("cq all##queue prepend eqbal go "..t.serverside.backflip_direction) -- if not broken legs or no walls then just move direction
	end
			
end



TReX.config.on_click=function(variable, toggle, toggle2)

	if (type(t.serverside["settings"][variable]) == "boolean") then
		if (toggle ~= nil) then
			t.serverside["settings"][variable] = verify(toggle)
		else
			t.serverside["settings"][variable] = not t.serverside["settings"][variable]
		end

		if (t.serverside["settings"][variable]) then -- if toggling to true
			--"parry","meditate"
			if table.contains({"extrusion","purify","deathsight","tarot","daina","alleviate","salt","accelerate","fitness","rage","bloodboil","might","shrugging","dragonheal","transmute","echos","timestamp","override","debugEnabled","restore","paused","Prompt","fool","afflictions","insomnia","vault","reporting","focus","clot","defences","recovery","tree","moss","sipping","affbar"}, variable) then
				t.serverside["settings"][variable] = true 				
			end

			if table.contains({"afflictions","insomnia","vault","reporting","focus","clot","defences","sipping","tree"}, variable) then
				t.serverside["settings_default"][variable] = "Yes"
			end
				--"parry","meditate"
				if not table.contains({"extrusion","purify","tree","clot","deathsight","rage","tarot","daina","alleviate","salt","fitness","recovery","bloodboil","accelerate","vault","fool","moss","echos","timestamp","Prompt","restore","might","shrugging","dragonheal","transmute","override","debugEnabled","paused","affbar"}, variable) then
					t.send("curing "..variable.." on", false)
				end
				
					if (variable == "affbar") then
						TReX.serverside.affbar("on")
					end

				if (variable == "dragonheal") then
					class_skill.dragon.dragonheal = true
					TReX.class.skill_check()
				end
				
					
				if (variable == "salt") then
					class_skill.alchemist.salt = true
					TReX.class.skill_check()
				end
				
				if (variable == "accelerate") then
					class_skill.depthswalker.accelerate = true
					TReX.class.skill_check()
				end			

				if (variable == "alleviate") then
					class_skill.blademaster.alleviate = true
					TReX.class.skill_check()
				end	

				if (variable == "bloodboil") then
					class_skill.magi.bloodboil = true
					TReX.class.skill_check()
				end					
				
				if (variable == "daina") then
					class_skill.shaman.daina = true
					TReX.class.skill_check()
				end		

				if (variable == "shrugging") then
					class_skill.serpent.shrugging = true
					TReX.class.skill_check()
				end		
				
				if (variable == "might") then
					class_skill[TReX.s.class:lower()].might = true
					TReX.class.skill_check()
				end				
				
				if (variable == "fitness") then
					class_skill[TReX.s.class:lower()].fitness = true
					TReX.class.skill_check()
				end
				
				if (variable == "tarot") then
					class_skill[TReX.s.class:lower()].tarot = true
					TReX.class.skill_check()
				end
				
				if (variable == "purify") then
					class_skill[TReX.s.class:lower()].purify = true
					TReX.class.skill_check()
				end
				
				if (variable == "extrusion") then
					class_skill[TReX.s.class:lower()].extrusion = true
					TReX.class.skill_check()
				end						

				
				--for k,v in pairs(class_skill) do
				--if TReX.s.class:lower()==k then
						--for p,j in pairs(class_skill[k]) do 
							--class_skill[k][p] =j
						--end
					--end
				--end
								
				TReX.config.show("settings")
			
					if (variable == "Prompt") then
						--if not t.serverside.prompt_capture == "config prompt custom PROMPTCAPTURE" then
							t.serverside.prompt_capture = "config prompt custom PROMPTCAPTURE"
							send(t.serverside.prompt_capture)
						--end	
					end
			
					if (variable == "transmutation") then
						raiseEvent("TReX precache reset")
						TReX.pipes.epipes()
					end

					if (variable == "moss") then
						t.send("curing mosshealth " ..t.serverside["settings_default"].moss_health_at)
						t.send("curing mossmana " ..t.serverside["settings_default"].moss_mana_at)	
					end							

					if (variable == "clot") then
						t.serverside.green_echo("Clotting on")
					end

					if (variable == "tree") then
						t.serverside.green_echo("Tree on")
					end					

					if (variable == "vault") then
						t.send("curing usevault on", false) 
					end

					if (variable == "defences") then
						TReX.defs.keepup()
					end 
					
					--if (variable == "parry") then
						--TReX.parry.toggle("on")
					--end
					
					if table.index_of({"echos","deathsight","restore","timestamp"},variable) then
						t.serverside.green_echo(variable.." on")
					end


		else -- if toggling to false

			--"parry",
			if table.contains({"extrusion","purify","affbar","deathsight","daina","tarot","alleviate","salt","accelerate","fitness","rage","bloodboil","might","shrugging","dragonheal","transmute","echos","timestamp","override","debugEnabled","restore","paused","Prompt","fool","afflictions","insomnia","vault","reporting","focus","clot","defences","recovery","tree","moss","sipping"}, variable) then
				t.serverside["settings"][variable] = false
			end
	
			if table.contains({"afflictions","insomnia","vault","reporting","focus","clot","defences","sipping","tree"}, variable) then
				t.serverside["settings_default"][variable] = "No"
			end
				--"parry",
				if not table.contains({"extrusion","purify","affbar","tree","clot","deathsight","rage","daina","tarot","alleviate","salt","fitness","recovery","bloodboil","accelerate","vault","fool","moss","echos","timestamp","Prompt","restore","might","shrugging","dragonheal","transmute","override","debugEnabled","paused"}, variable) then
					t.send("curing "..variable.." off", false)
				end
				
					if (variable == "affbar") then
						TReX.serverside.affbar("off")
					end
				
				if (variable == "dragonheal") then
					class_skill.dragon.dragonheal = false
					TReX.class.skill_check()
				end
				
				if (variable == "salt") then
					class_skill.alchemist.salt = false
					TReX.class.skill_check()
				end

				if (variable == "alleviate") then
					class_skill.blademaster.alleviate = false
					TReX.class.skill_check()
				end			

				if (variable == "bloodboil") then
					class_skill.magi.bloodboil = false
					TReX.class.skill_check()
				end	

				if (variable == "daina") then
					class_skill.shaman.daina = false
					TReX.class.skill_check()
				end					
				
				if (variable == "accelerate") then
					class_skill.depthswalker.accelerate = false
					TReX.class.skill_check()
				end		

				if (variable == "shrugging") then
					class_skill.serpent.shrugging = false
					TReX.class.skill_check()
				end					

				if (variable == "might") then
					class_skill[TReX.s.class:lower()].might = false
					TReX.class.skill_check()
				end	
				
				if (variable == "fitness") then
					class_skill[TReX.s.class:lower()].fitness = false
					TReX.class.skill_check()
				end
				
				if (variable == "tarot") then
					class_skill[TReX.s.class:lower()].tarot = false
					TReX.class.skill_check()
				end

				if (variable == "purify") then
					class_skill[TReX.s.class:lower()].purify = false
					TReX.class.skill_check()
				end			

				if (variable == "extrusion") then
					class_skill[TReX.s.class:lower()].extrusion = false
					TReX.class.skill_check()
				end						

				TReX.config.show("settings")
				
					if (variable == "Prompt") then
						--if not t.serverside.prompt_capture == "config prompt all" then
							--t.serverside.prompt_capture = "config prompt all"
							--send(t.serverside.prompt_capture)
						--end						
					end
				
					if (variable == "transmutation") then
						raiseEvent("TReX precache reset")
						TReX.pipes.epipes()
					end

					if (variable == "moss") then
						t.send("curing mosshealth 35", false)
						t.send("curing mossmana 35", false)	
					end							

					if (variable == "vault") then
						t.send("curing usevault off", false) 
					end

					if (variable == "defences") then
						TReX.defs.reset()
					end 
					
					if (variable == "clot") then
						t.serverside.red_echo("Clotting off")
					end		

					if (variable == "tree") then
						t.serverside.red_echo("Tree off")
					end							
					
					--if (variable == "parry") then
						--TReX.parry.toggle("off")
					--end
					
					if table.index_of({"echos","deathsight","restore","timestamp"},variable) then
						t.serverside.red_echo(variable.." off")
					end

				
				
		end
	end
	
	TReX.config.saveSettings()
	
end		

TReX.config.sip_health_at=function(num)
	t.serverside["settings_default"].sip_health_at = num
	t.send("curing siphealth " .. num)
	TReX.config.showSettings("settings")
end

TReX.config.sip_mana_at=function(num)
	t.serverside["settings_default"].sip_mana_at = num
	t.send("curing sipmana " .. num)
	TReX.config.showSettings("settings")
end

TReX.config.moss_health_at=function(num)
	t.serverside["settings_default"].moss_health_at = num
	t.send("curing mosshealth " .. num)
	TReX.config.showSettings("settings")
end

TReX.config.moss_mana_at=function(num)
	t.serverside["settings_default"].moss_mana_at = num
	t.send("curing mossmana " .. num)
	TReX.config.showSettings("settings")
end

TReX.config.set_fractures=function(num)
	t.serverside["settings_default"].fractures = num
	t.send("curing healthaffsabove " .. num)
	TReX.config.showSettings("settings")
end

TReX.config.set_clot_at=function(num)
	t.serverside["settings_default"].clot_at = num
	TReX.config.showSettings("settings")
end

TReX.config.unknown_diagnose_at=function(num)
	t.config["settings_system"].diag_at=num
	TReX.config.showSettings("settings")
end

TReX.config.set_mount=function(num)
	t.send("curing mount "..num)
	t.serverside["settings_default"].mount=num
end

TReX.config.add_mount=function(name, number)
	if not table.contains({mount_list}, name) then
		mount_list[tostring(name)]={["number"]=number, ["enabled"]=false}
	end
		TReX.config.showMounts()
end

TReX.config.remove_mount=function(name)

	if table.contains({mount_list}, name) then
		table.removekey(mount_list, name)
	end
		TReX.config.showMounts()

end

TReX.config.showSettings=function()
echo("\n")
cecho("\n\t<white>System Settings")
echo("\n")
echo("\n - ") echoLink("Sip Health at", "clearCmdLine() appendCmdLine'sip_health_at '", "sip health") cecho("<white>: "..t.serverside["settings_default"].sip_health_at.." %", false)
echo("\n - ") echoLink("Sip Mana at", "clearCmdLine() appendCmdLine'sip_mana_at '", "sip mana") cecho("<white>: "..t.serverside["settings_default"].sip_mana_at.." %", false)
echo("\n - ") echoLink("Moss Health at", "clearCmdLine() appendCmdLine'moss_health_at '", "moss health") cecho("<white>: "..t.serverside["settings_default"].moss_health_at.." %", false)
echo("\n - ") echoLink("Moss Mana at", "clearCmdLine() appendCmdLine'moss_mana_at '", "moss mana") cecho("<white>: "..t.serverside["settings_default"].moss_mana_at.." %", false)
echo("\n - ") echoLink("Apply to Fractures at", "clearCmdLine() appendCmdLine'set_fractures '", "fractures") cecho("<white>: "..t.serverside["settings_default"].fractures.." %", false)
echo("\n - ") echoLink("Clot bleeding at", "clearCmdLine() appendCmdLine'clot_at '", "puff count") cecho("<white>: "..t.serverside["settings_default"].clot_at.." bleeding", false)
echo("\n - ") echoLink("System will diagnose on", "clearCmdLine() appendCmdLine'unknown_diag_at '", "unknowns") cecho("<white>: "..t.config["settings_system"].diag_at.." unknown", false)
echo("\n")
	
local sortSettings = {}

TReX.class.skill_check()

  for k,v in pairs(t.serverside.settings) do
	if not table.index_of({"debugEnabled", "paused", "meditate", "installed", "sys_loaded", "sipRingMana", "sipRingHealth", "override"}, k) then
		sortSettings[#sortSettings+1] = k
		table.sort(sortSettings)
	end
  end

	local x = 0
	 			 
		for i, n in ipairs(sortSettings) do
			x = x + 1

		     	d = "<dim_grey>[<white>"

			--if table.index_of(t.stats, n) then

		 		if t.serverside.settings[n] then
		 			d = d .. " <light_blue>+ "
		 		else
		 			d = d .. " <red>- "
		 		end

		 	--end

	     		d = d .. "<dim_grey>]<white> " 


				if (x-1)%3 == 0 then
					echo("\n")
				end  
		
		   	local nWithSpace = n:title()

				if nWithSpace:len() < 25 and (x-1) %3~=2 then
					local pad = 25 - nWithSpace:len()
					nWithSpace = nWithSpace .. string.rep(" ", pad)
				elseif nWithSpace:len() > 25 then
					nWithSpace = nWithSpace:cut(25)
		     	end
	 
			local command

				fg("white")
				cecho(d)
		
			local command = [[TReX.config.on_click("]]..n..[[")]]
			echoLink(nWithSpace, command, "Toggle " .. n, true)

		end
		
		echo"\n\n"
		--deletep=false
		--	if not table.contains({prompt_sent}, "sent") then
		--		table.insert(prompt_sent, "sent")
		--	end
		--TReX.stats.custom_prompt()

end

TReX.config.show=function (arg,arg2) 
	if arg == nil then
		cecho(b..TReX.menus.main)
	elseif arg == "precache" then
		TReX.precache.manage()
	elseif arg == "tree" then
		TReX.serverside.tree_manage()
	elseif arg == "mount list" then
		TReX.config.showMounts()
	elseif arg == "inventory" then
		TReX.inv.set_id_table()
	elseif arg == "prios" then
		TReX.prios.default_settings()
		TReX.prios.managePrios()
	elseif arg == "defup" then
		TReX.defs.defup_current()
	elseif arg == "keepup" then
		TReX.defs.keepup_current()		
	--elseif arg == "defs" then
		--TReX.defs.display()
	elseif arg == "lust" then
		TReX.lust.whitelist()
	elseif arg == "settings" then
		TReX.config.showSettings()
	elseif arg == "help file" then
		cecho(TReX.menus.help)
	elseif arg == "setup" then
		cecho(TReX.menus.setup)
	elseif arg=="prompt" then
		TReX.stats.showSettings()
	elseif arg == "about" then
		cecho(TReX.menus.about)
		cechoLink( "<white>\t"..TReX.downloadsURL, [[TReX.downloadNow()]], TReX.downloadsURL, true )
		echo("\n\n\n\n")
	elseif arg == "about" then
		cecho(TReX.menus.about)
	elseif arg == "clan info" then
		cecho(TReX.menus.clan)
	elseif arg == "development" then
		cecho(TReX.menus.development)
	elseif arg == "bugs" then
		cecho(TReX.menus.bug)
		echoLink("\t".."https://github.com/shanesrasmussen/TReX-System/issues", [[openUrl("https://github.com/shanesrasmussen/TReX-System/issues")]], "",false) echo"\n"
	elseif arg == "projects" then
		cecho(TReX.menus.projects)
		echoLink("\t".."https://github.com/shanesrasmussen/TReX-System/projects", [[openUrl("https://github.com/shanesrasmussen/TReX-System/projects")]], "",false) echo"\n"
	--elseif arg == "misc" then
		--cecho(TReX.menus.misc)
	elseif arg == "api" then
		cecho(TReX.menus.api)
	else
		t.serverside.green_echo("Unknown command: <white>"..arg..".")
		t.serverside.green_echo("(enter '<dim_grey>trex<white>' for list of valid commands)")
	end
	
		--elseif arg == "reset" then
		--if arg2 == nil then
			--TReX.reset_player(target)
		--else
		--	TReX.reset_player(arg2)
		--end
	--elseif arg == "report" then TReX.report()
	--elseif arg == "gui" then
		--if arg2 == nil       then TReX.toggle_gui()
		--elseif arg2 == "on"  then TReX.enable_gui()
		--elseif arg2 == "off" then TReX.disable_gui()
		--end

		if t.serverside.settings.Prompt then
			deletep=false
				if not table.contains({prompt_sent}, "sent") then
					table.insert(prompt_sent, "sent")
				end
			TReX.stats.custom_prompt()
		end
end

TReX.config.save=function() -- saves this file
  if string.char(getMudletHomeDir():byte()) == "/" then
		_sep = "/"
  	else
		_sep = "\\"
   end -- if
   
   local savePath = getMudletHomeDir() .. _sep .. "TReX_config.lua"
  
      if (io.exists(savePath)) then
		table.save(savePath, TReX.config)
		if t.serverside["settings"].echos then TReX.config.echo("Settings Saved") end
	  end -- if
	  
 
end -- func

TReX.config.load=function() --loads it
  if string.char(getMudletHomeDir():byte()) == "/"
   then _sep = "/"
    else _sep = "\\"
     end -- if
   
   local savePath = getMudletHomeDir() .. _sep .. "TReX_config.lua"
   
    if (io.exists(savePath)) then
    table.load(savePath, TReX.config)
    if t.serverside["settings"].echos then TReX.config.echo("Settings Loaded") end
  end -- if

  if t.serverside["settings"].debugEnabled then TReX.debugMessage(" (TReX.config.load COMPILED) ") end
  
end -- func

TReX.config.save() 

for _, file in ipairs(TReX.config) do
	dofile(file)
end -- forr