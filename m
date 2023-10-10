Return-Path: <SRS0=DBWy=FY=gmail.com=groeck7@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1204CD98C0
	for <soc@archiver.kernel.org>; Tue, 10 Oct 2023 23:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78330C433C7; Tue, 10 Oct 2023 23:56:16 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F32A4C433C8;
	Tue, 10 Oct 2023 23:56:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F32A4C433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-49e035bdca7so1650096e0c.2;
        Tue, 10 Oct 2023 16:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696982174; x=1697586974; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=81q6JGyTrQkoGOoIsyVbwevzEO/VUyof31ZjWP977mU=;
        b=kdUa6OSOjpT8tkZWpdv10j6y8gSr+gUUA77wpcfiYn9H6vxv1z59bDqs/XHTraXfx3
         347K2zBrBP5xEkW5xnm+9KxJZUi5Ry+g2LPAA2pRD2P6Cja6FZYfZZl9qOLGaCkaExoO
         NMYGLSIA4wQ8gOeTk5sDfTZ4ooI8GFcSTTzzQi4Ihaw9C0mWav8aVGXDvx19TYfdPb1/
         BXEYiyR8cRx+SU9L091luWfIO6R00JxM50C4PmjzEGelYD71Z91V728VQb5oIRV7f1gh
         nwM1dc017d9UDP/pF0z6DG1mZVEOgWS4LIQIUfRhuo2StBLzLsxWMeFQUVx5efd7b77R
         clmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696982174; x=1697586974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81q6JGyTrQkoGOoIsyVbwevzEO/VUyof31ZjWP977mU=;
        b=IVUBRNehytshSd+94eLHjYGgLVWz4+MMh+4jZYWlCvMPSubM8u8Dlz4MuhGEDUEaov
         Gf99mLUwk0tCw+NFEMBQ/U8+eBRcJZsgMHQAVsKwh8H0o61DtIkDe2YXhsSlBH16Atxb
         7YCqR+USxKtRkLLwzK2C7VzuTU6uUiR/e3jY/ubbMGEWa7Sm5SJC1vFDtL9WDj+hKU+Q
         AaMxdSzr4XD1/BTNyGSZlc7yj06DuvpzFuSZ3ZrtoDm6p04WApeTQ7k2WcFCp5hJxogf
         eKQgcQDI5FQbA6Gq272Wo9RlgdHiRfY/SHH58XsslkAPkwUf1HgtaNekDRQs9HLfeF6W
         iRDg==
X-Gm-Message-State: AOJu0YwCn7midaxB53PRfixtqJGZOPrM2rKzL9DapBf9OJEDWM6aipio
	WGpR8UeNe3YMey1UsvkifZ8=
X-Google-Smtp-Source: AGHT+IFxOSIstbwDUhScD3UnbX41CGxXoQr7rYjO1d7eEYKArjvWODITwh3Sfy4A8h03bKu8fyHOiQ==
X-Received: by 2002:a1f:ca83:0:b0:49d:d91:8b27 with SMTP id a125-20020a1fca83000000b0049d0d918b27mr15458605vkg.2.1696982173711;
        Tue, 10 Oct 2023 16:56:13 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 10-20020ac5ce8a000000b0049a5b8d475csm2305003vke.34.2023.10.10.16.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 16:56:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 10 Oct 2023 16:56:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
	tomasz.figa@gmail.com, s.nawrocki@samsung.com,
	linus.walleij@linaro.org, wim@linux-watchdog.org,
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
	olof@lixom.net, cw00.choi@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 15/20] watchdog: s3c2410_wdt: Add support for Google
 tensor SoCs
Message-ID: <e2320e90-5e3b-4b50-8af9-56dee639d022@roeck-us.net>
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-16-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010224928.2296997-16-peter.griffin@linaro.org>

On Tue, Oct 10, 2023 at 11:49:23PM +0100, Peter Griffin wrote:
> This patch adds the compatibles and drvdata for the Google
> gs101 & gs201 SoCs found in Pixel 6 and Pixel 7 phones. Similar
> to Exynos850 it has two watchdog instances, one for each cluster
> and has some control bits in PMU registers.
> 
> The watchdog IP found in gs101 SoCs also supports a few
> additional bits/features in the WTCON register which we add
> support for and an additional register detailed below.
> 
> dbgack-mask - Enables masking WDT interrupt and reset request
> according to asserted DBGACK input
> 
> windowed-mode - Enabled Windowed watchdog mode
> 
> Windowed watchdog mode also has an additional register WTMINCNT.
> If windowed watchdog is enabled and you reload WTCNT when the
> value is greater than WTMINCNT, it prompts interrupt or reset
> request as if the watchdog time has expired.

I am a bit lost with this one. The patch adds QUIRK_HAS_WTMINCNT_REG
but doesn't use it. It also adds S3C2410_WTMINCNT but does not use it
either.

What is the point of doing that ? It is just confusing.

Guenter

> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 104 ++++++++++++++++++++++++++++++---
>  1 file changed, 95 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 0b4bd883ff28..08a775c01c57 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -31,12 +31,14 @@
>  #define S3C2410_WTDAT		0x04
>  #define S3C2410_WTCNT		0x08
>  #define S3C2410_WTCLRINT	0x0c
> -
> +#define S3C2410_WTMINCNT	0x10
>  #define S3C2410_WTCNT_MAXCNT	0xffff
>  
> -#define S3C2410_WTCON_RSTEN	(1 << 0)
> -#define S3C2410_WTCON_INTEN	(1 << 2)
> -#define S3C2410_WTCON_ENABLE	(1 << 5)
> +#define S3C2410_WTCON_RSTEN		(1 << 0)
> +#define S3C2410_WTCON_INTEN		(1 << 2)
> +#define S3C2410_WTCON_ENABLE		(1 << 5)
> +#define S3C2410_WTCON_DBGACK_MASK	(1 << 16)
> +#define S3C2410_WTCON_WINDOWED_WD	(1 << 20)
>  
>  #define S3C2410_WTCON_DIV16	(0 << 3)
>  #define S3C2410_WTCON_DIV32	(1 << 3)
> @@ -67,6 +69,12 @@
>  #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
>  #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
>  
> +#define GS_CLUSTER0_NONCPU_OUT			0x1220
> +#define GS_CLUSTER1_NONCPU_OUT			0x1420
> +#define GS_CLUSTER0_NONCPU_INT_EN		0x1244
> +#define GS_CLUSTER1_NONCPU_INT_EN		0x1444
> +#define GS_CLUSTER2_NONCPU_INT_EN		0x1644
> +#define GS_RST_STAT_REG_OFFSET			0x3B44
>  /**
>   * DOC: Quirk flags for different Samsung watchdog IP-cores
>   *
> @@ -106,6 +114,8 @@
>  #define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
>  #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
>  #define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
> +#define QUIRK_HAS_DBGACK_BIT			(1 << 5)
> +#define QUIRK_HAS_WTMINCNT_REG			(1 << 6)
>  
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG \
> @@ -263,6 +273,54 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
>  		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
>  };
>  
> +static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
> +	.mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = 0,
> +	.cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
> +	.cnt_en_bit = 8,
> +	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
> +	.mask_reset_reg = GS_CLUSTER1_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = 1,
> +	.cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_gs201_cl0 = {
> +	.mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = 0,
> +	.cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
> +	.cnt_en_bit = 8,
> +	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_gs201_cl1 = {
> +	.mask_reset_reg = GS_CLUSTER1_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = 1,
> +	.cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
> +		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_WTMINCNT_REG,
> +};
> +
>  static const struct of_device_id s3c2410_wdt_match[] = {
>  	{ .compatible = "samsung,s3c2410-wdt",
>  	  .data = &drv_data_s3c2410 },
> @@ -278,6 +336,10 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>  	  .data = &drv_data_exynos850_cl0 },
>  	{ .compatible = "samsung,exynosautov9-wdt",
>  	  .data = &drv_data_exynosautov9_cl0 },
> +	{ .compatible = "google,gs101-wdt",
> +	  .data = &drv_data_gs101_cl0 },
> +	{ .compatible = "google,gs201-wdt",
> +	  .data = &drv_data_gs201_cl0 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> @@ -375,6 +437,21 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
>  	return 0;
>  }
>  
> +static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt, bool mask)
> +{
> +	unsigned long wtcon;
> +
> +	if (!(wdt->drv_data->quirks & QUIRK_HAS_DBGACK_BIT))
> +		return;
> +
> +	wtcon = readl(wdt->reg_base + S3C2410_WTCON);
> +	if (mask)
> +		wtcon |= S3C2410_WTCON_DBGACK_MASK;
> +	else
> +		wtcon &= ~S3C2410_WTCON_DBGACK_MASK;
> +	writel(wtcon, wdt->reg_base + S3C2410_WTCON);
> +}
> +
>  static int s3c2410wdt_keepalive(struct watchdog_device *wdd)
>  {
>  	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
> @@ -585,9 +662,11 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>  	}
>  
>  #ifdef CONFIG_OF
> -	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
> +	/* Choose Exynos850/ExynosAutov9/gsx01 driver data w.r.t. cluster index */
>  	if (variant == &drv_data_exynos850_cl0 ||
> -	    variant == &drv_data_exynosautov9_cl0) {
> +	    variant == &drv_data_exynosautov9_cl0 ||
> +	    variant == &drv_data_gs101_cl0 ||
> +	    variant == &drv_data_gs201_cl0) {
>  		u32 index;
>  		int err;
>  
> @@ -600,9 +679,14 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>  		case 0:
>  			break;
>  		case 1:
> -			variant = (variant == &drv_data_exynos850_cl0) ?
> -				&drv_data_exynos850_cl1 :
> -				&drv_data_exynosautov9_cl1;
> +			if (variant == &drv_data_exynos850_cl0)
> +				variant = &drv_data_exynos850_cl1;
> +			else if (variant == &drv_data_exynosautov9_cl0)
> +				variant = &drv_data_exynosautov9_cl1;
> +			else if (variant == &drv_data_gs101_cl0)
> +				variant = &drv_data_gs101_cl1;
> +			else if (variant == &drv_data_gs201_cl0)
> +				variant = &drv_data_gs201_cl1;
>  			break;
>  		default:
>  			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
> @@ -700,6 +784,8 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
>  	wdt->wdt_device.parent = dev;
>  
> +	s3c2410wdt_mask_dbgack(wdt, true);
> +
>  	/*
>  	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
>  	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
> -- 
> 2.42.0.609.gbb76f46606-goog
> 
