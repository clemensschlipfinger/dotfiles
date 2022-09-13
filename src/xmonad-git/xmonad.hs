--
-- XMonad Configuration
--

--IMPORT
--base
import XMonad
import Data.Monoid
import System.Exit
--import System.Environment
--import System.IO
--import System.IO.Unsafe

--import XMonad.Util.SpawnOnce  --Autostart
--import XMonad.Util.Run

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

--Layouts
import XMonad.Layout.ResizableTile --Tall Layout Resizable
import XMonad.Layout.ThreeColumns  --Three Column Layout
import XMonad.Layout.Circle

--Layout Modifiers
import XMonad.Layout.Renamed    --Rename Layout
import XMonad.Layout.Spacing    --Gaps
import XMonad.Layout.NoBorders  --A Modifier to disable Borders
import XMonad.Layout.SubLayouts --Layouts nested
import XMonad.Layout.WindowNavigation --easy navigation of a workspace

--import XMonad.Layout.BoringWindows    -- skip windows
--import XMonad.Layout.SimpleFloat--Grid Float
--import XMonad.Layout.LayoutHints --Make layouts respect size hints
--import XMonad.Layout.Grid     --Grid Layout
--import XMonad.Layout.Spiral
--import XMonad.Layout.Tabbed     --Tabbed Layout

--Hooks
import XMonad.Hooks.EwmhDesktops --to tell panel applications about its workspaces
import XMonad.Hooks.Place -- to place floated windows smart

import XMonad.Hooks.ManageDocks --Manging the bar
import XMonad.Hooks.DynamicLog   --Log Hook for xmobar
import XMonad.Hooks.StatusBar    --for xmobar
import XMonad.Hooks.StatusBar.PP --for xmobar

-- Other
import Graphics.X11.ExtraTypes.XF86 -- keysyms for the fn-keys

--Theme
import Theme

--Variables
----------------------------------------------------------------------

-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
myTerminal :: String
myTerminal    = "st"

-- The preferred browser program
myBrowser :: String
myBrowser = "firefox"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
--
myBorderWidth = 3

-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask = mod4Mask

-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
myWorkspaces = ["1","2","3","4","5","6","7","8","9"]

-- Border colors for unfocused and focused windows, respectively.
--
myNormalBorderColor  = deactiveColor
myFocusedBorderColor = accentColor

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
--self:
--command to determinate the name of the key
--xkbcli interactive-x11
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

-- Window Manager Keybindings

    -- close focused window
    [ ((modm .|. shiftMask, xK_c     ), kill)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)


    -- Move focus to the next window
    , ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown )

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp )

    -- Move focus to the next left window
    , ((modm,               xK_h     ), sendMessage $ Go L )

    -- Move focus to the right window
    , ((modm,               xK_l     ), sendMessage $ Go R )

    -- Move focus to the master window
    , ((modm,               xK_Return   ), windows W.focusMaster  )


    -- Swap the focused window and the master window
    , ((modm,               xK_m), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp )


    -- Shrink the master area
    , ((modm .|. shiftMask, xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm .|. shiftMask, xK_l     ), sendMessage Expand)


    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    
    -- float focused window
    --, ((modm              , xK_i     ) 
    --  , withFocused $ float)
    --

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --restart")

    --switch to Full Layout 
    , ((modm              , xK_f     ), sendMessage $ JumpToLayout "Full" )
 
    -- vertical expand shrink
    , ((modm              , xK_Up    ), sendMessage MirrorExpand)
    , ((modm              , xK_Down  ), sendMessage MirrorShrink)

    -- SubLayouts
    , ((modm .|. controlMask, xK_h   ), sendMessage $ pullGroup L)
    , ((modm .|. controlMask, xK_l   ), sendMessage $ pullGroup R)
    , ((modm .|. controlMask, xK_k   ), sendMessage $ pullGroup U)
    , ((modm .|. controlMask, xK_j   ), sendMessage $ pullGroup D)

    , ((modm              , xK_u     ), withFocused (sendMessage . MergeAll))
    , ((modm .|. shiftMask, xK_u     ), withFocused (sendMessage . UnMerge))

-- Application Keybindings

    -- launch a terminal
    , ((modm .|. shiftMask, xK_Return ), spawn $ XMonad.terminal conf)

    -- launch rofi -show run
    , ((modm,               xK_p      ), spawn $ "rofi -show drun -m primary")

    -- launch dmenu
    , ((modm .|. shiftMask, xK_p      ), spawn $ "tdmenu_run")

    -- launch a browser
    , ((modm .|. shiftMask, xK_f      ), spawn $ myBrowser )

    -- launch htop
    , ((modm .|.  shiftMask, xK_t     ), spawn "st htop")

    -- screenshot of Selection
    , ((modm           , xK_Print     ), spawn "scrot-script -s")

    -- screenshot of focused window
    , ((modm .|. shiftMask, xK_Print  ), spawn "scrot-script -u")

