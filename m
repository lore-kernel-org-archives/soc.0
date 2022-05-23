Return-Path: <SRS0=08VO=V7=gmail.com=tmaimon77@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709C3C433F5
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 12:48:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 164C3C3411B; Mon, 23 May 2022 12:48:48 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48E91C385A9;
	Mon, 23 May 2022 12:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 48E91C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f181.google.com with SMTP id d137so25130318ybc.13;
        Mon, 23 May 2022 05:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a/urjkmC/y3sPxLOpMM9Ml0CRv2DFsj4EvmuBqXkpuY=;
        b=bCh3cEAjmcC+m2ti0/7RnPnAUtDEkbLdRXJvyNFNw1McqAnoUtWkQ/utBO/964vCd0
         8duHhBRwwLFcnAff30qWka/C3Nbq5zZyWCOrGA87vu+v+lAW+REOmBQwjw+jYNzbyucq
         S4h6RUG5KHUj7Tfs7XzXK2N6BmneSINMQtQ7vfmi6noa8rKTP6vs3vMNL3oBDTqbELky
         EvUSMjRA6w3vn6ZFQHU7SWGIt//4QXSNhNFhWPipdKT74Uv3kQm0+CLmQHbm0o9m17Zb
         iLLHTduteAzKaXd5z9WWCYRJUVpvCNuK+0nUDDH2kwPJtr4NhxeXJIavOzuB7YsUxQkw
         5PVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a/urjkmC/y3sPxLOpMM9Ml0CRv2DFsj4EvmuBqXkpuY=;
        b=5tVCBN2RU5OSBMUs10w6oADyiNfyQV+wSLRRvGh6gLT74KU41EiRPoM/4cTZKjZgVw
         sDJn7/Ki4we6o/U2DGj9cwzExoh74wVQQZELS++EkgL3jmqNBV1JMoDEEMdDxgi+6Khv
         T8zX1pJux6GXGXzZzX/7H6nxoqzLQ5+Z9iPaFmrSvy7fBiCmbALfNbdhJ5LRpBgcboBo
         CoHurJns5ViOMGwuASEhuOemIjmn7i9Sx0mnGt2ne8vtaX2QET90nZYs1m/vvdmCCrB/
         Dh3aeU8fbdxGhC0CGxfuTd3V4D/oAstqj7eAuvRkIiwpijrReP/C1rAvyDb9w4EtvKgL
         gwPA==
X-Gm-Message-State: AOAM531iUOc28+ipTywIu8VHczTt4qTcy1qRgWQZfCJVES+L8DT+CTud
	+2VU+s4xB8iRvnxbJN23BNrWPZDrVhno+cjmLRA=
X-Google-Smtp-Source: ABdhPJybFcOI7X95xGKmOf4KchHFP40LmATvmZIS1e48jn2pvY3d8DWUi2dawWz6nQIAVx1WbZyGKCYisvF12k0QvEo=
X-Received: by 2002:a25:2c81:0:b0:64d:f21d:1fab with SMTP id
 s123-20020a252c81000000b0064df21d1fabmr21812968ybs.355.1653310125146; Mon, 23
 May 2022 05:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220522155046.260146-1-tmaimon77@gmail.com> <20220522155046.260146-9-tmaimon77@gmail.com>
 <6fa3d94c-294d-1c6c-5738-6d15b2e17e90@linux.intel.com>
In-Reply-To: <6fa3d94c-294d-1c6c-5738-6d15b2e17e90@linux.intel.com>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Mon, 23 May 2022 15:48:34 +0300
Message-ID: <CAP6Zq1g2sbJbjRTvOTPEmDm2ZpWc511RR6Swi3FSUZ8BQZy_FA@mail.gmail.com>
Subject: Re: [PATCH v1 08/19] clk: npcm8xx: add clock controller
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Avi Fishman <avifishman70@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Joel Stanley <joel@jms.id.au>, Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh+dt@kernel.org>, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	Philipp Zabel <p.zabel@pengutronix.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, catalin.marinas@arm.com, 
	will@kernel.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Jiri Slaby <jirislaby@kernel.org>, shawnguo@kernel.org, bjorn.andersson@linaro.org, 
	geert+renesas@glider.be, marcel.ziswiler@toradex.com, 
	Vinod Koul <vkoul@kernel.org>, biju.das.jz@bp.renesas.com, 
	nobuhiro1.iwamatsu@toshiba.co.jp, robert.hancock@calian.com, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, lkundrak@v3.sk, 
	soc@kernel.org, devicetree <devicetree@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org, 
	linux-serial <linux-serial@vger.kernel.org>, linux-watchdog@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/alternative; boundary="000000000000b6847e05dfad428a"

