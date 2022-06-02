Return-Path: <SRS0=14BC=WJ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318DAC43334
	for <soc@archiver.kernel.org>; Thu,  2 Jun 2022 06:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E6586C3411D; Thu,  2 Jun 2022 06:37:47 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 16B4CC385A5
	for <soc@kernel.org>; Thu,  2 Jun 2022 06:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 16B4CC385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id x62so4984811ede.10
        for <soc@kernel.org>; Wed, 01 Jun 2022 23:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=P+SVKsijP6JkUgNOco2XQmqekWV6FYkMFTb8nxQO5ww=;
        b=m8c+W7QgyV419RzrHTmnU1lGVvxFj1lycM/jla3m2HZRFzackfP82Ocf0pcBBhq+nc
         gw9FxoQoK4g83ngSbEQQ2dSjZD9nBv50f3M1Cq2aB5EiTclnSK9QiiggPVOwrOMacXwq
         IfqcWeNqsfL8UZMkux6dbflF9hQSJ4d3TzSOvQuRTH9IELyTcxmUTd6Z8lXcwgQhK9r5
         EAsHXEJSJDgqKmaYa2k6fBEj+8/+d+mEWdo4dtl3c4/4SknIcB5pKxqJ+uUxKty45m7m
         Ujy4U1b/ghF1wXJkHTvanrg/Qqb4BjMJyuRoLR02xnluLPoeToDgj2iOChQ1/XSyusXD
         MBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P+SVKsijP6JkUgNOco2XQmqekWV6FYkMFTb8nxQO5ww=;
        b=yGDEiuEL2N+ScJsUXPouV4ayTvYyjcD2ysJlour6/pUYSVTOZfXLQcaqpsCWF4LY9z
         DHP/CLgRV8EBqeArjKWR+O99F+b6a0KgrVAIjlJi2FBA9ninhWLBD70PFm74+QdzYMG6
         uqUyJyzJ8tV1Rialldu3ohbe2shrNYAAkz1yqUofs4uz6CL6XLE7qOQVS0Ap1V04m0cc
         oJNuPZaXB1dmdHdeHzBQUJil5ju+n8R6xphDJEEvoYN3GufXS+lxmiOGD4hIw9kg6HE6
         X1eZA/BV/lMIto3llfVzC2OYwsoh4RkmLR1NBGvU2RrdxVb7C0+Sa3UVOpzaKR0m5B6t
         zJWQ==
X-Gm-Message-State: AOAM5324FLgDHajFJI5KOO9kCLQ+3/PSxelsnwYcGaK/V2sIlaVnhfXI
	KKdwyf7cdlF/w+Yr5c75YM1UeA==
X-Google-Smtp-Source: ABdhPJzvPQWmTxwqNMXeu7trZCjNJkphaQbsMtBiWxqHxuG0WA17vaqx3Y07SBGsaskn4cdpMdEDKw==
X-Received: by 2002:aa7:cb4a:0:b0:42d:d232:34d7 with SMTP id w10-20020aa7cb4a000000b0042dd23234d7mr3679077edt.201.1654151865385;
        Wed, 01 Jun 2022 23:37:45 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x25-20020a170906b09900b006f52dbc192bsm1432623ejy.37.2022.06.01.23.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 23:37:44 -0700 (PDT)
Message-ID: <b1b87be5-a048-b713-c9f2-84b948aa6718@linaro.org>
Date: Thu, 2 Jun 2022 08:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [RFC v2 1/2] clk: hisilicon: add CRG driver Hi3521a SoC
Content-Language: en-US
To: "Marty E. Plummer" <hanetzer@startmail.com>
List-Id: <soc.lore.kernel.org>
Cc: arnd@arndb.de, cai.huoqing@linux.dev, christian.koenig@amd.com,
 devicetree@vger.kernel.org, gengdongjiu@huawei.com,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux@armlinux.org.uk, michael@walle.cc,
 miquel.raynal@bootlin.com, mturquette@baylibre.com, novikov@ispras.ru,
 olof@lixom.net, p.yadav@ti.com, rdunlap@infradead.org, richard@nod.at,
 robh+dt@kernel.org, sboyd@kernel.org, soc@kernel.org,
 sumit.semwal@linaro.org, tudor.ambarus@microchip.com, vigneshr@ti.com,
 xuwei5@hisilicon.com
References: <20220501054440.2434247-1-hanetzer@startmail.com>
 <20220501173423.2473093-1-hanetzer@startmail.com>
 <20220501173423.2473093-2-hanetzer@startmail.com>
 <f42cb4d0-7133-eea5-b456-b5169bebfad1@linaro.org>
 <20220601105846.7hriawg3stxb657f@proprietary-killer>
 <630b0d13-6778-2508-6a34-9daa0358047d@linaro.org>
 <20220601110616.xmxih663kxgupszv@proprietary-killer>
 <a2a98c6d-2ff7-89f6-0711-c8f8b99e85c2@linaro.org>
 <20220601182418.okoofgannw6vbcxo@proprietary-killer>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601182418.okoofgannw6vbcxo@proprietary-killer>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/06/2022 20:24, Marty E. Plummer wrote:

>>> Either or. Whatever makes the workload easier is what I'm looking for.
>>
>> Sorry, you need to be more specific. Apply is not a job for you, for the
>> patch submitter.
>>
>> Then you miss here important piece - which is the first patch. DTS goes
>> always via separate branch (or even tree) from driver changes. That's
>> why bindings are always separate first patches.
>>
> So, add a 4: arch/arm/boot/dts/soc.dtsi and 5: arch/arm/boot/dts/board.dts
> to the above list, or should those be the same patch as well?

For me does not matter, sub architecture maintainer might have preference.

Best regards,
Krzysztof
