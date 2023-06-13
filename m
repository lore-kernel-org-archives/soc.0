Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7271BC7EE2E
	for <soc@archiver.kernel.org>; Tue, 13 Jun 2023 01:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21F5EC4339B; Tue, 13 Jun 2023 01:02:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCEDC433D2;
	Tue, 13 Jun 2023 01:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686618148;
	bh=1z9/IfA+IhPl3I1sfssrAX9t86sGv8Lk4ExcN0MED6Q=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=iNAEdRvF/zfrKtNL0s33EtogmGXBo9VzeJgX/uKZ9RJmIP4k8gnJQL9kOq3TN0AAK
	 V0i3o50VG3k80llf5WrQXW2mLDg1B4Y2S6iD6myhMucodC0ypNwszqlkO+7noBgjUY
	 VhFHu8htElDvqa20XOVNIjnMS0Qq3uhAgCVoPn7xvmE5GYixMpmAvS68lC62PHfef+
	 Yml5YpLXz2n8IBCMMQnddVJ63Hd34UhVzOhR9EDLU1Pl4hcM2DhVgpMJ2JeaR55eat
	 nxScaqddbmpw2OJSLkHzL25wNsq0DmIA8tn8b022F0B0BqzcwbOSLvaZTK7qRyLRAE
	 SUb4OPhoB1svg==
Message-ID: <bda5f640831a8080a83eca8c8e37c30d.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230605040749.67964-9-ychuang570808@gmail.com>
References: <20230605040749.67964-1-ychuang570808@gmail.com> <20230605040749.67964-9-ychuang570808@gmail.com>
Subject: Re: [PATCH v13 08/10] clk: nuvoton: Add clock driver for ma35d1 clock controller
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org, arnd@arndb.de, soc@kernel.org, schung@nuvoton.com, mjchen@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Jacky Huang <ychuang570808@gmail.com>, catalin.marinas@arm.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, krzysztof.kozlowski+dt@linaro.org, lee@kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh+dt@kernel.org, tmaimon77@gmail.com, will@kernel.org
Date: Mon, 12 Jun 2023 18:02:24 -0700
User-Agent: alot/0.10

Quoting Jacky Huang (2023-06-04 21:07:47)
> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvot=
on/clk-ma35d1-divider.c
> new file mode 100644
> index 000000000000..0c2bed47909a
> --- /dev/null
> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Nuvoton Technology Corp.
> + * Author: Chi-Fang Li <cfli0@nuvoton.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +
> +struct ma35d1_adc_clk_div {
> +       struct clk_hw hw;
> +       void __iomem *reg;
> +       u8 shift;
> +       u8 width;
> +       u32 mask;
> +       const struct clk_div_table *table;
> +       /* protects concurrent access to clock divider registers */
> +       spinlock_t *lock;
> +};
> +
> +struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *nam=
e,
> +                                    struct clk_hw *parent_hw, spinlock_t=
 *lock,
> +                                    unsigned long flags, void __iomem *r=
eg,
> +                                    u8 shift, u8 width, u32 mask_bit);

Why is this forward declared?

