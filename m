Return-Path: <SRS0=DEnQ=TZ=linaro.org=viresh.kumar@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22ADDC433F5
	for <soc@archiver.kernel.org>; Mon, 14 Mar 2022 03:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EDAF1C340F4; Mon, 14 Mar 2022 03:51:22 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E1D3C340F5
	for <soc@kernel.org>; Mon, 14 Mar 2022 03:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E1D3C340F5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id e2so12436554pls.10
        for <soc@kernel.org>; Sun, 13 Mar 2022 20:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/Oqm6rMIEYZj78iej3CXr853eUOdIFYFax/LH5tNlQ4=;
        b=HT6ocqKuPFuAvF58pUg2kKkQKHEcOIlRgjO3OjMnA41k7rJvTugBLPWdbwSuGBrbm4
         hG8bU5/+Tu1cFFH1f2FY5KW8so58G5ibDdkgeGvmbU7IrG7m+zEc2Qb9KQjEb/gJhEIT
         aBkwd+ucbuLxui1U/Nj4IcMGywN++FYQg3HKrjR7+uWIC6csasTQROt8/LDExYa+b+/k
         r94RNe9ubcmA9iaq8GOsaFbhMLrBuxEOrBy8xAv+7B5i8Z/2IvGczVCTvZQKG12k7lFG
         x99atVsOaWmLwxUbSAmbva3PEDZ8OcxCQU3/IjX1YDj723fTn7pHr3E+3fi8T6Ow3LOx
         BPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/Oqm6rMIEYZj78iej3CXr853eUOdIFYFax/LH5tNlQ4=;
        b=yDDgHkWyAx50fxONKrrYwmOBTo4+RwRHJMzvjhWThr6RKsV4KxwlraNFOgt1bTU/Xx
         Obt9qd7oWbnfvRppmbx7FQBZPd1nwRSgNEH9x5eEccfpYPENSsPeHUpzsrrkJyt/pSd0
         t0SZnhvGSEPsafXmjjuxJuyRA+fcBHGN6InC3W+L8SHxEfLeNbH405U7BnVmNBLFl5+3
         HLIB3mR1PFwUrU2GPI4VeKOXOlaQ4kq8fC42WETHaEOV+UP6BP2Ve7zwM3wPzCKmBOmy
         mYaBD0//xFSnkM8F9j4n75Pyh+bYXEBNs8XiXpc3xSMJCRiAw+GLXYg7kGTZfBKjApJ2
         RjlQ==
X-Gm-Message-State: AOAM5315yD0GxbdBlcynZBHILGfcsnHyzt4XyH2ejlMFFLutiaIcuNFA
	59JNQrV6gppJ6rnt9UHcXEM0/w==
X-Google-Smtp-Source: ABdhPJzRDv5E6ORpbQOsmkNhWUYCtTFzJpR8SogiKKLlKw0MvmqA5q9cATA2IpIJX4OlGa3gdrfVgA==
X-Received: by 2002:a17:902:d284:b0:153:6463:253d with SMTP id t4-20020a170902d28400b001536463253dmr4632616plc.54.1647229880920;
        Sun, 13 Mar 2022 20:51:20 -0700 (PDT)
Received: from localhost ([223.184.83.228])
        by smtp.gmail.com with ESMTPSA id t7-20020a056a0021c700b004f7916d44bcsm9179206pfj.220.2022.03.13.20.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 20:51:20 -0700 (PDT)
Date: Mon, 14 Mar 2022 09:21:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: spear13xx: Update SPI dma properties
Message-ID: <20220314035118.gbjbrwbsywxljjti@vireshk-i7>
References: <20220312180615.68929-1-singh.kuldeep87k@gmail.com>
 <20220312180615.68929-2-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220312180615.68929-2-singh.kuldeep87k@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52

On 12-03-22, 23:36, Kuldeep Singh wrote:
> Reorder dmas and dma-names property for spi controller node to make it
> compliant with bindings.
> 
> Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>

What about a fixes tag ?

> ---
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

Why does the order matter here since we have dma-names anyway, which
was correct earlier ?

>  			};
>  
>  			rtc@e0580000 {
> -- 
> 2.25.1

-- 
viresh
