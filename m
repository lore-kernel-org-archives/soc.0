Return-Path: <jic23@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2FDC433F5
	for <soc@archiver.kernel.org>; Sun, 16 Jan 2022 11:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 17ABBC36AE7; Sun, 16 Jan 2022 11:13:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C98FCC36AE3;
	Sun, 16 Jan 2022 11:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642331621;
	bh=Fg121GflpmYLjIKrlP/YRUChTu7q0Vsm7v3+PjUcPjI=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=WZnagPQvLw3cJ+yNzQSJxk2OWbF9EZni/x+LssKH/zCYzy+Zh3oLmjO784ELKrn/F
	 89XPCH3tTQ3Gy4Kctp/WXCHgrrffRGfMaCQp+44py0Mp7FChw/npW6H4nIjacUcj3S
	 Tu1At+0FbXE/LD5Uf7Z9Ce8kkwdVoWh/xEZPl/JmZuHJgOfLITXUQnkZzTTt43fuVN
	 0udocqfWwJF854VMQgpmGS+NbYrh6r96q4oG28+zKSwTL33z5WJ+D1PwlfxauHSwSa
	 ZOxy/LIVJPtgWX6AZILTxGAyN14dY6jQMS4GBuxvgqibW4djeXr70S7loqvDpi+rMB
	 oRPawMwx/PK/g==
Date: Sun, 16 Jan 2022 11:19:39 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 olof@lixom.net, linus.walleij@linaro.org, catalin.marinas@arm.com,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org,
 pankaj.dubey@samsung.com, linux-fsd@tesla.com, linux-iio@vger.kernel.org,
 Tamseel Shams <m.shams@samsung.com>
Subject: Re: [PATCH 21/23] iio: adc: exynos-adc: Add support for ADC V3
 controller
Message-ID: <20220116111939.413ece7e@jic23-huawei>
In-Reply-To: <20220113121143.22280-22-alim.akhtar@samsung.com>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
	<CGME20220113122452epcas5p201a3a87d0e9c0e9f449a90ed62de1f1c@epcas5p2.samsung.com>
	<20220113121143.22280-22-alim.akhtar@samsung.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 13 Jan 2022 17:41:41 +0530
Alim Akhtar <alim.akhtar@samsung.com> wrote:

> Exynos's ADC-V3 has some difference in registers set, number of
> programmable channels (16 channel) etc. This patch adds support for ADC-V3
> controller version.
> 
> Cc: linux-fsd@tesla.com
> Cc: jic23@kernel.org
> Cc: linux-iio@vger.kernel.org
> Signed-off-by: Tamseel Shams <m.shams@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>

Hi Alim,

A few minor suggestions below.  I'm not seeing a binding update though...

I'd also suggest that it would be more appropriate to break this out as
a separate mini series from the main support so that it can be reviewed
and merge separately. It's not ideal when a list just gets patch 21 of
23 with no cover letter etc sent to it.

Jonathan

> ---
>  drivers/iio/adc/exynos_adc.c | 74 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 72 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iio/adc/exynos_adc.c b/drivers/iio/adc/exynos_adc.c
> index 3b3868aa2533..61752e798fd6 100644
> --- a/drivers/iio/adc/exynos_adc.c
> +++ b/drivers/iio/adc/exynos_adc.c
> @@ -55,6 +55,11 @@
>  #define ADC_V2_INT_ST(x)	((x) + 0x14)
>  #define ADC_V2_VER(x)		((x) + 0x20)
>  
> +/* ADC_V3 register definitions */
> +#define ADC_V3_DAT(x)			((x) + 0x08)
> +#define ADC_V3_DAT_SUM(x)		((x) + 0x0C)
> +#define ADC_V3_DBG_DATA(x)		((x) + 0x1C)
> +
>  /* Bit definitions for ADC_V1 */
>  #define ADC_V1_CON_RES		(1u << 16)
>  #define ADC_V1_CON_PRSCEN	(1u << 14)
> @@ -92,6 +97,7 @@
>  
>  /* Bit definitions for ADC_V2 */
>  #define ADC_V2_CON1_SOFT_RESET	(1u << 2)
> +#define ADC_V2_CON1_SOFT_NON_RESET	(1u << 1)
>  
>  #define ADC_V2_CON2_OSEL	(1u << 10)
>  #define ADC_V2_CON2_ESEL	(1u << 9)
> @@ -100,6 +106,7 @@
>  #define ADC_V2_CON2_ACH_SEL(x)	(((x) & 0xF) << 0)
>  #define ADC_V2_CON2_ACH_MASK	0xF
>  
> +#define MAX_ADC_V3_CHANNELS		16
>  #define MAX_ADC_V2_CHANNELS		10
>  #define MAX_ADC_V1_CHANNELS		8
>  #define MAX_EXYNOS3250_ADC_CHANNELS	2

Given we have a mixture of required an unrequired elements in this structure
it might be a good idea to add some documentation.  Kernel-doc for the whole
structure preferred.  Note this isn't necessarily something that needs to be
in this patch given the lack of docs predates this and with the change to make
adc_isr() required that I suggest below things aren't made worse by this patch.

