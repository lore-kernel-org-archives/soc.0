Return-Path: <SRS0=dFf3=F2=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76DACDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 14:03:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BD2DBC433CB; Thu, 12 Oct 2023 14:03:50 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 03826C433CA
	for <soc@kernel.org>; Thu, 12 Oct 2023 14:03:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 03826C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d9a58f5f33dso1084968276.1
        for <soc@kernel.org>; Thu, 12 Oct 2023 07:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697119428; x=1697724228; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=puIzhyS5gW8rbBXjq7G5YhTTPZWWF1R9uTZ424mIyo8=;
        b=eehus7qP0cByTJyUgnMzeuSIwi1eyflc8lt8o+MGWVV4ZFYb1R48QYD0gJTGAMG6oL
         GEnCMpUhhDdbNMzX43a4zlYY1r2jRA3+YUv//nSzfOFiZIM+VvNO1x31fIkJ12fpgnQf
         pb85ltHefF88ZlfUH4GPTSKtgYC72ZANETObH/hU4JpUQdvxhllB+Dsr//CGCL3Ky+3j
         9Qpd+AYXTGSzisBJ25mZnKh9x0OQi96G6V4w9Aep2fZHyIFBtJ2inHtNxfBD7qB4MOZq
         kNo7kTK13X+4N/v0IfSx1kh3WNJvlr/0m96tPOFOfgHmrPmBEwuCC4hD9wirbOY/Ofhg
         HHBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697119428; x=1697724228;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=puIzhyS5gW8rbBXjq7G5YhTTPZWWF1R9uTZ424mIyo8=;
        b=ue/DQBW37/XM/LO8zOEYU/QYYKae5KbZgFRL8WpiTLddn4UE7bJAaJbs/4XKdz3OJ6
         jOxLHWpNt6cj1mkAC45jqVuwfqF1UTKgGNXxtFK3pUNXHWGV0cE77f1IZbJjiUPyA7/+
         8sGJqzVxwaPRqz4itJx2wVP07Xv0YoTmplGQjYBtCzdp1yFwdzC8BCrkEU/yV1b7Og3x
         vJHglmwiSm3yzvuZay4g/nf5puliCNDR1TXKB75JJB2g8zJll7XnSPtMJnQ50e4APdy+
         btRYTLbFO4OESqyyi5HEjwwrFk9Ccnio3lseolehFyLj9Je5MdXwayGD2GLJVPtMb1st
         ModA==
X-Gm-Message-State: AOJu0Yw/sIo8P8lv42XFSmiNqtnst2a1ryPT4Vr/3UV20wd4fsMJjSre
	WGiuvTs5N2k6ZDtR/YaS3MjvG/M+xphytzLMsYYKpw==
X-Google-Smtp-Source: AGHT+IEGxOAHYxFWe5zN7VMnBZpra60R5/a8mbnM6JL9voxiaeBEv75YfHq+VJXGhKSFvI92pIjqpWnDeQDRoREZX68=
X-Received: by 2002:a5b:40b:0:b0:d5c:1b9b:6f5a with SMTP id
 m11-20020a5b040b000000b00d5c1b9b6f5amr20283517ybp.44.1697119427708; Thu, 12
 Oct 2023 07:03:47 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-17-peter.griffin@linaro.org> <ccd0d092-8ae5-4033-96cf-5ba37e175e0c@linaro.org>
In-Reply-To: <ccd0d092-8ae5-4033-96cf-5ba37e175e0c@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 12 Oct 2023 15:03:35 +0100
Message-ID: <CADrjBPpUt-PShY4Wm9UWK7ZxujYsm7DoNUY67tzUMAp33BVY=w@mail.gmail.com>
Subject: Re: [PATCH v3 16/20] tty: serial: samsung: Add gs101 compatible and
 SoC data
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	cw00.choi@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Thu, 12 Oct 2023 at 07:26, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/10/2023 20:48, Peter Griffin wrote:
> > Add serial driver data for Google Tensor gs101 SoC.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> > index 07fb8a9dac63..26bc52e681a4 100644
> > --- a/drivers/tty/serial/samsung_tty.c
> > +++ b/drivers/tty/serial/samsung_tty.c
> > @@ -2597,14 +2597,22 @@ static const struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
> >       .fifosize = { 256, 64, 64, 64 },
> >  };
> >
> > +static const struct s3c24xx_serial_drv_data gs101_serial_drv_data = {
> > +     EXYNOS_COMMON_SERIAL_DRV_DATA(),
> > +     /* rely on samsung,uart-fifosize DT property for fifosize */
>
> It's an optional property, so you cannot rely on it.

Is it possible to make it a mandatory DT property for certain SoCs?

>
> > +     .fifosize = { 0 },

I can update this to 256, and we can add more sizes as we enable other
UARTs I suppose.

What's the purpose of having fifosize specified in DT and in *_serial_drv_data?

Thanks,

Peter
