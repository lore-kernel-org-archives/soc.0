Return-Path: <sboyd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02282C433F5
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 00:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C35C7C340EC; Fri, 11 Mar 2022 00:47:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0F7BC340E8;
	Fri, 11 Mar 2022 00:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646959648;
	bh=SV+4IXZPAVwcqKilJcp3l84Me/Nm3Q8asnC4wjZcNvA=;
	h=In-Reply-To:References:Subject:From:List-Id:Cc:To:Date:From;
	b=ASbSj8CpUkxxlxLc+MQKVUZt2ikis2ahqq+bBsJEOr/MNHh/p7qIJ5DV1S3JusyJf
	 SSV/VvvfEzqWzHuePV7DTHAKD0RB2CsJ0XlhqBfOlXnmq+ZZTNuTswLe+5W9ngYAQd
	 LhNNCijpQvw1LjP7CRoPpwrRPQV0gKjzAYgZA0pvDqt1RnN6/l7blOtHTmCUeJV93+
	 Ton1e8Lo0ov4986LdL7wFmhP00MgE79EQ5KVimjIZEApn225H4c6ukVLWcl9XMCDh0
	 CdLqbEX1m3MhN/FZtn1HccJHUXar00rk7mgzJ5A/rQD60B/tLVCIQNelQDmuXQrLla
	 bHYwSPdJoMprA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220130145116.88406-7-nbd@nbd.name>
References: <20220130145116.88406-1-nbd@nbd.name> <20220130145116.88406-7-nbd@nbd.name>
Subject: Re: [PATCH v9 06/13] clk: en7523: Add clock driver for Airoha EN7523 SoC
From: Stephen Boyd <sboyd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, john@phrozen.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Felix Fietkau <nbd@nbd.name>, Michael Turquette <mturquette@baylibre.com>
Date: Thu, 10 Mar 2022 16:47:26 -0800
User-Agent: alot/0.10
Message-Id: <20220311004728.A0F7BC340E8@smtp.kernel.org>

