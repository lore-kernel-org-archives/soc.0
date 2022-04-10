Return-Path: <shawnguo@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4D1C433F5
	for <soc@archiver.kernel.org>; Sun, 10 Apr 2022 08:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C4C1C385A1; Sun, 10 Apr 2022 08:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6C7C385A4;
	Sun, 10 Apr 2022 08:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649578217;
	bh=oWcijgduq6hUVYArMN1t5D+6iZ2KcSmM4K89CBwgrzw=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=dvHC0jxZKRqtrdlvjRnnurubVK1sZ+SfPdvdQZT31K91dyMREeFREiI57hbcCSyuG
	 6IxDfreb9ZLiIWVo7jemEqk5jkB0w9ml4YebKlRtI8aGCuBPjLPfdZdo5GrwqZigLK
	 fiI+Mlgfwp6gBH+asSfzTFwGQbS3VriGiTyKdVpPuTe0ZOuj3asNl2218xEzYocRoJ
	 nEpg0cJQXIABfNyLwODLu/30oDODYSJ9eu+RyxP4SqZA8yDYa2l8cKjhjhBbC8MgJj
	 9oK5lmDe3G6t8hAWLfYQWpoDqKe87OJvl3Kyh0j/37GkmD4qgmcGtcPW6uDpEXH5dc
	 NGGxqVcwHn1wg==
Date: Sun, 10 Apr 2022 16:10:08 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Jesse Taube <mr.bossman075@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, aisheng.dong@nxp.com, stefan@agner.ch,
	linus.walleij@linaro.org, daniel.lezcano@linaro.org,
	tglx@linutronix.de, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
	linux@armlinux.org.uk, abel.vesa@nxp.com, dev@lynxeye.de,
	marcel.ziswiler@toradex.com, tharvey@gateworks.com,
	leoyang.li@nxp.com, sebastian.reichel@collabora.com,
	cniedermaier@dh-electronics.com, clin@suse.com,
	giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v1 06/12] ARM: clk: imx: Update pllv3 to support
 i.MXRT1170
Message-ID: <20220410081008.GS129381@dragon>
References: <20220326144313.673549-1-Mr.Bossman075@gmail.com>
 <20220326144313.673549-7-Mr.Bossman075@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220326144313.673549-7-Mr.Bossman075@gmail.com>

On Sat, Mar 26, 2022 at 10:43:07AM -0400, Jesse Taube wrote:
> The i.MXRT1170 has a pll that has the multiplier bits inverted and
> cannot be changed add IMX_PLLV3_GENERICV2.
> 
> The i.MXRT1170 also has the lock bit moved as well as the
> power bit inverted the power bit also is in different locations on each
> pll control register.
> 
> Signed-off-by: Jesse Taube <Mr.Bossman075@gmail.com>

This is a patch for clk subsystem rather than ARM architecture.  So drop
'ARM: ' prefix from subject.

Shawn

