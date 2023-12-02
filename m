Return-Path: <SRS0=d21C=HN=google.com=willmcvicker@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58C00C07E97
	for <soc@archiver.kernel.org>; Sat,  2 Dec 2023 00:01:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C4B1C43391; Sat,  2 Dec 2023 00:01:46 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 12FF8C433C9
	for <soc@kernel.org>; Sat,  2 Dec 2023 00:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 12FF8C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d0477a0062so57145ad.0
        for <soc@kernel.org>; Fri, 01 Dec 2023 16:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701475304; x=1702080104; darn=kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mAq9aESkSR3AFEFm9X9jLBFq75wW+IJ+aFdTgvAj3CA=;
        b=EW8WgnT3hu2q8LkYQJBWP7+ZAtMW6KE1al7VsWBVhvWMdeY5h+E87zZH97HWXDH2vE
         XJyJsaDU+7RruTAcCrI4xIrntPtLVs2z/1LpgUhGA2kEm44veMFoQpxjxAZKNexKRo5M
         iiulz3xPS3Qd0NeWLEoO4E0asohGRny4AvH19g2RSovOuPtfNx9yUqnM7M91K922oYcZ
         T5BQngjdGBa0O62/Nf54BTVrQ1A024yF6pmdXRoGcq/rQFDu3KnNfj8M2Wkl2AkzA6HX
         WSCObxXzp4EZ8gC1CC3THO8Iz9ft2js4YWuiUyDUOEe1ONZLPtKoHIegXNJmZ3CP7huq
         Nbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701475304; x=1702080104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAq9aESkSR3AFEFm9X9jLBFq75wW+IJ+aFdTgvAj3CA=;
        b=S2UrBoBelc9FsSaqDk+JcWmJdp5wYRC4cEpJkcyoiHivbfvUaAdTJW2H/gdy07Oe0P
         /cKq59ybCKo4J8KtalsZXswZZu1349PjB6CPoHcgw4jRcQqaODgKqeVGfWIDk1cxmcjk
         DP23qna5jDUGtjSb+aDSFY2SLar7zKuosRpMIUFPi4qCOpp6ff/S0vShmO0QznrcUCEY
         zTdTKQZELBkdXQ6AZB5+s86NjuS3bFY3EEo35/LwRRNs6SZtaDzkBb5JIMkM9csGMIrK
         vDLKq+XKvNwnO43BVvIzMg4Gnw9Hli5AVUp4g+t+pyzZWB4GmMZpbZcFzZGpcGvIUwQ2
         9rbA==
X-Gm-Message-State: AOJu0YzEvhvuKlT3EGwChgX131bQjQ3iQZkYyK8NWOwFhugjnJf/lmG4
	K2beQFk3fbCpxzmEPdjZbWzOYw==
X-Google-Smtp-Source: AGHT+IE17kpLJ8Q5Lug32eokrVRrSIqitRaVpd6LfPR22gRh2ZjbVP9mKMFERR3xRKkC14Zj3KFEnQ==
X-Received: by 2002:a17:902:c950:b0:1cf:dbef:79c4 with SMTP id i16-20020a170902c95000b001cfdbef79c4mr361753pla.16.1701475304205;
        Fri, 01 Dec 2023 16:01:44 -0800 (PST)
Received: from google.com (148.98.83.34.bc.googleusercontent.com. [34.83.98.148])
        by smtp.gmail.com with ESMTPSA id li18-20020a17090b48d200b00274922d4b38sm3738989pjb.27.2023.12.01.16.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 16:01:43 -0800 (PST)
Date: Fri, 1 Dec 2023 16:01:40 -0800
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
Subject: Re: [PATCH v5 17/20] tty: serial: samsung: Add gs101 compatible and
 common fifoszdt_serial_drv_data
Message-ID: <ZWpz5L2g4SB2cdVD@google.com>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-18-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201160925.3136868-18-peter.griffin@linaro.org>

On 12/01/2023, Peter Griffin wrote:
> Add serial driver data for Google Tensor gs101 SoC and a common
> fifoszdt_serial_drv_data that can be used by platforms that specify the
> samsung,uart-fifosize DT property.
> 
> A corresponding dt-bindings patch updates the yaml to ensure
> samsung,uart-fifosize is a required property.
> 
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

---

I verified boot to a busybox console with kernel logs printed to the serial
port.

Regards,
Will

> ---
>  drivers/tty/serial/samsung_tty.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 1b0c2b467a30..f8d98f1006de 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2490,14 +2490,25 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
>  	.fifosize = { 256, 64, 64, 64 },
>  };
>  
> +/*
> + * Common drv_data struct for platforms that specify uart,fifosize in
> + * device tree.
> + */
> +static const struct s3c24xx_serial_drv_data exynos_fifoszdt_serial_drv_data = {
> +	EXYNOS_COMMON_SERIAL_DRV_DATA(),
> +	.fifosize = { 0 },
> +};
> +
>  #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
>  #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
>  #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
> +#define EXYNOS_FIFOSZDT_DRV_DATA (&exynos_fifoszdt_serial_drv_data)
>  
>  #else
>  #define EXYNOS4210_SERIAL_DRV_DATA NULL
>  #define EXYNOS5433_SERIAL_DRV_DATA NULL
>  #define EXYNOS850_SERIAL_DRV_DATA NULL
> +#define EXYNOS_FIFOSZDT_DRV_DATA NULL
>  #endif
>  
>  #ifdef CONFIG_ARCH_APPLE
> @@ -2581,6 +2592,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
>  	}, {
>  		.name		= "artpec8-uart",
>  		.driver_data	= (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
> +	}, {
> +		.name		= "gs101-uart",
> +		.driver_data	= (kernel_ulong_t)EXYNOS_FIFOSZDT_DRV_DATA,
>  	},
>  	{ },
>  };
> @@ -2602,6 +2616,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
>  		.data = EXYNOS850_SERIAL_DRV_DATA },
>  	{ .compatible = "axis,artpec8-uart",
>  		.data = ARTPEC8_SERIAL_DRV_DATA },
> +	{ .compatible = "google,gs101-uart",
> +		.data = EXYNOS_FIFOSZDT_DRV_DATA },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> -- 
> 2.43.0.rc2.451.g8631bc7472-goog
> 
