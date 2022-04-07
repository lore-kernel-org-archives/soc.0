Return-Path: <SRS0=bijT=UR=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE9BC433EF
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 15D62C385A8; Thu,  7 Apr 2022 12:07:37 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0085BC385A4
	for <soc@kernel.org>; Thu,  7 Apr 2022 12:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0085BC385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id b24so6118846edu.10
        for <soc@kernel.org>; Thu, 07 Apr 2022 05:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=RXZ9lKydxs9kO1JxJb9dd9FMIU/aXNoy++vgijFww0k=;
        b=fLD8z1WxhKcc6h+Y8bC7AhGku/THlFtrhKM2rXzhUBuY0kZjjS+0nP32uiXsbKo5/g
         khQVI75054BWUQlt5DPpOFfvB1C+p6Bg6JYLxddgQE2rlBw4T2ZAoRz1jur9dTuSv+4a
         PuPwoait6By0LinqVCigKsk27Pu1PN4dao0w9VO5oGnS21ll8SA/av/uBJlwRKY1Sa9T
         uPHNnqI9qcgn07ejmI3ZrgOto5D/UYJV+PRTfpGcbrBnPd44tF7LRqJuSl52TmPmcq1a
         KEn44H29T8tDkwyZrPS4ekqYz6E73UKuBcnVAcr7NeH3f5F/2pYyzup2hEtYL4f0Hy9M
         ATcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RXZ9lKydxs9kO1JxJb9dd9FMIU/aXNoy++vgijFww0k=;
        b=vgrtqtWaFd5l8tEF0GyQygXDh723dSc5d9ImyFeyIsQTzOw+eD4KVnsdyTGSquMTV+
         sb9a3VzdqD8qdk5RBBcf+dHb8U/g+SjfqAhYJ3CPXFVC7hISbs+fDPxAowmqvAL3pXfc
         GmPXBY3Op0ls9o13PBcON5+PAYOAxfctnvOJEz+MKGUBSTIf3PZJD8io542cWpOrbcCs
         quYBZiJ1Ps/6E6d7ZcVD/EOAUrqSpp80PDJ58wvnCttcvA4dKJyBGArfk7HRCV833MYP
         gpb7fdP5LIKpK3FNqZI1OdYIwitKKlo4S6GIJIt6GDbR4ZL7rd7g7rDvpFDNNNeuGMlC
         8ibQ==
X-Gm-Message-State: AOAM530C1I30gL862Mp0rnJYCAo3Z7zat1PtWxfursYRrtnDe1OeJ4S0
	ugG1ZE1SvnfHuMwi1WcCRTXqog==
X-Google-Smtp-Source: ABdhPJxY5BbGCb1UPDSfWzKyt1vTRnHHRckAjtmhaAzU6YN/28sHmSGj6JzYZN3UfrqHa7RW1CKLYg==
X-Received: by 2002:a05:6402:209:b0:416:5211:841f with SMTP id t9-20020a056402020900b004165211841fmr14082498edv.59.1649333254265;
        Thu, 07 Apr 2022 05:07:34 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id k26-20020a056402049a00b004197b0867e0sm9133959edv.42.2022.04.07.05.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 05:07:33 -0700 (PDT)
Message-ID: <01250e59-eb49-43fb-666e-c1592d9dc922@linaro.org>
Date: Thu, 7 Apr 2022 14:07:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] ARM: dts: lan966x: Add QSPI nodes
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>, arnd@arndb.de,
 robh+dt@kernel.org, krzk+dt@kernel.org, alexandre.belloni@bootlin.com,
 olof@lixom.net, soc@kernel.org, nicolas.ferre@microchip.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com,
 tudor.ambarus@microchip.com, Manohar.Puri@microchip.com
References: <20220407105835.10962-1-kavyasree.kotagiri@microchip.com>
 <20220407105835.10962-2-kavyasree.kotagiri@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407105835.10962-2-kavyasree.kotagiri@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thank you for your patch. There is something to discuss/improve.


This should be sent with your DT bindings patch in one patchset.

On 07/04/2022 12:58, Kavyasree Kotagiri wrote:
> LAN966x SoC supports 3 instances of QSPI.
> Data and clock of qspi0, qspi1, qspi2 works upto 100Mhz.

s/upto/up to/

> 
> Signed-off-by: Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
> ---
>  arch/arm/boot/dts/lan966x.dtsi | 48 ++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/lan966x.dtsi b/arch/arm/boot/dts/lan966x.dtsi
> index 7d2869648050..b3c687db0aea 100644
> --- a/arch/arm/boot/dts/lan966x.dtsi
> +++ b/arch/arm/boot/dts/lan966x.dtsi
> @@ -196,6 +196,54 @@
>  			status = "disabled";
>  		};
>  
> +		qspi0: spi@e0804000 {
> +			compatible = "microchip,lan966x-qspi";
> +			reg = <0xe0804000 0x100>,
> +			      <0x20000000 0x08000000>;
> +			reg-names = "qspi_base", "qspi_mmap";
> +			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks GCK_ID_QSPI0>;
> +			clock-names = "gclk";

This is not correct with the DT schema.

> +			dmas = <&dma0 AT91_XDMAC_DT_PERID(0)>,
> +			       <&dma0 AT91_XDMAC_DT_PERID(1)>;
> +			dma-names = "rx", "tx";

This as well.

You can test schema with 'make dtbs_check DT_SCHEMA_FILES=...."
(check the docs for help what is needed to do it).


Best regards,
Krzysztof