--000000000000b6847e05dfad428a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ilpo,

Thanks for your comments.

the patch will modify according to your comments and will be sent in the
next kernel revision 5.19.rc1

On Mon, 23 May 2022 at 10:07, Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel=
.com>
wrote:

> On Sun, 22 May 2022, Tomer Maimon wrote:
>
> > Nuvoton Arbel BMC NPCM7XX contains an integrated clock controller, whic=
h
> > generates and supplies clocks to all modules within the BMC.
> >
> > Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
>
> > +static struct clk_hw *
> > +npcm8xx_clk_register_pll(void __iomem *pllcon, const char *name,
> > +                      const char *parent_name, unsigned long flags)
> > +{
> > +     struct npcm8xx_clk_pll *pll;
> > +     struct clk_init_data init;
> > +     struct clk_hw *hw;
> > +     int ret;
> > +
> > +     pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);
> > +     if (!pll)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     pr_debug("%s reg, name=3D%s, p=3D%s\n", __func__, name, parent_na=
me);
> > +
> > +     init.name =3D name;
> > +     init.ops =3D &npcm8xx_clk_pll_ops;
> > +     init.parent_names =3D &parent_name;
> > +     init.num_parents =3D 1;
> > +     init.flags =3D flags;
> > +
> > +     pll->pllcon =3D pllcon;
> > +     pll->hw.init =3D &init;
> > +
> > +     hw =3D &pll->hw;
> > +
> > +     ret =3D clk_hw_register(NULL, hw);
> > +     if (ret) {
> > +             kfree(pll);
> > +             hw =3D ERR_PTR(ret);
> > +     }
> > +
> > +     return hw;
> > +}
> > +
> > +#define NPCM8XX_CLKEN1          (0x00)
> > +#define NPCM8XX_CLKEN2          (0x28)
> > +#define NPCM8XX_CLKEN3          (0x30)
> > +#define NPCM8XX_CLKEN4          (0x70)
> > +#define NPCM8XX_CLKSEL          (0x04)
> > +#define NPCM8XX_CLKDIV1         (0x08)
> > +#define NPCM8XX_CLKDIV2         (0x2C)
> > +#define NPCM8XX_CLKDIV3         (0x58)
> > +#define NPCM8XX_CLKDIV4         (0x7C)
> > +#define NPCM8XX_PLLCON0         (0x0C)
> > +#define NPCM8XX_PLLCON1         (0x10)
> > +#define NPCM8XX_PLLCON2         (0x54)
> > +#define NPCM8XX_SWRSTR          (0x14)
> > +#define NPCM8XX_IRQWAKECON      (0x18)
> > +#define NPCM8XX_IRQWAKEFLAG     (0x1C)
> > +#define NPCM8XX_IPSRST1         (0x20)
> > +#define NPCM8XX_IPSRST2         (0x24)
> > +#define NPCM8XX_IPSRST3         (0x34)
> > +#define NPCM8XX_WD0RCR          (0x38)
> > +#define NPCM8XX_WD1RCR          (0x3C)
> > +#define NPCM8XX_WD2RCR          (0x40)
> > +#define NPCM8XX_SWRSTC1         (0x44)
> > +#define NPCM8XX_SWRSTC2         (0x48)
> > +#define NPCM8XX_SWRSTC3         (0x4C)
> > +#define NPCM8XX_SWRSTC4         (0x50)
> > +#define NPCM8XX_CORSTC          (0x5C)
> > +#define NPCM8XX_PLLCONG         (0x60)
> > +#define NPCM8XX_AHBCKFI         (0x64)
> > +#define NPCM8XX_SECCNT          (0x68)
> > +#define NPCM8XX_CNTR25M         (0x6C)
> > +#define NPCM8XX_THRTL_CNT       (0xC0)
> > +
> > +struct npcm8xx_clk_gate_data {
> > +     u32 reg;
> > +     u8 bit_idx;
> > +     const char *name;
> > +     const char *parent_name;
> > +     unsigned long flags;
> > +     /*
> > +      * If this clock is exported via DT, set onecell_idx to constant
> > +      * defined in include/dt-bindings/clock/nuvoton, NPCM8XX-clock.h
> for
> > +      * this specific clock.  Otherwise, set to -1.
> > +      */
> > +     int onecell_idx;
> > +};
> > +
> > +struct npcm8xx_clk_mux_data {
> > +     u8 shift;
> > +     u8 mask;
> > +     u32 *table;
> > +     const char *name;
> > +     const char * const *parent_names;
> > +     u8 num_parents;
> > +     unsigned long flags;
> > +     /*
> > +      * If this clock is exported via DT, set onecell_idx to constant
> > +      * defined in include/dt-bindings/clock/nuvoton, NPCM8XX-clock.h
> for
> > +      * this specific clock.  Otherwise, set to -1.
> > +      */
> > +     int onecell_idx;
> > +
> > +};
> > +
> > +struct npcm8xx_clk_div_fixed_data {
> > +     u8 mult;
> > +     u8 div;
> > +     const char *name;
> > +     const char *parent_name;
> > +     u8 clk_divider_flags;
> > +     /*
> > +      * If this clock is exported via DT, set onecell_idx to constant
> > +      * defined in include/dt-bindings/clock/nuvoton, NPCM8XX-clock.h
> for
> > +      * this specific clock.  Otherwise, set to -1.
> > +      */
> > +     int onecell_idx;
> > +};
> > +
> > +struct npcm8xx_clk_div_data {
> > +     u32 reg;
> > +     u8 shift;
> > +     u8 width;
> > +     const char *name;
> > +     const char *parent_name;
> > +     u8 clk_divider_flags;
> > +     unsigned long flags;
> > +     /*
> > +      * If this clock is exported via DT, set onecell_idx to constant
> > +      * defined in include/dt-bindings/clock/nuvoton, NPCM8XX-clock.h
> for
> > +      * this specific clock.  Otherwise, set to -1.
> > +      */
> > +     int onecell_idx;
> > +};
> > +
> > +struct npcm8xx_clk_pll_data {
> > +     u32 reg;
> > +     const char *name;
> > +     const char *parent_name;
> > +     unsigned long flags;
> > +     /*
> > +      * If this clock is exported via DT, set onecell_idx to constant
> > +      * defined in include/dt-bindings/clock/nuvoton, NPCM8XX-clock.h
> for
> > +      * this specific clock.  Otherwise, set to -1.
> > +      */
> > +     int onecell_idx;
> > +};
> > +
>
>
> > +/*
> > + * Single copy of strings used to refer to clocks within this driver
> indexed by
> > + * above enum.
> > + */
> > +#define NPCM8XX_CLK_S_REFCLK      "refclk"
> > +#define NPCM8XX_CLK_S_SYSBYPCK    "sysbypck"
> > +#define NPCM8XX_CLK_S_MCBYPCK     "mcbypck"
> > +#define NPCM8XX_CLK_S_GFXBYPCK    "gfxbypck"
> > +#define NPCM8XX_CLK_S_PLL0        "pll0"
> > +#define NPCM8XX_CLK_S_PLL1        "pll1"
> > +#define NPCM8XX_CLK_S_PLL1_DIV2   "pll1_div2"
> > +#define NPCM8XX_CLK_S_PLL2        "pll2"
> > +#define NPCM8XX_CLK_S_PLL_GFX     "pll_gfx"
> > +#define NPCM8XX_CLK_S_PLL2_DIV2   "pll2_div2"
> > +#define NPCM8XX_CLK_S_PIX_MUX     "gfx_pixel"
> > +#define NPCM8XX_CLK_S_GPRFSEL_MUX "gprfsel_mux"
> > +#define NPCM8XX_CLK_S_MC_MUX      "mc_phy"
> > +#define NPCM8XX_CLK_S_CPU_MUX     "cpu"  /*AKA system clock.*/
>
> Add spaces around comment.
>
> > +#define NPCM8XX_CLK_S_MC          "mc"
> > +#define NPCM8XX_CLK_S_AXI         "axi"  /*AKA CLK2*/
> > +#define NPCM8XX_CLK_S_AHB         "ahb"  /*AKA CLK4*/
>
> Ditto.
>
> > +static void __init npcm8xx_clk_init(struct device_node *clk_np)
> > +{
> > +     struct clk_hw_onecell_data *npcm8xx_clk_data;
> > +     void __iomem *clk_base;
> > +     struct resource res;
> > +     struct clk_hw *hw;
> > +     int ret;
> > +     int i;
> > +
> > +     ret =3D of_address_to_resource(clk_np, 0, &res);
> > +     if (ret) {
> > +             pr_err("%pOFn: failed to get resource, ret %d\n", clk_np,
> ret);
> > +             return;
> > +     }
> > +
> > +     clk_base =3D ioremap(res.start, resource_size(&res));
> > +     if (!clk_base)
> > +             goto npcm8xx_init_error;
> > +
> > +     npcm8xx_clk_data =3D kzalloc(struct_size(npcm8xx_clk_data, hws,
> > +                                            NPCM8XX_NUM_CLOCKS),
> GFP_KERNEL);
> > +     if (!npcm8xx_clk_data)
> > +             goto npcm8xx_init_np_err;
> > +
> > +     npcm8xx_clk_data->num =3D NPCM8XX_NUM_CLOCKS;
> > +
> > +     for (i =3D 0; i < NPCM8XX_NUM_CLOCKS; i++)
> > +             npcm8xx_clk_data->hws[i] =3D ERR_PTR(-EPROBE_DEFER);
> > +
> > +     /* Register plls */
> > +     for (i =3D 0; i < ARRAY_SIZE(npcm8xx_plls); i++) {
> > +             const struct npcm8xx_clk_pll_data *pll_data =3D
> &npcm8xx_plls[i];
> > +
> > +             hw =3D npcm8xx_clk_register_pll(clk_base + pll_data->reg,
> > +                                           pll_data->name,
> > +                                           pll_data->parent_name,
> > +                                           pll_data->flags);
> > +             if (IS_ERR(hw)) {
>
> Who deregisters the already registered plls on error paths?
>
> You might want to consider devm_ variants in npcm8xx_clk_register_pll() t=
o
> make the cleanup simpler.
>
> Please check the other error path rollbacks from this point onward too.


> > +                     pr_err("npcm8xx_clk: Can't register pll\n");
> > +                     goto npcm8xx_init_fail;
> > +             }
> > +
> > +             if (pll_data->onecell_idx >=3D 0)
> > +                     npcm8xx_clk_data->hws[pll_data->onecell_idx] =3D =
hw;
> > +     }
> > +
> > +     /* Register fixed dividers */
> > +     hw =3D clk_hw_register_fixed_factor(NULL, NPCM8XX_CLK_S_PLL1_DIV2=
,
> > +                                       NPCM8XX_CLK_S_PLL1, 0, 1, 2);
> > +     if (IS_ERR(hw)) {
> > +             pr_err("npcm8xx_clk: Can't register fixed div\n");
> > +             goto npcm8xx_init_fail;
> > +     }
> > +
> > +     hw =3D clk_hw_register_fixed_factor(NULL, NPCM8XX_CLK_S_PLL2_DIV2=
,
> > +                                       NPCM8XX_CLK_S_PLL2, 0, 1, 2);
> > +     if (IS_ERR(hw)) {
> > +             pr_err("npcm8xx_clk: Can't register pll div2\n");
> > +             goto npcm8xx_init_fail;
> > +     }
> > +
> > +     hw =3D clk_hw_register_fixed_factor(NULL, NPCM8XX_CLK_S_PRE_CLK,
> > +                                       NPCM8XX_CLK_S_CPU_MUX, 0, 1, 2)=
;
> > +     if (IS_ERR(hw)) {
> > +             pr_err("npcm8xx_clk: Can't register ckclk div2\n");
> > +             goto npcm8xx_init_fail;
> > +     }
> > +
> > +     hw =3D clk_hw_register_fixed_factor(NULL, NPCM8XX_CLK_S_AXI,
> > +                                       NPCM8XX_CLK_S_TH, 0, 1, 2);
> > +     if (IS_ERR(hw)) {
> > +             pr_err("npcm8xx_clk: Can't register axi div2\n");
> > +             goto npcm8xx_init_fail;
> > +     }
> > +
> > +     hw =3D clk_hw_register_fixed_factor(NULL, NPCM8XX_CLK_S_ATB,
> > +                                       NPCM8XX_CLK_S_AXI, 0, 1, 2);
> > +     if (IS_ERR(hw)) {
> > +             pr_err("npcm8xx_clk: Can't register atb div2\n");
> > +             goto npcm8xx_init_fail;
> > +     }
> > +
> > +     /* Register muxes */
> > +     for (i =3D 0; i < ARRAY_SIZE(npcm8xx_muxes); i++) {
> > +             const struct npcm8xx_clk_mux_data *mux_data =3D
> &npcm8xx_muxes[i];
> > +
> > +             hw =3D clk_hw_register_mux_table(NULL, mux_data->name,
> > +                                            mux_data->parent_names,
> > +                                            mux_data->num_parents,
> > +                                            mux_data->flags,
> > +                                            clk_base + NPCM8XX_CLKSEL,
> > +                                            mux_data->shift,
> > +                                            mux_data->mask, 0,
> > +                                            mux_data->table,
> > +                                            &npcm8xx_clk_lock);
> > +
> > +             if (IS_ERR(hw)) {
> > +                     pr_err("npcm8xx_clk: Can't register mux\n");
> > +                     goto npcm8xx_init_fail;
> > +             }
> > +
> > +             if (mux_data->onecell_idx >=3D 0)
> > +                     npcm8xx_clk_data->hws[mux_data->onecell_idx] =3D =
hw;
> > +     }
> > +
> > +     /* Register clock dividers specified in npcm8xx_divs */
> > +     for (i =3D 0; i < ARRAY_SIZE(npcm8xx_divs); i++) {
> > +             const struct npcm8xx_clk_div_data *div_data =3D
> &npcm8xx_divs[i];
> > +
> > +             hw =3D clk_hw_register_divider(NULL, div_data->name,
> > +                                          div_data->parent_name,
> > +                                          div_data->flags,
> > +                                          clk_base + div_data->reg,
> > +                                          div_data->shift,
> div_data->width,
> > +                                          div_data->clk_divider_flags,
> > +                                          &npcm8xx_clk_lock);
> > +             if (IS_ERR(hw)) {
> > +                     pr_err("npcm8xx_clk: Can't register div table\n")=
;
> > +                     goto npcm8xx_init_fail;
> > +             }
> > +
> > +             if (div_data->onecell_idx >=3D 0)
> > +                     npcm8xx_clk_data->hws[div_data->onecell_idx] =3D =
hw;
> > +     }
> > +
> > +     ret =3D of_clk_add_hw_provider(clk_np, of_clk_hw_onecell_get,
> > +                                  npcm8xx_clk_data);
> > +     if (ret)
> > +             pr_err("failed to add DT provider: %d\n", ret);
> > +
> > +     of_node_put(clk_np);
> > +
> > +     return;
> > +
> > +npcm8xx_init_fail:
> > +     kfree(npcm8xx_clk_data->hws);
> > +npcm8xx_init_np_err:
> > +     iounmap(clk_base);
> > +npcm8xx_init_error:
> > +     of_node_put(clk_np);
> > +}
> > +
> > +CLK_OF_DECLARE(npcm8xx_clk_init, "nuvoton,npcm845-clk",
> npcm8xx_clk_init);
> >
>
> --
>  i.
>
>
Best regards,

