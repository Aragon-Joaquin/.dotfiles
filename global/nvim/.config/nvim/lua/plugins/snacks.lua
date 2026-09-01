--TODO: create a folder an put these in another file
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      highlights = {}, -- can change the colors? i dunno
      bigfile = { enabled = true },
      --NOTE: dashboard
      dashboard = {
        width = 70,
        preset = {
          keys = {
            { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "s", desc = "Restore Session", section = "session" },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          },

          header = [[
                                                                   :     
                          L.                           G:         t#,    
  .    .                  EW:        ,ft               E#,    :  ;##W.   
  Di   Dt              .. E##;       t#E            .. E#t  .GE :#L:WE   
  E#i  E#i            ;W, E###t      t#E           ;W, E#t j#K;.KG  ,#D  
  E#t  E#t           j##, E#fE#f     t#E          j##, E#GK#f  EE    ;#f 
  E#t  E#t          G###, E#t D#G    t#E         G###, E##D.  f#.     t#i
  E########f.     :E####, E#t  f#E.  t#E       :E####, E##Wi  :#G     GK 
  E#j..K#j...    ;W#DG##, E#t   t#K: t#E      ;W#DG##, E#jL#D: ;#L   LW. 
  E#t  E#t      j###DW##, E#t    ;#W,t#E     j###DW##, E#t ,K#j t#f f#:  
  E#t  E#t     G##i,,G##, E#t     :K#D#E    G##i,,G##, E#t   jD  f#D#;   
  f#t  f#t   :K#K:   L##, E#t      .E##E  :K#K:   L##, j#t        G#t    
   ii   ii  ;##D.    L##, ..         G#E ;##D.    L##,  ,;         t     
            ,,,      .,,              fE ,,,      .,,                    
                                       ,                                 
]],
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },

        enabled = true,
      },
      image = { enabled = true },
      explorer = { enabled = true },
      indent = { enabled = true },
      input = { enabled = true },
      picker = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
}