Quoting Felix Fietkau (2022-01-30 06:51:09)
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> new file mode 100644
> index 000000000000..137e13520ad9
> --- /dev/null
> +++ b/drivers/clk/clk-en7523.c
> @@ -0,0 +1,350 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/delay.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/en7523-clk.h>
> +
> +#define REG_PCI_CONTROL                        0x88
> +#define   REG_PCI_CONTROL_PERSTOUT     BIT(29)
> +#define   REG_PCI_CONTROL_PERSTOUT1    BIT(26)
> +#define   REG_PCI_CONTROL_REFCLK_EN1   BIT(22)
> +#define REG_GSW_CLK_DIV_SEL            0x1b4
> +#define REG_EMI_CLK_DIV_SEL            0x1b8
> +#define REG_BUS_CLK_DIV_SEL            0x1bc
> +#define REG_SPI_CLK_DIV_SEL            0x1c4
> +#define REG_SPI_CLK_FREQ_SEL           0x1c8
> +#define REG_NPU_CLK_DIV_SEL            0x1fc
> +#define REG_CRYPTO_CLKSRC              0x200
> +#define REG_RESET_CONTROL              0x834
> +#define   REG_RESET_CONTROL_PCIEHB     BIT(29)
> +#define   REG_RESET_CONTROL_PCIE1      BIT(27)
> +#define   REG_RESET_CONTROL_PCIE2      BIT(26)
> +
> +struct en_clk_desc {
> +       int id;
> +       const char *name;
> +       u32 base_reg;
> +       u32 base_bits;
> +       u32 base_shift;
> +       union {
> +               const u32 *base_values;
> +               u32 base_value;

Just use unsigned int?

> +       };
> +       int n_base_values;

size_t?

> +
> +       u32 div_reg;

u16?

> +       u32 div_bits;

u8?

> +       u32 div_shift;

u8?

> +       u32 div_val0;
> +       u32 div_step;

u8?

> +};
> +
> +struct en_clk_gate {
> +       void __iomem *base;
> +       struct clk_hw hw;
> +};
> +
> +static const u32 gsw_base[] =3D { 400000000, 500000000 };
> +static const u32 emi_base[] =3D { 333000000, 400000000 };
> +static const u32 bus_base[] =3D { 500000000, 540000000 };
> +static const u32 slic_base[] =3D { 100000000, 3125000 };
> +static const u32 npu_base[] =3D { 333000000, 400000000, 500000000 };
> +
> +static const struct en_clk_desc en7523_base_clks[] =3D {
> +       {
> +               .id =3D EN7523_CLK_GSW,
> +               .name =3D "gsw",
> +
> +               .base_reg =3D REG_GSW_CLK_DIV_SEL,
> +               .base_bits =3D 1,
> +               .base_shift =3D 8,
> +               .base_values =3D gsw_base,
> +               .n_base_values =3D ARRAY_SIZE(gsw_base),
> +
> +               .div_bits =3D 3,
> +               .div_shift =3D 0,
> +               .div_step =3D 1,
> +       }, {
> +               .id =3D EN7523_CLK_EMI,
> +               .name =3D "emi",
> +
> +               .base_reg =3D REG_EMI_CLK_DIV_SEL,
> +               .base_bits =3D 1,
> +               .base_shift =3D 8,
> +               .base_values =3D emi_base,
> +               .n_base_values =3D ARRAY_SIZE(emi_base),
> +
> +               .div_bits =3D 3,
> +               .div_shift =3D 0,
> +               .div_step =3D 1,
> +       }, {
> +               .id =3D EN7523_CLK_BUS,
> +               .name =3D "bus",
> +
> +               .base_reg =3D REG_BUS_CLK_DIV_SEL,
> +               .base_bits =3D 1,
> +               .base_shift =3D 8,
> +               .base_values =3D bus_base,
> +               .n_base_values =3D ARRAY_SIZE(bus_base),
> +
> +               .div_bits =3D 3,
> +               .div_shift =3D 0,
> +               .div_step =3D 1,
> +       }, {
> +               .id =3D EN7523_CLK_SLIC,
> +               .name =3D "slic",
> +
> +               .base_reg =3D REG_SPI_CLK_FREQ_SEL,
> +               .base_bits =3D 1,
> +               .base_shift =3D 0,
> +               .base_values =3D slic_base,
> +               .n_base_values =3D ARRAY_SIZE(slic_base),
> +
> +               .div_reg =3D REG_SPI_CLK_DIV_SEL,
> +               .div_bits =3D 5,
> +               .div_shift =3D 24,
> +               .div_val0 =3D 20,
> +               .div_step =3D 2,
> +       }, {
> +               .id =3D EN7523_CLK_SPI,
> +               .name =3D "spi",
> +
> +               .base_reg =3D REG_SPI_CLK_DIV_SEL,
> +
> +               .base_value =3D 400000000,
> +
> +               .div_bits =3D 5,
> +               .div_shift =3D 8,
> +               .div_val0 =3D 40,
> +               .div_step =3D 2,
> +       }, {
> +               .id =3D EN7523_CLK_NPU,
> +               .name =3D "npu",
> +
> +               .base_reg =3D REG_NPU_CLK_DIV_SEL,
> +               .base_bits =3D 2,
> +               .base_shift =3D 8,
> +               .base_values =3D npu_base,
> +               .n_base_values =3D ARRAY_SIZE(npu_base),
> +
> +               .div_bits =3D 3,
> +               .div_shift =3D 0,
> +               .div_step =3D 1,
> +       }, {
> +               .id =3D EN7523_CLK_CRYPTO,
> +               .name =3D "crypto",
> +
> +               .base_reg =3D REG_CRYPTO_CLKSRC,
> +               .base_bits =3D 1,
> +               .base_shift =3D 8,
> +               .base_values =3D emi_base,
> +               .n_base_values =3D ARRAY_SIZE(emi_base),
> +       }
> +};
> +
> +static const struct of_device_id of_match_clk_en7523[] =3D {
> +       { .compatible =3D "airoha,en7523-scu", },
> +       { /* sentinel */ }
> +};
> +
> +static u32 en7523_get_base_rate(void __iomem *base, int i)

