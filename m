Return-Path: <SRS0=3KZd=R6=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1283C433EF
	for <soc@archiver.kernel.org>; Fri, 14 Jan 2022 07:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 747F0C36AEC; Fri, 14 Jan 2022 07:34:31 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 62781C36AEA
	for <soc@kernel.org>; Fri, 14 Jan 2022 07:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 62781C36AEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8C1913F1F2
	for <soc@kernel.org>; Fri, 14 Jan 2022 07:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642145668;
	bh=mteS+HvR1DGukuOVJN2MZ0A5d8t+icrvQbG1zYE72KQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=oz6eBCjvr5ww5Xw1pDNqvmlJ3QL28cjDpVXQFpufjfjxcr6HuLdG3YSlUglofWb88
	 VDsRDkVick6kk9axvEcifYrBmLF0ZtkBtNDXJix4adyEItVWEI0w18t5yfGXVHGyd3
	 E2uqnk9RMtKGBSTECCcojeQH0R7s9A+HPwWkXQaJR90gyKx+DoxrvANr1vMVY5dFtt
	 W5C+ShAy7CWO+15h5iCvPvzxDets3Pk9bJ6Efi3862jeyvE1iiEiwlGAVcGom8ODcL
	 dnzNqLtXI7qTwcH7oAwXLqsMkmpOe72zzmcHJs1mkwAR3oOejsNwLJFS2kO6jt0Ysg
	 UF/BLIiwwOUNw==
Received: by mail-ed1-f70.google.com with SMTP id i9-20020a05640242c900b003fe97faab62so7560724edc.9
        for <soc@kernel.org>; Thu, 13 Jan 2022 23:34:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mteS+HvR1DGukuOVJN2MZ0A5d8t+icrvQbG1zYE72KQ=;
        b=8Q0sGcBnAWcUkMZ4+mRhWA/Kv96BvI4ehXokEbBB0aGrbYxPUnA1IO2RCkPlTkIbR4
         0MRqkfPtiJ6Zp315yCqGsFMDRJmev4bKUVtlAfJRUxOSaAW+nGy92rqpMSYv/8LNV6CU
         Oj9Xi/Is33HG61y0/JwIb/HTKuliNx+TSgoQLnZhmCkyUjWWhzSj3tDjZWQkLRa3F5k2
         6i5TRGy69eC1ftAGzVP28oVXqbeId007vJYabeW1s3Shn0uYu4ZuPzjMeteQFBKKT/aB
         /8zxf0AGiggfePgPsxG0c0foaczTA44ECCGqEkjg4PkSza+ZvBdSeUx/cS4zaQofwSef
         BAMQ==
X-Gm-Message-State: AOAM5329uXIi8uMdVlw4wu/fQllR+Hlh83jYl17gYhdLAFcwhvz7RpXP
	WPxTxyOpjC6/W3O0gNrH9K7l3unar8uVbopbHMKiDmP8Dij2iA6hDIQUIuRkk79zt1z4cnojRHS
	7SFQBv6h19VHu6p+Ed6NPKfA=
X-Received: by 2002:a17:907:6e02:: with SMTP id sd2mr6286814ejc.276.1642145668309;
        Thu, 13 Jan 2022 23:34:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzPYpFBXNfBuxsoAXAMpsTbqNgiDwQGWbcN8/zT8+trFSXbW3w4GwrSWxUCYjfS0jRzR3y3XA==
X-Received: by 2002:a17:907:6e02:: with SMTP id sd2mr6286798ejc.276.1642145668097;
        Thu, 13 Jan 2022 23:34:28 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id ky10sm1567611ejc.151.2022.01.13.23.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 23:34:27 -0800 (PST)
Message-ID: <5e3f84e0-7b91-8eac-1643-d44f61a47620@canonical.com>
Date: Fri, 14 Jan 2022 08:34:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 00/23] Add support for Tesla Full Self-Driving (FSD) SoC
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 olof@lixom.net
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linus.walleij@linaro.org, catalin.marinas@arm.com, robh+dt@kernel.org,
 s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org,
 pankaj.dubey@samsung.com, arnd@arndb.de, Arnd Bergmann <arnd@arndb.de>
References: <CGME20220113122302epcas5p1d45c0714fe286f8f91d0f28c3fad86e4@epcas5p1.samsung.com>
 <20220113121143.22280-1-alim.akhtar@samsung.com>
 <d1a852e1-c4c2-b7c4-ddeb-7fbcfd9b4e58@canonical.com>
 <076001d80909$52d201c0$f8760540$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <076001d80909$52d201c0$f8760540$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/01/2022 06:41, Alim Akhtar wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@canonical.com]
>> Sent: Thursday, January 13, 2022 6:02 PM
>> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-arm-
>> kernel@lists.infradead.org; linux-kernel@vger.kernel.org
>> Cc: soc@kernel.org; linux-clk@vger.kernel.org; devicetree@vger.kernel.org;
>> olof@lixom.net; linus.walleij@linaro.org; catalin.marinas@arm.com;
>> robh+dt@kernel.org; s.nawrocki@samsung.com; linux-samsung-
>> soc@vger.kernel.org; pankaj.dubey@samsung.com
>> Subject: Re: [PATCH 00/23] Add support for Tesla Full Self-Driving (FSD) SoC
>>
>> On 13/01/2022 13:11, Alim Akhtar wrote:
>>> This patch set adds basic support for the Tesla Full Self-Driving
>>> (FSD) SoC. This SoC contains three clusters of four Cortex-A72 CPUs,
>>> as well as several IPs.
>>>
>>> Patches 1 to 8 provide support for the clock controller (which is
>>> designed similarly to Exynos SoCs).
>>>
>>> The remaining changes provide pinmux support, initial device tree
>>> support, and SPI, ADC, and MCT IP functionality.
>>
>> Does FSD have some version number? The FDS, especially in compatibles,
>> looks quite generic, so what will happen if a newer SoC comes later? You
>> would have:
>> - tesla,fsd-pinctrl
>> - tesla,fsd-xxxx-pinctrl (where xxxx could be some new version)
>>
>> This will be extra confusing, because fsd-pinctrl looks like the generic one,
>> while it is specific...
>>
> AFAIK, there is no version for FSD SoC (like we see on Exynos or any other SoC)
> In case something comes in future, may be just adopt as Olof suggested in the other thread like fsd2 etc..
>> Best regards,
>> Krzysztof

The naming is still confusing. The SoC is FSD, compatible is "fsd" but
entire sub-architecture is also FSD called. Therefore it looks like
creating entire sub-architecture for only one SoC, which actually in
multiple pieces is or looks like Samsung Exynos (designed by Samsung,
using several blocks from Exynos SoC).

Best regards,
Krzysztof
