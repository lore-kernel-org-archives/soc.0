Return-Path: <SRS0=tGbr=UD=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6451C433F5
	for <soc@archiver.kernel.org>; Thu, 24 Mar 2022 06:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 76989C340F0; Thu, 24 Mar 2022 06:25:55 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0EFBC340EC;
	Thu, 24 Mar 2022 06:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0EFBC340EC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id u22so3217326pfg.6;
        Wed, 23 Mar 2022 23:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dwDYUTHimQOgoxdkP8sjUxdcESsR/QK5BJW0KPL4v+M=;
        b=pGphB0wGqeHh0tXFHs9/r2BIMpxutQtSbYKLKe3d+08y+zJTH030ndCKamAQQuqFSx
         WtDfAJwybEaGIjL9n/UfJ5DEK7kfiZk1a1of6Ts6LX17eT1eOuhEFMIaqMO3PCZFoyiE
         D/KuJ0isIQYcfACmWYEzQYo+jNITKZIQI4AyyuWz+a14q/w+zU44rJsGn0DYhwuwY+Sv
         Wlj69HoE8Ruxt73jXKPH4iW3KgmYg6olr6zKQmKsVnl++t4zD0vKVif2/1RR8WUcsOoz
         CTYZcxz1mpKCL/LmaIrh1jnLzGxFY0CPzLO8hAdl38WnYKYZLUZkhnk1eE5yy7h/Eyq2
         +jYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dwDYUTHimQOgoxdkP8sjUxdcESsR/QK5BJW0KPL4v+M=;
        b=dnLZhOQpBsmPOzooAdF4Zwg69GB12oTWNqQiXCRrcDnipNED0MJZCI0EmeL/rYlaGu
         raUJUm1tjHWbKTAd1MCQDUEKLMrYhnNTyS2XwT3klXHFr2elIA+M4Yh59z9Emdrb79l5
         oPg8nuwud1MDT88a9tHmQzoTGuG8g/g6wgyrfzip5brEuKXNSHWBRDJr+eYWXaTpVDL0
         ALpJDahSceBAeGWKuGOPR67eLSvJvsobMrWgyK3EaNMc5z1MtjTHwFwFIM6PZn9gENIK
         ynM4OQbS7m0j30vt6P8GfOQEnWujISkpG/paWkz3ljO4WZhJS2T7bgTNe8Z3q6LI3LU+
         vmHg==
X-Gm-Message-State: AOAM532Iakiv4RwcWP63Co15jQ8cQ3uCKoiNAyVN1u8Pq8LyglwTB5uM
	M7LfRdD0LOUarZA6abGdYJ0=
X-Google-Smtp-Source: ABdhPJxfRsmaap5/p4sWElWvELb49XKGWxiVS20Y8jWLuFnhXpOyQVwz+ldkHm5/uH7/ZY+CB7KEeQ==
X-Received: by 2002:a65:604a:0:b0:375:5cc8:7458 with SMTP id a10-20020a65604a000000b003755cc87458mr2863442pgp.205.1648103154065;
        Wed, 23 Mar 2022 23:25:54 -0700 (PDT)
Received: from 9a2d8922b8f1 ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id h6-20020a636c06000000b00363a2533b17sm1466081pgc.8.2022.03.23.23.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 23:25:53 -0700 (PDT)
Date: Thu, 24 Mar 2022 11:55:47 +0530
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: spear13xx: Update SPI dma properties
Message-ID: <20220324062547.GA15504@9a2d8922b8f1>
References: <20220323175920.93155-1-singh.kuldeep87k@gmail.com>
 <20220324023904.h2qfxzxlznggbsyr@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220324023904.h2qfxzxlznggbsyr@vireshk-i7>

On Thu, Mar 24, 2022 at 08:09:04AM +0530, Viresh Kumar wrote:
> On 23-03-22, 23:29, Kuldeep Singh wrote:
> > Reorder dmas and dma-names property for spi controller node to make it
> > compliant with bindings.
> > 
> > Fixes: 6e8887f60f60 ("ARM: SPEAr13xx: Pass generic DW DMAC platform data from DT")
> > Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> > ---
> > v2:
> > - Add fixes tag
> > - Remove 1/2 patch from series as it's not required
> > - v1 discussion link:
> >   https://lore.kernel.org/linux-devicetree/20220312180615.68929-2-singh.kuldeep87k@gmail.com/
> > 
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
> >  			};
> >  
> >  			rtc@e0580000 {
> 
> Rob,
> 
> I tried to ask this at V1 as well [1]. Why do we need a patch like
> this ? Isn't this a DT tooling issue, where it is asking for a fixed
> order of values ?

Fixed order of values is important in case of properties like
compatibles etc. In case of dma-names, yes order shouldn't matter here.

This patch is more of appeasing dtbs_check warning rather than fixing
something. It's safe to go with this patch.
I am not sure if there's a provision to exclude dma-names from fix
ordering checks. Rob can help here in providing better insights.

- Kuldeep