static unsigned int?
unsigned int i?

> +{
> +       const struct en_clk_desc *desc =3D &en7523_base_clks[i];
> +       u32 val;
> +
> +       if (!desc->base_bits)
> +               return desc->base_value;
> +
> +       val =3D readl(base + desc->base_reg);
> +       val >>=3D desc->base_shift;
> +       val &=3D (1 << desc->base_bits) - 1;
> +
> +       if (val >=3D desc->n_base_values)
> +               return 0;
> +
> +       return desc->base_values[val];
> +}
> +
> +static u32 en7523_get_div(void __iomem *base, int i)
> +{
> +       const struct en_clk_desc *desc =3D &en7523_base_clks[i];
> +       u32 reg, val;
> +
> +       if (!desc->div_bits)
> +               return 1;
> +
> +       reg =3D desc->div_reg ? desc->div_reg : desc->base_reg;
> +       val =3D readl(base + reg);
> +       val >>=3D desc->div_shift;
> +       val &=3D (1 << desc->div_bits) - 1;
> +
> +       if (!val && desc->div_val0)
> +               return desc->div_val0;
> +
> +       return (val + 1) * desc->div_step;
> +}
> +
> +static int en7523_pci_is_enabled(struct clk_hw *hw)
> +{
> +       struct en_clk_gate *cg =3D container_of(hw, struct en_clk_gate, h=
w);
> +
> +       return !!(readl(cg->base + REG_PCI_CONTROL) & REG_PCI_CONTROL_REF=
CLK_EN1);
> +}
> +
> +static int en7523_pci_prepare(struct clk_hw *hw)
> +{
> +       struct en_clk_gate *cg =3D container_of(hw, struct en_clk_gate, h=
w);
> +       void __iomem *np_base =3D cg->base;
> +       u32 val, mask;
> +
> +       /* Need to pull device low before reset */
> +       val =3D readl(np_base + REG_PCI_CONTROL);
> +       val &=3D ~(REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT);
> +       writel(val, np_base + REG_PCI_CONTROL);
> +       usleep_range(1000, 2000);
> +
> +       /* Enable PCIe port 1 */
> +       val |=3D REG_PCI_CONTROL_REFCLK_EN1;
> +       writel(val, np_base + REG_PCI_CONTROL);
> +       usleep_range(1000, 2000);
> +
> +       /* Reset to default */
> +       val =3D readl(np_base + REG_RESET_CONTROL);
> +       mask =3D REG_RESET_CONTROL_PCIE1 | REG_RESET_CONTROL_PCIE2 |
> +              REG_RESET_CONTROL_PCIEHB;
> +       writel(val & ~mask, np_base + REG_RESET_CONTROL);
> +       usleep_range(1000, 2000);
> +       writel(val | mask, np_base + REG_RESET_CONTROL);
> +       msleep(100);
> +       writel(val & ~mask, np_base + REG_RESET_CONTROL);
> +       usleep_range(5000, 10000);
> +
> +       /* Release device */
> +       mask =3D REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT;
> +       val =3D readl(np_base + REG_PCI_CONTROL);
> +       writel(val & ~mask, np_base + REG_PCI_CONTROL);
> +       usleep_range(1000, 2000);
> +       writel(val | mask, np_base + REG_PCI_CONTROL);
> +       msleep(250);
> +
> +       return 0;
> +}
> +
> +static void en7523_pci_unprepare(struct clk_hw *hw)
> +{
> +       struct en_clk_gate *cg =3D container_of(hw, struct en_clk_gate, h=
w);
> +       void __iomem *np_base =3D cg->base;
> +       u32 val;
> +
> +       val =3D readl(np_base + REG_PCI_CONTROL);
> +       val &=3D ~REG_PCI_CONTROL_REFCLK_EN1;
> +       writel(val, np_base + REG_PCI_CONTROL);
> +}
> +
> +static struct clk_hw *en7523_register_pcie_clk(struct device *dev,
> +                                              void __iomem *np_base)
> +{
> +       static const struct clk_ops pcie_gate_ops =3D {
> +               .is_enabled =3D en7523_pci_is_enabled,
> +               .prepare =3D en7523_pci_prepare,
> +               .unprepare =3D en7523_pci_unprepare,
> +       };
> +       struct clk_init_data init =3D {
> +               .name =3D "pcie",
> +               .ops =3D &pcie_gate_ops,
> +       };
> +       struct en_clk_gate *cg;
> +
> +       cg =3D devm_kzalloc(dev, sizeof(*cg), GFP_KERNEL);
> +       if (!cg)
> +               return NULL;
> +
> +       cg->base =3D np_base;
> +       cg->hw.init =3D &init;
> +       en7523_pci_unprepare(&cg->hw);
> +
> +       if (clk_hw_register(NULL, &cg->hw))

pass dev?

> +               return NULL;
> +
> +       return &cg->hw;
> +}
> +
> +static void en7523_register_clocks(struct device *dev, struct clk_hw_one=
cell_data *clk_data,
> +                                  void __iomem *base, void __iomem *np_b=
ase)
> +{
> +       struct clk_hw *hw;
> +       u32 rate;
> +       int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(en7523_base_clks); i++) {
> +               const struct en_clk_desc *desc =3D &en7523_base_clks[i];
> +
> +               rate =3D en7523_get_base_rate(base, i);
> +               rate /=3D en7523_get_div(base, i);
> +
> +               hw =3D clk_hw_register_fixed_rate(dev, desc->name, NULL, =
0, rate);
> +               if (IS_ERR(hw)) {
> +                       pr_err("Failed to register clk %s: %ld\n",
> +                              desc->name, PTR_ERR(hw));
> +                       continue;
> +               }
> +
> +               clk_data->hws[desc->id] =3D hw;
> +       }
> +
> +       hw =3D en7523_register_pcie_clk(dev, np_base);
> +       clk_data->hws[EN7523_CLK_PCIE] =3D hw;
> +
> +       clk_data->num =3D EN7523_NUM_CLOCKS;
> +}
> +
> +static int en7523_clk_probe(struct platform_device *pdev)
> +{
> +       struct device_node *node =3D pdev->dev.of_node;
> +       struct clk_hw_onecell_data *clk_data;
> +       void __iomem *base, *np_base;
> +       int r;
> +
> +       base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       np_base =3D devm_platform_ioremap_resource(pdev, 1);
> +       if (IS_ERR(base))
> +               return PTR_ERR(np_base);
> +
> +       clk_data =3D devm_kzalloc(&pdev->dev,
> +                               struct_size(clk_data, hws, EN7523_NUM_CLO=
CKS),
> +                               GFP_KERNEL);
> +       if (!clk_data)
> +               return -ENOMEM;
> +
> +       en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
> +
> +       r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_dat=
a);
> +       if (r)
> +               dev_err(&pdev->dev,
> +                       "could not register clock provider: %s: %d\n",
> +                       pdev->name, r);
> +
> +       return r;
> +}
> +
> +static struct platform_driver clk_en7523_drv =3D {
> +       .probe =3D en7523_clk_probe,
> +       .driver =3D {
> +               .name =3D "clk-en7523",
> +               .of_match_table =3D of_match_clk_en7523,

suppress_bind_attrs?

> +       },
> +};
