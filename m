Return-Path: <SRS0=9HEL=UD=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0F22C433EF
	for <soc@archiver.kernel.org>; Thu, 24 Mar 2022 02:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8074CC340E9; Thu, 24 Mar 2022 02:39:09 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E426EC340E8
	for <soc@kernel.org>; Thu, 24 Mar 2022 02:39:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E426EC340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f52.google.com with SMTP id kx5-20020a17090b228500b001c6ed9db871so8200823pjb.1
        for <soc@kernel.org>; Wed, 23 Mar 2022 19:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=lLmU9eaNbQZtuAnKmKQfSZbES2JI+sc9+LEMrBqU4oU=;
        b=dnVbf83bqgCMp5cYxA71grdC1mbKtFSVFvEj+qoYy6rhknJ4YfdZNDk7jhGPnziFVN
         FUQlh1n+Ey9VUcqr304xQkZ4p+aAsR8YYceECVxQvDI3XpWNTHKkxN85CY4XWBWetREa
         v6DOVnDwfFYkqNd8UlACDQJ9Q4WJ8AUaq8VGoQPpfD4lPdjMllnDS/ppUA7hBQG4SJPX
         Yc4TTr2Pb3zrQdWzhEmJPJtCMDi/oAU23S0qX1VWoAQZACK8LSETLXFPf0pkRKcoP5Ip
         9Y39LBqKNMa6oHUITZMLdtae8wjuXW8f7useNMMYPwx86U2CirMQhvdD/xsLwC7z5d4O
         0WDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=lLmU9eaNbQZtuAnKmKQfSZbES2JI+sc9+LEMrBqU4oU=;
        b=bBrzD/yz6uIqHLqiBQnhWGZWveVq65xXLDjXa1qYTVrHrwIn2fOISiZKkqDybfV94w
         A2ltZXxtOBp4Zvv58tCNuvCQPlH8YgAkFHhQLhl8DYyUr0AKnhqNDCNqX6R1eHRR7XcP
         1aoWybRBcKzKVFD7CkQlL5vmqNSviIxSA3ZjPZQFqgCSYMi4VeivQl1Sh8M0ihw4IoZn
         l4XgFVde36TpMk+nZ74PEONDGgmO6K9WXvZvQ2Xcv/aWwvLA6cII7JU8X2FnC/6wzJ9W
         V7lZi00rW/M5sBYIDcp09OFOIrX7JbpeK9nC+nXyxjeXTvtwylHVXhoxhJH0umX8HWWn
         yk4Q==
X-Gm-Message-State: AOAM532SXurn86IEQDKrrZe39JkRflyzueso6Bng6kU9HN3x6K9ilSAt
	hWGER+D8FwoJ9J+8DOZ/jdY3Tg==
X-Google-Smtp-Source: ABdhPJyB4BzVu6jeixu1gk0n4B4VYDuwYKx1dB0266XakOvXJ0YNren71lhLRwBZGZOhpl9m1LLSLw==
X-Received: by 2002:a17:902:8497:b0:154:9282:bc01 with SMTP id c23-20020a170902849700b001549282bc01mr3418482plo.33.1648089547345;
        Wed, 23 Mar 2022 19:39:07 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id oo16-20020a17090b1c9000b001b89e05e2b2sm1001104pjb.34.2022.03.23.19.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 19:39:05 -0700 (PDT)
Date: Thu, 24 Mar 2022 08:09:04 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
	Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: spear13xx: Update SPI dma properties
Message-ID: <20220324023904.h2qfxzxlznggbsyr@vireshk-i7>
References: <20220323175920.93155-1-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220323175920.93155-1-singh.kuldeep87k@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52

On 23-03-22, 23:29, Kuldeep Singh wrote:
> Reorder dmas and dma-names property for spi controller node to make it
> compliant with bindings.
> 
> Fixes: 6e8887f60f60 ("ARM: SPEAr13xx: Pass generic DW DMAC platform data from DT")
> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> ---
> v2:
> - Add fixes tag
> - Remove 1/2 patch from series as it's not required
> - v1 discussion link:
>   https://lore.kernel.org/linux-devicetree/20220312180615.68929-2-singh.kuldeep87k@gmail.com/
> 
>  arch/arm/boot/dts/spear13xx.dtsi | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx.dtsi
> index c87b881b2c8b..45f0b2a33e02 100644
> --- a/arch/arm/boot/dts/spear13xx.dtsi
> +++ b/arch/arm/boot/dts/spear13xx.dtsi
> @@ -284,9 +284,8 @@ spi0: spi@e0100000 {
>  				#size-cells = <0>;
>  				interrupts = <0 31 0x4>;
>  				status = "disabled";
> -				dmas = <&dwdma0 4 0 0>,
> -					<&dwdma0 5 0 0>;
> -				dma-names = "tx", "rx";
> +				dmas = <&dwdma0 5 0 0>, <&dwdma0 4 0 0>;
> +				dma-names = "rx", "tx";
>  			};
>  
>  			rtc@e0580000 {

Rob,

I tried to ask this at V1 as well [1]. Why do we need a patch like
this ? Isn't this a DT tooling issue, where it is asking for a fixed
order of values ?

-- 
viresh

[1] https://lore.kernel.org/all/20220312180615.68929-2-singh.kuldeep87k@gmail.com/
