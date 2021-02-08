Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1B4C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 18:38:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8190D60C3F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 18:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8190D60C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V930HZaK++YtGpr4VeTZWDO5+6LN04fzdEE5SXO8EeE=; b=VpWnwPsKLvoJYo7I1Miay+8wC
	pref+4e+oB8aBpgzopWfR+yhepMZjTtKD/ldz1nVbdZplSTmU1RpYSzCcZlQMyfm0OA78Avsk7fbb
	wHrTmIN2Av4xc5oVfh97Tb4ftcCKGcKTN/g1Cz6S1tQeEfZ7oRlwZWEYVb7NphHydDPBOT15kxxiL
	+VJw3Y9SPsIgIsQ42zRMzc0hqe194F8nlKH+p27QBLWj02UGXHILhUaRaP1lz7Y2OEQZ4d/hpjQBr
	LM/piArbOXaQ+GR7xycXzdlMCKyvixdtVUhXMPCtBedIA/EutD5/+mgeERIz6yjLf0D/nCRFdV/rB
	smFSo0Vuw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9BPc-00070M-Pa; Mon, 08 Feb 2021 18:37:29 +0000
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9BPZ-0006zW-JJ
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 18:37:26 +0000
Received: by mail-wm1-f44.google.com with SMTP id u14so81059wmq.4
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 10:37:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LCazIuYzBZltynFuvPO11MbeG9djR0YG9Vn4Gd94Mj8=;
 b=FoKlMvmgZH226DxsbfK/QD/NhL2qarNPFYVG/9k/XZ9l3IwuFs1P0LLqHt0MDO5FWR
 PKUriwQ5M4s7ogOAyN0TfNCd77zkpuSewoZaPB1oZGPo4Jwj0H5GAoG0PSZt/p9KbXTZ
 6I5rvoAlQ4QcXNBrAKmg4wYxp76NK4oxi6klX7ikV8uX95w1riMSgCs/XMHR/upQUFcF
 sTXwtlf4O/Rl0JevvaTYzAs93izNd5j5t1fAOYSx4LP71rZU3Cl3NI95ObX7C8e/aRFt
 LV3Fed3iSsp+bdc9Jxh7L3KKEJ7c1kd6eqdYaDZUnLobgVtYFrUDE+mJ1Sx4D3/RFiig
 uBzw==
X-Gm-Message-State: AOAM532wc/yEEFavJewKi1qsjwgptzungxOzOOMSP4DOFoYX/vz3xurH
 bZ6QO7uaJlTZ3Ko5yR7sQwI=
X-Google-Smtp-Source: ABdhPJx5+93U+Vf00VOHmUASuEOURE6VEeP94SC6giYw0Z/wDYFCVRw7Hu+lyDXt+hRbtNuLKTqKbA==
X-Received: by 2002:a1c:39d5:: with SMTP id g204mr92727wma.127.1612809444236; 
 Mon, 08 Feb 2021 10:37:24 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id x15sm13363628wro.66.2021.02.08.10.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:37:23 -0800 (PST)
Date: Mon, 8 Feb 2021 19:37:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
Message-ID: <20210208183721.4gc7vyfgtpk7nch3@kozik-lap>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st>
 <20210208105451.yumjjunjeyrglfnw@kozik-lap>
 <11d36c47-45c6-03ee-2d08-6692b5d0e241@marcan.st>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11d36c47-45c6-03ee-2d08-6692b5d0e241@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_133725_672249_D9B5D7A8 
X-CRM114-Status: GOOD (  29.78  )
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
Message-ID: <20210208183721.Ebm0upz_lgRkcT8GJ3oxiUz3R3AHeFPZ66HZ7O7zcoc@z>

On Tue, Feb 09, 2021 at 01:10:02AM +0900, Hector Martin wrote:
> On 08/02/2021 19.54, Krzysztof Kozlowski wrote:
> > > +enum s3c24xx_irq_type {
> > > +	IRQ_DISCRETE = 0,
> > > +	IRQ_S3C6400 = 1,
> > > +	IRQ_APPLE = 2,
> > 
> > It seems you add the third structure to differentiate type of UART.
> > There is already port type and s3c24xx_serial_drv_data, no need for
> > third structure (kind of similar to tries of Tamseel Shams in recent
> > patches). It's too much. Instead, differentiate by port type or prepare
> > own set of uart_ops if it's really different (like you did with startup
> > op).
> 
> This ties into little changes in a bunch of places, so separate uart_ops
> callbacks for every one of those would end up duplicating a lot of code :(
> 
> That list is just used to map the port type to something that only
> represents the type of IRQs, but its only real purpose for the indirection
> is so I can do "== IRQ_DISCRETE" in some codepaths to mean "not apple or
> S3C6400".
> 
> e.g.
> 
>     if (s3c24xx_irq_type(port) == IRQ_DISCRETE)
>         free_irq(ourport->rx_irq, ourport);
> 
> Would have to become
> 
>     if (port->type != IRQ_S3C6400 && port->type != IRQ_APPLE)
>         free_irq(ourport->rx_irq, ourport);
> 
> or
> 
>     switch (port->type) {
>     case IRQ_S3C6400:
>     case IRQ_APPLE:
>         break;
>     default:
>         free_irq(ourport->rx_irq, ourport);
>     }
> 
> Which one do you prefer?

The latter, especially that switches will appear quite a lot in such
case.

However this pattern (== IRQ_DISCRETE) appears only in three places so
it should not be the main case considered here.

However I saw later you actually replaced the
s3c24xx_serial_has_interrupt_mask(), so it's not that bad.

In most of your code, there will be actually a switch with all three
cases.

> 
> Aside: Marc didn't like introducing new port types into uapi, but if we
> don't do that then we need a "real" port type in drv_data that isn't the
> uapi-exposed port or something along those lines, with a separate enum
> containing all the true port type values for that.

Looking at Greg's comment, we can get rid of the PORT_ stuff entirely.
First of all, PORT_S3C2410 == PORT_S3C2412, so this define is not
accurate.

This leaves us with three types (s3c2400, s3c2440, s3c6410 and Apple).
The s3c2440 could be removed with adding a new "ucon_mask" field to
s3c24xx_serial_drv_data.

This would end with s3c24xx, s3c6410 and Apple - quite nice choice.

> 
> > >   	/* Startup sequence is different for s3c64xx and higher SoC's */
> > > -	if (s3c24xx_serial_has_interrupt_mask(port))
> > > +	case IRQ_S3C6400:
> > >   		s3c24xx_serial_ops.startup = s3c64xx_serial_startup;
> > 
> > Don't overwrite specific ops. It's difficult to see then which ops are
> > being used. Instead create a new set of uart_ops matching the needs.
> 
> s3c24xx_serial_ops was already doing that here, but I can move that to a a
> separate uart_ops too.

You're right. This one would have to be improved before your change.
Instead of replacing specific op calls in startup, I think it's better
to have entirely separate ops instance for each variant:

static const struct uart_ops s3c24xx_serial_ops;
static const struct uart_ops s3c64xx_serial_ops;
static const struct uart_ops s5l_serial_ops;

This allows to add a "const", since uart_port takes such const pointer.

Still during s3c24xx_serial_probe() correct ops would have to be
assigned, but at least all ops are easily visible.

Best regards,
Krzysztof


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