Tomer

--000000000000b6847e05dfad428a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Ilpo,</div><div dir=3D"ltr"><br><=
/div><div dir=3D"ltr">Thanks for your comments.</div><div dir=3D"ltr"><br><=
/div><div dir=3D"ltr">the patch will=C2=A0modify according to your comments=
 and will be sent in the next kernel revision 5.19.rc1</div><div><br></div>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 23=
 May 2022 at 10:07, Ilpo J=C3=A4rvinen &lt;<a href=3D"mailto:ilpo.jarvinen@=
linux.intel.com" target=3D"_blank">ilpo.jarvinen@linux.intel.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Sun, 22 =
May 2022, Tomer Maimon wrote:<br>
<br>
&gt; Nuvoton Arbel BMC NPCM7XX contains an integrated clock controller, whi=
ch<br>
&gt; generates and supplies clocks to all modules within the BMC.<br>
&gt; <br>
&gt; Signed-off-by: Tomer Maimon &lt;<a href=3D"mailto:tmaimon77@gmail.com"=
 target=3D"_blank">tmaimon77@gmail.com</a>&gt;<br>
<br>
&gt; +static struct clk_hw *<br>
&gt; +npcm8xx_clk_register_pll(void __iomem *pllcon, const char *name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 const char *parent_name, unsigned long flags)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct npcm8xx_clk_pll *pll;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk_init_data init;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk_hw *hw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pll =3D kzalloc(sizeof(*pll), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!pll)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ERR_PTR(-ENOME=
M);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pr_debug(&quot;%s reg, name=3D%s, p=3D%s\n&quot;,=
 __func__, name, parent_name);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0<a href=3D"http://init.name" rel=3D"noreferrer" t=
