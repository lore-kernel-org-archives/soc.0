Return-Path: <SRS0=yJwA=TZ=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33305C433FE
	for <soc@archiver.kernel.org>; Mon, 14 Mar 2022 06:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 00E61C340F4; Mon, 14 Mar 2022 06:54:42 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5E96AC340EE;
	Mon, 14 Mar 2022 06:54:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5E96AC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id z12-20020a17090ad78c00b001bf022b69d6so13562376pju.2;
        Sun, 13 Mar 2022 23:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ty6PwcxLzIVrqLfmu+9Ne928mUjT7ENA64son7AJAZo=;
        b=ZGY/KZNA9gTe1grOsoHZT2V1gfXNR7zcB/QMdQc0lY0zzvx6LFNO89ToSoVPvcwdKS
         aMA4qwy4WgaS2gGCJIZUUIszGUL0empqFJVQar4anjnNgukjglDVIzdnng1IkGQ+a4Af
         gnxIdAI9C9/7KOcV2Wu/WR41fNqYybY4sC3gyrWMH0O/XZICKRSflhJ27SgG4K9U2kLN
         d3VBgGhPXuB3BT0PWX8sITD/5PRzmNLaEXV1l0U71G5DpPALuwzS6wJ+RIuZ+oOGvddg
         5z3OwlP+A+BRDd7VtejvLIVjMBrnxDrb9IZoOiCgO1k/m8XL7OC6t2A0k93ZDeaeWxfg
         TcOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ty6PwcxLzIVrqLfmu+9Ne928mUjT7ENA64son7AJAZo=;
        b=7TMCXibT/HB/kRZFKgZLMIMMtAcveLfE8utKOyv0p+E1tkjxRgr21qKv9a6E6PLnq5
         spZdidDE3TQ8Pqg5XAqgoY6Olpow1x2VMFPbkOteaBXi3H+pe/fULQcgMQOV0Lctu7X+
         97K9aZv0WvcB5rEJ90CZ5k+ZBWRr/nXAProyvJsGbqw3eNKIwdWJukF5PnbnAIdui/J7
         teW9+U+Y6EVGwyBMgvs4MFiulEJyh/69Wa0Fe518EzukRUU/dw9kAsKMmmGwP0THvp/h
         ovprPgNxN79Hr6vois46qGVcRrqdMgZaM08VAXpx7aZDToL4pIS7fzBBD7BiXQsHyh3g
         TmOw==
X-Gm-Message-State: AOAM5337Mv4dI7dVLfobX2ZK4wO2fO8GneOYdEY7viMlK+tv6rkBICKE
	bBG/rr9FHSCVEkTyfyZRHPo=
X-Google-Smtp-Source: ABdhPJy9dg1ytDwWF5oBI9JRVSns4+X/cV/eUxiu8GWjgUVo7wm+A3Nzdx5ki2X39sTeFdtdRP7LfA==
X-Received: by 2002:a17:90a:430d:b0:1bc:f340:8096 with SMTP id q13-20020a17090a430d00b001bcf3408096mr23455757pjg.93.1647240880682;
        Sun, 13 Mar 2022 23:54:40 -0700 (PDT)
Received: from 9a2d8922b8f1 ([122.161.53.68])
        by smtp.gmail.com with ESMTPSA id p17-20020a639511000000b0038108d69e8fsm9310536pgd.53.2022.03.13.23.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 23:54:40 -0700 (PDT)
Date: Mon, 14 Mar 2022 12:24:34 +0530
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: spear13xx: Update SPI dma properties
Message-ID: <20220314065434.GA43329@9a2d8922b8f1>
References: <20220312180615.68929-1-singh.kuldeep87k@gmail.com>
 <20220312180615.68929-2-singh.kuldeep87k@gmail.com>
 <20220314035118.gbjbrwbsywxljjti@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220314035118.gbjbrwbsywxljjti@vireshk-i7>

On Mon, Mar 14, 2022 at 09:21:18AM +0530, Viresh Kumar wrote:
> On 12-03-22, 23:36, Kuldeep Singh wrote:
> > Reorder dmas and dma-names property for spi controller node to make it
> > compliant with bindings.
> > 
> > Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> 
> What about a fixes tag ?

Sure, will add one.

> > ---
> >  arch/arm/boot/dts/spear13xx.dtsi | 5 ++---
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx.dtsi
> > index c87b881b2c8b..45f0b2a33e02 100644
> > --- a/arch/arm/boot/dts/spear13xx.dtsi
> > +++ b/arch/arm/boot/dts/spear13xx.dtsi
> > @@ -284,9 +284,8 @@ spi0: spi@e0100000 {
> >  				#size-cells = <0>;
> >  				interrupts = <0 31 0x4>;
> >  				status = "disabled";
> > -				dmas = <&dwdma0 4 0 0>,
> > -					<&dwdma0 5 0 0>;
> > -				dma-names = "tx", "rx";
> > +				dmas = <&dwdma0 5 0 0>, <&dwdma0 4 0 0>;
> > +				dma-names = "rx", "tx";
> 
> Why does the order matter here since we have dma-names anyway, which
> was correct earlier ?

Dma-names order matters here.
As per pl022 binding, dma-names order specify rx,tx and all DTs which
have tx,rx as order start raising dtbs_chek warning. Thus, need to
reverse this order. Please note, no functional change in this patch
apart from just fixing warning.

Warning:
'rx' was expected
'tx' was expected

Regards
Kuldeep
