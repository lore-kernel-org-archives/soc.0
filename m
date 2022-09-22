Return-Path: <SRS0=uPeQ=ZZ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA31CC6FA82
	for <soc@archiver.kernel.org>; Thu, 22 Sep 2022 06:52:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9BEC8C433D6; Thu, 22 Sep 2022 06:52:37 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 98B1EC433C1
	for <soc@kernel.org>; Thu, 22 Sep 2022 06:52:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 98B1EC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id q17so9777072lji.11
        for <soc@kernel.org>; Wed, 21 Sep 2022 23:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=HpPp0BHUrPNweVTZtr7NErbLRKsWdneVoqjGlBiJPh8=;
        b=NKMnWZgS5BSvCK945ZAajPqZeW1VEAPF/K92kxSO4ojFqEyhY8uY9CH+GHuAXdXtOd
         SfSN5wRHjrXBzsEv2ctbxRIk+0qiV8ELcEryUMxTeLdWAxOYJhtm4pVh4nX611N262zw
         btTtSVEQlc5bzd8yrbHKYbpE+5XChRGCVaGtbwozWlmXAF70qot5gRQS8AhJ+KwdGUtV
         BAv7WxehOAK1Go0BWI1ZwmbfAD66AxqIxc5g/1txVRCAqFK/Ar1RKkdYZig5/oV8jbjz
         S0NAZ5x8Uk5mvit51bkHuua9/6uHPIy150GK6No/16fjALgvzhVK1961Gf4rf4YawyYC
         SiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=HpPp0BHUrPNweVTZtr7NErbLRKsWdneVoqjGlBiJPh8=;
        b=HA9cu6km095dimeaBQWqjY9AweUuKndWrt6D/Nov4gz3LgXQ3eDlq7ZjI1Mhgd8r5W
         pPqrliXVkuyFnB2kLt0KTYPC3qCKVnnrk2FSgyNY2QROCTMmFYbjitS1gCYwYJp9V9wG
         oOApO360PSmHXxhZeMNB7cN+icyWVj+8DGMpDYj85FidU/egASDJ75li/4kB+iuv/q5o
         9nTxR0v/U3vZ9Wd0vLlgmXKkw55loEopuYWbqKBvbbccoOw3PbAeMr6WwPIwTMeg3Oxl
         5ombAGEY/bwUfa3yHucCFsgiQJ4uFJyKDnqzUF8BPKhf1ekpOhDEHKJSVrinP3WvH/cY
         Z5Pw==
X-Gm-Message-State: ACrzQf2kjfPvJcylvojm6CjD69W9wgnQn4H9W0IcZ5MOQ9vUR4NKqaXr
	zZB9xHMB/kZx9Dmi4x5KTHBA1g==
X-Google-Smtp-Source: AMsMyM78If/cBNQ1SnC+v6xychOd6uY7sVFoQMHHASjrPCwbCyMRcKsSoHMRnkbuxCvoylYmkrHGyw==
X-Received: by 2002:a2e:7309:0:b0:26c:3db7:8fe2 with SMTP id o9-20020a2e7309000000b0026c3db78fe2mr525386ljc.387.1663829554770;
        Wed, 21 Sep 2022 23:52:34 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a7-20020ac25e67000000b00499b57032c1sm784269lfr.144.2022.09.21.23.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 23:52:34 -0700 (PDT)
Message-ID: <f84250e7-39fe-80d9-9e50-700f9752367a@linaro.org>
Date: Thu, 22 Sep 2022 08:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add AMD DaytonaX BMC
Content-Language: en-US
To: Konstantin Aladyshev <aladyshev22@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org
References: <20220920165404.14099-1-aladyshev22@gmail.com>
 <20220921210950.10568-1-aladyshev22@gmail.com>
 <20220921210950.10568-3-aladyshev22@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921210950.10568-3-aladyshev22@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/09/2022 23:09, Konstantin Aladyshev wrote:
> Add initial version of device tree for the BMC in the AMD DaytonaX
> platform.
> 
> AMD DaytonaX platform is a customer reference board (CRB) with an
> Aspeed ast2500 BMC manufactured by AMD.
> 
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  arch/arm/boot/dts/aspeed-bmc-amd-daytonax.dts | 319 ++++++++++++++++++
>  2 files changed, 320 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

