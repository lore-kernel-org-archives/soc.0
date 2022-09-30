Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37774C433F5
	for <soc@archiver.kernel.org>; Fri, 30 Sep 2022 20:28:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE5B8C433D7; Fri, 30 Sep 2022 20:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4952C433D6;
	Fri, 30 Sep 2022 20:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664569699;
	bh=jejxPFfCUdcXRfn/R02eCU+x3ypBElkW4Q0Y4Tx7CFo=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=cTMxFbvTzINpIJmUmMspmGbc7glNRBUwS0VML8jz5uAO/WSeo7QjdfiXKgPn5Pg9b
	 OROQB+ACS1nS1PX5j3LJhMyP522t3s75u2dj9hQZtxvwZktxBnLKvrN9DN/cVFqzgr
	 aeZGffZg6zx9EdAgxIjqT36obMUSVnedX5htIZKqhWFe0UwB5WxQLhjhoIkHmN+8Gz
	 2ETbYKiXq8VibdeqQKmrZMfME6BiZfpdznaPTGf7XJuk69RlYE7DfJTxPss7cT/AEQ
	 V7Y+m4LZNkVOlXIIZdACq1Ve7AmxQD88R/tgtR7nkm8Qyq8yFlHVLOF3rFV774Bq7Z
	 KjBGUppgEV6fQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220901183343.3188903-9-Mr.Bossman075@gmail.com>
References: <20220901183343.3188903-1-Mr.Bossman075@gmail.com> <20220901183343.3188903-9-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v6 08/10] clk: imx: Add initial support for i.MXRT1170 clock driver
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de, marcel.ziswiler@toradex.com, tharvey@gateworks.com, leoyang.li@nxp.com, sebastian.reichel@collabora.com, cniedermaier@dh-electronics.com, Mr.Bossman075@gmail.com, clin@suse.com, giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
To: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
Date: Fri, 30 Sep 2022 13:28:17 -0700
User-Agent: alot/0.10
Message-Id: <20220930202819.C4952C433D6@smtp.kernel.org>

Quoting Jesse Taube (2022-09-01 11:33:41)
> Add clock driver support for i.MXRT1170.
>=20
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> ---
> V1 -> V2:
>  - Add slab.h and clock-provider.h
>  - Add spaces in `root_clocks`
>  - Expand and sort macro
>  - Move `clk_hw` structs to `clocks_probe`
>  - Remove of_irq.h
>  - Remove unused code/comments
> V2 -> V3:
>  - Expand root_clocks names array
>  - Remove root_clock_names enum
> V3 -> V4:
>  - Nothing done
> V4 -> V5:
>  - Use __imx_clk_hw_pllv3 to change power bit
> V5 -> V6:
>  - Nothing done
> ---
>  drivers/clk/imx/Kconfig         |   7 +
>  drivers/clk/imx/Makefile        |   1 +
>  drivers/clk/imx/clk-imxrt1170.c | 749 ++++++++++++++++++++++++++++++++
>  3 files changed, 757 insertions(+)
>  create mode 100644 drivers/clk/imx/clk-imxrt1170.c
>=20
> diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> index 25785ec9c276..704a7777af4f 100644
> --- a/drivers/clk/imx/Kconfig
> +++ b/drivers/clk/imx/Kconfig
> @@ -119,3 +119,10 @@ config CLK_IMXRT1050
>         select MXC_CLK
>         help
>             Build the driver for i.MXRT1050 CCM Clock Driver
> +
> +config CLK_IMXRT1170
> +       tristate "IMXRT1170 CCM Clock Driver"
> +       depends on SOC_IMXRT
> +       select MXC_CLK
> +       help
> +           Build the driver for i.MXRT1170 CCM Clock Driver
> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index 88b9b9285d22..d607a6d8138a 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -52,4 +52,5 @@ obj-$(CONFIG_CLK_IMX6UL) +=3D clk-imx6ul.o
>  obj-$(CONFIG_CLK_IMX7D)  +=3D clk-imx7d.o
>  obj-$(CONFIG_CLK_IMX7ULP) +=3D clk-imx7ulp.o
>  obj-$(CONFIG_CLK_IMXRT1050)  +=3D clk-imxrt1050.o
> +obj-$(CONFIG_CLK_IMXRT1170)  +=3D clk-imxrt1170.o
>  obj-$(CONFIG_CLK_VF610)  +=3D clk-vf610.o
> diff --git a/drivers/clk/imx/clk-imxrt1170.c b/drivers/clk/imx/clk-imxrt1=
170.c
> new file mode 100644
> index 000000000000..71d9aacf9751
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imxrt1170.c
> @@ -0,0 +1,749 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2022
> + * Author(s):
> + * Jesse Taube <Mr.Bossman075@gmail.com>
> + */
> +#include <linux/clk.h>

