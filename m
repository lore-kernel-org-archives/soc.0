Return-Path: <SRS0=2bQ/=FZ=google.com=willmcvicker@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A019ACDB482
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 21:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 64473C433C9; Wed, 11 Oct 2023 21:54:32 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 462B0C433CA
	for <soc@kernel.org>; Wed, 11 Oct 2023 21:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 462B0C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c9d4f08d7cso61635ad.0
        for <soc@kernel.org>; Wed, 11 Oct 2023 14:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697061269; x=1697666069; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hFNTOUr3sjh42JldH+ELeMO62wE15U4NeCTwSZiG1r0=;
        b=KRL3hr38wyhP0cDJILGvfodA6pSXiPrU5/KYM/b8hse2RmSYNNpxqiur81Iwv8oqUR
         mkRXhqAbe5JlrLmvM+W+Slly/21RIWv0BlUviajTi+MgTleKFPySPrNmY1kypksThP2L
         9gW/8ZMKopeR0t57LamKeoygNqq1omL+WazvBmeZrkc/gH4elRI48H3RCDRIn5WZoUEH
         UqxGpNcC+f2P6S37wqhOfwUuhkjVH8FyrSJUwHlHLnLdvZ3e/5N/7cc/7Paq/i5m4pBS
         YTHwok70glK2zj7N/InwW0JZDdcsQvXi6pTFlJTmaUj8+H6zOdVqN4RQIzw1YXfOb7/D
         aRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697061269; x=1697666069;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hFNTOUr3sjh42JldH+ELeMO62wE15U4NeCTwSZiG1r0=;
        b=sLK0iO/gXhfVpYBpi3lMweRgKI3KvhYWcqrEjI7ohIu9IV28k++dVvdpZcPBRIdpvb
         wMjxehXYxRomF0u+iQyZfjJxgaPT7EHdcDM98PGwXi1Y4sPswCZnU7n0dU5AcEhhhMI7
         j7wJzvOpB/qolWdb8k2IeES0Q0rCNBU4BaEMLXfnHI/vcz00GoIjNNs0w+W5sVrLHKpe
         pA4xIN7rFb034b/twHGzotSZ3PtU1cfWR8tbGkcFJISdFp86hyNDHYZ0n/jb1KhyautT
         OiTycXKH06RBYgzCj3AGD5mRTelD+cDnC2x7Z5vLaayW5e0oMbtaqC59/EY+MgL+6DDs
         JDfA==
X-Gm-Message-State: AOJu0Yxq3aMuHYfii2UDuqzJEXLzPCySLxbTxJ5uu/Uq6C26XnOzb97S
	H1r5rrk2ggxeLpPq1u50/Kcz/w==
X-Google-Smtp-Source: AGHT+IESnmMbD2m86bsiGhw8JvUJbRSUCZ9voOyC7gGycNSvge5EBHqaFjy4tS+2pc3LAqrXcBMp8A==
X-Received: by 2002:a17:903:228f:b0:1c3:976e:22e6 with SMTP id b15-20020a170903228f00b001c3976e22e6mr363519plh.12.1697061269436;
        Wed, 11 Oct 2023 14:54:29 -0700 (PDT)
Received: from google.com (13.65.82.34.bc.googleusercontent.com. [34.82.65.13])
        by smtp.gmail.com with ESMTPSA id e19-20020aa78253000000b006950032f0c9sm10551259pfn.84.2023.10.11.14.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 14:54:28 -0700 (PDT)
Date: Wed, 11 Oct 2023 14:54:25 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
	tomasz.figa@gmail.com, s.nawrocki@samsung.com,
	linus.walleij@linaro.org, wim@linux-watchdog.org,
	linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
	cw00.choi@samsung.com, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, semen.protsenko@linaro.org,
	saravanak@google.com, soc@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
	kernel-team@android.com, linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 16/20] tty: serial: samsung: Add gs101 compatible and
 SoC data
Message-ID: <ZScZkWWATxdd4oqP@google.com>
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-17-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011184823.443959-17-peter.griffin@linaro.org>

On 10/11/2023, Peter Griffin wrote:
> Add serial driver data for Google Tensor gs101 SoC.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 07fb8a9dac63..26bc52e681a4 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2597,14 +2597,22 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
>  	.fifosize = { 256, 64, 64, 64 },
>  };
>  
> +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
> +	EXYNOS_COMMON_SERIAL_DRV_DATA(),
> +	/* rely on samsung,uart-fifosize DT property for fifosize */
> +	.fifosize = { 0 },
> +};
> +
>  #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
>  #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
>  #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
> +#define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)
>  
>  #else
>  #define EXYNOS4210_SERIAL_DRV_DATA NULL
>  #define EXYNOS5433_SERIAL_DRV_DATA NULL
>  #define EXYNOS850_SERIAL_DRV_DATA NULL
> +#define GS101_SERIAL_DRV_DATA NULL
>  #endif
>  
>  #ifdef CONFIG_ARCH_APPLE
> @@ -2688,6 +2696,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
>  	}, {
>  		.name		= "artpec8-uart",
>  		.driver_data	= (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
> +	}, {
> +		.name		= "gs101-uart",
> +		.driver_data	= (kernel_ulong_t)GS101_SERIAL_DRV_DATA,
>  	},
>  	{ },
>  };
> @@ -2709,6 +2720,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
>  		.data = EXYNOS850_SERIAL_DRV_DATA },
>  	{ .compatible = "axis,artpec8-uart",
>  		.data = ARTPEC8_SERIAL_DRV_DATA },
> +	{ .compatible = "google,gs101-uart",
> +		.data =  GS101_SERIAL_DRV_DATA },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> -- 
> 2.42.0.655.g421f12c284-goog
> 
