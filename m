Return-Path: <SRS0=Nkqh=HK=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25E2C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 12:13:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5CFDF64E27; Mon,  8 Feb 2021 12:13:30 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C266E64DCC;
	Mon,  8 Feb 2021 12:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C266E64DCC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-ed1-f52.google.com with SMTP id df22so17815806edb.1;
        Mon, 08 Feb 2021 04:13:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FpLR5cZzlQKftepQVrprWEOfxdWH5lN8lHi/n2VPC5I=;
        b=gh5PfiDJQImo9dHlFewOtBnzrHAu6gQlmSzeKjnDFcXkZCa1KkUS6S8Dq30f8IiIUT
         zmB6KCOLiYpdP7zijmr1KHCI0E1g2VV/ajj1lwbKS/5vi1GwYKFTNk0d+7VQt7jhRPqD
         J00EzCTCk5Xkr08FV4jnFLhyZrcG8EZSJLb/hCQhcni2KolL+LCJZNAqPHi0kJGtP+t4
         vsms1iERKA8dDcSOyr4F1l1g+oaddmjvAqWF7Qfxm1y5QfC1E7Tn9NRP5VqiyUgBKmxr
         tUExE0fczoaogdFDlC5rgCtGVJagyIa6JoVOuCPqowdfA/Jqwuabc08f+EV2w/GOevIV
         xdNQ==
X-Gm-Message-State: AOAM5320EygGKKPWLnCOJslVrN1Ukggsvij1efXYQ3HoPLyoEP5spY/B
	OVIRFyhs7VbXjsQtg7jn7u4=
X-Google-Smtp-Source: ABdhPJzKOvT2pcfH6hm8UXtb6quo0MW5QUh99YT16bBy/QZjt+x9tofllOvobrLzWCCU+gDST0jy1g==
X-Received: by 2002:a05:6402:1711:: with SMTP id y17mr16628083edu.72.1612786408134;
        Mon, 08 Feb 2021 04:13:28 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id hr31sm8330971ejc.125.2021.02.08.04.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Feb 2021 04:13:26 -0800 (PST)
Date: Mon, 8 Feb 2021 13:13:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hector Martin 'marcan' <marcan@marcan.st>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>, robh+dt@kernel.org,
	Arnd Bergmann <arnd@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <20210208121325.owjjd7nfbdanszny@kozik-lap>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>

On Mon, Feb 08, 2021 at 08:56:53PM +0900, Hector Martin 'marcan' wrote:
> On 08/02/2021 20.04, Krzysztof Kozlowski wrote:
> > apple
> > 
> > Don't make things different for this one platform (comparing to all
> > other platforms). Apple is not that special. :)
> 
> AAPL is the old vendor prefix used in the PowerPC era. I'm happy to use
> `apple`, as long as we're OK with having two different prefixes for the same
> vendor, one for PPC and one for ARM64. I've seen opinions go both ways on
> this one :)

Thanks for explanation. I propose to choose just "apple". Sticking to
old vendor name is not a requirement - we have few vendor prefixes which
were marked as deprecated because we switched to a better one.

> 
> > > + * Copyright 2021 Hector Martin <marcan@marcan.st>
> > 
> > A lot here might be difficult to reverse-egineer or figure out by
> > ourself, so usually people rely on vendor sources (the open source
> > compliance package). Didn't you receive such for the iOS (or whatever
> > was on your Mac)?
> 
> Apple source drops are sparse (they don't even include things like the
> irqchip driver, only the very core OS code) and APSL licensed, which is a
> license incompatible with the GPL. Worse, they've moved to a partial-blob
> model with the M1; M1-compatible XNU source code drops now include a .a blob
> with startup and CPU-specific code, for which no source code is provided.
> (to be clear: Apple does not ship Linux for these machines)
> 
> Honestly, beyond what's in this patchset and a few more details about CPU
> registers like performance monitoring stuff that exist in public XNU drops
> but I haven't looked into yet, Apple's source code drops are going to be
> practically useless to us from here on out. It's all binaries after this.
> 
> Apple device trees are not open source at all; those are provided by iBoot
> and ship with device firmware, which is not openly licensed. Those device
> trees are OF-inspired, but otherwise in a different format and structure to
> Linux device trees.
> 
> Since there is zero Apple-published code or data with a license compatible
> with the Linux kernel to be used here, there can be zero copyright lines
> claiming any submissions are copyright Apple from us, because that would
> imply a license violation has occurred. I am treating this as I would any
> other no-source reverse engineering project, that is, ensuring that I only
> look at Apple code (binaries, source, devicetrees, whatever) to understand
> how the hardware functions, build documentation for it (at least in my head,
> but I am also trying to document things on our wiki as I go), and then write
> original code to drive it from Linux, unrelated to whatever Apple was doing.

