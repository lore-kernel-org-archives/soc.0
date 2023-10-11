Return-Path: <SRS0=bvvi=FZ=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F8CCDB473
	for <soc@archiver.kernel.org>; Wed, 11 Oct 2023 18:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC0E1C433CD; Wed, 11 Oct 2023 18:03:57 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C22EDC433C7
	for <soc@kernel.org>; Wed, 11 Oct 2023 18:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C22EDC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-775810b032aso7212185a.1
        for <soc@kernel.org>; Wed, 11 Oct 2023 11:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697047435; x=1697652235; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2+lwLhk0eIlh4K7WyRSQjzGji/fhcQWQbO8LhvSYCpU=;
        b=g010u6YuH9jeGe82RVUKH2bwjGgmoCA81e/LIkOA+5zkzjnlD+5KRHUNW2c5fBXYLU
         fvA7DMkBErOpxv+yOj6A4dSsKmrhPp4KAv4/+LQR4fgbOP/JSKDRz9jY3lbjiEdnXLtP
         YDAYwEuUIi1wuD3vLSQWkm9TFVtfc/W/P+hK6dDTwTwpk1pPH7Y5vuRBNjB8L8w4qW+1
         cYASk++2dInN86rH+6hIPbzg5m45HRdCjdnlyZcwwVj4qGc6OPIRdPn0theOf0CtSfaQ
         nBok4eCCo7bIGNXuYfJSTVOzjysseXqHneCbu09igEbAnDKMpbpi4D8rewGHLOHlNhWN
         abYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697047435; x=1697652235;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2+lwLhk0eIlh4K7WyRSQjzGji/fhcQWQbO8LhvSYCpU=;
        b=l3P6hXvEuTUaEL/pvcip9e5ghN1iD/WicK+0TYluE3E5FC1a5ARR/5zPZ37C4jH32h
         PJxp0HJPn0B/D8P5ZIxpeYPlwucWLSL97LH9JnhhAlI9Ti+BPzIE/WGUjY/Kgg82YOG+
         xWSscgqTcKRNbBCf4PfKnmWx0gCVZpLHytKXYPu0RyY7Nn2P9IvSd+DW/kYEgkv+IJnt
         UBNx2NdEJuzKQdhWqzYl3lP2SyUkHR/klygIsfGRZtNclOf3yjjH+IbHR/g8AyyjWpPC
         ugjWAylaO9JaqNoQ3BewOYj0UtRZl6RJTenxJwxISUptscsAUrAyUcJItVjMNiTmrXTg
         6bOg==
X-Gm-Message-State: AOJu0Yw4/HBV546Im20bQCjE5ykW2MSItXrWIa6mi6Arcboi5CyzGfhH
	bzcC85m5Sy9CMX+AthHGyZKizUWHFsvVioG2JqsrJg==
X-Google-Smtp-Source: AGHT+IGt+0fVENikMfRGv423wq596E+D6hAqM0KbzwaZfRzrT8CBCTVaa4eh0NSbF1Brpy+RH3NFuekBbLkzj8qn004=
X-Received: by 2002:a0c:b213:0:b0:64f:3de6:d502 with SMTP id
 x19-20020a0cb213000000b0064f3de6d502mr21163979qvd.5.1697047435542; Wed, 11
 Oct 2023 11:03:55 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org>
 <20231010224928.2296997-17-peter.griffin@linaro.org> <2023101109-crispy-escapable-0801@gregkh>
In-Reply-To: <2023101109-crispy-escapable-0801@gregkh>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 11 Oct 2023 19:03:44 +0100
Message-ID: <CADrjBPouDPfcj9eCN0BN0Lfd1sOb=Q3jmkeD1aO2on5VHmROJg@mail.gmail.com>
Subject: Re: [PATCH v2 16/20] tty: serial: samsung: Add gs101 compatible and
 SoC data
To: Greg KH <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

Thanks for the review.

On Wed, 11 Oct 2023 at 08:47, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Oct 10, 2023 at 11:49:24PM +0100, Peter Griffin wrote:
> > Add serial driver data for Google Tensor gs101 SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/tty/serial/samsung_tty.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> > index 07fb8a9dac63..79a1a184d5c1 100644
> > --- a/drivers/tty/serial/samsung_tty.c
> > +++ b/drivers/tty/serial/samsung_tty.c
> > @@ -2597,14 +2597,21 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
> >       .fifosize = { 256, 64, 64, 64 },
> >  };
> >
> > +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
> > +     EXYNOS_COMMON_SERIAL_DRV_DATA(),
> > +     .fifosize = { 256, 64, 64, 64 },
> > +};
>
> Why are you duplicating a structure that is already in the same file?
> What is the benifit here?

There is a mistake here, the struct shouldn't be the same as e850 it
should look like this

static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
     EXYNOS_COMMON_SERIAL_DRV_DATA(),
     /* rely on samsung,uart-fifosize DT property for fifosize */
     .fifosize = { 0 },
};

This then allows the fifosize to be taken from the samsung,uart-fifosize
DT property for each of the 19 UARTs on this SoC.

>
> >  #define EXYNOS4210_SERIAL_DRV_DATA (&exynos4210_serial_drv_data)
> >  #define EXYNOS5433_SERIAL_DRV_DATA (&exynos5433_serial_drv_data)
> >  #define EXYNOS850_SERIAL_DRV_DATA (&exynos850_serial_drv_data)
> > +#define GS101_SERIAL_DRV_DATA (&gs101_serial_drv_data)
>
> What is "GS101"?

gs101 is the name of the SoC in Pixel 6, 6 pro, 6a phones. I've put
some more info
about the various names of the SoC in the bindings documentation. See
https://lore.kernel.org/linux-arm-kernel/20231010224928.2296997-9-peter.griffin@linaro.org/T/#mb45492e58de0bef566df8cdf6191ab8f96f0cf99

>
> >  #else
> >  #define EXYNOS4210_SERIAL_DRV_DATA NULL
> >  #define EXYNOS5433_SERIAL_DRV_DATA NULL
> >  #define EXYNOS850_SERIAL_DRV_DATA NULL
> > +#define GS101_SERIAL_DRV_DATA NULL
> >  #endif
> >
> >  #ifdef CONFIG_ARCH_APPLE
> > @@ -2688,6 +2695,9 @@ static const struct platform_device_id s3c24xx_serial_driver_ids[] = {
> >       }, {
> >               .name           = "artpec8-uart",
> >               .driver_data    = (kernel_ulong_t)ARTPEC8_SERIAL_DRV_DATA,
> > +     }, {
> > +             .name           = "gs101-uart",
> > +             .driver_data    = (kernel_ulong_t)GS101_SERIAL_DRV_DATA,
> >       },
> >       { },
> >  };
> > @@ -2709,6 +2719,8 @@ static const struct of_device_id s3c24xx_uart_dt_match[] = {
> >               .data = EXYNOS850_SERIAL_DRV_DATA },
> >       { .compatible = "axis,artpec8-uart",
> >               .data = ARTPEC8_SERIAL_DRV_DATA },
> > +     { .compatible = "google,gs101-uart",
> > +             .data =  GS101_SERIAL_DRV_DATA },
>
> Why aren't you just listing this hardware as the same one above?  There
> doesn't need to be a new entry if you just fix up the DT for the board
> to declare it as the proper type of device.  No need to keep adding new
> entries that do the exact same thing, we don't normally like that at all
> for other bus types, why is DT different?
>

I believe Krzysztof already answered this from a dt maintainer point of view.

regards,

Peter.
