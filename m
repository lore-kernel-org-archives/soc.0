Return-Path: <SRS0=eplR=UH=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C28C433FE
	for <soc@archiver.kernel.org>; Mon, 28 Mar 2022 02:09:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7514DC340EE; Mon, 28 Mar 2022 02:09:04 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 359C4C34100
	for <soc@kernel.org>; Mon, 28 Mar 2022 02:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 359C4C34100
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f170.google.com with SMTP id k14so11133798pga.0
        for <soc@kernel.org>; Sun, 27 Mar 2022 19:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=yvXapPqYzElq1fYgdlIr/vuqUeFZA0jI8LMeEGgPqcQ=;
        b=hzFkH4Dt0bG4QB4nuDoGBznHRc2425jzVBZUuzFK0B1Xh623OyRshk5FtU7W2tRHc8
         ZXMPRTiRU6TCOPyLLjCxSwmalnl2W3+Is5PslOeujy6QBwyR5EprL+wFvtER2I57ULMQ
         AZP00TUnW+ogsIPGUvNPW1nYfNld5HhWcYjFjgjLHGqs1QEdG9gYoTqaPevta1kyDgt/
         ciD4tASRA//4+S/ex7DIb9IyNbE3c6Zf8W79hplB1tm60xsLJ5BUoWJFYPP83/m6uRn4
         vPtBwVROoe7CGhklwVz3FYCDDFQhQRXw17in87OMLJqRGyIlKhFiuj6lSZJrbb8gNIHy
         WM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yvXapPqYzElq1fYgdlIr/vuqUeFZA0jI8LMeEGgPqcQ=;
        b=lD//Q8exF2mDfF7Z9nC5yOhvRv64FulhWlxmja0U9BSxbFeiGmvV1TYwXmLVQZ1lzX
         QbhckZiVLq4EV0ObPdwbU4vaK35sUI05BdalBZ6gRRBBIhxbgYcVT6ZGSAQ4Vc0Aw/7t
         Pj+8Qf6ZDZZb501cy2b7sp9WS3r03RV6h5QaiAghp1T6GX4dWAaUiusaDEFqLt/33+gb
         ya/+ERhcXueGm4lYtHOAt7mJmtmEm2z9lD/qzlf60Aq048640Sd2XH9qhig5qrKUhkZi
         CF/b8g2PhAjIYxzeotthejoLF/lIdBcRfosjUyp3JLBhKPvKY6SrUKMZcY+I9XCXHLeK
         pD8w==
X-Gm-Message-State: AOAM532f3tvglyv/zeUdfa1yU4gHTsNn/AvPZTw6z/1k2H1sbDmvp5Bb
	9yznMK+z4BwEgN5/wsyZLQyjGQ==
X-Google-Smtp-Source: ABdhPJz5uvOKpCljPOUZlt+bf8vDiW2zaApYmTdIP/2olLO3lmLicLDouamvSFijCL5pAeI5MwBKIA==
X-Received: by 2002:a63:7d13:0:b0:398:2d7d:cde2 with SMTP id y19-20020a637d13000000b003982d7dcde2mr5525065pgc.376.1648433342678;
        Sun, 27 Mar 2022 19:09:02 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id h190-20020a6383c7000000b003831aa89c45sm5285812pge.42.2022.03.27.19.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Mar 2022 19:09:02 -0700 (PDT)
Date: Mon, 28 Mar 2022 07:38:52 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ARM: dts: spear1340: Update serial node properties
Message-ID: <20220328020852.ljbci4l5rv5cdsot@vireshk-i7>
References: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
 <20220326042313.97862-3-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220326042313.97862-3-singh.kuldeep87k@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52

On 26-03-22, 09:53, Kuldeep Singh wrote:
> Reorder dma and dma-names property for serial node to make it compliant
> with bindings.
> 
> Fixes: 6e8887f60f60 ("ARM: SPEAr13xx: Pass generic DW DMAC platform data from DT")
> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
> ---
>  arch/arm/boot/dts/spear1340.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/spear1340.dtsi b/arch/arm/boot/dts/spear1340.dtsi
> index 827e887afbda..13e1bdb3ddbf 100644
> --- a/arch/arm/boot/dts/spear1340.dtsi
> +++ b/arch/arm/boot/dts/spear1340.dtsi
> @@ -134,9 +134,9 @@ serial@b4100000 {
>  				reg = <0xb4100000 0x1000>;
>  				interrupts = <0 105 0x4>;
>  				status = "disabled";
> -				dmas = <&dwdma0 12 0 1>,
> -					<&dwdma0 13 1 0>;
> -				dma-names = "tx", "rx";
> +				dmas = <&dwdma0 13 0 1>,
> +					<&dwdma0 12 1 0>;
> +				dma-names = "rx", "tx";
>  			};
>  
>  			thermal@e07008c4 {

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
