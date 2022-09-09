Return-Path: <SRS0=6vKs=ZM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76EE5ECAAD5
	for <soc@archiver.kernel.org>; Fri,  9 Sep 2022 07:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47399C433D7; Fri,  9 Sep 2022 07:38:28 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AEDA8C43141
	for <soc@kernel.org>; Fri,  9 Sep 2022 07:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AEDA8C43141
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id y29so823185ljq.7
        for <soc@kernel.org>; Fri, 09 Sep 2022 00:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=8ULEp+WlIDxfwyX+Ul0SmLJhz/rCCVaMvM2NKyHPCaA=;
        b=xQosMpjd9c9zqbElRArG5e9KduNYicN539Yiia5j3ijpQA6MpKKuYsDFBZO86ZOXL6
         BT15l0f7PpQ4yx5Ucu/o3KmX6LW94lKG6xgv2HlPHt0n9ll7boTxASwDLuR3MrQr1NvJ
         oKpgFGd3Cts6mxaSBhcqy7bhokjpNaI9UC9mdHqHtKWVweVkl8t1IOg/s174XmIoMgq0
         7K5QMLYf6I8ksCffTDNgjdRd4dK+emppAsDYk1cd/fKPPQfxBW0dPGUV5URJYIelwJFX
         upSP1g3l7Soo3oGqqc9+RrkJstXvQSHhndKxCfcMHBNR+kXNtjVBg6xXcjGcyubkOD0P
         w7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=8ULEp+WlIDxfwyX+Ul0SmLJhz/rCCVaMvM2NKyHPCaA=;
        b=At/b8PpL8phbW+Rbz/8ki3gcVJK3IIPvo9iC90ZhQE+TlkX6Q7NTl1DROYiDYozRkj
         WYbpduWXe0PhbM/XwCfOLkjieJgxvhJiP/nTVXl8FVeGQgdC/9DAZwXVCMuaOJSyJFU4
         Xt0hIcNyZF6dWGMY3uqdHbm2eHRJEbJeM71WK7aPSsTC9hC9IwmGhKe/w8o+ohX6Q/qx
         6mfahGFFrsBO4Wd9BRn++48YtzfaKLHLbFHdnh99IwkaulfO5SLGLN/1QhS6K+q7U5HJ
         7SSg0BSuNGDYCvZTibY7PCtTrSznBpYwiWFrvQ0I0U6APDMr/2mlPPfBrBVeVAebNLpS
         SbJQ==
X-Gm-Message-State: ACgBeo0+/n49lieu9L1zL9j2tPE/MENyQYpzRJw5KWIejI2oyoWenFDY
	viyF6u8cTuZbhMMFF4YG/soapg==
X-Google-Smtp-Source: AA6agR7WASyX4osBLqnsk44pTtLygmK2pLxbitoinO6kMsAT4OgHsDFi3epynUoAOWfqktnju1rc1Q==
X-Received: by 2002:a2e:a9a9:0:b0:261:bf5a:8ff3 with SMTP id x41-20020a2ea9a9000000b00261bf5a8ff3mr3557630ljq.252.1662709104708;
        Fri, 09 Sep 2022 00:38:24 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id w17-20020a197b11000000b004947f8b6266sm159979lfc.203.2022.09.09.00.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 00:38:23 -0700 (PDT)
Message-ID: <51e6ea21-8af4-775d-1561-6671cfc50ecf@linaro.org>
Date: Fri, 9 Sep 2022 09:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH] arm64: defconfig: enable ARCH_BCM
Content-Language: en-US
To: Naresh Kamboju <naresh.kamboju@linaro.org>, f.fainelli@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: andersson@kernel.org, arnd@arndb.de, biju.das.jz@bp.renesas.com,
 catalin.marinas@arm.com, dmitry.baryshkov@linaro.org,
 geert+renesas@glider.be, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, marcel.ziswiler@toradex.com, michael@walle.cc,
 shawnguo@kernel.org, soc@kernel.org, vkoul@kernel.org, will@kernel.org,
 lkft-triage@lists.linaro.org,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20220906033957.4377-1-f.fainelli@gmail.com>
 <20220909073509.301363-1-naresh.kamboju@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909073509.301363-1-naresh.kamboju@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/09/2022 09:35, Naresh Kamboju wrote:
> From: Naresh kamboju <naresh.kamboju@linaro.org>
> 
> 
> On 2022-09-05 20:39, Florian Fainelli wrote:
>> Commit 96796c914b84 ("arm64: Kconfig.platforms: Re-organized Broadcom
>> menu") introduced a new symbol ARCH_BCM and made all of the Broadcom
>> SoCs Kconfig depend on it, but did not enable it in the defconfig.
>> Thus, now the defconfig doesn't include support for any Broadcom
>> architectures anymore. Fix it.
>>
>> Fixes: 96796c914b84 ("arm64: Kconfig.platforms: Re-organized Broadcom menu")
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

The patch was sent on 6th of September. Your report on 8th of September...

Best regards,
Krzysztof
