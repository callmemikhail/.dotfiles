/* See LICENSE file for copyright and license details. */
/* appearance */ 
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const unsigned int snap      = 20;       /* snap pixel */
static const unsigned int borderpx  = 2;       /* border pixel of windows */
static const char col_cyan[]        = "#111519";
static const char col_gray1[]       = "#111519";
static const char col_gray2[]       = "#5c6570";
static const char col_gray3[]       = "#c3c4c5";
static const char col_gray4[]       = "#c3c4c5";
static const char col_bgray[]	    = "#8093a1";
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=8";

static const char *colors[][3]      = {
    /*               fg         bg         border   */
    [SchemeNorm]    = { col_gray3, col_gray1,col_gray2 },
    [SchemeSel]     = { col_gray4, col_cyan, col_bgray  },
    [SchemeStatus]  = { col_gray3, col_gray1, "#000000" }, // Statusbar right {text,background,not used but cannot be empty}
             [SchemeTagsSel] = { col_cyan, col_bgray,  "#000000"  }, // Tagbar left selected {text,background,not used but cannot be empty}
             [SchemeTagsNorm]= { col_gray4, col_cyan,  "#000000" }, // Tagbar left unselected {text,background,not used but cannot be empty}
             [SchemeInfoSel] = { col_gray4, col_cyan,  "#000000"  }, // infobar middle  selected {text,background,not used but cannot be empty}
             [SchemeInfoNorm]= { col_gray3, col_gray1, "#000000" }, // infobar middle  unselected {text,background,not used but cannot be empty}
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
    /* xprop(1):
     *	WM_CLASS(STRING) = instance, class
     *	WM_NAME(STRING) = title
     */
    /* class      instance    title       tags mask     isfloating   monitor */
    { "Steam",     NULL,	  NULL,       1 << 6,	    0, 		 -1 },
    { "steam",     NULL,	  NULL,       1 << 6,	    0, 		 -1 },
    { "discord",   NULL,	  NULL,       1 << 7,	    0, 		 -1 },
    { "vscodium",  NULL,	  NULL,       1 << 3,	    0, 		 -1 },
    { "VSCodium",  NULL,	  NULL,       1 << 3,	    0, 		 -1 },
    { "steamwebhelper",NULL,  NULL,       1 << 6,	    0, 		 -1 },
    { "TelegramDesktop",NULL, NULL,       1 << 8,	    0, 		 -1 },
};

/* layout(s) */
static const float mfact     = 0.6;  /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
    /* symbol     arrange function */
    { "[]=",      tile },    /* first entry is default */
    { "><>",      NULL },    /* no layout function means floating behavior */
    { "[M]",      monocle },
    //	{ "|||",      col },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/usr/bin/alacritty", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */

