globalkeys = awful.util.table.join(
   awful.key(
      { modkey,           },
      "/",
      function ()
         mymainmenu:toggle()
      end
   ),
   awful.key(
      { modkey,           },
      "p",
      awful.tag.viewprev
   ),
   awful.key(
      { modkey,           },
      "n",
      awful.tag.viewnext
   ),
   awful.key(
      { modkey,           },
      "j",
      function ()
         awful.client.focus.byidx( 1)
         if client.focus then
            client.focus:raise()
         end
      end
   ),
   awful.key({ modkey,           },
      "k",
      function ()
         awful.client.focus.byidx(-1)
         if client.focus then
            client.focus:raise()
         end
      end
   ),
   awful.key(
      { modkey, "Control"   },
      "j",
      function ()
         awful.client.swap.byidx(  1)
      end
   ),
   awful.key(
      { modkey, "Control"   },
      "k",
      function ()
         awful.client.swap.byidx( -1)
      end
   ),
   awful.key(
      { modkey,           },
      "Return",
      function ()
         awful.util.spawn(terminal)
      end
   ),
   awful.key(
      { modkey, "Control" },
      "r",
      awesome.restart
   ),
   awful.key(
      { modkey, "Shift"   },
      "q",
      awesome.quit
   ),
   awful.key(
      { modkey,           },
      "l",
      function ()
         awful.tag.incmwfact( 0.05)
      end
   ),
   awful.key(
      { modkey,           },
      "h",
      function ()
         awful.tag.incmwfact(-0.05)
      end
   ),
   awful.key(
      { modkey, "Shift"   },
      "h",
      function ()
         awful.tag.incnmaster( 1)
      end
   ),
   awful.key(
      { modkey, "Shift"   },
      "l",
      function ()
         awful.tag.incnmaster(-1)
      end
   ),
   awful.key(
      { modkey, "Control" },
      "h",
      function ()
         awful.tag.incncol( 1)
      end
   ),
   awful.key(
      { modkey, "Control" },
      "l",
      function ()
         awful.tag.incncol(-1)
      end
   ),
   awful.key(
      { modkey,           },
      "space",
      function ()
         awful.layout.inc(layouts,  1)
      end
   ),
   awful.key(
      { modkey, "Shift"   },
      "space",
      function ()
         awful.layout.inc(layouts, -1)
      end
   ),
   awful.key(
      { modkey, "Control" },
      "space",
      awful.client.floating.toggle
   ),
   awful.key(
      { modkey, "Control" },
      "Return",
      function ()
         awful.client:swap(awful.client.getmaster())
      end
   ),
   awful.key(
      { modkey,           },
      "t",
      function ()
         awful.client.ontop = not awful.client.ontop
      end
   ),
   awful.key(
      { modkey },
      "m",
        function ()
	   local c = client.focus
	   if c then
	      c.minimized = true
	   end
        end
   ),
   awful.key(
      { modkey, "Control" },
      "m",
      function ()
	 local c = awful.client.restore()
	 -- Focus restored client
	 if c then
	    client.focus = c
	    c:raise()
	 end
      end
   ),
    awful.key(
      { modkey, "Shift" },  "r",
      function ()
         mypromptbox[mouse.screen]:run()
      end
   ),
   awful.key(
      { modkey },  "r",
      function()
        awful.util.spawn("rofi -show run", false)
      end
   ),
   awful.key(
      { modkey },  "o",
      function()
        awful.util.spawn("rofi -show window", false)
      end
   ),
   awful.key(
      { modkey },  "i",
      function()
        awful.util.spawn("rofi -show compi", false)
      end
   ),
   awful.key(
      { modkey },  "=",
      function()
        awful.util.spawn("rofi -show calc", false)
      end
   ),
   awful.key(
      { modkey },
      "x",
      function ()
         awful.prompt.run(
            { prompt = "Run Lua code: " },
            mypromptbox[mouse.screen].widget,
            awful.util.eval, nil,
            awful.util.getdir("cache") .. "/history_eval"
         )
      end
   ),
   awful.key(
      { modkey },
      "=",
      function()
	 awful.util.spawn("amixer set Master 5%+", false)
      end
   ),
   awful.key(
      { modkey },
      "-",
      function()
	 awful.util.spawn("amixer set Master 5%-", false)
      end
   ),
   awful.key(
      { modkey },
      "0",
      function()
	 awful.util.spawn("amixer set Master toggle", false)
      end
   ),
   awful.key(
      { modkey, "Control", "Shift" },
      "l",
      function ()
         awful.util.spawn("xscreensaver-command -lock")
      end
   ),
   awful.key(
      { modkey, "Control", "Shift" },
      "t",
      function()
	 result = awful.util.spawn_with_shell(
	    "source $HOME/.bashrc.d/utils/toggle-touchscreen.sh && " ..
	    "toggle-touchscreen"
	 )
	 naughty.notify({title = 'Toggle Touch Screen', text = result})
      end
   ),
   awful.key(
      { modkey, "Shift" },
      "k",
      function()
	 awful.util.spawn_with_shell(
	    "source $HOME/.bashrc.d/utils/setup-international-keyboard.sh && " ..
	    "setup-international-keyboard"
	 )
         naughty.notify({ title = "International Keyboard Configured", message = "You're idling", timeout = 3 })
      end
   ),
   awful.key(
      { modkey, "Control", "Shift" },
      "k",
      function()
	 result = awful.util.spawn_with_shell(
	    "source $HOME/.bashrc.d/utils/setup-abnt-keyboard.sh && " ..
	    "setup-abnt-keyboard"
	 )
         naughty.notify({ title = "ABNT Keyboard Configured", message = "You're idling", timeout = 3 })
      end
   ),
   awful.key(
      { },
      "Print",
      function ()
	 awful.util.spawn_with_shell(
	    "file=/tmp/" ..
	    "screenshot-$(date --iso-8601=s | tr ':' '-').png && " ..
	    "import -window root -quality 98 -quiet $file"
	 )
      end
   ),
   awful.key(
      { 'Control' },
      "Print",
      function ()
	 awful.util.spawn_with_shell(
	    "file=Dropbox/fernando/screenshots/" ..
	    "screenshot-$(date --iso-8601=s | tr ':' '-').png && " ..
	    "import -window root -quality 98 -quiet $file"
	 )
      end
   ),
   awful.key(
      { 'Alt' },
      "Print",
      function ()
	 awful.util.spawn_with_shell(
	    "file=/tmp/" ..
	    "screenshot-$(date --iso-8601=s | tr ':' '-').png && " ..
	    "import -quality 98 $file"
	 )
      end
   ),
   awful.key(
      { 'Control', 'Alt' },
      "Print",
      function ()
	 awful.util.spawn_with_shell(
	    "file=Dropbox/fernando/screenshots/" ..
	    "screenshot-$(date --iso-8601=s | tr ':' '-').png && " ..
	    "import -quality 98 $file"
	 )
      end
   )
)

