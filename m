Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30EDEC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 18:14:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C842D64E88
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 18:14:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C842D64E88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Kivm/Q91+/WPqQ6w0q14gL7dHMwmJcQCEV4NtIkY2/k=; b=aLlpA4iIiSU8sEiDv6AGW45t/
	HEe1kw6OK/W2Y/mNun9uYdXbAhmuafuwoWt4fUjt3cFsVqf0zowAl2PjUVsD4L23iIw5wD2eUYRmQ
	OiS2HAhO9xig1PWEP3de64mhtvtQzMWbKlK9vKovO7AERgh/zgQra9T1Ei5sSObkNxxnGJdgeOMof
	Wofieio9/RVnYLQCcYBBCIBfiCW8XOb13jMCe3cvyorT6/UdGH0RYmHi7g0dTWUjcREY3gd5wK10X
	Hdfjy26swHcnIQOesvSeF2J2H6FsZZnysyWTIzyoiEsRXqFJdjz0PvfR0hYNVh1oqsBbpBGjYHYuv
	ZLNx5n79g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9B1r-0004EY-JF; Mon, 08 Feb 2021 18:12:55 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9B1p-0004ED-OR
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 18:12:54 +0000
Received: by mail-wr1-f54.google.com with SMTP id z6so18283865wrq.10
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 08 Feb 2021 10:12:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uG44Nh0+1Z6GPKJ+sMh7UFsXf5L8CgK5m4MwsqTm8vM=;
 b=NS4ndrRWVJMzONV0OGAvnqInJu95epcki5Jw0DEFltTFeW3c2RNTheBsKpG0kzaq4A
 8gyXzux6avC60xs6ws5zixSdAT210Kv5Zdgdi6WJ0ii3eOy7mtm7tpzBkydB5Z+Hvxb7
 vXMZ9bKK/FQ2usd8Iq5p+FKxQsNkdkLitspDg68jHPGbSTOJV1FZOB54SSib2Q7drQ8w
 sFLd9JICoZWbfo6nJNA6YwMQmzP5RRYhSz1W9XTLN4wwURRNysDUSWJL3joBWABh6n2/
 2g0fno8ePgs6uYWuUBxS0P9+gHtULOmdYOahopgxNfkAHL5fUXAnY0iaCVvvhhr9gB7e
 b3CQ==
X-Gm-Message-State: AOAM532V+hPDTVRJ8tmKMPCk8Fd89PX4mHle44aWgzdOvv1dREavxGOj
 OeJ3hTfDilgb85EuZA6E30g=
X-Google-Smtp-Source: ABdhPJy/wKPjP7+LBFoeHW0XLxMt/V+JDUKUXKCYLCJTnC5Yurk6M5a1DiVIEb/R09EmHRvq8ISlSg==
X-Received: by 2002:adf:e3cd:: with SMTP id k13mr84116wrm.289.1612807972155;
 Mon, 08 Feb 2021 10:12:52 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
 by smtp.googlemail.com with ESMTPSA id s23sm21317647wmc.35.2021.02.08.10.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:12:49 -0800 (PST)
Date: Mon, 8 Feb 2021 19:12:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 01/18] dt-bindings: vendor-prefixes: add AAPL prefix
Message-ID: <20210208181248.tbgffdwghlseawic@kozik-lap>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-2-marcan@marcan.st>
 <20210208102730.p4nhsl35oowsklv2@kozik-lap>
 <20210208173215.GA1567700@robh.at.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208173215.GA1567700@robh.at.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_131253_803131_AD6158A0 
X-CRM114-Status: GOOD (  26.53  )
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
 Marc Zyngier <maz@kernel.org>, Hector Martin <marcan@marcan.st>,
 linux-kernel@vger.kernel.org, soc@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208181248.8dV-kYB8nsIhuroBLbYmZgiv9MQhFWhlaXxR5vuPodM@z>

On Mon, Feb 08, 2021 at 11:32:15AM -0600, Rob Herring wrote:
> On Mon, Feb 08, 2021 at 11:27:30AM +0100, Krzysztof Kozlowski wrote:
> > On Fri, Feb 05, 2021 at 05:39:34AM +0900, Hector Martin wrote:
> > > Amusingly, this wasn't yet documented, even though this vendor prefix
> > > has been used since time immemorial on PPC.
> > > 
> > > Signed-off-by: Hector Martin <marcan@marcan.st>
> > > ---
> > >  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > index 041ae90b0d8f..d7950c723472 100644
> > > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > > @@ -25,6 +25,8 @@ patternProperties:
> > >    # Keep list in alphabetical order.
> > >    "^70mai,.*":
> > >      description: 70mai Co., Ltd.
> > > +  "^AAPL,.*":
> > 
> > All prefixes are lower case... see ABB below (not mentioning that the
> > company name is not APPLE), so just "apple".
> 
> Grep the kernel tree for 'AAPL,'.

I know it's the ticker, but the point was - we don't use tickers here
for none of other platforms.

Mentioned grep brings only one result:
arch/powerpc/platforms/powermac/pic.c:   * cases where the APPL,interrupts property is completely

so hardly an argument for backwards consistency, within the kernel.

On the other hand, some DTs for iPhones mention "apple", not APPL:
https://www.theiphonewiki.com/wiki/D211AP/Device_Tree
https://www.theiphonewiki.com/wiki/D331AP/Device_Tree
https://gist.github.com/bazad/1faef1a6fe396b820a43170b43e38be1

Although I am not sure how reliable are the sources.

> It comes from the the ticker symbol 
> which early on was the preferred form, but we've tended to move away 
> from that. The DT Apple ships (which is *very* different) uses both 
> forms.
> 
> So keep what exists already or have old AAPL and new apple?

Hectore mention old PowerPC Apple sources were using the APPL, but it
seems they did not end up here. What would be the point to stick to the
old prefix if we cannot find it?

Maybe they exists in other systems? I could not find such in latest
FreeBSD, but there were not many DTSes inside.

Best regards,
Krzysztof

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