> @@ -164,6 +171,7 @@ struct exynos_adc_data {
>  	void (*exit_hw)(struct exynos_adc *info);
>  	void (*clear_irq)(struct exynos_adc *info);
>  	void (*start_conv)(struct exynos_adc *info, unsigned long addr);
> +	irqreturn_t (*adc_isr)(int irq, void *dev_id);
>  };
>  
>  static void exynos_adc_unprepare_clk(struct exynos_adc *info)
> @@ -484,6 +492,59 @@ static const struct exynos_adc_data exynos7_adc_data = {
>  	.start_conv	= exynos_adc_v2_start_conv,
>  };
>  
> +static void exynos_adc_v3_init_hw(struct exynos_adc *info)
> +{
> +	u32 con2;
> +
> +	writel(ADC_V2_CON1_SOFT_RESET, ADC_V2_CON1(info->regs));
> +
> +	writel(ADC_V2_CON1_SOFT_NON_RESET, ADC_V2_CON1(info->regs));
> +
> +	con2 = ADC_V2_CON2_C_TIME(6);
> +	writel(con2, ADC_V2_CON2(info->regs));
> +
> +	/* Enable interrupts */
> +	writel(1, ADC_V2_INT_EN(info->regs));
> +}
> +
> +static void exynos_adc_v3_exit_hw(struct exynos_adc *info)
> +{
> +	u32 con2;
> +
> +	con2 = readl(ADC_V2_CON2(info->regs));
> +	con2 &= ~ADC_V2_CON2_C_TIME(7);
> +	writel(con2, ADC_V2_CON2(info->regs));
> +
> +	/* Disable interrupts */
> +	writel(0, ADC_V2_INT_EN(info->regs));
> +}
> +
> +static irqreturn_t exynos_adc_v3_isr(int irq, void *dev_id)
> +{
> +	struct exynos_adc *info = (struct exynos_adc *)dev_id;

Shouldn't need the cast as cast from void * to another pointer
is always valid in C without the explicit cast.

> +	u32 mask = info->data->mask;
> +
> +	info->value = readl(ADC_V3_DAT(info->regs)) & mask;
> +
> +	if (info->data->clear_irq)
> +		info->data->clear_irq(info);

Don't need this currently as v3_isr() is always matched
with clear_isr() being provided.  Having the check implies
otherwise which is probably not a good thing to do until some future
device support (maybe) needs it.

> +
> +	complete(&info->completion);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static const struct exynos_adc_data exynos_adc_v3_adc_data = {
> +	.num_channels	= MAX_ADC_V3_CHANNELS,
> +	.mask		= ADC_DATX_MASK, /* 12 bit ADC resolution */
> +
> +	.init_hw	= exynos_adc_v3_init_hw,
> +	.exit_hw	= exynos_adc_v3_exit_hw,
> +	.clear_irq	= exynos_adc_v2_clear_irq,
> +	.start_conv	= exynos_adc_v2_start_conv,
> +	.adc_isr	= exynos_adc_v3_isr,
> +};
> +
>  static const struct of_device_id exynos_adc_match[] = {
>  	{
>  		.compatible = "samsung,s3c2410-adc",
> @@ -518,6 +579,9 @@ static const struct of_device_id exynos_adc_match[] = {
>  	}, {
>  		.compatible = "samsung,exynos7-adc",
>  		.data = &exynos7_adc_data,
> +	}, {
> +		.compatible = "samsung,exynos-adc-v3",
> +		.data = &exynos_adc_v3_adc_data,
>  	},
>  	{},
>  };
> @@ -719,6 +783,12 @@ static const struct iio_chan_spec exynos_adc_iio_channels[] = {
>  	ADC_CHANNEL(7, "adc7"),
>  	ADC_CHANNEL(8, "adc8"),
>  	ADC_CHANNEL(9, "adc9"),
> +	ADC_CHANNEL(10, "adc10"),
> +	ADC_CHANNEL(11, "adc11"),
> +	ADC_CHANNEL(12, "adc12"),
> +	ADC_CHANNEL(13, "adc13"),
> +	ADC_CHANNEL(14, "adc14"),
> +	ADC_CHANNEL(15, "adc15"),
>  };
>  
>  static int exynos_adc_remove_devices(struct device *dev, void *c)
> @@ -885,8 +955,8 @@ static int exynos_adc_probe(struct platform_device *pdev)
>  
>  	mutex_init(&info->lock);
>  
> -	ret = request_irq(info->irq, exynos_adc_isr,
> -					0, dev_name(&pdev->dev), info);
> +	ret = request_irq(info->irq, info->data->adc_isr ? info->data->adc_isr :
> +				exynos_adc_isr, 0, dev_name(&pdev->dev), info);

I'd rather see the slightly larger change of providing adc_isr for existing
parts and the conditional part here going away.

Jonathan


>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "failed requesting irq, irq = %d\n",
>  							info->irq);