> +
> +static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct cl=
k_hw *_hw)
> +{
> +       return container_of(_hw, struct ma35d1_adc_clk_div, hw);
> +}
> +
> +static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsign=
ed long parent_rate)
> +{
> +       unsigned int val;
> +       struct ma35d1_adc_clk_div *dclk =3D to_ma35d1_adc_clk_div(hw);
> +
> +       val =3D readl_relaxed(dclk->reg) >> dclk->shift;
> +       val &=3D clk_div_mask(dclk->width);
> +       val +=3D 1;
> +       return divider_recalc_rate(hw, parent_rate, val, dclk->table,
> +                                  CLK_DIVIDER_ROUND_CLOSEST, dclk->width=
);
> +}
> +
> +static long ma35d1_clkdiv_round_rate(struct clk_hw *hw, unsigned long ra=
te, unsigned long *prate)
> +{
> +       struct ma35d1_adc_clk_div *dclk =3D to_ma35d1_adc_clk_div(hw);
> +
> +       return divider_round_rate(hw, rate, prate, dclk->table,
> +                                 dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
> +}
> +
> +static int ma35d1_clkdiv_set_rate(struct clk_hw *hw, unsigned long rate,=
 unsigned long parent_rate)
> +{
> +       int value;
> +       unsigned long flags =3D 0;
> +       u32 data;
> +       struct ma35d1_adc_clk_div *dclk =3D to_ma35d1_adc_clk_div(hw);
> +
> +       value =3D divider_get_val(rate, parent_rate, dclk->table,
> +                               dclk->width, CLK_DIVIDER_ROUND_CLOSEST);
> +
> +       spin_lock_irqsave(dclk->lock, flags);
> +
> +       data =3D readl_relaxed(dclk->reg);
> +       data &=3D ~(clk_div_mask(dclk->width) << dclk->shift);
> +       data |=3D (value - 1) << dclk->shift;
> +       data |=3D dclk->mask;
> +       writel_relaxed(data, dclk->reg);
> +
> +       spin_unlock_irqrestore(dclk->lock, flags);
> +       return 0;
> +}
> +
> +static const struct clk_ops ma35d1_adc_clkdiv_ops =3D {
> +       .recalc_rate =3D ma35d1_clkdiv_recalc_rate,
> +       .round_rate =3D ma35d1_clkdiv_round_rate,
> +       .set_rate =3D ma35d1_clkdiv_set_rate,
> +};
> +
> +struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *nam=
e,
> +                                    struct clk_hw *parent_hw, spinlock_t=
 *lock,
> +                                    unsigned long flags, void __iomem *r=
eg,
> +                                    u8 shift, u8 width, u32 mask_bit)
> +{
> +       struct ma35d1_adc_clk_div *div;
> +       struct clk_init_data init;
> +       struct clk_div_table *table;
> +       struct clk_parent_data pdata =3D { .index =3D 0 };
> +       u32 max_div, min_div;
> +       struct clk_hw *hw;
> +       int ret;
> +       int i;
> +
> +       div =3D devm_kzalloc(dev, sizeof(*div), GFP_KERNEL);
> +       if (!div)
> +               return ERR_PTR(-ENOMEM);
> +
> +       max_div =3D clk_div_mask(width) + 1;
> +       min_div =3D 1;
> +
> +       table =3D devm_kcalloc(dev, max_div + 1, sizeof(*table), GFP_KERN=
EL);
> +       if (!table)
> +               return ERR_PTR(-ENOMEM);
> +
> +       for (i =3D 0; i < max_div; i++) {
> +               table[i].val =3D min_div + i;
> +               table[i].div =3D 2 * table[i].val;
> +       }
> +       table[max_div].val =3D 0;
> +       table[max_div].div =3D 0;
> +
> +       memset(&init, 0, sizeof(init));
> +       init.name =3D name;
> +       init.ops =3D &ma35d1_adc_clkdiv_ops;
> +       init.flags |=3D flags;
> +       pdata.hw =3D parent_hw;
> +       init.parent_data =3D &pdata;
> +       init.num_parents =3D 1;
> +
> +       div->reg =3D reg;
> +       div->shift =3D shift;
> +       div->width =3D width;
> +       div->mask =3D mask_bit ? BIT(mask_bit) : 0;
> +       div->lock =3D lock;
> +       div->hw.init =3D &init;
> +       div->table =3D table;
> +
> +       hw =3D &div->hw;
> +       ret =3D devm_clk_hw_register(dev, hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +       return hw;
> +}
> +EXPORT_SYMBOL_GPL(ma35d1_reg_adc_clkdiv);
> diff --git a/drivers/clk/nuvoton/clk-ma35d1-pll.c b/drivers/clk/nuvoton/c=
lk-ma35d1-pll.c
> new file mode 100644
> index 000000000000..e4c9f94e6796
> --- /dev/null
> +++ b/drivers/clk/nuvoton/clk-ma35d1-pll.c
> @@ -0,0 +1,361 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Nuvoton Technology Corp.
> + * Author: Chi-Fang Li <cfli0@nuvoton.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk-provider.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/math64.h>
> +#include <linux/slab.h>
> +#include <linux/units.h>
> +#include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +
> +/* PLL frequency limits */
> +#define PLL_FREF_MAX_FREQ      (200 * HZ_PER_MHZ)
> +#define PLL_FREF_MIN_FREQ      (1 * HZ_PER_MHZ)
> +#define PLL_FREF_M_MAX_FREQ    (40 * HZ_PER_MHZ)
> +#define PLL_FREF_M_MIN_FREQ    (10 * HZ_PER_MHZ)
> +#define PLL_FCLK_MAX_FREQ      (2400 * HZ_PER_MHZ)
> +#define PLL_FCLK_MIN_FREQ      (600 * HZ_PER_MHZ)
> +#define PLL_FCLKO_MAX_FREQ     (2400 * HZ_PER_MHZ)
> +#define PLL_FCLKO_MIN_FREQ     (85700 * HZ_PER_KHZ)
> +#define PLL_SS_RATE            0x77
> +#define PLL_SLOPE              0x58CFA
> +
> +#define REG_PLL_CTL0_OFFSET    0x0
> +#define REG_PLL_CTL1_OFFSET    0x4
> +#define REG_PLL_CTL2_OFFSET    0x8
> +
> +/* bit fields for REG_CLK_PLL0CTL0, which is SMIC PLL design */
> +#define SPLL0_CTL0_FBDIV       GENMASK(7, 0)
> +#define SPLL0_CTL0_INDIV       GENMASK(11, 8)
> +#define SPLL0_CTL0_OUTDIV      GENMASK(13, 12)
> +#define SPLL0_CTL0_PD          BIT(16)
> +#define SPLL0_CTL0_BP          BIT(17)
> +
> +/* bit fields for REG_CLK_PLLxCTL0 ~ REG_CLK_PLLxCTL2, where x =3D 2 ~ 5=
 */
> +#define PLL_CTL0_FBDIV         GENMASK(10, 0)
> +#define PLL_CTL0_INDIV         GENMASK(17, 12)
> +#define PLL_CTL0_MODE          GENMASK(19, 18)
> +#define PLL_CTL0_SSRATE                GENMASK(30, 20)
> +#define PLL_CTL1_PD            BIT(0)
> +#define PLL_CTL1_BP            BIT(1)
> +#define PLL_CTL1_OUTDIV                GENMASK(6, 4)
> +#define PLL_CTL1_FRAC          GENMASK(31, 24)
> +#define PLL_CTL2_SLOPE         GENMASK(23, 0)
> +
> +#define INDIV_MIN              1
> +#define INDIV_MAX              63
> +#define FBDIV_MIN              16
> +#define FBDIV_MAX              2047
> +#define FBDIV_FRAC_MIN         1600
> +#define FBDIV_FRAC_MAX         204700
> +#define OUTDIV_MIN             1
> +#define OUTDIV_MAX             7
> +
> +#define PLL_MODE_INT            0
> +#define PLL_MODE_FRAC           1
> +#define PLL_MODE_SS             2
> +
> +struct ma35d1_clk_pll {
> +       struct clk_hw hw;
> +       u32 id;
> +       u8 mode;
> +       void __iomem *ctl0_base;
> +       void __iomem *ctl1_base;
> +       void __iomem *ctl2_base;
> +};
> +
> +struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode,=
 const char *name,
> +                                 struct clk_hw *parent_hw, void __iomem =
*base);