Makes sense. In such case it's indeed your work. Since you introduce it,
the DTSes are usually licensed with (GPL-2.0+ OR MIT).

> 
> We're also trying to avoid looking at any Apple stuff in general as much as
> possible, preferring black-box approaches where feasible, to minimize
> exposure. For example, I only looked at an (outdated, arm32 era) AIC
> register name list in XNU to write the AIC driver; there is no actual AIC
> driver code in the source, and instead of decompiling Apple's binary blob
> AIC driver module, I figured out how the hardware actually worked via
> probing and experimentation. The entire userspace GPU stack is being reverse
> engineered via a black-box approach, without any decompilation. I'm going to
> see what I can do about the kernel driver in the future, and prefer some
> kind of mmio tracing solution if I can get it all to work on macOS.
> 
> As for this file specifically: while I am obviously looking at Apple's DTs
> to figure out things like register offsets and what hardware exists, those
> are facts, and facts are not copyrightable, and thus Apple does not hold any
> copyright interest over this code as I submitted it. Short of verbatim
> copying and pasting of entire nodes with bespoke property names (which would
> never fly here anyway because Apple does things very differently from Linux
> DTs when you get down into the details), it would be extremely hard to argue
> that translating hardware information from decompiled Apple DTs to Linux DTs
> would constitute a copyright violation, since the entire purpose of DTs is
> to describe hardware facts.
> 
> You can read more about our reverse engineering and copyright policy at
> https://alx.sh/re - if you have any suggestions or spot anything
> problematic, please let me know.
> 
> (I'm actually probably going to change that copyright line to "The Asahi
> Linux Contributors" for v2, if that's okay with the kernel folks, to be in
> line with our other projects; I defaulted to my name since so far I'm the
> only contributor to these files, but I expect other people to throw PRs at
> me in the future and the history to end up with more names here)

The copyrights matter more in case the need to relicense the work or
some copyright-infringement cases. If you use generic alias - The Asahi
contributors - how it would be possible to find people with actual
copyrights? For example to ask them about relicense permission?  Unless
it's an official body (e.g. foundation or company).  Therefore I propose
to stick to real names and include other contributors once they
contribute.

However this are just my thoughts, not a really professional opinion
about copyright aspects.

> 
> > I guess Rob will comment on the dt-bindings more... but for me a generic
> > "arm-platform" is too generic. What's the point of it? I didn't see any
> > of such generic compatibles in other platforms.
> 
> This is a hack for patches #11/#12 to use, and I expect it will go away once
> we figure out how to properly handle that problem (which needs further
> discussion). Sorry for the noise, this should not be there in the final
> version.
> 
> > > +		bootargs = "earlycon";
> > 
> > This should not be hard-coded in DTS. Pass it from bootloader.
> 
> My apologies, this was garbage left over from before I had bootargs support
> in the bootloader. Will be gone for v2.
> 
> > > +	clk24: clk24 {
> > 
> > Just "clock". Node names should be generic.
> 
> Really? Almost every other device device tree uses unique clock node names.

Yes, really, devicetree/ePAPR spec:
"The name of a node should be somewhat generic, reflecting the function
of the device and not its precise programming model. If appropriate, the
name should be one of the following choices:"

Multiple other boards and people (including myself...) made the same
mistake of adding specific names. Even some platform maintainers still
don't get it or never cared to look at DT spec. :)

> 
> > > +		compatible = "fixed-clock";
> > > +		#clock-cells = <0>;
> > > +		clock-frequency = <24000000>;
> > > +		clock-output-names = "clk24";
> > 
> > What clock is it? Part of board or SoC? Isn't it a work-around for
> > missing clock drivers?
> 
> The clock topology isn't entirely known yet; I'm submitting this as an
> initial bring-up patchset and indeed there should be a clockchip driver in
> the future. The UART driver wants a clock to be able to calculate baud
> rates. I figured we can get away with a fixed-clock for now while that part
> of the SoC gets figured out.

Such workaround is ok, but maybe add a comment that it's a workaround so
far.

Best regards,
Krzysztof

