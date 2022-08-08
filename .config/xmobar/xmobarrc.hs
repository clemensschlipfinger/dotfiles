Config { font = "xft:ricefont:size=8" -- default font
       , additionalFonts = [ "xft:Material Design Icons Desktop:size=11"
													 , "xft:ricefont:size=11"  -- font for icons
													 ]
       , borderColor = "#454545"
       , borderWidth = 3
       , border = FullB
       , bgColor = "#191919"
       , fgColor = "white"
       , alpha = 255
       , position = Static { xpos = 5 , ypos = 5, width = 1910, height = 35 }
       , textOffset = -1
       , iconOffset = -1
       , lowerOnStart = True
       , pickBroadest = False
       , persistent = False
       , hideOnStart = False
       , iconRoot = "."
       , allDesktops = False
       , overrideRedirect = True
       , commands = [ 
            -- Run Weather "EGPF" ["-t","<station>: <tempC>C", "-L","18","-H","25", "--normal","green", "--high","red", "--low","lightblue"] 36000
            -- , Run Network "wlp0s20f3" [ "-S", "False", "-t", "<dev>: <rx>|<tx>" ] 10 
              Run Wireless "" [ "-t", "<fn=1>󰤨</fn>  <ssid> <qualitybar>" ] 10
            , Run MultiCpu [ "-w", "3", "-a", "l", "-L","10","-H","50", "-n", "#8c7dff" ,"-h", "red", "-t" , "<fn=1>󰘚</fn> <total>%" ] 10
            , Run CpuFreq [ "-t", "<fn=1>󰓅</fn> <max>GHz", "-w", "2", "-L", "1", "-H", "4", "-l", "white", "-n","#8c7dff", "-h", "red"] 50
            , Run MultiCoreTemp ["-t", "<fn=1>󰔏</fn> <avg>°C", "-L", "60", "-H", "80", "-l", "white", "-n", "#8c7dff", "-h", "red", "--", "--mintemp", "20", "--maxtemp", "100"] 50
            , Run Memory [ "-w", "2", "-t","<fn=1>󰍛</fn> <usedratio>%"] 20
            , Run Com "uname" ["-n"] "" 36000
            , Run Date "<fn=1>󰥔</fn> %a %b %_d %Y %H:%M:%S" "date" 10
		    , Run BatteryP ["BAT0"]
				 [ "-t", "<acstatus>"
				 , "-L", "10", "-H", "80"
				 , "-l", "red", "-h","#8c7dff" 
				 , "--", "-O", "Charging", "-o", "<fn=1>󰁹</fn> <left>%"
                 , "-a", "notify-send -u critical 'Battery running out!'"
                 , "-A", "3"
				 ] 300	
		    , Run Alsa "default" "Master" [ "-w", "3","-t", "<fn=1>󰓃</fn> <volume>% <status>"]
            -- , Run Com "pulsemixer" [ "--get-volume" , "|", "cat"] "vol" 10
		    , Run Brightness [ "-w", "3", "-t", "<fn=1>󰃠</fn> <percent>%", "--", "-D", "intel_backlight" ] 10
		    , Run XMonadLog
				, Run Com "cointop" [ "price","--coin", "ETH" ] "coin" 36000
       ]
       , sepChar = "%"
       , alignSep = "}{"
       , template = " <fn=1>󰣇</fn> %XMonadLog%}{<fn=2> </fn> ETH %coin%  |  %multicpu%  |  %cpufreq%  |  %multicoretemp%  |  %memory%  |  %wi%  |  %alsa:default:Master%  |  %bright%  |  %battery%  |  %date%  |  <fc=#aaaaaa>%uname%</fc>  "
       }
