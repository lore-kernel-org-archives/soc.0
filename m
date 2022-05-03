Return-Path: <SRS0=Fita=VL=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BECC433EF
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 11:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6EB0EC385B2; Tue,  3 May 2022 11:37:48 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 250A4C385AE
	for <soc@kernel.org>; Tue,  3 May 2022 11:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 250A4C385AE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id n10so15459338ejk.5
        for <soc@kernel.org>; Tue, 03 May 2022 04:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=QVp3RkrsZjknN37lAxJZhaR2zOHWGKJGvjIrozmrcSE=;
        b=tLQIXAep+KkODb2kR+H3gzQ6jOvCX3R6P+mOUJCrE1CJ6CpXrCtUbTQ0KpW4ygvB20
         W9go6Cj1n8KEishC2RUv6sjlqCg6Orly2xx3FECOPACCBFqVdsNaud4d71tdKyw7J9B+
         EAa79rJ4Sntra6vgOkRMew7unZedgmc3lm18k871vDFf8Pl5T4pRmCwTfj/DuRBtPa5f
         AP9l4RG7FcTQ29MDY0mMFQlzlkCIOt3XG2avd10re0f5jn+jY0aDETvIM6hdYZhW9bUy
         iHg4ZntHsvderHpMV5R97DTwIj6wIVWwZd6vgelRAFH27QW+GW0pqgmdV036LoBDvA0r
         SYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QVp3RkrsZjknN37lAxJZhaR2zOHWGKJGvjIrozmrcSE=;
        b=bdzoMCMJA9ZJcZoMekL9ErBuS9mS3yrA0sf5hv6ElVv9vQbynh6q0QeRdxlI/mraBi
         4Vsf7SMogRnl88wfLxjUFnhXqnQ0icDS8GanV43A7znTKVgYk/XGzQ7LPUFLeUVh75Gu
         QHkSWyfQsSPWIlpsNxSqRc6y1F4atGuWyBjIwd4Wv+ViDCFUNq7CpYdEI0cBTTJEU7Cz
         Ml1Dsxrz4Sq8haHjExl38AmHO4+ncjXY5Al7UeA/v1FDs0IR3kASuW9Cg7mY3arVZhey
         EaQrtYwF7w/J6RfHpAMyZvWo08Yy9CYc+8wcLGgg8g97GkXE70dbJb1sf9HFHuOuLde7
         CEzg==
X-Gm-Message-State: AOAM533/hncUz2cJfMeCma9wo8VpJdJJ9iu+Obxck9pGXdujMT1eL1Rp
	OIpdIFePGu3DdLX6IdWFswA+lw==
X-Google-Smtp-Source: ABdhPJzxvzxgUY0kSWz6s201m+ymj+wkPW3O8HI9frx8YpxBCkivKl1bsuIkyh+cfHW9VMvSQH2zmw==
X-Received: by 2002:a17:906:c1d6:b0:6d6:e0a3:bbc7 with SMTP id bw22-20020a170906c1d600b006d6e0a3bbc7mr15490136ejb.484.1651577864342;
        Tue, 03 May 2022 04:37:44 -0700 (PDT)
Received: from [192.168.0.202] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id zd7-20020a17090698c700b006f3ef214dfesm4569152ejb.100.2022.05.03.04.37.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 May 2022 04:37:43 -0700 (PDT)
Message-ID: <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>
Date: Tue, 3 May 2022 13:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v2 1/2] clk: hisilicon: add CRG driver Hi3521a SoC
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: "Marty E. Plummer" <hanetzer@startmail.com>, arnd@arndb.de,
 cai.huoqing@linux.dev, christian.koenig@amd.com, devicetree@vger.kernel.org,
 gengdongjiu@huawei.com, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux@armlinux.org.uk, michael@walle.cc, miquel.raynal@bootlin.com,
 mturquette@baylibre.com, novikov@ispras.ru, olof@lixom.net, p.yadav@ti.com,
 rdunlap@infradead.org, richard@nod.at, robh+dt@kernel.org, sboyd@kernel.org,
 soc@kernel.org, sumit.semwal@linaro.org, tudor.ambarus@microchip.com,
 vigneshr@ti.com, xuwei5@hisilicon.com
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-2-hanetzer@startmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220501173423.2473093-2-hanetzer@startmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/05/2022 19:34, Marty E. Plummer wrote:
> Add CRG driver for Hi3521A SoC. CRG (Clock and Reset Generator) module
> generates clock and reset signals used by other module blocks on SoC.
> 
> Signed-off-by: Marty E. Plummer <hanetzer@startmail.com>
> ---
>  drivers/clk/hisilicon/Kconfig             |   8 ++
>  drivers/clk/hisilicon/Makefile            |   1 +
>  drivers/clk/hisilicon/crg-hi3521a.c       | 141 ++++++++++++++++++++++
>  include/dt-bindings/clock/hi3521a-clock.h |  34 ++++++

Bindings go to separate patch. Your patchset is unmerge'able.

Best regards,
Krzysztof
