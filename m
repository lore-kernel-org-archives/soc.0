Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDF2C433EF
	for <soc@archiver.kernel.org>; Wed,  5 Jan 2022 23:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B6F8BC36AEF; Wed,  5 Jan 2022 23:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED80C36AEB;
	Wed,  5 Jan 2022 23:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641426717;
	bh=YFDW9UwtIL/9v6egyqDAIIRuFmW3uKN/e4j5XwY72jY=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=LZoB4xjFMzbtcF951p+iKg7Avj/+wRZiYQkuJrxxfQaSjXJidl3n4ZEWGrwYMZtcE
	 k96lTj33Vc0RRuw5rOBf2ZyJ99y2m5bxigD+DCpUWD4fxd5QsrRwuvgzDiJVodvMrx
	 gov4clVNsIiY7eTS4EB8+cdh0lqblLgjgFdjnBEkH3X19BQBjL6nlXHNNtnYSA/7Nj
	 lgYe7ySiQcDdwgyfhtgfhjzK9USZndWkZUjV/ejr101YLNIZUVR1PeARVG5N4KjljD
	 exoDGjJ4sW+uFGOYAbwhteCRtS8zupQ8H2qroLHXubPgN/+WI1jYcW9OQi048jD72I
	 NyJd5d3s+hW1g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220103233948.198119-6-Mr.Bossman075@gmail.com>
References: <20220103233948.198119-1-Mr.Bossman075@gmail.com> <20220103233948.198119-6-Mr.Bossman075@gmail.com>
Subject: Re: [PATCH v7 5/7] clk: imx: Add initial support for i.MXRT1050 clock driver
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: mturquette@baylibre.com, robh+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, ulf.hansson@linaro.org, aisheng.dong@nxp.com, stefan@agner.ch, linus.walleij@linaro.org, gregkh@linuxfoundation.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk, abel.vesa@nxp.com, adrian.hunter@intel.com, jirislaby@kernel.org, giulio.benetti@benettiengineering.com, nobuhiro1.iwamatsu@toshiba.co.jp, Mr.Bossman075@gmail.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org
To: Jesse Taube <mr.bossman075@gmail.com>, linux-imx@nxp.com
Date: Wed, 05 Jan 2022 15:51:56 -0800
User-Agent: alot/0.9.1
Message-Id: <20220105235157.8ED80C36AEB@smtp.kernel.org>

Quoting Jesse Taube (2022-01-03 15:39:46)
> Add clock driver support for i.MXRT1050.
>=20
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>
> Suggested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

What is suggested by for a new driver?

> ---
> diff --git a/drivers/clk/imx/Kconfig b/drivers/clk/imx/Kconfig
> --- a/drivers/clk/imx/Kconfig
> +++ b/drivers/clk/imx/Kconfig
> @@ -105,3 +105,8 @@ config CLK_IMX8ULP
>         select MXC_CLK
>         help
>             Build the driver for i.MX8ULP CCM Clock Driver
> +
> +config CLK_IMXRT1050
> +       bool "IMXRT1050 CCM Clock Driver"
> +       depends on SOC_IMXRT
> +       select MXC_CLK

Please add some help text here.

> diff --git a/drivers/clk/imx/Makefile b/drivers/clk/imx/Makefile
> index b5e040026dfb..3d9a1e3b5fc6 100644
> --- a/drivers/clk/imx/Makefile
> +++ b/drivers/clk/imx/Makefile
> @@ -47,3 +47,4 @@ obj-$(CONFIG_CLK_IMX6UL) +=3D clk-imx6ul.o
>  obj-$(CONFIG_CLK_IMX7D)  +=3D clk-imx7d.o
>  obj-$(CONFIG_CLK_IMX7ULP) +=3D clk-imx7ulp.o
>  obj-$(CONFIG_CLK_VF610)  +=3D clk-vf610.o
> +obj-$(CONFIG_CLK_IMXRT1050)  +=3D clk-imxrt1050.o

