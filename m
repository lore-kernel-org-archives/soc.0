Return-Path: <SRS0=nEAh=HQ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACD2C10F04
	for <soc@archiver.kernel.org>; Tue,  5 Dec 2023 22:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A482CC433C8; Tue,  5 Dec 2023 22:29:48 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6064CC433C7
	for <soc@kernel.org>; Tue,  5 Dec 2023 22:29:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6064CC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-7c45fa55391so1874799241.2
        for <soc@kernel.org>; Tue, 05 Dec 2023 14:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701815385; x=1702420185; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NrXqJVDzW4Zm/gOjUfh5BbRIxo1FamErN2RJgIBt+Rg=;
        b=fQ77nMoX/SwMFIlWwL02ofCd+hkKmrGgIzH/qGvE3Zl+6ywKcqBiQLN7bWb1VtVKMY
         6pbJjHAEG4bH8UYCbzEbn0BZDZNOjzNjJNzoWqJeHG6AYzAg2GjtUxrWbFRii82aMKhM
         H3tq9vUXL3Wg62+jgzDejB+obeCg0OsghYlI/wgK8IhKbKayktoemLY5daChdXmtu1Qa
         oBLHX3HVCGFS2xLcWilP3pygJmxyIv/mfGIbbKkpz1cDSCs3PZOyTOcU50hKoAYGrNwW
         JKD1OcesuJZyBQW3mjePl7Vfr03LlqaqLnUvhPCEXq57wFRbjVI+zIDrfnR//sUMQCMD
         sEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701815385; x=1702420185;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrXqJVDzW4Zm/gOjUfh5BbRIxo1FamErN2RJgIBt+Rg=;
        b=DxoBtTaHThQVjXJ2tIKERjVNRZ3tsPPLa/55TldiptlV+xiKfTdH8bL0UUlY9NMjDb
         PcXG5b7u2CUVyFWUc71XpdWwVxAV43xOh34MdAVCEm/oc+tZ4KVhOKh1yxpBMYUaTunF
         Nb2MOb0vj6vNkK1+w1DXDSWEDjotCbrzj0XPenMSllSKnTEJ61SJLATg7QYOgbtf9q8n
         MTTzerTeUML+a6mPev2Y1dLg20x34TVTGFA2YgqoBqD/TsVjSpsjF9PjrxSs6qOjiFnQ
         hxMsKce9LHHi9ndgomOf3zknEI5apw1L5wfEEYTlTZemRHHEjaDO+OiNNVHzEZPortj+
         fr9Q==
X-Gm-Message-State: AOJu0Yy3BasK6laKaMzorjt91hm+uCFHteTgPoeS7+OT010u3VgVbNJ7
	JZ66i+PTSzp9VGSXJBsFnaeFrG9TJzDUNBBtMNuPYw==
X-Google-Smtp-Source: AGHT+IFF2TpItFKowjCZ8ASJ/0BWEWuvpsfiA6UqGLSiCQ0pnJ8/SuZznn+CD6peVXZleVKejXfbOHGauFLhVvJuCuQ=
X-Received: by 2002:a67:af0b:0:b0:464:7b6d:2efc with SMTP id
 v11-20020a67af0b000000b004647b6d2efcmr4247312vsl.34.1701815385307; Tue, 05
 Dec 2023 14:29:45 -0800 (PST)
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-18-peter.griffin@linaro.org> <ZWpz5L2g4SB2cdVD@google.com>
In-Reply-To: <ZWpz5L2g4SB2cdVD@google.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 5 Dec 2023 22:29:34 +0000
Message-ID: <CADrjBPpOUf72k=tFWsOQUUuH2Nc8O9=_EaX7QexTCvRT-5QndQ@mail.gmail.com>
Subject: Re: [PATCH v5 17/20] tty: serial: samsung: Add gs101 compatible and
 common fifoszdt_serial_drv_data
To: William McVicker <willmcvicker@google.com>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, soc@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Sat, 2 Dec 2023 at 00:01, William McVicker <willmcvicker@google.com> wrote:
>
> On 12/01/2023, Peter Griffin wrote:
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
>
> Tested-by: Will McVicker <willmcvicker@google.com>
>
> ---
>
> I verified boot to a busybox console with kernel logs printed to the serial
> port.

Thanks for testing :) I've added your Tested-by tags to the various
patches apart from the pinctrl ones that have been refactored a bit.

Thanks,

Peter.
>
> Regards,
> Will
>
> > ---
> >  drivers/tty/serial/samsung_tty.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> > index 1b0c2b467a30..f8d98f1006de 100644
> > --- a/drivers/tty/serial/samsung_tty.c
> > +++ b/drivers/tty/serial/samsung_tty.c
> > @@ -2490,14 +2490,25 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
> >       .fifosize = { 256, 64, 64, 64 },
> >  };
> >
> > +/*
> > + * Common drv_data struct for platforms that specify uart,fifosize in
> > + * device tree.
> > + */
> > +static const struct s3c24xx_serial_drv_data exynos_fifoszdt_serial_drv_data = {
> > +     EXYNOS_COMMON_SERIAL_DRV_DATA(),
> > +     .fifosize = { 0 },
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
> > @@ -2581,6 +2592,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
> >       }, {
> >               .name           = "artpec8-uart",
> >               .driver_data    = (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
> > +     }, {
> > +             .name           = "gs101-uart",
> > +             .driver_data    = (kernel_ulong_t)EXYNOS_FIFOSZDT_DRV_DATA,
> >       },
> >       { },
> >  };
> > @@ -2602,6 +2616,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
> >               .data = EXYNOS850_SERIAL_DRV_DATA },
> >       { .compatible = "axis,artpec8-uart",
> >               .data = ARTPEC8_SERIAL_DRV_DATA },
> > +     { .compatible = "google,gs101-uart",
> > +             .data = EXYNOS_FIFOSZDT_DRV_DATA },
> >       {},
> >  };
> >  MODULE_DEVICE_TABLE(of, s3c24xx_uart_dt_match);
> > --
> > 2.43.0.rc2.451.g8631bc7472-goog
> >