> ---
>  drivers/clk/imx/clk-pllv3.c | 57 +++++++++++++++++++++++++++++++++++--
>  drivers/clk/imx/clk.h       |  4 +++
>  2 files changed, 59 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-pllv3.c b/drivers/clk/imx/clk-pllv3.c
> index 20ee9611ba6e..a1dbc3a2e280 100644
> --- a/drivers/clk/imx/clk-pllv3.c
> +++ b/drivers/clk/imx/clk-pllv3.c
> @@ -23,6 +23,7 @@
>  
>  #define BM_PLL_POWER		(0x1 << 12)
>  #define BM_PLL_LOCK		(0x1 << 31)
> +#define BM_PLL_LOCK_V2		(0x1 << 29)
>  #define IMX7_ENET_PLL_POWER	(0x1 << 5)
>  #define IMX7_DDR_PLL_POWER	(0x1 << 20)
>  
> @@ -34,6 +35,7 @@
>   * @base:	 base address of PLL registers
>   * @power_bit:	 pll power bit mask
>   * @powerup_set: set power_bit to power up the PLL
> + * @lock_bit:	 pll lock bit mask
>   * @div_mask:	 mask of divider bits
>   * @div_shift:	 shift of divider bits
>   * @ref_clock:	reference clock rate
> @@ -48,6 +50,7 @@ struct clk_pllv3 {
>  	void __iomem	*base;
>  	u32		power_bit;
>  	bool		powerup_set;
> +	u32		lock_bit;
>  	u32		div_mask;
>  	u32		div_shift;
>  	unsigned long	ref_clock;
> @@ -65,7 +68,7 @@ static int clk_pllv3_wait_lock(struct clk_pllv3 *pll)
>  	if ((pll->powerup_set && !val) || (!pll->powerup_set && val))
>  		return 0;
>  
> -	return readl_relaxed_poll_timeout(pll->base, val, val & BM_PLL_LOCK,
> +	return readl_relaxed_poll_timeout(pll->base, val, val & pll->lock_bit,
>  					  500, PLL_LOCK_TIMEOUT);
>  }
>  
> @@ -101,7 +104,7 @@ static int clk_pllv3_is_prepared(struct clk_hw *hw)
>  {
>  	struct clk_pllv3 *pll = to_clk_pllv3(hw);
>  
> -	if (readl_relaxed(pll->base) & BM_PLL_LOCK)
> +	if (readl_relaxed(pll->base) & pll->lock_bit)
>  		return 1;
>  
>  	return 0;
> @@ -155,6 +158,39 @@ static const struct clk_ops clk_pllv3_ops = {
>  	.set_rate	= clk_pllv3_set_rate,
>  };
>  
> +static int clk_pllv3_genericv2_set_rate(struct clk_hw *hw, unsigned long rate,
> +		unsigned long parent_rate)
> +{
> +	struct clk_pllv3 *pll = to_clk_pllv3(hw);
> +	u32 val, div;
> +
> +	div = (readl_relaxed(pll->base) >> pll->div_shift) & pll->div_mask;
> +	val = (div == 0) ? parent_rate * 22 : parent_rate * 20;
> +
> +	if (rate == val)
> +		return 0;
> +
> +	return -EINVAL;
> +}
> +
> +static unsigned long clk_pllv3_genericv2_recalc_rate(struct clk_hw *hw,
> +					   unsigned long parent_rate)
> +{
> +	struct clk_pllv3 *pll = to_clk_pllv3(hw);
> +	u32 div = (readl_relaxed(pll->base) >> pll->div_shift)  & pll->div_mask;
> +
> +	return (div == 0) ? parent_rate * 22 : parent_rate * 20;
> +}
> +
> +static const struct clk_ops clk_pllv3_genericv2_ops = {
> +	.prepare	= clk_pllv3_prepare,
> +	.unprepare	= clk_pllv3_unprepare,
> +	.is_prepared	= clk_pllv3_is_prepared,
> +	.recalc_rate	= clk_pllv3_genericv2_recalc_rate,
> +	.round_rate	= clk_pllv3_round_rate,
> +	.set_rate	= clk_pllv3_genericv2_set_rate,
> +};
> +
>  static unsigned long clk_pllv3_sys_recalc_rate(struct clk_hw *hw,
>  					       unsigned long parent_rate)
>  {
> @@ -407,6 +443,13 @@ static const struct clk_ops clk_pllv3_enet_ops = {
>  	.recalc_rate	= clk_pllv3_enet_recalc_rate,
>  };
>  
> +void imx_clk_hw_pll3_powerbit(struct clk_hw *hw, u8 shift)
> +{
> +	struct clk_pllv3 *pll = to_clk_pllv3(hw);
> +
> +	pll->power_bit = shift;
> +}
> +
>  struct clk_hw *imx_clk_hw_pllv3(enum imx_pllv3_type type, const char *name,
>  			  const char *parent_name, void __iomem *base,
>  			  u32 div_mask)
> @@ -422,10 +465,20 @@ struct clk_hw *imx_clk_hw_pllv3(enum imx_pllv3_type type, const char *name,
>  		return ERR_PTR(-ENOMEM);
>  
>  	pll->power_bit = BM_PLL_POWER;
> +	pll->lock_bit = BM_PLL_LOCK;
>  	pll->num_offset = PLL_NUM_OFFSET;
>  	pll->denom_offset = PLL_DENOM_OFFSET;
>  
>  	switch (type) {
> +	case IMX_PLLV3_GENERICV2:
> +		pll->lock_bit = BM_PLL_LOCK_V2;
> +		pll->powerup_set = true;
> +		ops = &clk_pllv3_genericv2_ops;
> +		break;
> +	case IMX_PLLV3_SYSV2:
> +		pll->lock_bit = BM_PLL_LOCK_V2;
> +		pll->powerup_set = true;
> +		fallthrough;
>  	case IMX_PLLV3_SYS:
>  		ops = &clk_pllv3_sys_ops;
>  		break;
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h
> index 7d220a01de1f..e70e985840a4 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -220,6 +220,8 @@ struct clk_hw *imx_clk_hw_sscg_pll(const char *name,
>  
>  enum imx_pllv3_type {
>  	IMX_PLLV3_GENERIC,
> +	IMX_PLLV3_GENERICV2,
> +	IMX_PLLV3_SYSV2,
>  	IMX_PLLV3_SYS,
>  	IMX_PLLV3_USB,
>  	IMX_PLLV3_USB_VF610,
> @@ -231,6 +233,8 @@ enum imx_pllv3_type {
>  	IMX_PLLV3_AV_IMX7,
>  };
>  
> +void imx_clk_hw_pll3_powerbit(struct clk_hw *hw, u8 shift);
> +
>  struct clk_hw *imx_clk_hw_pllv3(enum imx_pllv3_type type, const char *name,
>  		const char *parent_name, void __iomem *base, u32 div_mask);
>  
> -- 
> 2.34.1
> 
