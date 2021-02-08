Return-Path: <SRS0=Nkqh=HK=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B319EC433E6
	for <soc@archiver.kernel.org>; Mon,  8 Feb 2021 18:12:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7051264E7D; Mon,  8 Feb 2021 18:12:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFC7764E37;
	Mon,  8 Feb 2021 18:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DFC7764E37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-wr1-f46.google.com with SMTP id z6so18284038wrq.10;
        Mon, 08 Feb 2021 10:12:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uG44Nh0+1Z6GPKJ+sMh7UFsXf5L8CgK5m4MwsqTm8vM=;
        b=DgSonjPcSweVPXgzzfExigEPPIauKm1+qisyQ8nZFmf7FQTZbZDLytkeEk+bFGWIDd
         EBGXFnipIs/ApzyD3ZIK+9eJa4z6Bmy1Te/Fvf3bDUB8th0s/Kvt4ANoyJLvz3YvUbWU
         9l+xfgg2gyw5oYTO+SocBhGmuXNi9rrajIH2AiRQPkZFYANir7OUgC4U2zurWHoRD/mB
         4o0GGk7mfV+VLgSytJXwJ26Hz8F4dDddhtd8M3gZIGxEKd0KomVZrm/rzxuFWx8kDz2F
         G/I8XVP2wDV6t3bJ+VJuNi+f8MNi9jYquGwrU15AQajbYW16z4zmfyWQCrWmoJnnbHKD
         N/OQ==
X-Gm-Message-State: AOAM533Kq4KKvs2igkIRJMZ0VgKyn+WJ0qYLNbA2WC7tq1Z75XcnZAHl
	iwn7fhtmznU+UbbcfsX8pbvn1I2enG8=
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
List-Id: <soc.lore.kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@kernel.org>,
	devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org, soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/18] dt-bindings: vendor-prefixes: add AAPL prefix
Message-ID: <20210208181248.tbgffdwghlseawic@kozik-lap>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-2-marcan@marcan.st>
 <20210208102730.p4nhsl35oowsklv2@kozik-lap>
 <20210208173215.GA1567700@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210208173215.GA1567700@robh.at.kernel.org>

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
