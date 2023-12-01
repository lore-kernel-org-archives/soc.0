Return-Path: <SRS0=F/1U=HM=google.com=willmcvicker@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97F09C4167B
	for <soc@archiver.kernel.org>; Fri,  1 Dec 2023 23:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6864DC43395; Fri,  1 Dec 2023 23:59:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C4A9C433C8
	for <soc@kernel.org>; Fri,  1 Dec 2023 23:59:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4C4A9C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1cfd9ce0745so25615ad.1
        for <soc@kernel.org>; Fri, 01 Dec 2023 15:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701475182; x=1702079982; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CsnZ8tLi44TF4B/LPOeT4LSUfzukYQ6OFttHE+3YHUw=;
        b=YnSHOWY+DsXJaoeqCAwexCDb9qr67t7PJhnprqmwcnMHBMQievC9e7QrQoEeVwLMDn
         JSLbCWGhrdORTwYl+0OBN3tcVeAszIwce7oLxNaoZd4AAftBr+WroBMCVtLgInozO/ri
         okH7qquLsj4H4nGqF4Q4AdZl/ZTKYYijtsttgQsKpw4LNCcXKRzDR4F14sb6EFoIhYYU
         pccY8vlTE6bn/tUwsHBdl1u4mGt4OAvNZaakWP9e/+1gTXB/KaHTPjmeq9qaspx/xmIs
         McL3hGQrhnkuTHH65BODdecqHsBN7/ldMgte7NriOx0oeNRB6RqqMBDsate+1bY/IyOh
         ElDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701475182; x=1702079982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CsnZ8tLi44TF4B/LPOeT4LSUfzukYQ6OFttHE+3YHUw=;
        b=ev5MOnfeKYBVk1cZ144abW2rJm74zgspR5f3CvKnx5jxfsr77PcoKu91FwLAvsbc5B
         pjv6ykF/+Rq4SXP8RSiCLTaRFeBXmp7fjZL9+EKfshhYCNjjJYUlMPDd/AdrnUOorodi
         +FMdm3WIhKATSECwNyC86O4l71TmfB6EEIOAnRFSkHhpu2y4Y8ZzXSWIopn4/V5DFQX8
         s3vBLlWZt7z59rBqOj3G/svbk6xnWv8j95An5Dw1oXeZDYcizROA3+Rt3eamAXohq8MM
         X7HZIUnJNA5hAoGR+TQrSAT1YsB3SR3nTR7AR3Y8bwjm9l7+GzKGX3Banr00ZfgKao7+
         +qOw==
X-Gm-Message-State: AOJu0YzHeqyCnIDzaGsEfaB27KDJ1pVDmoDu/PkWHc1N7A4xa7/A9+8Z
	zIrPlsuZkE1AFae7HeGipPkaJA==
X-Google-Smtp-Source: AGHT+IH/oQZ/e/nrVEW7sYNHAvPkCVP2lTNjXcyASwa9y5ndnxVIOks5Ta27JEirSwxZej1ki1pGuA==
X-Received: by 2002:a17:903:258c:b0:1d0:4885:d45d with SMTP id jb12-20020a170903258c00b001d04885d45dmr358689plb.10.1701475181432;
        Fri, 01 Dec 2023 15:59:41 -0800 (PST)
Received: from google.com (148.98.83.34.bc.googleusercontent.com. [34.83.98.148])
        by smtp.gmail.com with ESMTPSA id ep13-20020a17090ae64d00b0028672722301sm5960pjb.40.2023.12.01.15.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 15:59:40 -0800 (PST)
Date: Fri, 1 Dec 2023 15:59:37 -0800
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
	tomasz.figa@gmail.com, s.nawrocki@samsung.com,
	linus.walleij@linaro.org, wim@linux-watchdog.org,
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 16/20] watchdog: s3c2410_wdt: Add support for Google
 gs101 SoC
Message-ID: <ZWpzaQ4uLNFXCr8q@google.com>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-17-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201160925.3136868-17-peter.griffin@linaro.org>

On 12/01/2023, Peter Griffin wrote:
> This patch adds the compatibles and drvdata for the Google
> gs101 SoC found in Pixel 6, Pixel 6a & Pixel 6 pro phones.
> 
> Similar to Exynos850 it has two watchdog instances, one for
> each cluster and has some control bits in PMU registers.
> 
> gs101 also has the dbgack_mask bit in wtcon register, so
> we also enable QUIRK_HAS_DBGACK_BIT.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

---

I verified boot to a busybox console and that the watchdog probes.

Regards,
Will

> ---
>  drivers/watchdog/s3c2410_wdt.c | 47 ++++++++++++++++++++++++++++++----
>  1 file changed, 42 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index 39f3489e41d6..c1ae71574457 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -68,6 +68,13 @@
>  #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
>  #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
>  
> +#define GS_CLUSTER0_NONCPU_OUT			0x1220
> +#define GS_CLUSTER1_NONCPU_OUT			0x1420
> +#define GS_CLUSTER0_NONCPU_INT_EN		0x1244
> +#define GS_CLUSTER1_NONCPU_INT_EN		0x1444
> +#define GS_CLUSTER2_NONCPU_INT_EN		0x1644
> +#define GS_RST_STAT_REG_OFFSET			0x3B44
> +
>  /**
>   * DOC: Quirk flags for different Samsung watchdog IP-cores
>   *
> @@ -269,6 +276,30 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
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
> +		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
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
> +		  QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
> +};
> +
>  static const struct of_device_id s3c2410_wdt_match[] = {
>  	{ .compatible = "samsung,s3c2410-wdt",
>  	  .data = &drv_data_s3c2410 },
> @@ -284,6 +315,8 @@ static const struct of_device_id s3c2410_wdt_match[] = {
>  	  .data = &drv_data_exynos850_cl0 },
>  	{ .compatible = "samsung,exynosautov9-wdt",
>  	  .data = &drv_data_exynosautov9_cl0 },
> +	{ .compatible = "google,gs101-wdt",
> +	  .data = &drv_data_gs101_cl0 },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, s3c2410_wdt_match);
> @@ -604,9 +637,10 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>  	}
>  
>  #ifdef CONFIG_OF
> -	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
> +	/* Choose Exynos850/ExynosAutov9/gs101 driver data w.r.t. cluster index */
>  	if (variant == &drv_data_exynos850_cl0 ||
> -	    variant == &drv_data_exynosautov9_cl0) {
> +	    variant == &drv_data_exynosautov9_cl0 ||
> +	    variant == &drv_data_gs101_cl0) {
>  		u32 index;
>  		int err;
>  
> @@ -619,9 +653,12 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
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
>  			break;
>  		default:
>  			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
> -- 
> 2.43.0.rc2.451.g8631bc7472-goog
> 
