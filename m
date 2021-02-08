Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25EDC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 09:37:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B5DA64E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 09:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B5DA64E66
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vItHNiWWSts37qLJ2SITlJRHYBG/tPUrnp35njUqsF4=; b=FNOaobNV21HFth7ydyFlnH3LG
	+HXyuXuTYYB+aS50KLhETJW09Uxb8imWhxRq5NqQSTh2aBvMjjJV+qBeuWarq6BReLQIg9e5cbzRR
	7bhdIgpHqsOgNT55exrf8HmrXVy3PjaxV/7BPZWTTm6yoUxAspOz4X4gCGkIKiHgOkZRHLK3/PFMm
	cucObCn/ICZN2oxDin5/7ivWSeD+CEPn/AGWBJbU9jWni0L/pL8JcXy7t6ZaTjO6Fzg1SPI0Q5GfE
	gQdBZI+Ljd9ceMqVqvY7FBXAHVWCHOVOed4nYhEq+jc5b0ed1lgymxKPHnWNVzNnn9s3VvEvABMDd
	TFqgxZY+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l92yA-0005aP-EB; Mon, 08 Feb 2021 09:36:34 +0000
Received: from mail-ej1-f46.google.com ([209.85.218.46])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l92y7-0005a2-NA
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 09:36:32 +0000
Received: by mail-ej1-f46.google.com with SMTP id w1so23454269ejf.11
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 01:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a83njXoovn0qtrB4EyPB9Yl+LzkRQ7pFu3WjHr3iefI=;
 b=K9l6zn3KeLLcqvXplUcBgIDUSArPWN5MiHVG575beuvZqdo4xyO83vTFohqtaW6Qud
 z/oXboLDpPu0Oc3/TUFxBUMj6PwMMgngCGlK0zcCg1fGkitoqGu6r467wFhvKn/7ZZtY
 1vOPuD2W9T/U7ETJ8O9v5QRoj4JfuMvjkCWb2TYSt6sHScHDGikPzE2ldJmzJ3eCre9Z
 slAc4yj7VXq2niZ2Qh55yCFSzLQMStvCadRg9/WIho/Y++NcRZb5ypkJDAzuDkbNXx3j
 G7XVaK9jftKRLN9IPbeB1vUfzusUgCflcyPokx9Hj5HtqfhLRxl85bxe1bigB0PTzIYe
 Ik4A==
X-Gm-Message-State: AOAM530Lt9TyRcUf5mB3xGwQcjluVexNHriWZS9UvyuWDGd723kVje2T
 Nae0fwbsS5+McDMQ4nrrum4=
X-Google-Smtp-Source: ABdhPJxsEsOQPr31EIv/8wBxOnZllOnQfSoEJaey/Jsc/XmZpEyjNY737e5BsGWYE7T4PnSiPWWklw==
X-Received: by 2002:a17:906:199a:: with SMTP id
 g26mr16161672ejd.485.1612776987720; 
 Mon, 08 Feb 2021 01:36:27 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id df15sm8949477edb.24.2021.02.08.01.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 01:36:26 -0800 (PST)
Date: Mon, 8 Feb 2021 10:36:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
Message-ID: <20210208093625.trpm3tte2gw24w4l@kozik-lap>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st>
 <87lfc1l4lo.wl-maz@kernel.org>
 <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
 <e2bd8f99-58db-4cae-30b3-6fa608bc76dd@marcan.st>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e2bd8f99-58db-4cae-30b3-6fa608bc76dd@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_043631_773644_92747492 
X-CRM114-Status: GOOD (  23.81  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org,
 robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208093625.BazcNPtHCE5bLywzSlN7kh70gcRAH47TM6UaIPg5Rb8@z>

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


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
