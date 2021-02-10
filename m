Return-Path: <SRS0=/n+n=HM=gmail.com=k.kozlowski.k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05E2C433E0
	for <soc@archiver.kernel.org>; Wed, 10 Feb 2021 12:55:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 88F6464E45; Wed, 10 Feb 2021 12:55:52 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F89664DF2;
	Wed, 10 Feb 2021 12:55:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F89664DF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=k.kozlowski.k@gmail.com
Received: by mail-wm1-f46.google.com with SMTP id t142so1752180wmt.1;
        Wed, 10 Feb 2021 04:55:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=klyvuCb2s80xxmYVdUoIwTBI4ZLcJg7EZBGPH+l10fY=;
        b=nK3X6vpcBwdFmMfg+/6NQVTFatvmW8Ngixt5elst8dY+tiqzZ3xwoDVRIJsCjoSQ9d
         gl/DxfJMfOIMY0o++upMyA9Dmm5fMusY4GPQsO5wCmKPw9K+HEmrcQo2HJTnTKe9U5Yn
         cOkw5nryGCMzINFpCx6O90WelKKCPEqHUf1IYSy9kFGRp0jDKQoPKWvKgMktaM2mJG4t
         kQr1nZZM7FNRBHkDT+GIEQ2/4j4H/RXVBrj7GxS7JCSLf3zynKOotR50HcNR41VM0ZHg
         tCRmKY2lmBgLmAhKiqZjkMe+HrGB1nJDy0iErOgz+5+EAlb+W8zEqHay0YILhbhjTMql
         fznw==
X-Gm-Message-State: AOAM5311ZX3Ft/Rbu+3EW7oxnTjnaVIXNBNxSyUQn421tJSeR5z2IysO
	BhiewvejTJiyZLfOavoiWlc=
X-Google-Smtp-Source: ABdhPJxEJMv2xTHkhA5hRM6aKJJZhYfdlEBUHOKcxJzOPO3sXDi3h9DHp9MZv//bMkX9mQOgPEc9bA==
X-Received: by 2002:a1c:3b8a:: with SMTP id i132mr2869183wma.26.1612961750425;
        Wed, 10 Feb 2021 04:55:50 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id 64sm3601054wrc.50.2021.02.10.04.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 04:55:49 -0800 (PST)
Date: Wed, 10 Feb 2021 13:55:48 +0100
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
Message-ID: <20210210125548.sdeadc4ncoxu3ikj@kozik-lap>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-19-marcan@marcan.st>
 <20210208110441.25qc6yken4effd6c@kozik-lap>
 <cd67b2ce-9676-31b4-85f7-de1ec9b2bf72@marcan.st>
 <YCOzLSqdsr83xf0b@atomide.com>
 <4481998a-27f6-951e-bb4f-a9d2b95f211f@marcan.st>
 <YCPE2lPpBlhCi7TH@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YCPE2lPpBlhCi7TH@atomide.com>

On Wed, Feb 10, 2021 at 01:34:50PM +0200, Tony Lindgren wrote:
> * Hector Martin <marcan@marcan.st> [210210 11:14]:
> > On 10/02/2021 19.19, Tony Lindgren wrote:
> > > * Hector Martin 'marcan' <marcan@marcan.st> [210208 12:05]:
> > > > On 08/02/2021 20.04, Krzysztof Kozlowski wrote:
> > > ...
> > > 
> > > > > > +	clk24: clk24 {
> > > > > 
> > > > > Just "clock". Node names should be generic.
> > > > 
> > > > Really? Almost every other device device tree uses unique clock node names.
> > > 
> > > Yeah please just use generic node name "clock". FYI, we're still hurting
> > > because of this for the TI clock node names years after because the drivers
> > > got a chance to rely on the clock node name..
> > > 
> > > Using "clock" means your clock driver code won't get a chance to wrongly
> > > use the node name and you avoid similar issues.
> > 
> > That means it'll end up like this (so that we can have more than one
> > fixed-clock):
> > 
> > clocks {
> >     #address-cells = <1>;
> >     #size-cells = <0>;
> > 
> >     clk123: clock@0 {
> >         ...
> >         reg = <0>
> >     }
> > 
> >     clk456: clock@1 {
> >         ...
> >         reg = <1>
> >     }
> > }
> > 
> > Correct?
> 
> Yeah, just don't use an imaginary dummy index for the reg. Use a real
> register offset from a clock controller instance base, and a register
> bit offset too if needed.

No, there is no need for fake "clocks" node with fake addresses. If you
have multiple clocks, the rules are the same as for other similar cases,
e.g. leds:

{
    clock-0 {
       ...
    };

    clock-1 {
        ..
    };

    soc@0 {
    };
}

This should not generate any dtc W=1 warnings and work with dtschema
(you need to check for both).

Best regards,
Krzysztof

