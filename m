Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C788C433F5
	for <soc@archiver.kernel.org>; Sat, 23 Apr 2022 03:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4FC39C385A9; Sat, 23 Apr 2022 03:03:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E85CC385A0;
	Sat, 23 Apr 2022 03:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650683011;
	bh=xraYrCISR1OxVB2XsBau8UCvomdxAg6MIQGb1MPBctg=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=dmixgK5bAwgADM5YT1dMWWtqxzB/bfXptDyqqBw8uhk5B0xCzfPbXicLGjSSzF9q9
	 Hjt43Iqjj8H40UEDVh8n1OOxsF1Tqh4SnxMz5pAbUNUEVdcwrdj2Zj/XCE6CjZkOCu
	 O0iiqDBKzSbWUQBw0/K0j1WxjphDyQ4mLyOrgPvycYLrS5ADiuO1GKGgpFZhwpLunZ
	 rgd+kG7uTTCZl9m/pRRIoHJMlEHgK8khCB9BhTJojj61spv8Q2jo2+b0iy3KcQdLEm
	 2bLAJTUYVWj8Psel3SH8iW3L8MYryIoZqWZfseS8gBuQRoHksddnO8YNhNhCsi8yaS
	 HVwld+5Z6Y1EA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220326144313.673549-9-Mr.Bossman075@gmail.com>
References: <20220326144313.673549-1-Mr.Bossman075@gmail.com> <20220326144313.673549-9-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v1 08/12] clk: imx: Add initial support for i.MXRT1170 clock driver
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de, marcel.ziswiler@toradex.com, tharvey@gateworks.com, leoyang.li@nxp.com, sebastian.reichel@collabora.com, cniedermaier@dh-electronics.com, Mr.Bossman075@gmail.com, clin@suse.com, giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
To: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
Date: Fri, 22 Apr 2022 20:03:29 -0700
User-Agent: alot/0.10
Message-Id: <20220423030331.0E85CC385A0@smtp.kernel.org>

Quoting Jesse Taube (2022-03-26 07:43:09)
> diff --git a/drivers/clk/imx/clk-imxrt1170.c b/drivers/clk/imx/clk-imxrt1=
170.c
> new file mode 100644
> index 000000000000..041aea3d4b02
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imxrt1170.c
> @@ -0,0 +1,391 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2022
> + * Author(s):
> + * Jesse Taube <Mr.Bossman075@gmail.com>
> + */
> +#include <linux/clk.h>
> +#include <linux/of_address.h>

Is this include used?

> +#include <linux/of_irq.h>

Is this include used?

> +#include <linux/platform_device.h>

Need to include clk-provider.h

> +#include <dt-bindings/clock/imxrt1170-clock.h>
> +
> +#include "clk.h"
> +
> +#define CLOCK_MUX_DEFAULT "rcosc48M_div2", "osc", "rcosc400M", "rcosc16M"
> +
> +#define LPCG_GATE(gate) (0x6000 + (gate * 0x20))
> +
> +#define DEF_CLOCK(flags, macro, name) \
> +do { \
> +       hws[macro##_SEL] =3D imx_clk_hw_mux(#name"_sel", ccm_base + (name=
 * 0x80), \
> +               8, 3, root_clocks[name], 8); \
> +       hws[macro##_GATE] =3D imx_clk_hw_gate_dis_flags(#name"_gate", #na=
me"_sel", \
> +               ccm_base + (name * 0x80), 24, flags); \
> +       hws[macro] =3D imx_clk_hw_divider(#name, #name"_gate", ccm_base +=
 (name * 0x80), 0, 8); \
> +} while (0)
> +
> +enum root_clock_names {
> +       m7,             /* root clock m7. */

Is the comment adding any value? It has the enum name after "root clock"
and the enum is "root_clock_names" so it looks very obvious.

> +       m4,             /* root clock m4. */
> +       bus,            /* root clock bus. */
> +       bus_lpsr,       /* root clock bus lpsr. */
[...]
> +       end,            /* root clock end. */
> +};
> +
> +static const char * const root_clocks[79][8] =3D {
> +       {CLOCK_MUX_DEFAULT, "pll_arm", "pll1_sys", "pll3_sys", "pll_video=
"},

Space after { and before }

> +       {CLOCK_MUX_DEFAULT, "pll3_pfd3", "pll3_sys", "pll2_sys", "pll1_di=
v5"},
> +       {CLOCK_MUX_DEFAULT, "pll3_sys", "pll1_div5", "pll2_sys", "pll2_pf=
d3"},
[...]
> +       {CLOCK_MUX_DEFAULT, "pll2_pfd3", "rcosc48M", "pll3_pfd1", "pll_au=
dio"}
> +};
> +
> +static const char * const pll_arm_mux[] =3D {"pll_arm_pre", "osc"};
> +static const char * const pll3_mux[] =3D {"pll3_pre", "osc"};
> +static const char * const pll2_mux[] =3D {"pll2_pre", "osc"};
> +
> +static const struct clk_div_table post_div_table[] =3D {
> +       { .val =3D 3, .div =3D 1, },
> +       { .val =3D 2, .div =3D 8, },
> +       { .val =3D 1, .div =3D 4, },
> +       { .val =3D 0, .div =3D 2, },
> +       { }
> +};
> +
> +static struct clk_hw **hws;
> +static struct clk_hw_onecell_data *clk_hw_data;

Do either of these need to be static global variables? They could be
local function pointers allocated on the heap (like they already are).

> +
> +static int imxrt1170_clocks_probe(struct platform_device *pdev)
> +{
[...]
> +       hws[IMXRT1170_CLK_PLL2_PFD3] =3D imx_clk_hw_pfd("pll2_pfd3", "pll=
2_sys", pll_base + 0x270, 3);
> +
> +       /* CCM clocks */
> +       ccm_base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (WARN_ON(IS_ERR(ccm_base)))
> +               return PTR_ERR(ccm_base);
> +
> +       DEF_CLOCK(CLK_IS_CRITICAL, IMXRT1170_CLK_M7, m7);

Don't have macros do things to variables that are in global scope. It
makes things very non-obvious. Instead, pass hw to the macro, or better
yet make a static inline function and let the compiler decide to inline
it or not.

> +       DEF_CLOCK(CLK_IS_CRITICAL, IMXRT1170_CLK_M4, m4);
[...]
> +       DEF_CLOCK(0, IMXRT1170_CLK_CSI2_UI, csi2_ui);
> +       DEF_CLOCK(0, IMXRT1170_CLK_CSI, csi);
> +       DEF_CLOCK(0, IMXRT1170_CLK_CKO1, cko1);
> +       DEF_CLOCK(0, IMXRT1170_CLK_CKO2, cko2);
> +
> +       hws[IMXRT1170_CLK_USB] =3D imx_clk_hw_gate("usb", "bus", ccm_base=
 + LPCG_GATE(115), 0);
> +
> +       clk_set_rate(hws[IMXRT1170_CLK_PLL_ARM]->clk, 90000000);

Use assigned-clock-rates?

> +
> +       imx_check_clk_hws(hws, IMXRT1170_CLK_END);
