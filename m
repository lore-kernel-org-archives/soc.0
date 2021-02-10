Return-Path: <SRS0=/n+n=HM=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686C7C433E0
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 13:25:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2C49564E77; Wed, 10 Feb 2021 13:25:23 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CAE364DE7;
	Wed, 10 Feb 2021 13:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CAE364DE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-wr1-f53.google.com with SMTP id z6so2495909wrq.10;
        Wed, 10 Feb 2021 05:25:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Qbkae6XY7nF+JRYKySs6fWFYR01dWCp9hvuftwHNY5Q=;
        b=JHodjc/FCluG8JAlSxABirNdrdOU69CB19x7wUNYsQ3ai1jby8jtqANE7gfgiejCIh
         rcy07gOHrby3OboosUyPdVppbyUAKav+j3iJKWRYhnd3ZyZXtO1FH30Tm0BJ0kZ+U/kj
         vjl0Wia3aVdti1Hl14OfWYyoEEP6myMyU9qBydWua++WIXNuepoI/bGOjbmizVI0hj9U
         9wtjkExgaJK5CR5YH/8PbKR/Vf5CxSD6UXWVl08lHDUOGYZbMwr7h5t3X1GWxeF/89Zo
         8G7WMb7ldOAO6Z5qDUl8PXhieU3Y3U8CDOsjiZmPlNJRnVHqaxpcScV1n6VX7Hgdzm7j
         CyzQ==
X-Gm-Message-State: AOAM532LoNoYryHCWOVUrVIGRB5LCdTxdIe8DHW2lvjOffXOSp3JH+iz
	O7zQwYGw8uC/X6uq8COmI5w=
X-Google-Smtp-Source: ABdhPJw2XE1pIwLVQEAfJrFRyhQJBLSdyhHkZA/kqetUF5a5F5YWWHUVOfaPXlPHyoH3cIrs6pZRVA==
X-Received: by 2002:adf:80c8:: with SMTP id 66mr3729053wrl.344.1612963521202;
        Wed, 10 Feb 2021 05:25:21 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id f14sm2363823wmj.30.2021.02.10.05.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 05:25:19 -0800 (PST)
Date: Wed, 10 Feb 2021 14:25:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tony Lindgren <tony@atomide.com>
List-Id: <soc.lore.kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Arnd Bergmann <arnd@kernel.org>,
	devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org, soc@kernel.org, robh+dt@kernel.org,
	Olof Johansson <olof@lixom.net>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 18/18] arm64: apple: Add initial Mac Mini 2020 (M1)
 devicetree
Message-ID: <20210210132518.de7eyzrb5p5xycox@kozik-lap>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <YCOzLSqdsr83xf0b@atomide.com>
 <4481998a-27f6-951e-bb4f-a9d2b95f211f@marcan.st>
 <YCPE2lPpBlhCi7TH@atomide.com>
 <20210210125548.sdeadc4ncoxu3ikj@kozik-lap>
 <YCPdclQykSPx96hk@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YCPdclQykSPx96hk@atomide.com>

On Wed, Feb 10, 2021 at 03:19:46PM +0200, Tony Lindgren wrote:
> * Krzysztof Kozlowski <krzk@kernel.org> [210210 12:56]:
> > On Wed, Feb 10, 2021 at 01:34:50PM +0200, Tony Lindgren wrote:
> > > * Hector Martin <marcan@marcan.st> [210210 11:14]:
> > > > On 10/02/2021 19.19, Tony Lindgren wrote:
> > > > > * Hector Martin 'marcan' <marcan@marcan.st> [210208 12:05]:
> > > > > > On 08/02/2021 20.04, Krzysztof Kozlowski wrote:
> > > > > ...
> > > > > 
> > > > > > > > +	clk24: clk24 {
> > > > > > > 
> > > > > > > Just "clock". Node names should be generic.
> > > > > > 
> > > > > > Really? Almost every other device device tree uses unique clock node names.
> > > > > 
> > > > > Yeah please just use generic node name "clock". FYI, we're still hurting
> > > > > because of this for the TI clock node names years after because the drivers
> > > > > got a chance to rely on the clock node name..
> > > > > 
> > > > > Using "clock" means your clock driver code won't get a chance to wrongly
> > > > > use the node name and you avoid similar issues.
> > > > 
> > > > That means it'll end up like this (so that we can have more than one
> > > > fixed-clock):
> > > > 
> > > > clocks {
> > > >     #address-cells = <1>;
> > > >     #size-cells = <0>;
> > > > 
> > > >     clk123: clock@0 {
> > > >         ...
> > > >         reg = <0>
> > > >     }
> > > > 
> > > >     clk456: clock@1 {
> > > >         ...
> > > >         reg = <1>
> > > >     }
> > > > }
> > > > 
> > > > Correct?
> > > 
> > > Yeah, just don't use an imaginary dummy index for the reg. Use a real
> > > register offset from a clock controller instance base, and a register
> > > bit offset too if needed.
> > 
> > No, there is no need for fake "clocks" node with fake addresses. If you
> > have multiple clocks, the rules are the same as for other similar cases,
> > e.g. leds:
> > 
> > {
> >     clock-0 {
> >        ...
> >     };
> > 
> >     clock-1 {
> >         ..
> >     };
> > 
> >     soc@0 {
> >     };
> > }
> > 
> > This should not generate any dtc W=1 warnings and work with dtschema
> > (you need to check for both).
> 
> OK yeah so no need for the node name there after the "clock-" :)
> Sounds good to me.

You also could add a suffix or prefix ("fixed-clock-0", "clock-ext").
There is no strict requirement and Rob admitted that as-is was good
enough.

From my point of view, the dt spec mentions "clock" as one of preferred
names, so I would stick to it.

Anyway, it's not that important. :)

Best regards,
Krzysztof

