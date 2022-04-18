Return-Path: <SRS0=Kfe6=U4=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D88DC433F5
	for <soc@archiver.kernel.org>; Mon, 18 Apr 2022 12:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5614AC385AF; Mon, 18 Apr 2022 12:20:29 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2A3F8C385A8
	for <soc@kernel.org>; Mon, 18 Apr 2022 12:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2A3F8C385A8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id r13so26556578ejd.5
        for <soc@kernel.org>; Mon, 18 Apr 2022 05:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=IrspqwoC0i8xWBSDGv/e81WYq/G3Gaial55KaXcpMB4=;
        b=EROJPtVhkTWMC362VRxsn28ErAWXjxRwSGzBrXd/ILtzWuytV08hvlbx49encLOOqc
         yeMw9yc7SKrF1+IquHFumnC5nzv8sCjiS/9h3Ie6onCCBYKAmaLf0suDnplCv4q3oEDF
         knghEFqpRQpYEfE3tDtNwMu2obylGzqhbXAdLhvCLWIQKLnEXd8Sw7hYct4HM0iizOxM
         KJxVev9k4sh5XJ89IrjxtG8nz5L8AoKnxF88C74xHknJiavH0KHq7Pxu0mOPH9XvZWze
         PiVvIKdjNyMdM4oEgTDgrWs57aI2jc86pzv2U3KyxgYxeQX5iqZEIrJxIMY3Y4NeUc0Y
         leDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IrspqwoC0i8xWBSDGv/e81WYq/G3Gaial55KaXcpMB4=;
        b=wOmTIovB9ET8nS03ElBfJZUodfvx1SsYkUiQpJ9v5fdslO+gvXEYnfrzjIn++74mBY
         ycRscxPfQbOKb0sx6EY4AyI7igvNXznWrOYCxBum/gR0Hx4XE75r1Fo0t+8/SrWMrDVW
         6ZrCrmdSnUu4h7aPa8y+3lIHjiKhYY6mihmSYKSAFm1OnvUk6qcNl8i4M8NgZA3030n9
         +A0Ih0GMLrIP6ae3NdClpkTUcY3YYO4KrghXYHR7XqdaMP9XIHDhbRLUyVC3BKlBW74r
         2x1PQi2sPKai4npWKQrzc/oxRpDHClI3tmWbI55U0Y+AMDAOJKyxBsTphcj51L6uFG+X
         HGdQ==
X-Gm-Message-State: AOAM533f5tr+QDlhOItD90sTkqgiornzjYCVWgCaHTDA2nNEsKBMcFHf
	NiWDe22ALozB/dnMG56kJ75dKA==
X-Google-Smtp-Source: ABdhPJzoDxvcNzmEcyeGaDq97ow/WOeOSzYmXAahpLo2Kg1wrT2tHDDGSBII00dY0Cob+6Pqx4rvHQ==
X-Received: by 2002:a17:907:7e9f:b0:6e8:92eb:4171 with SMTP id qb31-20020a1709077e9f00b006e892eb4171mr8636712ejc.53.1650284425490;
        Mon, 18 Apr 2022 05:20:25 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o14-20020a170906774e00b006d5b915f27dsm4538016ejn.169.2022.04.18.05.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 05:20:25 -0700 (PDT)
Message-ID: <60e50c11-118d-431f-7120-95fcbb53eeb5@linaro.org>
Date: Mon, 18 Apr 2022 14:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 3/5] arm64: dts: nuvoton: Add initial support for
 MA35D1
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
 olof@lixom.net, will@kernel.org, soc@kernel.org, cfli0@nuvoton.com
References: <20220418082738.11301-1-ychuang3@nuvoton.com>
 <20220418082738.11301-4-ychuang3@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220418082738.11301-4-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/04/2022 10:27, Jacky Huang wrote:
> Add the initial device tree files for Nuvoton MA35D1 Soc.
> 

(...)

> +	gic: interrupt-controller@50800000 {

The unit address does not match first reg property. Don't you have
warnings with this?

> +		compatible = "arm,gic-400";
> +		#interrupt-cells = <3>;
> +		interrupt-parent = <&gic>;
> +		interrupt-controller;
> +		reg = <0x0 0x50801000 0x0 0x1000>,
> +		      <0x0 0x50802000 0x0 0x2000>,
> +		      <0x0 0x50804000 0x0 0x2000>,
> +		      <0x0 0x50806000 0x0 0x2000>;
> +		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0x13) |
> +			      IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +};

Best regards,
Krzysztof