-- Bind all key numbers to tags.
for i = 1, 9 do
   globalkeys = awful.util.table.join(
      globalkeys,
      awful.key(
	 { modkey },
	 "#" .. i + 9,
	 function ()
	    local screen = mouse.screen
	    local tag = awful.tag.gettags(screen)[i]

	    if tag then
	       awful.tag.viewonly(tag)
	    end
	 end
      ),
      awful.key(
	 { modkey, "Control" },
	 "#" .. i + 9,
	 function ()
	    local screen = mouse.screen
	    local tag = awful.tag.gettags(screen)[i]

	    if tag then
	       awful.tag.viewtoggle(tag)
	    end
	 end
      ),
      awful.key(
	 { modkey, "Shift" },
	 "#" .. i + 9,
	 function ()
	    if client.focus then
	       local tag = awful.tag.gettags(client.focus.screen)[i]

	       if tag then
		  awful.client.movetotag(tag)
	       end
	    end
	 end
      )
   )
end

root.keys(globalkeys)

root.buttons(
   awful.util.table.join(
      awful.button(
         {},
         3,
         function ()
            mymainmenu:toggle()
         end
      ),
      awful.button(
         {},
         4,
         awful.tag.viewnext
      ),
      awful.button(
         {},
         5,
         awful.tag.viewprev
      )
   )
)

clientkeys = awful.util.table.join(
   awful.key(
      { modkey,           },
      "f",
      function (c)
	 c.fullscreen = not c.fullscreen
      end
   ),
   awful.key(
      { modkey, "Shift"   },
      "c",
      function (c)
	 c:kill()
      end
   ),
   awful.key(
      { modkey,           },
      "o",
      awful.client.movetoscreen
   ),
   awful.key(
      { modkey, "Shift"   },
      "r",
      function (c)
	 c:redraw()
      end
   )
)

clientbuttons = awful.util.table.join(
   awful.button(
      { },
      1,
      function (c)
	 client.focus = c;
	 c:raise()
      end
   ),
   awful.button(
      { modkey },
      1,
      awful.mouse.client.move
   ),
   awful.button(
      { modkey },
      3,
      awful.mouse.client.resize
   )
)

awful.rules.rules = {
   {
      rule = { },
      properties = {
         border_width = beautiful.border_width,
         border_color = beautiful.border_normal,
	 keys = clientkeys,
	 buttons = clientbuttons
      }
   },
   {
      rule_any = {
         name = { ".*Emulator.*" }
      },
      properties = {
         floating = true,
      }
   },
}
