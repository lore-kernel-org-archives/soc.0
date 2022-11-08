Return-Path: <SRS0=HpX/=3I=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0636C4332F
	for <soc@archiver.kernel.org>; Tue,  8 Nov 2022 11:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD975C433C1; Tue,  8 Nov 2022 11:13:30 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A361FC433D7
	for <soc@kernel.org>; Tue,  8 Nov 2022 11:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A361FC433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id b9so20574207ljr.5
        for <soc@kernel.org>; Tue, 08 Nov 2022 03:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b6jOxeuiN/P01zuIfksPvOeqYmxHvoXJTsaDxoCzoKc=;
        b=AJWW7q3rfm8uJ5TAPfZceGmBAUYtgGRyVzRsBn9NKAmQkl07a0ZA9Z0sebEgvC4Qqj
         h++Y2PeOi5je4QMztSNvVfQyfBHESw54AWECOf06LfbR0Zq/phtWTUjZVK2wpABXlI0p
         8jStsY+gWu3bdmXhjNh8WSf0a8ez4apalpQ887SIIQ6PcSzSYaAhDR4Y2/MS7K7dcYtW
         vIRu1DvBEnt3t7la1J980coDN+bggzpB3VblRVqxWuRoNsdaZYNqTIfsMj2pG6YfWMbb
         zwrwTs5MN2EzDFL6J7s0l7VtIiC5e0YLVOKcI6+LTDRgAWU2x4YPpCJ85vu+RNfmgDMi
         BfdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b6jOxeuiN/P01zuIfksPvOeqYmxHvoXJTsaDxoCzoKc=;
        b=bP5fPyPhatIPQjJIp7layKIVBlM9BD7nDlmEf9ZCRzR9lr9odoqEowXlOQH9CKbU9H
         46Sn0Po+NByQS8RJVIwXhcdsn0V2SuyzEUst1gSdn6B3INqvSamDX80pway2C3I6+nMy
         M8l6IUb6z/ChV6qYJuasgBa3UsEFTDNIPX5McxoKDmWDyaN/P1PVYUIvBwiA57jWvFrY
         xVnTJyT5pJLzaDNk+NnuQUKhd0wRlbXbaFMz6a5POTdbGa3bYKura41dLhAzgqCEcnsJ
         Gx64HJbIXRzho2Hzb0yzHhfyhcNlIm5c1wTlT2jYrOerseGTuyzJMW9i4qll7RTJ5qW6
         CngQ==
X-Gm-Message-State: ACrzQf0IyHDHeGKZ/MCha2MbhPYpppjn5sPFN2E+lNuXnS9XFLHJes6r
	hFLKuXvXWVPvexFYyxW3I5r2uw==
X-Google-Smtp-Source: AMsMyM4BamTVwnVRVEzHMxTSWzVqGEy7NnZV4CojHp0kgr4RUINHxdiS3OTFIT2molBMkjMfY86rKg==
X-Received: by 2002:a2e:9545:0:b0:277:8a06:fda2 with SMTP id t5-20020a2e9545000000b002778a06fda2mr5368558ljh.32.1667906007777;
        Tue, 08 Nov 2022 03:13:27 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id p16-20020ac246d0000000b004acd6e441cesm1735642lfo.205.2022.11.08.03.13.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 03:13:27 -0800 (PST)
Message-ID: <f8f83839-2e76-e500-a16e-5fd2985a278d@linaro.org>
Date: Tue, 8 Nov 2022 12:13:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 5/5] arm64: dts: uniphier: Add NX1 SoC and boards
 support
Content-Language: en-US
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Masami Hiramatsu <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221107103410.3443-1-hayashi.kunihiko@socionext.com>
 <20221107103410.3443-6-hayashi.kunihiko@socionext.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107103410.3443-6-hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2022 11:34, Kunihiko Hayashi wrote:
> Initial version of devicetree sources for NX1 SoC and boards.
> 
> NX1 SoC belongs to the UniPhier armv8 architecture platform, and is
> designed for IoT and AI/ML application fields.
> 

> +
> +		soc_glue: syscon@1f800000 {
> +			compatible = "socionext,uniphier-nx1-soc-glue",
> +				     "simple-mfd", "syscon";
> +			reg = <0x1f800000 0x2000>;
> +
> +			pinctrl: pinctrl {
> +				compatible = "socionext,uniphier-nx1-pinctrl";

So instead of documenting the hardware precisily, you have one big bag
for everything under simple-mfd. This is not how the SoC should be
described in DTS.

> +			};
> +		};
> +
> +		soc-glue@1f900000 {
> +			compatible = "simple-mfd";

No, it is not allowed on its own. You need a specific compatible and
bindings describing its children.


Best regards,
Krzysztof

