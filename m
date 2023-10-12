Return-Path: <SRS0=XK7G=F2=linaro.org=semen.protsenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 242AFCDB482
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 05:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8ED1C433CD; Thu, 12 Oct 2023 05:38:19 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9EA49C433C7
	for <soc@kernel.org>; Thu, 12 Oct 2023 05:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9EA49C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-278f0f565e2so470374a91.2
        for <soc@kernel.org>; Wed, 11 Oct 2023 22:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697089098; x=1697693898; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wwWnNHAbWyeAscY15FX+TU6dhJaouDy+zgSEChH3FwY=;
        b=cBXKYozW2GggdgSFmzLx0z6YkbXZYKmjbt8oJUataa8BzY8dGaIqOhB1R9uZ080faA
         CLJ4W+7FSqcIOd9fnwHaCZ7ZP9PWKuZVsm/0a9BCc754c9zBY/CN6af7lUj8G2pdSCal
         xqoN3BFHm/Pj4fTM5bzyzNXyj50DtuOeBQ3cxMVrco2yrsh/7vPK+QTx2lyF++/q/dRu
         56kB6Pq/K3QGs+yir/RP04fxves3cAUj7rEKDuKdjHGvuLMt27lh9jdVQSSgeyjv+zwh
         Q82GMskCRHN8z3aiP09YmDzYO2D3rbXrR8c5AS5dXNQA8SyxDBb/KZFztkCSIvzfQ5KP
         CQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697089098; x=1697693898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wwWnNHAbWyeAscY15FX+TU6dhJaouDy+zgSEChH3FwY=;
        b=J4q6KmRNA7vYBQHQ0wu7y/ADIKI2Fy5tYGu0uEUo2uJGC2rULoXZ9PyK9WSlZbxkcx
         WlIwCTFP+T0KPHT0g+3LACGHa6Gk+N4XFfXsU64XlmaCXO+wqkLOxNU25hAFjkp4sgKp
         HSYu61TVSArSi+M3JuwmgjOem5/fg/WtKWN5SCxvAqT0BLRHk1lgcBZ14bdUAGINrca/
         GG1zIf5kpX9RCjapKfJi2npCqVhfh62QukFemY0mFEFG1bfoc/4s1e3+VLe0OPy1fylD
         /onGNrBtfcTS3FlAZz+vdeZ+esrEaW4rw/wP6pP7VBi4r4WXYSmqcmhwNGij+pu1nO2M
         8heQ==
X-Gm-Message-State: AOJu0YxU9LG6m+TSwjlDUMlGpp2eNsQkpeT20GMYxFBedyodCxBn/z5a
	+DQ+IX2lAGd6fk5RYl3zawjEq0WiLwc0mmHbPh+GPQ==
X-Google-Smtp-Source: AGHT+IGSsE9UdV0Qgkc/+49sBerKsPKwjip2GPaMvf0yjDHtLvarJUP6ASq6DTMnyLnKKYmGaxwKGOUUUcsGQWvpu/Q=
X-Received: by 2002:a17:90b:1c83:b0:274:616e:3fc4 with SMTP id
 oo3-20020a17090b1c8300b00274616e3fc4mr19950072pjb.34.1697089097916; Wed, 11
 Oct 2023 22:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org> <20231011184823.443959-17-peter.griffin@linaro.org>
In-Reply-To: <20231011184823.443959-17-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 12 Oct 2023 00:38:06 -0500
Message-ID: <CAPLW+4m1KLXJ67uDJ83V+zdSA0qU4cDh9Q+irpcixz1btMVv7Q@mail.gmail.com>
Subject: Re: [PATCH v3 16/20] tty: serial: samsung: Add gs101 compatible and
 SoC data
To: Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Add serial driver data for Google Tensor gs101 SoC.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsun=
g_tty.c
> index 07fb8a9dac63..26bc52e681a4 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2597,14 +2597,22 @@ static const struct s3c24xx_serial_drv_data exyno=
s850_serial_drv_data =3D {
>         .fifosize =3D { 256, 64, 64, 64 },
>  };
>
> +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data =3D {
> +       EXYNOS_COMMON_SERIAL_DRV_DATA(),
> +       /* rely on samsung,uart-fifosize DT property for fifosize */
> +       .fifosize =3D { 0 },
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
> @@ -2688,6 +2696,9 @@ static const struct platform_device_id s3c24xx_seri=
al_driver_ids[] =3D {
>         }, {
>                 .name           =3D "artpec8-uart",
>                 .driver_data    =3D (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DA=
TA,
> +       }, {
> +               .name           =3D "gs101-uart",
> +               .driver_data    =3D (kernel_ulong_t)GS101_SERIAL_DRV_DATA=
,
>         },
>         { },
>  };
> @@ -2709,6 +2720,8 @@ static const struct of_device_id s3c24xx_uart_dt_ma=
tch[] =3D {
>                 .data =3D EXYNOS850_SERIAL_DRV_DATA },
>         { .compatible =3D "axis,artpec8-uart",
>                 .data =3D ARTPEC8_SERIAL_DRV_DATA },
> +       { .compatible =3D "google,gs101-uart",
> +               .data =3D  GS101_SERIAL_DRV_DATA },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> --
> 2.42.0.655.g421f12c284-goog
>