static const char *obs_studio[]			= { "obs", NULL };
static const char *vifm[]				= { "vifm", NULL };
static const char *steam[]				= { "steam", NULL };
static const char *discordcmd[]  		= { "discord", NULL };
static const char *browsercmd[]  		= { "librewolf", NULL };
static const char *termcmd[]  			= { "alacritty" , NULL };
static const char *flameshot[] 			= { "flameshot", "gui", NULL };
static const char *telegram[]			= { "telegram-desktop", NULL};
static const char *upvol[]   			= { "amixer", "set", "Master", "10%+", NULL };
static const char *downvol[] 			= { "amixer", "set", "Master", "10%-", NULL };
static const char *mutevol[] 			= { "pactl", "set-sink-mute", "@DEFAULT_SKINK@", "toggle", NULL };
static const char *dmenucmd[]			= { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", col_cyan, "-nf", col_bgray, "-sb", col_bgray, "-sf", col_cyan, NULL };

#include "exitdwm.c"
static const Key keys[] = {
    /* modifier                     key        function        argument */
    { MODKEY,						XK_b,      togglebar,       {0} }, 
    { MODKEY|ShiftMask,             XK_j,      rotatestack,     {.i = +1 } },
    { MODKEY|ShiftMask,             XK_k,      rotatestack,     {.i = -1 } },
    { MODKEY,                       XK_j,      focusstack,      {.i = +1 } }, 
    { MODKEY,                       XK_k,      focusstack,      {.i = -1 } }, 
    { MODKEY,                       XK_i,      incnmaster,      {.i = +1 } }, 
    { MODKEY,                       XK_g,      incnmaster,      {.i = -1 } },
    { MODKEY,						XK_h,      setmfact,        {.f = -0.05} },
    { MODKEY,           	        XK_l,      setmfact,        {.f = +0.05} },
    { MODKEY|ShiftMask,				XK_v, 	   spawn,           {.v = vifm} }, 
    { MODKEY|ShiftMask,				XK_s, 	   spawn,			{.v = steam} }, 
    { MODKEY|ShiftMask,				XK_t,	   spawn,			{.v = telegram} }, 
    { MODKEY,						XK_r,      spawn,			{.v = termcmd } }, 
    { MODKEY,						XK_p,      spawn,			{.v = dmenucmd } }, 
    { 0,							XK_Print,  spawn,			{.v = flameshot } }, 
    { MODKEY|ShiftMask,				XK_o, 	   spawn,			{.v = obs_studio} }, 
    { MODKEY|ShiftMask,				XK_d,      spawn,			{.v = discordcmd } },
    { MODKEY|ShiftMask,				XK_f,      spawn,			{.v = browsercmd } }, 
    { MODKEY,                       XK_Return, zoom,			{0} },
    { MODKEY,                       XK_Tab,    view,           	{0} },
    { MODKEY,						XK_w,      killclient,     	{0} },
    { MODKEY,						XK_t,      setlayout,      	{.v = &layouts[0]} },
    { MODKEY,						XK_f,      setlayout,      	{.v = &layouts[1]} },
    { MODKEY,						XK_m,      setlayout,      	{.v = &layouts[2]} },
    { MODKEY,                       XK_space,  setlayout,      	{0} },
    { MODKEY|ShiftMask,             XK_space,  togglefloating, 	{0} },
    { MODKEY,                       XK_0,      view,           	{.ui = ~0 } },
    { MODKEY|ShiftMask,             XK_0,      tag,            	{.ui = ~0 } },
    //	{ MODKEY,						XK_c,      setlayout,      	{.v = &layouts[3]} },
    //	{ MODKEY,                       XK_h,  	   focusmon,       	{.i = +1 } },
    // 	{ MODKEY,                       XK_l,  	   focusmon,       	{.i = -1 } },
    //	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         	{.i = +1 } },
    //	{ MODKEY|ShiftMask,             XK_period, tagmon,         	{.i = -1 } },
    //	{ MODKEY|ShiftMask,				XK_b,      spawn,          SHCMD("xdotool type $(grep -v '^#' ~/.config/snippets | dmenu -i -l 50 | cut -d' ' -f1)") },
    //	{ MODKEY|ShiftMask,				XK_x,      spawn,          SHCMD("awk -i inplace -v rmv=\"$(grep -v '^#' ~/.config/snippets | dmenu -i -l 50 | cut -d' ' -f1)\" '!index($0,rmv)' ~/.config/snippets") },
    { MODKEY|ControlMask,			XK_l,		movekeyboard_x, {.i = 20}},
    { MODKEY|ControlMask,			XK_j,	 	movekeyboard_y, {.i = 20}},
    { MODKEY|ControlMask,			XK_h,	 	movekeyboard_x, {.i = -20}},
    { MODKEY|ControlMask,			XK_k,	 	movekeyboard_y, {.i = -20}},
    TAGKEYS(                        XK_1,                      0)
    TAGKEYS(                        XK_2,                      1)
    TAGKEYS(                        XK_3,                      2) 
    TAGKEYS(                        XK_4,                      3)
    TAGKEYS(                        XK_5,                      4)
    TAGKEYS(                        XK_6,                      5)
    TAGKEYS(                        XK_7,                      6)
    TAGKEYS(                        XK_8,                      7)
    TAGKEYS(                        XK_9,                      8)
    { MODKEY|ShiftMask|ControlMask,	XK_q,      exitdwm,        {0} },
    { MODKEY|ShiftMask|ControlMask,	XK_Escape, quit,           {0} }, 
    { MODKEY|ShiftMask,             XK_Up,     spawn,          {.v = upvol   } },
    { MODKEY|ShiftMask,             XK_Down,   spawn,          {.v = downvol } },
    { MODKEY|ShiftMask,		XK_m,      spawn,				   {.v = mutevol } },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */

static const Button buttons[] = {
    /* click                event mask      button          function        argument */
    { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
    { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
    { ClkWinTitle,          0,              Button2,        zoom,           {0} },
    { ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
    { ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
    { ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
    { ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
    { ClkTagBar,            0,              Button1,        view,           {0} },
    { ClkTagBar,            0,              Button3,        toggleview,     {0} },
    { ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
    { ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};



// autostart
static const char *const autostart[] = {
    "slstatus", NULL,
    "telegram-desktop", NULL,
    NULL
};


