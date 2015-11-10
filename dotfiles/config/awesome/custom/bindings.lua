-- {{{ Key bindings
globalkeys = awful.util.table.join(
   awful.key(
      { modkey,           },
      "/",
      function ()
         mymainmenu:toggle()
      end
   ),

   -- Navigation
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

   -- Standard program
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

   -- Client
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
      { modkey, },
      "f",
      function ()
         awful.client.fullscreen = not awful.client.fullscreen
      end
   ),
   awful.key(
      { modkey, "Shift"   },
      "c",
      function ()
         awful.client:kill()
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
      "o",
      awful.client.movetoscreen
   ),
   awful.key(
      { modkey,           },
      "t",
      function ()
         awful.client.ontop = not awful.client.ontop
      end
   ),
   awful.key(
      { modkey,           },
      "m",
      function ()
         awful.client.minimized = true
      end
   ),
   awful.key(
      { modkey, "Shift"   },
      "m",
      function ()
         awful.client.maximized_horizontal = not awful.client.maximized_horizontal
         awful.client.maximized_vertical   = not awful.client.maximized_vertical
      end
   ),

   -- Prompt
   awful.key(
      { modkey },
      "r",
      function ()
         mypromptbox[mouse.screen]:run()
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

   -- Volume bindings
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
      { modkey, "Control" },
      "t",
      function()
	 awful.util.spawn(
	    "xinput " ..
	       "| grep 'maXTouch Digitizer'" ..
	       "| awk '{print $7}'" ..
	       "| tr -d 'id=' " ..
	       "| xargs xinput --disable"
	 )
	 naughty.notify({title = 'Touch Screen', text = 'disabled'})
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
-- }}}

-- {{{ Mouse bindings
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
-- }}}
