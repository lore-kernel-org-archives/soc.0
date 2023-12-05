Return-Path: <SRS0=nEAh=HQ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFADCC10F04
	for <soc@archiver.kernel.org>; Tue,  5 Dec 2023 22:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C594DC433C9; Tue,  5 Dec 2023 22:27:34 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A4EDC433C8
	for <soc@kernel.org>; Tue,  5 Dec 2023 22:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A4EDC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-67a8a745c43so2292336d6.0
        for <soc@kernel.org>; Tue, 05 Dec 2023 14:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701815252; x=1702420052; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQgUgsfQIHztV7qf++7j8HkPIKB30bIka5Ij6JClhqg=;
        b=se6+NukDK6RS0GfLthb40/E6hjHL0G7hWHAPBD5ewstpdQXHnmORvQ+iSH9Pf9+QSt
         P0LeDEQU86WWjNbvZvhgb8YOUb06J9FTO1aDh99sHfqspgH5uIYHDoCQgQRZ1UTvz3/b
         mNWhEFldZVQZLP2KeenLOfjfG+CQy1wQIDp6iAKf1W9dqplTcctEFdbt5XMdXiALYbpU
         HuovRFQjk6wibgOaS5KymLP2CdUObJeXW1WF3Kff20HzhPSFj0jYJn+a6z4oqbnyYNHp
         zGq8yajQaXRqfW85Kbz4qJBaEEPI5eL1UMvvcaJo8gLF9CvRC5YDwzDLptpgvV9eIZXw
         JTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701815252; x=1702420052;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQgUgsfQIHztV7qf++7j8HkPIKB30bIka5Ij6JClhqg=;
        b=j1qOUxUP553ltZfNTNawhJn28FsoLseY1eBEoWAi3NV7cU/KXP/dbGqsBxXhHbygqH
         PSSIrI/ckmflIbxu1kt1N+srY4w+FLJAoPiE4fvpiDU2mD5AFuLhnoOEsDoXRWYU7KMh
         hgeDk4Qvgzmy8lPqNtl2x3S7WZQEYVqNaVo+uv3LHQey216TG40d4pcDxJa0CpOdcccl
         +wfamnEdXs4dBWTtOnVd5ypWCIO135kZipOPL/Vlx1AVNi5dJM9p13gnfmd/MEY7m3/J
         KYxfKFCCmjONYGr4iQVB0qEZiObo4tFbhH0nHUXrrsGtZsTh5Kk4ONLmsQGsjfKyXBZB
         TK8A==
X-Gm-Message-State: AOJu0YyNVI9S1r2WwRcN5lNd8m8QBNFYEEam5K6DjYzNbCLljusjduID
	2rqiEIls6sZcM/qmvtM7qHlj+Mok4I9HgK1PnjjKAw==
X-Google-Smtp-Source: AGHT+IFuDEXqi1Ls7n87zoNMDXFD61P4gM6AnIVd1rR2PME4KbK/L6lRfRb0eqCvwCLr4kwYzSStOq+H59d+aaGst+k=
X-Received: by 2002:a05:6214:21aa:b0:67a:b5e4:db52 with SMTP id
 t10-20020a05621421aa00b0067ab5e4db52mr3083352qvc.61.1701815252500; Tue, 05
 Dec 2023 14:27:32 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-18-peter.griffin@linaro.org> <CAPLW+4mGykKdYuhjcpYQwk7cabo0mFv6Qo3UedcrVcLvMkww_Q@mail.gmail.com>
In-Reply-To: <CAPLW+4mGykKdYuhjcpYQwk7cabo0mFv6Qo3UedcrVcLvMkww_Q@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 5 Dec 2023 22:27:21 +0000
Message-ID: <CADrjBPrPqe8wnvmwB3+WKA_q=fkfNVAyhxHLe6Ok_LifGxARjg@mail.gmail.com>
Subject: Re: [PATCH v5 17/20] tty: serial: samsung: Add gs101 compatible and
 common fifoszdt_serial_drv_data
To: Sam Protsenko <semen.protsenko@linaro.org>
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

Hi Sam,

On Sat, 2 Dec 2023 at 01:09, Sam Protsenko <semen.protsenko@linaro.org> wro=
te:
>
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Add serial driver data for Google Tensor gs101 SoC and a common
> > fifoszdt_serial_drv_data that can be used by platforms that specify the
> > samsung,uart-fifosize DT property.
> >
> > A corresponding dt-bindings patch updates the yaml to ensure
> > samsung,uart-fifosize is a required property.
> >
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> > Reviewed-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/tty/serial/samsung_tty.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/sams=
ung_tty.c
> > index 1b0c2b467a30..f8d98f1006de 100644
> > --- a/drivers/tty/serial/samsung_tty.c
> > +++ b/drivers/tty/serial/samsung_tty.c
> > @@ -2490,14 +2490,25 @@ static const struct s3c24xx_serial_drv_data exy=
nos850_serial_drv_data =3D {
> >         .fifosize =3D { 256, 64, 64, 64 },
> >  };
> >
> > +/*
> > + * Common drv_data struct for platforms that specify uart,fifosize in
> > + * device tree.
>
> Isn't it "samsung,uart-fifosize"? Or it was intended this way?

The comment should read "samsung,uart-fifosize". Will update.

Thanks,

Peter.
>
> Other than this, LGTM (my R-b tag is already present in this patch).
>
> > + */
> > +static const struct s3c24xx_serial_drv_data exynos_fifoszdt_serial_drv=
_data =3D {
> > +       EXYNOS_COMMON_SERIAL_DRV_DATA(),
> > +       .fifosize =3D { 0 },
> > +};
> > +
> >  #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
> >  #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
> >  #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
> > +#define EXYNOS_FIFOSZDT_DRV_DATA (&exynos_fifoszdt_serial_drv_data)
> >
> >  #else
> >  #define EXYNOS4210_SERIAL_DRV_DATA NULL
> >  #define EXYNOS5433_SERIAL_DRV_DATA NULL
> >  #define EXYNOS850_SERIAL_DRV_DATA NULL
> > +#define EXYNOS_FIFOSZDT_DRV_DATA NULL
> >  #endif
> >
> >  #ifdef CONFIG_ARCH_APPLE
> > @@ -2581,6 +2592,9 @@ static const struct platform_device_id s3c24xx_se=
rial_driver_ids[] =3D {
> >         }, {
> >                 .name           =3D "artpec8-uart",
> >                 .driver_data    =3D (kernel_ulong_t)ARTPEC8_SERIAL_DRV_=
DATA,
> > +       }, {
> > +               .name           =3D "gs101-uart",
> > +               .driver_data    =3D (kernel_ulong_t)EXYNOS_FIFOSZDT_DRV=
_DATA,
> >         },
> >         { },
> >  };
> > @@ -2602,6 +2616,8 @@ static const struct of_device_id s3c24xx_uart_dt_=
match[] =3D {
> >                 .data =3D EXYNOS850_SERIAL_DRV_DATA },
> >         { .compatible =3D "axis,artpec8-uart",
> >                 .data =3D ARTPEC8_SERIAL_DRV_DATA },
> > +       { .compatible =3D "google,gs101-uart",
> > +               .data =3D EXYNOS_FIFOSZDT_DRV_DATA },
> >         {},
> >  };
> >  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> > --
> > 2.43.0.rc2.451.g8631bc7472-goog
> >