Why is this forward declared?

> +
> +static inline struct ma35d1_clk_pll *to_ma35d1_clk_pll(struct clk_hw *_h=
w)
> +{
> +       return container_of(_hw, struct ma35d1_clk_pll, hw);
> +}
> +
> +static unsigned long ma35d1_calc_smic_pll_freq(u32 pll0_ctl0,
> +                                              unsigned long parent_rate)
> +{
> +       u32 m, n, p, outdiv;
> +       u64 pll_freq;
> +
> +       if (pll0_ctl0 & SPLL0_CTL0_BP)
> +               return parent_rate;
> +
> +       n =3D FIELD_GET(SPLL0_CTL0_FBDIV, pll0_ctl0);
> +       m =3D FIELD_GET(SPLL0_CTL0_INDIV, pll0_ctl0);
> +       p =3D FIELD_GET(SPLL0_CTL0_OUTDIV, pll0_ctl0);
> +       outdiv =3D 1 << p;
> +       pll_freq =3D (u64)parent_rate * n;
> +       div_u64(pll_freq, m * outdiv);
> +       return pll_freq;
> +}
> +
> +static unsigned long ma35d1_calc_pll_freq(u8 mode, u32 *reg_ctl, unsigne=
d long parent_rate)
> +{
> +       unsigned long pll_freq, x;
> +       u32 m, n, p;
> +
> +       if (reg_ctl[1] & PLL_CTL1_BP)
> +               return parent_rate;
> +
> +       n =3D FIELD_GET(PLL_CTL0_FBDIV, reg_ctl[0]);
> +       m =3D FIELD_GET(PLL_CTL0_INDIV, reg_ctl[0]);
> +       p =3D FIELD_GET(PLL_CTL1_OUTDIV, reg_ctl[1]);
> +
> +       if (mode =3D=3D PLL_MODE_INT) {
> +               pll_freq =3D (u64)parent_rate * n;
> +               div_u64(pll_freq, m * p);
> +       } else {
> +               x =3D FIELD_GET(PLL_CTL1_FRAC, reg_ctl[1]);
> +               /* 2 decimal places floating to integer (ex. 1.23 to 123)=
 */
> +               n =3D n * 100 + ((x * 100) / FIELD_MAX(PLL_CTL1_FRAC));
> +               pll_freq =3D div_u64(parent_rate * n, 100 * m * p);
> +       }
> +       return pll_freq;
> +}
> +
> +static int ma35d1_pll_find_closest(struct ma35d1_clk_pll *pll, unsigned =
long rate,
> +                                  unsigned long parent_rate, u32 *reg_ct=
l,
> +                                  unsigned long *freq)
> +{
> +       unsigned long min_diff =3D ULONG_MAX;
> +       int fbdiv_min, fbdiv_max;
> +       int p, m, n;
> +
> +       *freq =3D 0;
> +       if (rate < PLL_FCLKO_MIN_FREQ || rate > PLL_FCLKO_MAX_FREQ)
> +               return -EINVAL;
> +
> +       if (pll->mode =3D=3D PLL_MODE_INT) {
> +               fbdiv_min =3D FBDIV_MIN;
> +               fbdiv_max =3D FBDIV_MAX;
> +       } else {
> +               fbdiv_min =3D FBDIV_FRAC_MIN;
> +               fbdiv_max =3D FBDIV_FRAC_MAX;
> +       }
> +
> +       for (m =3D INDIV_MIN; m <=3D INDIV_MAX; m++) {
> +               for (n =3D fbdiv_min; n <=3D fbdiv_max; n++) {
> +                       for (p =3D OUTDIV_MIN; p <=3D OUTDIV_MAX; p++) {
> +                               unsigned long tmp, fout, fclk, diff;
> +
> +                               tmp =3D div_u64(parent_rate, m);
> +                               if (tmp < PLL_FREF_M_MIN_FREQ ||
> +                                   tmp > PLL_FREF_M_MAX_FREQ)
> +                                       continue; /* constrain */
> +
> +                               fclk =3D div_u64(parent_rate * n, m);
> +                               /* for 2 decimal places */
> +                               if (pll->mode !=3D PLL_MODE_INT)
> +                                       fclk =3D div_u64(fclk, 100);
> +
> +                               if (fclk < PLL_FCLK_MIN_FREQ ||
> +                                   fclk > PLL_FCLK_MAX_FREQ)
> +                                       continue; /* constrain */
> +
> +                               fout =3D div_u64(fclk, p);
> +                               if (fout < PLL_FCLKO_MIN_FREQ ||
> +                                   fout > PLL_FCLKO_MAX_FREQ)
> +                                       continue; /* constrain */
> +
> +                               diff =3D abs(rate - fout);
> +                               if (diff < min_diff) {
> +                                       reg_ctl[0] =3D FIELD_PREP(PLL_CTL=
0_INDIV, m) |
> +                                                    FIELD_PREP(PLL_CTL0_=
FBDIV, n);
> +                                       reg_ctl[1] =3D FIELD_PREP(PLL_CTL=
1_OUTDIV, p);
> +                                       *freq =3D fout;
> +                                       min_diff =3D diff;
> +                                       if (min_diff =3D=3D 0)
> +                                               break;
> +                               }
> +                       }
> +               }
> +       }
> +       if (*freq =3D=3D 0)
> +               return -EINVAL; /* cannot find even one valid setting */
> +       return 0;
> +}
> +
> +static int ma35d1_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +                                  unsigned long parent_rate)
> +{
> +       struct ma35d1_clk_pll *pll =3D to_ma35d1_clk_pll(hw);
> +       u32 reg_ctl[3] =3D { 0 };
> +       unsigned long pll_freq;
> +       int ret;
> +
> +       if (parent_rate < PLL_FREF_MIN_FREQ || parent_rate > PLL_FREF_MAX=
_FREQ)
> +               return -EINVAL;
> +
> +       ret =3D ma35d1_pll_find_closest(pll, rate, parent_rate, reg_ctl, =
&pll_freq);
> +       if (ret !=3D 0)
> +               return ret;
> +
> +       switch (pll->mode) {
> +       case PLL_MODE_INT:
> +               reg_ctl[0] |=3D FIELD_PREP(PLL_CTL0_MODE, PLL_MODE_INT);
> +               break;
> +       case PLL_MODE_FRAC:
> +               reg_ctl[0] |=3D FIELD_PREP(PLL_CTL0_MODE, PLL_MODE_FRAC);
> +               break;
> +       case PLL_MODE_SS:
> +               reg_ctl[0] |=3D FIELD_PREP(PLL_CTL0_MODE, PLL_MODE_SS) |
> +                             FIELD_PREP(PLL_CTL0_SSRATE, PLL_SS_RATE);
> +               reg_ctl[2] =3D FIELD_PREP(PLL_CTL2_SLOPE, PLL_SLOPE);
> +               break;
> +       }
> +       reg_ctl[1] |=3D PLL_CTL1_PD;
> +
> +       writel_relaxed(reg_ctl[0], pll->ctl0_base);
> +       writel_relaxed(reg_ctl[1], pll->ctl1_base);
> +       writel_relaxed(reg_ctl[2], pll->ctl2_base);
> +       return 0;
> +}
> +
> +static unsigned long ma35d1_clk_pll_recalc_rate(struct clk_hw *hw, unsig=
ned long parent_rate)
> +{
> +       struct ma35d1_clk_pll *pll =3D to_ma35d1_clk_pll(hw);
> +       u32 reg_ctl[3];
> +       unsigned long pll_freq;
> +
> +       if (parent_rate < PLL_FREF_MIN_FREQ || parent_rate > PLL_FREF_MAX=
_FREQ)
> +               return 0;
> +
> +       switch (pll->id) {
> +       case CAPLL:
> +               reg_ctl[0] =3D readl_relaxed(pll->ctl0_base);
> +               pll_freq =3D ma35d1_calc_smic_pll_freq(reg_ctl[0], parent=
_rate);
> +               return pll_freq;
> +       case DDRPLL:
> +       case APLL:
> +       case EPLL:
> +       case VPLL:
> +               reg_ctl[0] =3D readl_relaxed(pll->ctl0_base);
> +               reg_ctl[1] =3D readl_relaxed(pll->ctl1_base);
> +               pll_freq =3D ma35d1_calc_pll_freq(pll->mode, reg_ctl, par=
ent_rate);
> +               return pll_freq;
> +       }
> +       return 0;
> +}
> +
> +static long ma35d1_clk_pll_round_rate(struct clk_hw *hw, unsigned long r=
ate,
> +                                     unsigned long *parent_rate)
> +{
> +       struct ma35d1_clk_pll *pll =3D to_ma35d1_clk_pll(hw);
> +       u32 reg_ctl[3] =3D { 0 };
> +       unsigned long pll_freq;
> +       long ret;
> +
> +       if (*parent_rate < PLL_FREF_MIN_FREQ || *parent_rate > PLL_FREF_M=
AX_FREQ)
> +               return -EINVAL;
> +
> +       ret =3D ma35d1_pll_find_closest(pll, rate, *parent_rate, reg_ctl,=
 &pll_freq);
> +       if (ret < 0)
> +               return ret;
> +
> +       switch (pll->id) {
> +       case CAPLL:
> +               reg_ctl[0] =3D readl_relaxed(pll->ctl0_base);
> +               pll_freq =3D ma35d1_calc_smic_pll_freq(reg_ctl[0], *paren=
t_rate);
> +               return pll_freq;
> +       case DDRPLL:
> +       case APLL:
> +       case EPLL:
> +       case VPLL:
> +               reg_ctl[0] =3D readl_relaxed(pll->ctl0_base);
> +               reg_ctl[1] =3D readl_relaxed(pll->ctl1_base);
> +               pll_freq =3D ma35d1_calc_pll_freq(pll->mode, reg_ctl, *pa=
rent_rate);
> +               return pll_freq;
> +       }
> +       return 0;
> +}
> +
> +static int ma35d1_clk_pll_is_prepared(struct clk_hw *hw)
> +{
> +       struct ma35d1_clk_pll *pll =3D to_ma35d1_clk_pll(hw);
> +       u32 val =3D readl_relaxed(pll->ctl1_base);
> +
> +       return !(val & PLL_CTL1_PD);
> +}
> +
> +static int ma35d1_clk_pll_prepare(struct clk_hw *hw)
> +{
> +       struct ma35d1_clk_pll *pll =3D to_ma35d1_clk_pll(hw);
> +       u32 val;
> +
> +       val =3D readl_relaxed(pll->ctl1_base);
> +       val &=3D ~PLL_CTL1_PD;
> +       writel_relaxed(val, pll->ctl1_base);
> +       return 0;
> +}
> +
> +static void ma35d1_clk_pll_unprepare(struct clk_hw *hw)
> +{
> +       struct ma35d1_clk_pll *pll =3D to_ma35d1_clk_pll(hw);
> +       u32 val;
> +
> +       val =3D readl_relaxed(pll->ctl1_base);
> +       val |=3D PLL_CTL1_PD;
> +       writel_relaxed(val, pll->ctl1_base);
> +}
> +
> +static const struct clk_ops ma35d1_clk_pll_ops =3D {
> +       .is_prepared =3D ma35d1_clk_pll_is_prepared,
> +       .prepare =3D ma35d1_clk_pll_prepare,
> +       .unprepare =3D ma35d1_clk_pll_unprepare,
> +       .set_rate =3D ma35d1_clk_pll_set_rate,
> +       .recalc_rate =3D ma35d1_clk_pll_recalc_rate,
> +       .round_rate =3D ma35d1_clk_pll_round_rate,
> +};
> +
> +static const struct clk_ops ma35d1_clk_fixed_pll_ops =3D {
> +       .recalc_rate =3D ma35d1_clk_pll_recalc_rate,
> +       .round_rate =3D ma35d1_clk_pll_round_rate,
> +};
> +
> +struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode,=
 const char *name,