arget=3D"_blank">init.name</a> =3D name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0init.ops =3D &amp;npcm8xx_clk_pll_ops;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0init.parent_names =3D &amp;parent_name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0init.num_parents =3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0init.flags =3D flags;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pll-&gt;pllcon =3D pllcon;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0pll-&gt;hw.init =3D &amp;init;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hw =3D &amp;pll-&gt;hw;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D clk_hw_register(NULL, hw);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(pll);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D ERR_PTR(ret);<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return hw;<br>
&gt; +}<br>
&gt; +<br>
&gt; +#define NPCM8XX_CLKEN1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x00)<br>
&gt; +#define NPCM8XX_CLKEN2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x28)<br>
&gt; +#define NPCM8XX_CLKEN3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x30)<br>
&gt; +#define NPCM8XX_CLKEN4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x70)<br>
&gt; +#define NPCM8XX_CLKSEL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x04)<br>
&gt; +#define NPCM8XX_CLKDIV1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x08)<br>
&gt; +#define NPCM8XX_CLKDIV2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x2C)<br>
&gt; +#define NPCM8XX_CLKDIV3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x58)<br>
&gt; +#define NPCM8XX_CLKDIV4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x7C)<br>
&gt; +#define NPCM8XX_PLLCON0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x0C)<br>
&gt; +#define NPCM8XX_PLLCON1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x10)<br>
&gt; +#define NPCM8XX_PLLCON2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x54)<br>
&gt; +#define NPCM8XX_SWRSTR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x14)<br>
&gt; +#define NPCM8XX_IRQWAKECON=C2=A0 =C2=A0 =C2=A0 (0x18)<br>
&gt; +#define NPCM8XX_IRQWAKEFLAG=C2=A0 =C2=A0 =C2=A0(0x1C)<br>
&gt; +#define NPCM8XX_IPSRST1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x20)<br>
&gt; +#define NPCM8XX_IPSRST2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x24)<br>
&gt; +#define NPCM8XX_IPSRST3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x34)<br>
&gt; +#define NPCM8XX_WD0RCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x38)<br>
&gt; +#define NPCM8XX_WD1RCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x3C)<br>
&gt; +#define NPCM8XX_WD2RCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x40)<br>
&gt; +#define NPCM8XX_SWRSTC1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x44)<br>
&gt; +#define NPCM8XX_SWRSTC2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x48)<br>
&gt; +#define NPCM8XX_SWRSTC3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x4C)<br>
&gt; +#define NPCM8XX_SWRSTC4=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x50)<br>
&gt; +#define NPCM8XX_CORSTC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x5C)<br>
&gt; +#define NPCM8XX_PLLCONG=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x60)<br>
&gt; +#define NPCM8XX_AHBCKFI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x64)<br>
&gt; +#define NPCM8XX_SECCNT=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x68)<br>
&gt; +#define NPCM8XX_CNTR25M=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x6C)<br>
&gt; +#define NPCM8XX_THRTL_CNT=C2=A0 =C2=A0 =C2=A0 =C2=A0(0xC0)<br>
&gt; +<br>
&gt; +struct npcm8xx_clk_gate_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 bit_idx;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *parent_name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set onecell_=
idx to constant<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * defined in include/dt-bindings/clock/nuvoton, =
NPCM8XX-clock.h for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, set to -=
1.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int onecell_idx;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct npcm8xx_clk_mux_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 shift;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 mask;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 *table;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char * const *parent_names;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 num_parents;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set onecell_=
idx to constant<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * defined in include/dt-bindings/clock/nuvoton, =
NPCM8XX-clock.h for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, set to -=
1.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int onecell_idx;<br>
&gt; +<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct npcm8xx_clk_div_fixed_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 mult;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 div;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *parent_name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 clk_divider_flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set onecell_=
idx to constant<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * defined in include/dt-bindings/clock/nuvoton, =
NPCM8XX-clock.h for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, set to -=
1.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int onecell_idx;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct npcm8xx_clk_div_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 shift;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 width;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *parent_name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u8 clk_divider_flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set onecell_=
idx to constant<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * defined in include/dt-bindings/clock/nuvoton, =
NPCM8XX-clock.h for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, set to -=
1.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int onecell_idx;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct npcm8xx_clk_pll_data {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u32 reg;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0const char *parent_name;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0unsigned long flags;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * If this clock is exported via DT, set onecell_=
idx to constant<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * defined in include/dt-bindings/clock/nuvoton, =
NPCM8XX-clock.h for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * this specific clock.=C2=A0 Otherwise, set to -=
1.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int onecell_idx;<br>
&gt; +};<br>
&gt; +<br>
<br>
<br>
&gt; +/*<br>
&gt; + * Single copy of strings used to refer to clocks within this driver =
indexed by<br>
&gt; + * above enum.<br>
&gt; + */<br>
&gt; +#define NPCM8XX_CLK_S_REFCLK=C2=A0 =C2=A0 =C2=A0 &quot;refclk&quot;<b=
r>
&gt; +#define NPCM8XX_CLK_S_SYSBYPCK=C2=A0 =C2=A0 &quot;sysbypck&quot;<br>
&gt; +#define NPCM8XX_CLK_S_MCBYPCK=C2=A0 =C2=A0 =C2=A0&quot;mcbypck&quot;<=
br>
&gt; +#define NPCM8XX_CLK_S_GFXBYPCK=C2=A0 =C2=A0 &quot;gfxbypck&quot;<br>
&gt; +#define NPCM8XX_CLK_S_PLL0=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pll0&quot=
;<br>
&gt; +#define NPCM8XX_CLK_S_PLL1=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pll1&quot=
;<br>
&gt; +#define NPCM8XX_CLK_S_PLL1_DIV2=C2=A0 =C2=A0&quot;pll1_div2&quot;<br>
&gt; +#define NPCM8XX_CLK_S_PLL2=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;pll2&quot=
;<br>
&gt; +#define NPCM8XX_CLK_S_PLL_GFX=C2=A0 =C2=A0 =C2=A0&quot;pll_gfx&quot;<=
br>
&gt; +#define NPCM8XX_CLK_S_PLL2_DIV2=C2=A0 =C2=A0&quot;pll2_div2&quot;<br>
&gt; +#define NPCM8XX_CLK_S_PIX_MUX=C2=A0 =C2=A0 =C2=A0&quot;gfx_pixel&quot=
;<br>
&gt; +#define NPCM8XX_CLK_S_GPRFSEL_MUX &quot;gprfsel_mux&quot;<br>
&gt; +#define NPCM8XX_CLK_S_MC_MUX=C2=A0 =C2=A0 =C2=A0 &quot;mc_phy&quot;<b=
r>
&gt; +#define NPCM8XX_CLK_S_CPU_MUX=C2=A0 =C2=A0 =C2=A0&quot;cpu&quot;=C2=
=A0 /*AKA system clock.*/<br>
<br>
Add spaces around comment.<br>
<br>
&gt; +#define NPCM8XX_CLK_S_MC=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;mc&q=
uot;<br>
&gt; +#define NPCM8XX_CLK_S_AXI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;axi&=
quot;=C2=A0 /*AKA CLK2*/<br>
&gt; +#define NPCM8XX_CLK_S_AHB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;ahb&=
quot;=C2=A0 /*AKA CLK4*/<br>
<br>
Ditto.<br>
<br>
&gt; +static void __init npcm8xx_clk_init(struct device_node *clk_np)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk_hw_onecell_data *npcm8xx_clk_data;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0void __iomem *clk_base;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct resource res;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0struct clk_hw *hw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int ret;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int i;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_address_to_resource(clk_np, 0, &amp;re=
s);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;%pOFn: f=
ailed to get resource, ret %d\n&quot;, clk_np, ret);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0clk_base =3D ioremap(res.start, resource_size(&am=
p;res));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!clk_base)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm8xx_init_err=
or;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0npcm8xx_clk_data =3D kzalloc(struct_size(npcm8xx_=
clk_data, hws,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 NPCM8XX_NUM_CLOCKS), GFP_KERNEL);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (!npcm8xx_clk_data)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm8xx_init_np_=
err;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0npcm8xx_clk_data-&gt;num =3D NPCM8XX_NUM_CLOCKS;<=
br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; NPCM8XX_NUM_CLOCKS; i++)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0npcm8xx_clk_data-&gt;=
hws[i] =3D ERR_PTR(-EPROBE_DEFER);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Register plls */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(npcm8xx_plls); i+=
+) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct npcm8xx_=
clk_pll_data *pll_data =3D &amp;npcm8xx_plls[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D npcm8xx_clk_re=
gister_pll(clk_base + pll_data-&gt;reg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pll_data-&gt;name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pll_data-&gt;parent_name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0pll_data-&gt;flags);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)) {<br>
<br>
Who deregisters the already registered plls on error paths?<br>
<br>
You might want to consider devm_ variants in npcm8xx_clk_register_pll() to =
<br>
make the cleanup simpler.<br>
<br>
Please check the other error path rollbacks from this point onward too.=C2=
=A0</blockquote><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pr_err(&quot;npcm8xx_clk: Can&#39;t register pll\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto npcm8xx_init_fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (pll_data-&gt;onec=
ell_idx &gt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0npcm8xx_clk_data-&gt;hws[pll_data-&gt;onecell_idx] =3D hw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Register fixed dividers */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_factor(NULL, NPCM8XX=
_CLK_S_PLL1_DIV2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM8=
XX_CLK_S_PLL1, 0, 1, 2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;npcm8xx_=
clk: Can&#39;t register fixed div\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm8xx_init_fai=
l;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_factor(NULL, NPCM8XX=
_CLK_S_PLL2_DIV2,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM8=
XX_CLK_S_PLL2, 0, 1, 2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;npcm8xx_=
clk: Can&#39;t register pll div2\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm8xx_init_fai=
l;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_factor(NULL, NPCM8XX=
_CLK_S_PRE_CLK,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM8=
XX_CLK_S_CPU_MUX, 0, 1, 2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;npcm8xx_=
clk: Can&#39;t register ckclk div2\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm8xx_init_fai=
l;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_factor(NULL, NPCM8XX=
_CLK_S_AXI,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM8=
XX_CLK_S_TH, 0, 1, 2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;npcm8xx_=
clk: Can&#39;t register axi div2\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm8xx_init_fai=
l;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_register_fixed_factor(NULL, NPCM8XX=
_CLK_S_ATB,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NPCM8=
XX_CLK_S_AXI, 0, 1, 2);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;npcm8xx_=
clk: Can&#39;t register atb div2\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto npcm8xx_init_fai=
l;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Register muxes */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(npcm8xx_muxes); i=
++) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct npcm8xx_=
clk_mux_data *mux_data =3D &amp;npcm8xx_muxes[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_registe=
r_mux_table(NULL, mux_data-&gt;name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mux_data-&gt;parent_names,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mux_data-&gt;num_parents,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mux_data-&gt;flags,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 clk_base + NPCM8XX_CLKSEL,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mux_data-&gt;shift,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mux_data-&gt;mask, 0,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 mux_data-&gt;table,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &amp;npcm8xx_clk_lock);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pr_err(&quot;npcm8xx_clk: Can&#39;t register mux\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto npcm8xx_init_fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (mux_data-&gt;onec=
ell_idx &gt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0npcm8xx_clk_data-&gt;hws[mux_data-&gt;onecell_idx] =3D hw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/* Register clock dividers specified in npcm8xx_d=
ivs */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (i =3D 0; i &lt; ARRAY_SIZE(npcm8xx_divs); i+=
+) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct npcm8xx_=
clk_div_data *div_data =3D &amp;npcm8xx_divs[i];<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0hw =3D clk_hw_registe=
r_divider(NULL, div_data-&gt;name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 div_data-&gt;parent_name,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 div_data-&gt;flags,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 clk_base + div_data-&gt;reg,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 div_data-&gt;shift, div_data-&gt;width,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 div_data-&gt;clk_divider_flags,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;npcm8xx_clk_lock);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(hw)) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0pr_err(&quot;npcm8xx_clk: Can&#39;t register div table\n&quot;);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0goto npcm8xx_init_fail;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (div_data-&gt;onec=
ell_idx &gt;=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0npcm8xx_clk_data-&gt;hws[div_data-&gt;onecell_idx] =3D hw;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0ret =3D of_clk_add_hw_provider(clk_np, of_clk_hw_=
onecell_get,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 npcm8xx_clk_data);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if (ret)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;failed t=
o add DT provider: %d\n&quot;, ret);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0of_node_put(clk_np);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return;<br>
&gt; +<br>
&gt; +npcm8xx_init_fail:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0kfree(npcm8xx_clk_data-&gt;hws);<br>
&gt; +npcm8xx_init_np_err:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0iounmap(clk_base);<br>
&gt; +npcm8xx_init_error:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0of_node_put(clk_np);<br>
&gt; +}<br>
&gt; +<br>
&gt; +CLK_OF_DECLARE(npcm8xx_clk_init, &quot;nuvoton,npcm845-clk&quot;, npc=
m8xx_clk_init);<br>
&gt; <br>
<br>
-- <br>
=C2=A0i.<br>
<br></blockquote><div><br></div><div>Best regards,</div><div><br></div><div=
>Tomer=C2=A0</div></div>
</div>

--000000000000b6847e05dfad428a--