-- Other Keybindings
    -- power menu
    , ((modm .|.  shiftMask, xK_0     ), spawn "rofi -m primary -show power-menu -modi power-menu:rofi-power-menu")

-- Fn-Key Keybindings
    -- Brightness
    , ((0, xF86XK_MonBrightnessUp     ), spawn "brightnessctl s +5%")
    , ((0, xF86XK_MonBrightnessDown   ), spawn "brightnessctl s 5%-")

    -- Audio
    , ((0, xF86XK_AudioMute           ), spawn "pulsemixer --toggle-mute")
    , ((0, xF86XK_AudioLowerVolume    ), spawn "pulsemixer --change-volume -2")
    , ((0, xF86XK_AudioRaiseVolume    ), spawn "pulsemixer --change-volume +2")

    -- Media Player
    , ((0, xF86XK_AudioPlay           ), spawn "playerctl play-pause")
    , ((0, xF86XK_AudioStop           ), spawn "playerctl stop")
    , ((0, xF86XK_AudioNext           ), spawn "playerctl next")
    , ((0, xF86XK_AudioPrev           ), spawn "playerctl previous")
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts: 

-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--

myLayout = avoidStruts $ myWindowNavigation $ tall ||| mtall  |||  threecol  ||| ( noBorders $ Full ) ||| Circle
    where
     -- default tall
     tall = renamed [ Replace "Tall" ] 
        $ smartBorders 
        $ tallSpacing $ topSpacing 
        $ subTabbed
        $ ResizableTall nmaster delta ratio []

     -- mirrored tiling 
     mtall= renamed [ Replace "Mirror Tall" ] 
        $ smartBorders 
        $ topSpacing $ tallSpacing
        $ subTabbed
        $ Mirror
        $ ResizableTall nmaster delta ratio []

     -- Three Columns
     threecol = renamed [ Replace "ThreeCol" ] 
        $ tallSpacing $ topSpacing
        $ subTabbed
        $ ThreeCol 1 delta (1/3)
 
     -- The default number of windows in the master pane
     nmaster = 1
     -- Default proportion of screen occupied by master pane
     ratio   = 1/2
     -- Percent of screen to increment by when resizing panes
     delta   =  3/100
     

     -- Gaps around and between windows
     -- Changes only seem to apply if I log out then in again
     -- Dimensions are given as (Border top bottom right left)
     --Spacing - tiled config
     tallSpacing = spacingRaw True  -- Only for >1 window
             (Border 0 0 0 5) -- Size of screen edge gaps
             True             -- Enable screen edge gaps
             (Border 0 5 5 0) -- Size of window gaps
             True             -- Enable window gaps

     --Spacing for Top
     topSpacing   = spacingRaw False
             (Border 5 0 0 0) 
             True            
             (Border 0 0 0 0)
             True

     -- Window Navigation
     myWindowNavigation = configurableNavigation noNavigateBorders

------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
--myManageHook = windowRules
myManageHook = placeHook myPlacement <+> windowRules
    where
-- Low Performance
--        myPlacement = withGaps (10,0,10,0) (smart (0.5,0.5))
--        myPlacement = smart (0.5,0.5)
        myPlacement = fixed(0.5,0.5)
        windowRules = composeAll
            [ className =? "MPlayer"        --> doFloat
            , className =? "Gimp"           --> doFloat
            , className =? "Xmessage"       --> doFloat

            , className =? "Xsane"          --> doFloat

            , title     =? "KUNST"          --> doFloat
            , title     =? "splash"         --> doFloat

            , resource  =? "desktop_window" --> doIgnore
            , resource  =? "kdesktop"       --> doIgnore
            ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Status bars and logging

-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
myLogHook = return ()

------------------------------------------------------------------------
-- Startup hook

-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
--from me:
--Currently executed after login...
--
-- By default, do nothing.
myStartupHook = return ()
    --Polybar
    --spawnOnce "COLOR=$(cat ~/.config/desktop-themes/$DESKTOP_DEFAULT_THEME/polybar) ~/.config/polybar/launch.sh"
-----------------------------------------------------------------------
--Xmobar
myXmobar = withSB $ statusBarProp "xmobar ~/.config/xmobar/xmobarrc.hs" $ pure $ myXmobarPP
    where
       myXmobarPP :: PP
       myXmobarPP = def
         { 
            ppTitle = shorten 90
            , ppTitleSanitize = xmobarStrip
            , ppSep = " | "
            , ppCurrent =  xmobarColor accentLightColor "" . wrap "[" "]" 
         }

------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = xmonad
      $ ewmh 
      $ docks 
      $ myXmobar 
      $ myConfig

-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--
myConfig = def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = myModMask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = myManageHook,
        handleEventHook    = myEventHook,
        logHook            = myLogHook,
        startupHook        = myStartupHook
    }
