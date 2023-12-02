Return-Path: <SRS0=Zczl=HN=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98375C4167B
	for <soc@archiver.kernel.org>; Sat,  2 Dec 2023 01:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85DE1C433CD; Sat,  2 Dec 2023 01:09:45 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C9A8C433C8
	for <soc@kernel.org>; Sat,  2 Dec 2023 01:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4C9A8C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-58df571e612so1217101eaf.0
        for <soc@kernel.org>; Fri, 01 Dec 2023 17:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701479382; x=1702084182; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dm/CsU1TecVhGqK7uMtHEjTeBHqkgwFFAUsgNTx3E7k=;
        b=z7lqd333bA6v0MZhWL0kLWIkFkP8n/z5WVthMM2rQeOv8m0UZsTnvNpREcWQK+bcfj
         TBSTqSewnR3i7Wap2fUz9iVhqoSflfIhy1SXoqhqvy4IwztVVzZADSDZ5YkPCKt7mPK/
         i2xoBUVvOINwoo0n0fYJVcptV+RaaKlLM4+D1BOIZvE7lBbpvxU6tFxA3KLte1Mwfhcf
         VXaphP38CjqjkMqa3IoNlqn34Ac4Vio5x/H0tOVXsmyGJ1NNueDUpUiiLy96t7b6OOqp
         QlKKBSd+G1oNMjc+OrgzRlCWYnGxqfFYd1zzIPMy8zfBgKH2ASHxp/jcvXqtyuEcXmdD
         cPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701479382; x=1702084182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dm/CsU1TecVhGqK7uMtHEjTeBHqkgwFFAUsgNTx3E7k=;
        b=daP/y3APdO2H3puMka1tOiBbponF2u0C4qPKmMtie8OQPojXX6d0KsIG62QTr/845o
         OztLdLQl4h/hcNUALD136ASKpp1OjQe8aQIeUT168I2TiiPz74Okh7XdZv+EqMzOE8GG
         z/q0m6MNgeIncwwEQ1+VywRh8g/Wd9abCpq2ns0S3MeGeK2DQJmRhjbk3iUNP7OJv6w/
         z2Keq4liyCBWpKW/6IVQ4W96oq+O6idE8TdvSt8PUlDOWfYnH6pRZwq9x3bpSIcVE3Is
         1XAXOh1lUcQ0YuIbTkxdXdMRJK14nkWhXPCDrouDMLcUGLs7JFjATvhte2QhhVjsKU3J
         cQfw==
X-Gm-Message-State: AOJu0YzFHyClwz2zj4c1XKCZVLyj6k5s7QZB85tULa+P9WONgK7YOh28
	IY5LQRWomCNr2j5+DZFjCIgo+qHbHBgmXpQTv7k3bg==
X-Google-Smtp-Source: AGHT+IHneY/ElPnA5P/2bRpVmnKU9oSTsSD93K6ineTQqUbPf7r6AwXLHD8DGCnM9a09BZNv9IxOdZTpyqL9luiNRC4=
X-Received: by 2002:a05:6358:1a93:b0:170:17eb:377d with SMTP id
 gm19-20020a0563581a9300b0017017eb377dmr430823rwb.37.1701479382291; Fri, 01
 Dec 2023 17:09:42 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org> <20231201160925.3136868-18-peter.griffin@linaro.org>
In-Reply-To: <20231201160925.3136868-18-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 1 Dec 2023 19:09:30 -0600
Message-ID: <CAPLW+4mGykKdYuhjcpYQwk7cabo0mFv6Qo3UedcrVcLvMkww_Q@mail.gmail.com>
Subject: Re: [PATCH v5 17/20] tty: serial: samsung: Add gs101 compatible and
 common fifoszdt_serial_drv_data
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
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
> ---
>  drivers/tty/serial/samsung_tty.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index 1b0c2b467a30..f8d98f1006de 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2490,14 +2490,25 @@ static const struct s3c24xx_serial_drv_data exyno=
s850_serial_drv_data =3D {
>         .fifosize =3D { 256, 64, 64, 64 },
>  };
>
> +/*
> + * Common drv_data struct for platforms that specify uart,fifosize in
> + * device tree.

Isn't it "samsung,uart-fifosize"? Or it was intended this way?

Other than this, LGTM (my R-b tag is already present in this patch).

> + */
> +static const struct s3c24xx_serial_drv_data exynos_fifoszdt_serial_drv_d=
ata =3D {
> +       EXYNOS_COMMON_SERIAL_DRV_DATA(),
> +       .fifosize =3D { 0 },
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
> @@ -2581,6 +2592,9 @@ static const struct platform_device_id s3c24xx_seri=
al_driver_ids[] =3D {
>         }, {
>                 .name           =3D "artpec8-uart",
>                 .driver_data    =3D (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DA=
TA,
> +       }, {
> +               .name           =3D "gs101-uart",
> +               .driver_data    =3D (kernel_ulong_t)EXYNOS_FIFOSZDT_DRV_D=
ATA,
>         },
>         { },
>  };
> @@ -2602,6 +2616,8 @@ static const struct of_device_id s3c24xx_uart_dt_ma=
tch[] =3D {
>                 .data =3D EXYNOS850_SERIAL_DRV_DATA },
>         { .compatible =3D "axis,artpec8-uart",
>                 .data =3D ARTPEC8_SERIAL_DRV_DATA },
> +       { .compatible =3D "google,gs101-uart",
> +               .data =3D EXYNOS_FIFOSZDT_DRV_DATA },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> --
> 2.43.0.rc2.451.g8631bc7472-goog
>
