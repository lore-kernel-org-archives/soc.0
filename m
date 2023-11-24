Return-Path: <SRS0=ZyH1=HF=linaro.org=peter.griffin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CC6FC61DF4
	for <soc@archiver.kernel.org>; Fri, 24 Nov 2023 23:53:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 358C7C433C9; Fri, 24 Nov 2023 23:53:52 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 762D1C433CA
	for <soc@kernel.org>; Fri, 24 Nov 2023 23:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 762D1C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-67a0fdd9348so7450626d6.2
        for <soc@kernel.org>; Fri, 24 Nov 2023 15:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700870029; x=1701474829; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1FS/kIDFBzyqgGanxolvGaA4a07brcriqTmvix5/W40=;
        b=catm2dI9nX48hmlCNAHri0/3eVJfcliyp3k9addyMAFE1INIw4iF57423w+jK1L1Ov
         uVIUSfnIde1BPcIkwEJEigbSy6ePLQmliPmb30A7PFReX99SdW/sYGEFfeBbOg6RxCrO
         5PMvwO/2KOkFeIZ8QqgAW5lZIkBrYWhGs5QxsRD6NiCNrBrtjZkd5ifk3VY6E/sphAf9
         vccZrOvAtlpObTh6vT1R3d7v1UYIBBgL0Y2KQZQMa23lTFDr6tfPf3c8X3h4iyhAe/Oj
         7iD+klfXYZ0D2kiZNhQlqm3h7kFzj0NNax5FUrJptLn6GKiRO8Lsx4lqyQHNXNz5x0HP
         BF6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700870029; x=1701474829;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FS/kIDFBzyqgGanxolvGaA4a07brcriqTmvix5/W40=;
        b=Eldd6Mu07Avim0+r/MmxDQ3je9okaHVAhp4XVbZk2hd2K30l5XNxNYGnMHqhS1JWb5
         NKdt0z3GyB9V6dkYIoPE2/3/Xo/+uh1ps19JwSvmMlZKSngn35vPDtO75Va33UjDqI/W
         nEHlM6TVzYW80Yt6nc8arZTgP/GeV8fo5UUmtpPnA9aJURdQSujVttGqGaTFrVaqNsv5
         MuvCKHDHdbTKQdbjEsfKbBqhuLoUYrNfdWAnht0OaQggFWvoIH6Gg+QTUbcee9UY2EkB
         c4IoFyH9NXN69n1WHi8rnQNJpIoKZ1+WVGF2LHd8GOejUOlGpa2XtYTGIF8iXfY9Aoq4
         tGOQ==
X-Gm-Message-State: AOJu0YyqG3JjsnKMHz1sNZt+DaO09Nl2pl2JTEOM1ufXKUpcLaELEfMN
	7xFEWq3izIVFVU5mE/VOKmwT7kq6wTXdFtVthFMm7Q==
X-Google-Smtp-Source: AGHT+IH68YNNs1mdIZPfOGd3BfU7yWO4f5ZEZ2LHNlI3qHeYAMd7J1NbAfruVBibbln969jG6/nSz3dpLoNuc455+D0=
X-Received: by 2002:a0c:eecd:0:b0:679:e7dd:fa9 with SMTP id
 h13-20020a0ceecd000000b00679e7dd0fa9mr5108187qvs.10.1700870029271; Fri, 24
 Nov 2023 15:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-18-peter.griffin@linaro.org> <ff91f9e7-6018-402e-935a-c9fa10ced9fd@linaro.org>
In-Reply-To: <ff91f9e7-6018-402e-935a-c9fa10ced9fd@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 24 Nov 2023 23:53:38 +0000
Message-ID: <CADrjBPqNTKHjh=QR__Jdw-Ht5z0NcB3j92dtjFJJS=A1AS9jQw@mail.gmail.com>
Subject: Re: [PATCH v3 17/20] arm64: dts: google: Add initial Google gs101 SoC support
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


On Thu, 12 Oct 2023 at 07:44, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/10/2023 20:48, Peter Griffin wrote:
> > Google gs101 SoC is ARMv8 mobile SoC found in the Pixel 6,
> > (oriole) Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
> > phones. It features:
> > * 4xA55 little cluster
> > * 2xA76 Mid cluster
> > * 2xX1 Big cluster
> >
>
> ...
>
> > +     gpa10: gpa10-gpio-bank  {
> > +             gpio-controller;
> > +             #gpio-cells = <2>;
> > +             interrupt-controller;
> > +             #interrupt-cells = <2>;
> > +             interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
> > +                        <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> > +     };
> > +
> > +     uart15_bus: uart15-bus-pins {
> > +            samsung,pins = "gpa2-3", "gpa2-4";
> > +            samsung,pin-function = <2>;
>
> GS101_PIN_FUNC_2

will fix
>
> > +            samsung,pin-pud = <0>;
>
> GS101_PIN_PULL_NONE

will fix

>
> > +     };
> > +
> > +     uart16_bus: uart16-bus-pins {
> > +            samsung,pins = "gpa3-0", "gpa3-1", "gpa3-2", "gpa3-3";
> > +            samsung,pin-function = <GS101_PIN_FUNC_2>;
> > +            samsung,pin-pud = <GS101_PIN_PULL_NONE>;
>
> But here it is correct...
>
> > +     };
> > +
> > +     uart16_bus_rts: uart1-bus-rts-pins {
> > +             samsung,pins = "gpa3-2";
> > +             samsung,pin-function = <GS101_PIN_FUNC_OUTPUT>;
> > +             samsung,pin-pud = <GS101_PIN_PULL_NONE>;
> > +             samsung,pin-val = <1>;
>
> Why do you set UART RTS pin value?

It's a remnant from the downstream drivers that support rts-gpio control.
I will remove the samsung,pin-val = <1> in the next version.

Thanks,

Peter
