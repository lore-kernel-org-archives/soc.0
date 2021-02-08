Return-Path: <SRS0=Nkqh=HK=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A7E7C433DB
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 09:36:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C33B764E6E; Mon,  8 Feb 2021 09:36:29 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CA6A64E7B;
	Mon,  8 Feb 2021 09:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CA6A64E7B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-ej1-f41.google.com with SMTP id b9so23422509ejy.12;
        Mon, 08 Feb 2021 01:36:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=a83njXoovn0qtrB4EyPB9Yl+LzkRQ7pFu3WjHr3iefI=;
        b=hoi+3Q7qkw6czHwKUcOMJRwzc9mkifAtPy8AmVnIXQZMWtrqHMAwMPbRhqo8g72Aib
         32kNBSv7eoM1CVG60WrGX8Y9mFQ4zW0Z4yCwmuXjm0uqp/twyCtXJDhBY5Zc6HtaRCWS
         Cngcd+ifp1XqTooznm9IAbBSc3Jkq0bKSMj0zOcL8avfh643DNFfjL+BUNP/v2AJRyKK
         NHBnyx6I2iYH7Uw7iWKZKjPtuOT5QbHBDghE7JSDkOWWTa/PEOgi/T4BLVykHd7vQF1R
         In9JFr8bQBfZGAK+G9jLsyxtmxV5+GHNjssF4ztjog0hXTQlOhMnbsYetjfb1HhEZFQE
         wg8Q==
X-Gm-Message-State: AOAM5323WU/gJu3b+reHbd46NiZw+jh/qfmib1F0UU+3XgnAx+UkywYf
	BeC2QDODXEaOOdqbX3hUIvw=
X-Google-Smtp-Source: ABdhPJxsEsOQPr31EIv/8wBxOnZllOnQfSoEJaey/Jsc/XmZpEyjNY737e5BsGWYE7T4PnSiPWWklw==
X-Received: by 2002:a17:906:199a:: with SMTP id g26mr16161672ejd.485.1612776987720;
        Mon, 08 Feb 2021 01:36:27 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id df15sm8949477edb.24.2021.02.08.01.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 01:36:26 -0800 (PST)
Date: Mon, 8 Feb 2021 10:36:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hector Martin 'marcan' <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, soc@kernel.org,
	linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
	Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
Message-ID: <20210208093625.trpm3tte2gw24w4l@kozik-lap>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st>
 <87lfc1l4lo.wl-maz@kernel.org>
 <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
 <e2bd8f99-58db-4cae-30b3-6fa608bc76dd@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e2bd8f99-58db-4cae-30b3-6fa608bc76dd@marcan.st>

On Sun, Feb 07, 2021 at 06:26:43PM +0900, Hector Martin 'marcan' wrote:
> On 07/02/2021 18.12, Hector Martin 'marcan' wrote:
> > On 06/02/2021 22.15, Marc Zyngier wrote:
> > > The default should be IRQ_NONE, otherwise the kernel cannot detect a
> > > screaming spurious interrupt.
> > 
> > Good point, and this needs fixing in s3c64xx_serial_handle_irq too then
> > (which is what I based mine off of).
> > 
> > > > +	ret = request_irq(port->irq, apple_serial_handle_irq, IRQF_SHARED,
> > > > +			  s3c24xx_serial_portname(port), ourport);
> > > 
> > > Why IRQF_SHARED? Do you expect any other device sharing the same line
> > > with this UART?
> > 
> > This also came from s3c64xx_serial_startup and... now I wonder why that
> > one needs it. Maybe on some SoCs it does get shared? Certainly not for
> > discrete rx/tx irq chips (and indeed those don't set the flag)...
> > 
> > CCing Thomas, who added the S3C64xx support (and should probably review
> > this patch); is there a reason for IRQF_SHARED there? NB: v1 breaks the
> > build on arm or with CONFIG_PM_SLEEP, those will be fixed for v2.
> 
> Seems Thomas does not work for Linaro any more :)
> 
> CCing Krzysztof instead, who is the Samsung arch maintainer.

Please use the scripts/get_maintainers.pl to get the list of people to
Cc. The script would point necessary folks.

A different issue is that all your emails from this thread were marked
by Google as spam.  I don't see any particular warning signs in the
header so it looks more of content-based match for spam.

> > Either way, certainly not for Apple SoCs; I'll get rid of IRQF_SHARED
> > for v2.

Please send a v2 after fixing issues pointed out by kbuild.

Best regards,
Krzysztof

