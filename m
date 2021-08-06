Return-Path: <SRS0=EEmc=M5=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD47C4338F
	for <soc@archiver.kernel.org>; Fri,  6 Aug 2021 20:59:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 79B7060EB2; Fri,  6 Aug 2021 20:59:47 +0000 (UTC)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D57761078
	for <soc@kernel.org>; Fri,  6 Aug 2021 20:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4D57761078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f46.google.com with SMTP id l20so11785031iom.4
        for <soc@kernel.org>; Fri, 06 Aug 2021 13:59:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Abd72sZNRU0BLu7YkKaiYFwOHr3rHD24N77jTkRPs6M=;
        b=IAjqGfY22aylGVk5OJUPG4EPAV8nji5tJyZWLNT3ak/fSsvfQ1gTnQc+cHGi7zjEuO
         xlQhqCJUXfv8Mg0LF6HUp2zrAIwVx6v8W8sa7/bQlEFh28oIaRBFtXqzacX1M65nj/mK
         0k7FtrcF/BsPFhlN43QnavlVMMavLSqxg4H/35cerBG24d2zRyYRs/107h/v2D/O7BpW
         iSISOs9j8qYgoQKq4Y4g/SL5akHDPMLRevSMo1xYdx0s2RtY2czXiGkyvJAN6XVKQH3r
         3RhWpAkRfpZGNmJElDGIAjF/Ft/V1tgpbseTNfe2qWhSYlq2z3R5HT4zJQ3Pmsz30cqO
         X8Tg==
X-Gm-Message-State: AOAM531ml1G1C4LeQnTYogHzJhYqWrL37qrEIpUSQvjqjTnqIQJYy3xy
	PUhQOuHDdEjuKKat4dm+1g==
X-Google-Smtp-Source: ABdhPJzyr3XOBq5uPxRDKXpTJOdZ6Sg4iLb6fl58mEob9P0bnfHDB8LAbg+1E/tRB8RW8/BxSSQcUg==
X-Received: by 2002:a05:6602:14f:: with SMTP id v15mr136277iot.206.1628283586727;
        Fri, 06 Aug 2021 13:59:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b23sm4530328iof.8.2021.08.06.13.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 13:59:45 -0700 (PDT)
Received: (nullmailer pid 1787406 invoked by uid 1000);
	Fri, 06 Aug 2021 20:59:44 -0000
Date: Fri, 6 Aug 2021 14:59:44 -0600
From: Rob Herring <robh@kernel.org>
To: Bert Vermeulen <bert@biot.com>
List-Id: <soc.lore.kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
Message-ID: <YQ2iwIcSuDwcw/s5@robh.at.kernel.org>
References: <20210730134552.853350-1-bert@biot.com>
 <20210730134552.853350-4-bert@biot.com>
 <20210730144627.GB19569@C02TD0UTHF1T.local>
 <d0ff051b-280c-4021-f4ee-7bfda5e356d3@biot.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0ff051b-280c-4021-f4ee-7bfda5e356d3@biot.com>

On Wed, Aug 04, 2021 at 06:41:55PM +0200, Bert Vermeulen wrote:
> On 7/30/21 4:46 PM, Mark Rutland wrote:
> > On Fri, Jul 30, 2021 at 03:45:50PM +0200, Bert Vermeulen wrote:
> > > +	timer {
> > > +		compatible = "arm,armv8-timer";
> > 
> > This should be "arm,armv7-timer".
> > 
> > > +		interrupt-parent = <&gic>;
> > > +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > > +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > > +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
> > > +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
> > 
> > GICv3 doesn't have a cpumask in its PPI description, so the
> > GIC_CPU_MASK_SIMPLE() bits should be removed.
> 
> Ok, will fix.
> 
> > > +		clock-frequency = <25000000>;
> > 
> > Please have your FW configure CNTFRQ on each CPU; the clock-frequency
> > property in the DT is a workaround for broken FW, and it's *vastly*
> > preferable for FW to configure this correctly (e.g. as it means VMs
> > should "just work").
> 
> I've since got hold of the modified U-Boot that runs on my eval board, and
> indeed it doesn't set CNTFRQ. So the kernel does need this, for the moment.

Can't you write CNTFRQ in the u-boot shell/script?

> I may get a chance to upstream support for this SoC in U-Boot, but I can't
> control what people are going to ship with their board. Is it ok to leave
> this in?

If they want a working upstream Linux, then you can control it.

I seem to recall this being rejected in other cases. That may have been 
on v8 which has taken stricter stances (but arguably any new v7 stuff 
should too).

Rob