Please don't include clk.h unless you use consumer clk APIs. Doesn't
look like it is used here?

> +#include <linux/of_address.h>
> +#include <linux/slab.h>
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>

Sorting alphabetically is nice.

> +#include <dt-bindings/clock/imxrt1170-clock.h>
> +
> +#include "clk.h"
> +
> +#define CLOCK_MUX_DEFAULT "rcosc48M_div2", "osc", "rcosc400M", "rcosc16M"
[...]
> +
> +static int imxrt1170_clocks_probe(struct platform_device *pdev)
> +{
> +       void __iomem *ccm_base;
> +       void __iomem *pll_base;
> +       struct clk_hw **hws;
> +       struct clk_hw_onecell_data *clk_hw_data;
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       struct device_node *anp;
> +       int ret;
> +
> +       clk_hw_data =3D kzalloc(struct_size(clk_hw_data, hws,
> +                                         IMXRT1170_CLK_END), GFP_KERNEL);
> +       if (WARN_ON(!clk_hw_data))
> +               return -ENOMEM;
> +
> +       clk_hw_data->num =3D IMXRT1170_CLK_END;
> +       hws =3D clk_hw_data->hws;
> +
> +       hws[IMXRT1170_CLK_OSC] =3D imx_obtain_fixed_clk_hw(np, "osc");
> +       hws[IMXRT1170_CLK_RCOSC_16M] =3D imx_obtain_fixed_clk_hw(np, "rco=
sc16M");
> +       hws[IMXRT1170_CLK_OSC_32K] =3D imx_obtain_fixed_clk_hw(np, "osc32=
k");
> +
> +       hws[IMXRT1170_CLK_RCOSC_48M] =3D imx_clk_hw_fixed_factor("rcosc48=
M",  "rcosc16M", 3, 1);
> +       hws[IMXRT1170_CLK_RCOSC_400M] =3D imx_clk_hw_fixed_factor("rcosc4=
00M",  "rcosc16M", 25, 1);
> +       hws[IMXRT1170_CLK_RCOSC_48M_DIV2] =3D imx_clk_hw_fixed_factor("rc=
osc48M_div2",  "rcosc48M", 1, 2);
> +
> +       anp =3D of_find_compatible_node(NULL, NULL, "fsl,imxrt-anatop");
> +       pll_base =3D of_iomap(anp, 0);
> +       of_node_put(anp);
> +       if (WARN_ON(!pll_base))
> +               return -ENOMEM;

The kzalloc() leaked.

> +
> +       /* Anatop clocks */
> +       hws[IMXRT1170_CLK_DUMMY] =3D imx_clk_hw_fixed("dummy", 0UL);
> +
> +       hws[IMXRT1170_CLK_PLL_ARM_PRE] =3D __imx_clk_hw_pllv3(IMX_PLLV3_S=
YSV2, "pll_arm_pre", "osc",
> +                                                           pll_base + 0x=
200, 0xff, 13);
> +       hws[IMXRT1170_CLK_PLL_ARM_BYPASS] =3D imx_clk_hw_mux("pll_arm_byp=
ass", pll_base + 0x200, 17,
> +                                                          1, pll_arm_mux=
, 2);
> +       hws[IMXRT1170_CLK_PLL_ARM_DIV] =3D clk_hw_register_divider_table(=
NULL, "pll_arm_div",
> +               "pll_arm_bypass", CLK_SET_RATE_PARENT | CLK_SET_RATE_GATE,
> +               pll_base + 0x200, 15, 2, 0, post_div_table, &imx_ccm_lock=
);
> +       hws[IMXRT1170_CLK_PLL_ARM] =3D imx_clk_hw_gate("pll_arm", "pll_ar=
m_div", pll_base + 0x200, 14);
> +
> +       hws[IMXRT1170_CLK_PLL3_PRE] =3D __imx_clk_hw_pllv3(IMX_PLLV3_GENE=
RICV2, "pll3_pre", "osc",
> +                                                        pll_base + 0x210=
, 0x1, 21);
> +       hws[IMXRT1170_CLK_PLL3_BYPASS] =3D imx_clk_hw_mux("pll3_bypass",
> +                                                       pll_base + 0x210,=
 16, 1, pll3_mux, 2);
> +       hws[IMXRT1170_CLK_PLL3] =3D imx_clk_hw_gate("pll3_sys", "pll3_byp=
ass", pll_base + 0x210, 13);
> +
> +       hws[IMXRT1170_CLK_PLL2_PRE] =3D __imx_clk_hw_pllv3(IMX_PLLV3_GENE=
RICV2, "pll2_pre", "osc",
> +                                                        pll_base + 0x240=
, 0x1, 23);
> +       hws[IMXRT1170_CLK_PLL2_BYPASS] =3D imx_clk_hw_mux("pll2_bypass",
> +                                                       pll_base + 0x240,=
 16, 1, pll2_mux, 2);
> +       hws[IMXRT1170_CLK_PLL2] =3D imx_clk_hw_gate("pll2_sys", "pll2_byp=
ass", pll_base + 0x240, 13);
> +
> +       hws[IMXRT1170_CLK_PLL3_PFD0] =3D imx_clk_hw_pfd("pll3_pfd0", "pll=
3_sys", pll_base + 0x230, 0);
> +       hws[IMXRT1170_CLK_PLL3_PFD1] =3D imx_clk_hw_pfd("pll3_pfd1", "pll=
3_sys", pll_base + 0x230, 1);
> +       hws[IMXRT1170_CLK_PLL3_PFD2] =3D imx_clk_hw_pfd("pll3_pfd2", "pll=
3_sys", pll_base + 0x230, 2);
> +       hws[IMXRT1170_CLK_PLL3_PFD3] =3D imx_clk_hw_pfd("pll3_pfd3", "pll=
3_sys", pll_base + 0x230, 3);
> +       hws[IMXRT1170_CLK_PLL3_DIV2_GATE] =3D imx_clk_hw_fixed_factor("pl=
l3_div2_gate", "pll3_sys", 1, 2);
> +       hws[IMXRT1170_CLK_PLL3_DIV2] =3D imx_clk_hw_gate("pll3_div2", "pl=
l3_sys", pll_base + 0x210, 3);
> +
> +       hws[IMXRT1170_CLK_PLL2_PFD0] =3D imx_clk_hw_pfd("pll2_pfd0", "pll=
2_sys", pll_base + 0x270, 0);
> +       hws[IMXRT1170_CLK_PLL2_PFD1] =3D imx_clk_hw_pfd("pll2_pfd1", "pll=
2_sys", pll_base + 0x270, 1);
> +       hws[IMXRT1170_CLK_PLL2_PFD2] =3D imx_clk_hw_pfd("pll2_pfd2", "pll=
2_sys", pll_base + 0x270, 2);
> +       hws[IMXRT1170_CLK_PLL2_PFD3] =3D imx_clk_hw_pfd("pll2_pfd3", "pll=
2_sys", pll_base + 0x270, 3);
> +
> +       /* CCM clocks */
> +       ccm_base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (WARN_ON(IS_ERR(ccm_base)))
> +               return PTR_ERR(ccm_base);
> +
> +       hws[IMXRT1170_CLK_M7_SEL] =3D imx_clk_hw_mux("m7_sel", ccm_base +=
 (1 * 0x80),
[....]
> +       hws[IMXRT1170_CLK_CSI2_UI] =3D imx_clk_hw_divider("csi2_ui", "csi=
2_ui_gate", ccm_base +
> +                                                       (76 * 0x80), 0, 8=
);
> +       hws[IMXRT1170_CLK_CSI] =3D imx_clk_hw_divider("csi", "csi_gate", =
ccm_base + (77 * 0x80), 0, 8);
> +       hws[IMXRT1170_CLK_CKO1] =3D imx_clk_hw_divider("cko1", "cko1_gate=
", ccm_base + (78 * 0x80), 0, 8);
> +       hws[IMXRT1170_CLK_CKO2] =3D imx_clk_hw_divider("cko2", "cko2_gate=
", ccm_base + (79 * 0x80), 0, 8);
> +
> +       hws[IMXRT1170_CLK_USB] =3D imx_clk_hw_gate("usb", "bus", ccm_base=
 + LPCG_GATE(115), 0);
> +
> +       imx_check_clk_hws(hws, IMXRT1170_CLK_END);
> +
> +       ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_=
data);

Use devm? Or implement a driver remove function?

> +       if (ret < 0) {
> +               dev_err(dev, "Failed to register clks for i.MXRT1170.\n");
> +               imx_unregister_hw_clocks(hws, IMXRT1170_CLK_END);
> +       }
> +       return ret;
> +}
> +
> +static const struct of_device_id imxrt1170_clk_of_match[] =3D {
> +       { .compatible =3D "fsl,imxrt1170-ccm" },
> +       { /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imxrt1170_clk_of_match);
> +
> +static struct platform_driver imxrt1170_clk_driver =3D {
> +       .probe =3D imxrt1170_clocks_probe,
> +       .driver =3D {
> +               .name =3D "imxrt1170-ccm",
> +               .of_match_table =3D imxrt1170_clk_of_match,
> +       },