> +                                 struct clk_hw *parent_hw, void __iomem =
*base)
> +{
> +       struct clk_parent_data pdata =3D { .index =3D 0 };
> +       struct clk_init_data init =3D {};
> +       struct ma35d1_clk_pll *pll;
> +       struct clk_hw *hw;
> +       int ret;
> +
> +       pll =3D devm_kzalloc(dev, sizeof(*pll), GFP_KERNEL);
> +       if (!pll)
> +               return ERR_PTR(-ENOMEM);
> +
> +       pll->id =3D id;
> +       pll->mode =3D u8mode;
> +       pll->ctl0_base =3D base + REG_PLL_CTL0_OFFSET;
> +       pll->ctl1_base =3D base + REG_PLL_CTL1_OFFSET;
> +       pll->ctl2_base =3D base + REG_PLL_CTL2_OFFSET;
> +
> +       init.name =3D name;
> +       init.flags =3D 0;
> +       pdata.hw =3D parent_hw;
> +       init.parent_data =3D &pdata;
> +       init.num_parents =3D 1;
> +
> +       if (id =3D=3D CAPLL || id =3D=3D DDRPLL)
> +               init.ops =3D &ma35d1_clk_fixed_pll_ops;
> +       else
> +               init.ops =3D &ma35d1_clk_pll_ops;
> +
> +       pll->hw.init =3D &init;
> +       hw =3D &pll->hw;
> +
> +       ret =3D devm_clk_hw_register(dev, hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +       return hw;
> +}
> +EXPORT_SYMBOL_GPL(ma35d1_reg_clk_pll);
> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-m=
a35d1.c
> new file mode 100644
> index 000000000000..297b11585f00
> --- /dev/null
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -0,0 +1,933 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2023 Nuvoton Technology Corp.
> + * Author: Chi-Fang Li <cfli0@nuvoton.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +
> +static DEFINE_SPINLOCK(ma35d1_lock);
> +
> +#define PLL_MAX_NUM            5
> +
> +/* Clock Control Registers Offset */
> +#define REG_CLK_PWRCTL         0x00
> +#define REG_CLK_SYSCLK0                0x04
> +#define REG_CLK_SYSCLK1                0x08
> +#define REG_CLK_APBCLK0                0x0C
> +#define REG_CLK_APBCLK1                0x10
> +#define REG_CLK_APBCLK2                0x14
> +#define REG_CLK_CLKSEL0                0x18
> +#define REG_CLK_CLKSEL1                0x1C
> +#define REG_CLK_CLKSEL2                0x20
> +#define REG_CLK_CLKSEL3                0x24
> +#define REG_CLK_CLKSEL4                0x28
> +#define REG_CLK_CLKDIV0                0x2C
> +#define REG_CLK_CLKDIV1                0x30
> +#define REG_CLK_CLKDIV2                0x34
> +#define REG_CLK_CLKDIV3                0x38
> +#define REG_CLK_CLKDIV4                0x3C
> +#define REG_CLK_CLKOCTL                0x40
> +#define REG_CLK_STATUS         0x50
> +#define REG_CLK_PLL0CTL0       0x60
> +#define REG_CLK_PLL2CTL0       0x80
> +#define REG_CLK_PLL2CTL1       0x84
> +#define REG_CLK_PLL2CTL2       0x88
> +#define REG_CLK_PLL3CTL0       0x90
> +#define REG_CLK_PLL3CTL1       0x94
> +#define REG_CLK_PLL3CTL2       0x98
> +#define REG_CLK_PLL4CTL0       0xA0
> +#define REG_CLK_PLL4CTL1       0xA4
> +#define REG_CLK_PLL4CTL2       0xA8
> +#define REG_CLK_PLL5CTL0       0xB0
> +#define REG_CLK_PLL5CTL1       0xB4
> +#define REG_CLK_PLL5CTL2       0xB8
> +#define REG_CLK_CLKDCTL                0xC0
> +#define REG_CLK_CLKDSTS                0xC4
> +#define REG_CLK_CDUPB          0xC8
> +#define REG_CLK_CDLOWB         0xCC
> +#define REG_CLK_CKFLTRCTL      0xD0
> +#define REG_CLK_TESTCLK                0xF0
> +#define REG_CLK_PLLCTL         0x40

Please use lowercase hex.

> +
> +#define PLL_MODE_INT            0
> +#define PLL_MODE_FRAC           1
> +#define PLL_MODE_SS             2
> +
> +struct clk_hw *ma35d1_reg_clk_pll(struct device *dev, u32 id, u8 u8mode,
> +                                 const char *name, struct clk_hw *parent=
_hw,
> +                                 void __iomem *base);
> +struct clk_hw *ma35d1_reg_adc_clkdiv(struct device *dev, const char *nam=
e,
> +                                    struct clk_hw *hw, spinlock_t *lock,
> +                                    unsigned long flags, void __iomem *r=
eg,
> +                                    u8 shift, u8 width, u32 mask_bit);

These function prototypes should be in a header and included in any C
files that use them.

> +
> +static const struct clk_parent_data ca35clk_sel_clks[] =3D {
> +       { .index =3D 0 },  /* HXT */
> +       { .index =3D 1 },  /* CAPLL */
> +       { .index =3D 2 }   /* DDRPLL */
> +};
> +
> +static const char *const sysclk0_sel_clks[] =3D {
> +       "epll_div2", "syspll"
> +};
> +
> +static const char *const sysclk1_sel_clks[] =3D {
> +       "hxt", "syspll"
[...]
> +       "pclk0", "apll", "dummy", "dummy"
> +};
> +
> +static const char *const i2s0_sel_clks[] =3D {
> +       "apll", "sysclk1_div2", "dummy", "dummy"
> +};
> +
> +static const char *const i2s1_sel_clks[] =3D {
> +       "apll", "sysclk1_div2", "dummy", "dummy"
> +};
> +
> +static const char *const can_sel_clks[] =3D {
> +       "apll", "vpll"
> +};
> +
> +static const char *const cko_sel_clks[] =3D {
> +       "hxt", "lxt", "hirc", "lirc", "capll_div4", "syspll",
> +       "ddrpll", "epll_div2", "apll", "vpll", "dummy", "dummy",
> +       "dummy", "dummy", "dummy", "dummy"

I suspect "dummy" is something that we don't want to tell Linux about?
If possible, we should simply omit it entirely from the parent_data
arrays.

> +};
> +
> +static const char *const smc_sel_clks[] =3D {
> +       "hxt", "pclk4"
> +};
> +
> +static const char *const kpi_sel_clks[] =3D {
> +       "hxt", "lxt"
> +};
> +
> +static const struct clk_div_table ip_div_table[] =3D {
> +       {0, 2}, {1, 4}, {2, 6}, {3, 8}, {4, 10},
> +       {5, 12}, {6, 14}, {7, 16}, {0, 0},
> +};
> +
> +static const struct clk_div_table eadc_div_table[] =3D {
> +       {0, 2}, {1, 4}, {2, 6}, {3, 8}, {4, 10},
> +       {5, 12}, {6, 14}, {7, 16}, {8, 18},
> +       {9, 20}, {10, 22}, {11, 24}, {12, 26},
> +       {13, 28}, {14, 30}, {15, 32}, {0, 0},
> +};
> +
> +static struct clk_hw *ma35d1_clk_fixed(const char *name, int rate)
> +{
> +       return clk_hw_register_fixed_rate(NULL, name, NULL, 0, rate);
> +}
> +
> +static struct clk_hw *ma35d1_clk_mux_parent(struct device *dev, const ch=
ar *name,
> +                                           void __iomem *reg, u8 shift, =
u8 width,
> +                                           const struct clk_parent_data =
*pdata,
> +                                           int num_pdata)
> +{
> +       return clk_hw_register_mux_parent_data(dev, name, pdata, num_pdat=
a,
> +                                              CLK_SET_RATE_NO_REPARENT, =
reg, shift,
> +                                              width, 0, &ma35d1_lock);
> +}
> +
> +static struct clk_hw *ma35d1_clk_mux(struct device *dev, const char *nam=
e,
> +                                    void __iomem *reg, u8 shift, u8 widt=
h,
> +                                    const char *const *parents, int num_=
parents)

Please don't use string arrays for parent descriptions. Everything
should use clk_parent_data or direct clk_hw pointers.