Please keep this sorted, maybe on config symbol name?=20

> diff --git a/drivers/clk/imx/clk-imxrt1050.c b/drivers/clk/imx/clk-imxrt1=
050.c
> new file mode 100644
> index 000000000000..a2f0e8663030
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imxrt1050.c
> @@ -0,0 +1,181 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2021
> + * Author(s):
> + * Jesse Taube <Mr.Bossman075@gmail.com>
> + * Giulio Benetti <giulio.benetti@benettiengineering.com>
> + */
> +#include <linux/mm.h>
> +#include <linux/delay.h>
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/io.h>
> +#include <linux/clkdev.h>

Drop unused includes.

> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>

Used?

> +#include <linux/sizes.h>
> +#include <linux/platform_device.h>
> +#include <soc/imx/revision.h>

Is this used?

> +#include <dt-bindings/clock/imxrt1050-clock.h>
> +
> +#include "clk.h"
> +
> +static const char * const pll_ref_sels[] =3D {"osc", "dummy", };
> +static const char * const per_sels[] =3D {"ipg_pdof", "osc", };
> +static const char * const pll1_bypass_sels[] =3D {"pll1_arm", "pll1_arm_=
ref_sel", };
> +static const char * const pll2_bypass_sels[] =3D {"pll2_sys", "pll2_sys_=
ref_sel", };
> +static const char * const pll3_bypass_sels[] =3D {"pll3_usb_otg", "pll3_=
usb_otg_ref_sel", };
> +static const char * const pll5_bypass_sels[] =3D {"pll5_video", "pll5_vi=
deo_ref_sel", };
> +static const char *const pre_periph_sels[] =3D {
> +       "pll2_sys", "pll2_pfd2_396m", "pll2_pfd0_352m", "arm_podf", };
> +static const char *const periph_sels[] =3D { "pre_periph_sel", "todo", };
> +static const char *const usdhc_sels[] =3D { "pll2_pfd2_396m", "pll2_pfd0=
_352m", };
> +static const char *const lpuart_sels[] =3D { "pll3_80m", "osc", };
> +static const char *const lcdif_sels[] =3D {
> +       "pll2_sys", "pll3_pfd3_454_74m", "pll5_video", "pll2_pfd0_352m",
> +       "pll2_pfd1_594m", "pll3_pfd1_664_62m", };
> +static const char *const semc_alt_sels[] =3D { "pll2_pfd2_396m", "pll3_p=
fd1_664_62m", };
> +static const char *const semc_sels[] =3D { "periph_sel", "semc_alt_sel",=
 };

Any chance this can use clk_parent_data instead of string names for
parents?

> +
> +static struct clk_hw **hws;
> +static struct clk_hw_onecell_data *clk_hw_data;
> +
> +static void __init imxrt_clocks_common_init(void __iomem *base)

Drop __init and preferably inline this to the callsite.

> +{
> +       /* Anatop clocks */
> +       hws[IMXRT1050_CLK_DUMMY] =3D imx_clk_hw_fixed("dummy", 0UL);
> +
> +       hws[IMXRT1050_CLK_PLL1_REF_SEL] =3D imx_clk_hw_mux("pll1_arm_ref_=
sel",
> +               base + 0x0, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels)=
);
> +       hws[IMXRT1050_CLK_PLL2_REF_SEL] =3D imx_clk_hw_mux("pll2_sys_ref_=
sel",
> +               base + 0x30, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels=
));
> +       hws[IMXRT1050_CLK_PLL3_REF_SEL] =3D imx_clk_hw_mux("pll3_usb_otg_=
ref_sel",
> +               base + 0x10, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels=
));
> +       hws[IMXRT1050_CLK_PLL5_REF_SEL] =3D imx_clk_hw_mux("pll5_video_re=
f_sel",
> +               base + 0xa0, 14, 2, pll_ref_sels, ARRAY_SIZE(pll_ref_sels=
));
> +
> +       hws[IMXRT1050_CLK_PLL1_ARM] =3D imx_clk_hw_pllv3(IMX_PLLV3_SYS, "=
pll1_arm",
> +               "pll1_arm_ref_sel", base + 0x0, 0x7f);
> +       hws[IMXRT1050_CLK_PLL2_SYS] =3D imx_clk_hw_pllv3(IMX_PLLV3_GENERI=
C, "pll2_sys",
> +               "pll2_sys_ref_sel", base + 0x30, 0x1);
> +       hws[IMXRT1050_CLK_PLL3_USB_OTG] =3D imx_clk_hw_pllv3(IMX_PLLV3_US=
B, "pll3_usb_otg",
> +               "pll3_usb_otg_ref_sel", base + 0x10, 0x1);
> +       hws[IMXRT1050_CLK_PLL5_VIDEO] =3D imx_clk_hw_pllv3(IMX_PLLV3_AV, =
"pll5_video",
> +               "pll5_video_ref_sel", base + 0xa0, 0x7f);
> +
> +       /* PLL bypass out */
> +       hws[IMXRT1050_CLK_PLL1_BYPASS] =3D imx_clk_hw_mux_flags("pll1_byp=
ass", base + 0x0, 16, 1,
> +               pll1_bypass_sels, ARRAY_SIZE(pll1_bypass_sels), CLK_SET_R=
ATE_PARENT);
> +       hws[IMXRT1050_CLK_PLL2_BYPASS] =3D imx_clk_hw_mux_flags("pll2_byp=
ass", base + 0x30, 16, 1,
> +               pll2_bypass_sels, ARRAY_SIZE(pll2_bypass_sels), CLK_SET_R=
ATE_PARENT);
> +       hws[IMXRT1050_CLK_PLL3_BYPASS] =3D imx_clk_hw_mux_flags("pll3_byp=
ass", base + 0x10, 16, 1,
> +               pll3_bypass_sels, ARRAY_SIZE(pll3_bypass_sels), CLK_SET_R=
ATE_PARENT);
> +       hws[IMXRT1050_CLK_PLL5_BYPASS] =3D imx_clk_hw_mux_flags("pll5_byp=
ass", base + 0xa0, 16, 1,
> +               pll5_bypass_sels, ARRAY_SIZE(pll5_bypass_sels), CLK_SET_R=
ATE_PARENT);
> +
> +       hws[IMXRT1050_CLK_VIDEO_POST_DIV_SEL] =3D imx_clk_hw_divider("vid=
eo_post_div_sel",
> +               "pll5_video", base + 0xa0, 19, 2);
> +       hws[IMXRT1050_CLK_VIDEO_DIV] =3D imx_clk_hw_divider("video_div",
> +               "video_post_div_sel", base + 0x170, 30, 2);
> +
> +       hws[IMXRT1050_CLK_PLL3_80M] =3D imx_clk_hw_fixed_factor("pll3_80m=
",  "pll3_usb_otg", 1, 6);
> +
> +       hws[IMXRT1050_CLK_PLL2_PFD0_352M] =3D imx_clk_hw_pfd("pll2_pfd0_3=
52m", "pll2_sys", base + 0x100, 0);
> +       hws[IMXRT1050_CLK_PLL2_PFD1_594M] =3D imx_clk_hw_pfd("pll2_pfd1_5=
94m", "pll2_sys", base + 0x100, 1);
> +       hws[IMXRT1050_CLK_PLL2_PFD2_396M] =3D imx_clk_hw_pfd("pll2_pfd2_3=
96m", "pll2_sys", base + 0x100, 2);
> +       hws[IMXRT1050_CLK_PLL3_PFD1_664_62M] =3D imx_clk_hw_pfd("pll3_pfd=
1_664_62m", "pll3_usb_otg", base + 0xf0, 1);
> +       hws[IMXRT1050_CLK_PLL3_PFD3_454_74M] =3D imx_clk_hw_pfd("pll3_pfd=
3_454_74m", "pll3_usb_otg", base + 0xf0, 3);
> +}
> +
> +static int imxrt1050_clocks_probe(struct platform_device *pdev)
> +{
> +       void __iomem *ccm_base;
> +       void __iomem *pll_base;
> +       struct device *dev =3D &pdev->dev;
> +       struct device_node *np =3D dev->of_node;
> +       struct device_node *anp;
> +       int ret;
> +
> +       clk_hw_data =3D kzalloc(struct_size(clk_hw_data, hws,
> +                                         IMXRT1050_CLK_END), GFP_KERNEL);
> +       if (WARN_ON(!clk_hw_data))
> +               return -ENOMEM;
> +
> +       clk_hw_data->num =3D IMXRT1050_CLK_END;
> +       hws =3D clk_hw_data->hws;
> +
> +       hws[IMXRT1050_CLK_OSC] =3D __clk_get_hw(of_clk_get_by_name(np, "o=
sc"));

Use clk_parent_data instead and reference the binding name with .fw_name

> +
> +       anp =3D of_find_compatible_node(NULL, NULL, "fsl,imxrt-anatop");
> +       pll_base =3D of_iomap(anp, 0);
> +       of_node_put(anp);
> +       if (WARN_ON(!pll_base))
> +               return -ENOMEM;
> +       imxrt_clocks_common_init(pll_base);
> +       /* CCM clocks */
> +       ccm_base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (WARN_ON(IS_ERR(ccm_base)))
> +               return PTR_ERR(ccm_base);
> +
> +       hws[IMXRT1050_CLK_ARM_PODF] =3D imx_clk_hw_divider("arm_podf", "p=
ll1_arm", ccm_base + 0x10, 0, 3);
> +       hws[IMXRT1050_CLK_PRE_PERIPH_SEL] =3D imx_clk_hw_mux("pre_periph_=
sel", ccm_base + 0x18, 18, 2,
> +               pre_periph_sels, ARRAY_SIZE(pre_periph_sels));
> +       hws[IMXRT1050_CLK_PERIPH_SEL] =3D imx_clk_hw_mux("periph_sel", cc=
m_base + 0x14, 25, 1,
> +               periph_sels, ARRAY_SIZE(periph_sels));
> +       hws[IMXRT1050_CLK_USDHC1_SEL] =3D imx_clk_hw_mux("usdhc1_sel", cc=
m_base + 0x1c, 16, 1,
> +               usdhc_sels, ARRAY_SIZE(usdhc_sels));
> +       hws[IMXRT1050_CLK_USDHC2_SEL] =3D imx_clk_hw_mux("usdhc2_sel", cc=
m_base + 0x1c, 17, 1,
> +               usdhc_sels, ARRAY_SIZE(usdhc_sels));
> +       hws[IMXRT1050_CLK_LPUART_SEL] =3D imx_clk_hw_mux("lpuart_sel", cc=
m_base + 0x24, 6, 1,
> +               lpuart_sels, ARRAY_SIZE(lpuart_sels));
> +       hws[IMXRT1050_CLK_LCDIF_SEL] =3D imx_clk_hw_mux("lcdif_sel", ccm_=
base + 0x38, 15, 3,
> +               lcdif_sels, ARRAY_SIZE(lcdif_sels));
> +       hws[IMXRT1050_CLK_PER_CLK_SEL] =3D imx_clk_hw_mux("per_sel", ccm_=
base + 0x1C, 6, 1,
> +               per_sels, ARRAY_SIZE(per_sels));
> +       hws[IMXRT1050_CLK_SEMC_ALT_SEL] =3D imx_clk_hw_mux("semc_alt_sel"=
, ccm_base + 0x14, 7, 1,
> +               semc_alt_sels, ARRAY_SIZE(semc_alt_sels));
> +       hws[IMXRT1050_CLK_SEMC_SEL] =3D imx_clk_hw_mux_flags("semc_sel", =
ccm_base + 0x14, 6, 1,
> +               semc_sels, ARRAY_SIZE(semc_sels), CLK_IS_CRITICAL);
> +
> +       hws[IMXRT1050_CLK_AHB_PODF] =3D imx_clk_hw_divider("ahb", "periph=
_sel", ccm_base + 0x14, 10, 3);
> +       hws[IMXRT1050_CLK_IPG_PDOF] =3D imx_clk_hw_divider("ipg", "ahb", =
ccm_base + 0x14, 8, 2);
> +       hws[IMXRT1050_CLK_PER_PDOF] =3D imx_clk_hw_divider("per", "per_se=
l", ccm_base + 0x1C, 0, 5);
> +
> +       hws[IMXRT1050_CLK_USDHC1_PODF] =3D imx_clk_hw_divider("usdhc1_pod=
f", "usdhc1_sel", ccm_base + 0x24, 11, 3);
> +       hws[IMXRT1050_CLK_USDHC2_PODF] =3D imx_clk_hw_divider("usdhc2_pod=
f", "usdhc2_sel", ccm_base + 0x24, 16, 3);
> +       hws[IMXRT1050_CLK_LPUART_PODF] =3D imx_clk_hw_divider("lpuart_pod=
f", "lpuart_sel", ccm_base + 0x24, 0, 6);
> +       hws[IMXRT1050_CLK_LCDIF_PRED] =3D imx_clk_hw_divider("lcdif_pred"=
, "lcdif_sel", ccm_base + 0x38, 12, 3);
> +       hws[IMXRT1050_CLK_LCDIF_PODF] =3D imx_clk_hw_divider("lcdif_podf"=
, "lcdif_pred", ccm_base + 0x18, 23, 3);
> +
> +       hws[IMXRT1050_CLK_USDHC1] =3D imx_clk_hw_gate2("usdhc1", "usdhc1_=
podf", ccm_base + 0x80, 2);
> +       hws[IMXRT1050_CLK_USDHC2] =3D imx_clk_hw_gate2("usdhc2", "usdhc2_=
podf", ccm_base + 0x80, 4);
> +       hws[IMXRT1050_CLK_LPUART1] =3D imx_clk_hw_gate2("lpuart1", "lpuar=
t_podf", ccm_base + 0x7c, 24);
> +       hws[IMXRT1050_CLK_LCDIF_APB] =3D imx_clk_hw_gate2("lcdif", "lcdif=
_podf", ccm_base + 0x74, 10);
> +       hws[IMXRT1050_CLK_DMA] =3D imx_clk_hw_gate("dma", "ipg", ccm_base=
 + 0x7C, 6);
> +       hws[IMXRT1050_CLK_DMA_MUX] =3D imx_clk_hw_gate("dmamux0", "ipg", =
ccm_base + 0x7C, 7);
> +       imx_check_clk_hws(hws, IMXRT1050_CLK_END);
> +
> +       ret =3D of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_=
data);
> +       if (ret < 0) {
> +               dev_err(dev, "Failed to register clks for i.MXRT1050.\n");
> +               imx_unregister_hw_clocks(hws, IMXRT1050_CLK_END);
> +               return ret;

Drop return

> +       }

Newline here please

> +       return 0;

return ret;

> +}
> +static const struct of_device_id imxrt1050_clk_of_match[] =3D {
> +       { .compatible =3D "fsl,imxrt1050-ccm" },
> +       { /* Sentinel */ },

Drop comma please so nothing can come after without causing compile fail.

> +};
> +MODULE_DEVICE_TABLE(of, imxrt1050_clk_of_match);
> +
> +static struct platform_driver imxrt1050_clk_driver =3D {
> +       .probe =3D imxrt1050_clocks_probe,
> +       .driver =3D {
> +               .name =3D "imxrt1050-ccm",
> +               .of_match_table =3D imxrt1050_clk_of_match,
> +       },
> +};
> +module_platform_driver(imxrt1050_clk_driver);

It's not a module though, unless the Kconfig is made into a tristate.
