Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D4EC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 19:16:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D2ED64E85
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 19:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D2ED64E85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WGeB78FVQPbFuQKl9XTHen933/7ULY1uTIa+LoPPZkE=; b=s9NBwIxrVRdIHM2axhD2b3m8D
	ZmtBOU6uu4sa4PN2eCqSKqtJkNkeXUjZrVA96extcb6kiJ40F5V4W3cFFkvf4dAI+JhTZ1ErPaQnc
	Dm4uu+yFMhHFUpphzidmTAazj6BiJxdtiOsAcBjN3VcDfXosdMHiAi5Slem1IpH5TgKnNt+ApHwnz
	10tQNE9kcT/qFtEh8eyJbd70X42Nh/6QlITAIiON5nR9jrzLJusKYNLNDuMu26tVbfargCt5iyDBM
	9R2W/PAGstmyVBg8pcFbEj/CsAhw6O42hnuv3BL5qbw/ltOl2SNg/a1QTLMoZD1eJlqybUHG8fmI7
	AuSNS2Wiw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Bzr-0004VJ-38; Mon, 08 Feb 2021 19:14:55 +0000
Received: from mail-ot1-f42.google.com ([209.85.210.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Bzn-0004Tm-EO
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 19:14:53 +0000
Received: by mail-ot1-f42.google.com with SMTP id y11so15253395otq.1
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 11:14:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9MpW4g/Oa/7358qxsu5N9b3A3zLC/8dOk9zLIzf9+VY=;
 b=FlSg2ifSQjNX7tcfvkrgoyl2Zy8g8Uzou6UvFjwhR4QJj5iewp5FEUUBbnNMPxIYHG
 9ccUwX1xmihdhwxtLMaHpVdwPHXUbc1p1q1hQsUBY6ko1sWUFWRpD6JxTZaoqG5bgeOa
 asjL3HzmNHIHTtx8zePXWOv1Ma1OyuevyX8/nyK7mZPhe70h3fpZxS38fChLuOn6tNKD
 JuGUpe2aGy/wiigIzUtmUvmL4S/qCP6Vo/hTDOxAsdQiTjadMeGFx/v6tM2JJGyrkFID
 qLt1q4SzQ5v84dkXuSIHEJ+TvMlUDHvNGJgpkk1wANNOH45iOaaXnZ7M/kLmKArsy9Zn
 2qgw==
X-Gm-Message-State: AOAM533dneKUb2dzTQocUmAmnokkrlX0SAXvEqikmWw0ZR35lh374YuP
 GnYCn6MBs9v0Bd+hsT2l/g==
X-Google-Smtp-Source: ABdhPJy2Zdk/7lhRLfQ4vS7stnE58LqLxeABIlpPpWwn9WDzA3vpkWV8wHQrC0uGs0rwMLBvpmZeqQ==
X-Received: by 2002:a9d:6e0b:: with SMTP id e11mr8799402otr.343.1612811688715; 
 Mon, 08 Feb 2021 11:14:48 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g11sm3859816oif.9.2021.02.08.11.14.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 11:14:48 -0800 (PST)
Received: (nullmailer pid 1735846 invoked by uid 1000);
 Mon, 08 Feb 2021 19:14:47 -0000
Date: Mon, 8 Feb 2021 13:14:47 -0600
From: Rob Herring <robh@kernel.org>
To: Hector Martin 'marcan' <marcan@marcan.st>
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <20210208191447.GA1677483@robh.at.kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_141451_526271_24335EFE 
X-CRM114-Status: GOOD (  51.08  )
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
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, soc@kernel.org,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208191447.CEnn5iHON-KkBuAj-ZZpsJrn7n9Qz2D27tbdB-nsCbU@z>

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

Does there need to be a legal entity behind 'The Asahi Linux 
Contributors' to be valid?

From a more practical standpoint, if we want to relicense something in 
say 5 years from now, who do we ask for an okay?

> > I guess Rob will comment on the dt-bindings more... but for me a generic
> > "arm-platform" is too generic. What's the point of it? I didn't see any
> > of such generic compatibles in other platforms.
> 
> This is a hack for patches #11/#12 to use, and I expect it will go away once
> we figure out how to properly handle that problem (which needs further
> discussion). Sorry for the noise, this should not be there in the final
> version.

I was going to ask on this. If you have a user of it, I'm okay with it. 
Generally though, 3 or 4 levels of compatible don't really have users.

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

It's a WIP to be more consistent around node names. For actual
clock controllers we have 'clock-controller(@.*)?'. There's not really 
something established for 'fixed-clock'. We probably should define 
something, but that goes in the schema first.

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

That is normal. It does break compatibility between an old kernel 
and new DT. There's not really a good way to avoid that.

Rob

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
