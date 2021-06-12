Return-Path: <SRS0=4GED=LG=gmail.com=mnhagan88@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13471C48BE5
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 09:23:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DCBF1611CC; Sat, 12 Jun 2021 09:23:09 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFAFA6108E;
	Sat, 12 Jun 2021 09:23:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFAFA6108E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=mnhagan88@gmail.com
Received: by mail-wm1-f48.google.com with SMTP id h22-20020a05600c3516b02901a826f84095so9941562wmq.5;
        Sat, 12 Jun 2021 02:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=SLFVhursGu66Uj/3K3eYasv4quV8R1dSmz2H6vx5rpU=;
        b=WK28YEY+mxu0dajuAkqICfBIey1HTQatNZpyxGFo9qbiP9NBSr6fYEGQvGgZht6PvO
         zgZ3hO18JVXKaAmM5D+5Inm/QkSMB7qXQbOQMcjwXtI7AAGd9Ds6z+FYgTdRksPvHV9K
         NRddoj35bs0eD2qSjrmIN2XTtz9Sj39v/8mp/NQ0Hiizde9SEIpqONigfIa8lP7VWcFS
         +/oUqFA8gS2wSPDguVPykI/8tTIbcYVfG8Q7ozpdmng2VRC6U5s/yctnI7Y+29vn4FV5
         ajmyKmYRbD4drWDkWw9aUhJJtnFT2ke+bxA1q0v9yiwYG/hvWurJMQqq5/CXSvr/AVqv
         ohFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=SLFVhursGu66Uj/3K3eYasv4quV8R1dSmz2H6vx5rpU=;
        b=E6Ube3Cl23UuKWfxTrJgsjRhiHp2/C9FYtz3HvrjMpRCoNHVPrsU3kk8SssfBD/A+w
         u/bLnF6Yuj5iB7uFuFhkm6jyB1tzSWYohLCX3FzrK1i2CY9e/mNt0rmMAeOtC1uwtajn
         aTpjlzdvFxPH/vgNTNJq6YZv7RZ+2DchPrefhl9Grb5vrlST3VeZc41mXX3OacDW6FPW
         3FEsLWIftsKv/27vphSw9KjBiM/bciZj/e+4FwRIhIJD7wFNyKUbFwwCb8CZ0zhF9+Xg
         j0FO2BreNKDBAqoi6AN3hHnp2aZyzQQ0e/cijnCXVdVpzG0gkeRDQb6XRhYsX0hJ9v7K
         fjsQ==
X-Gm-Message-State: AOAM532e7yYD0HTYvazzKcFvki7wqyw4mHrITKhJx+5aM3CXZWj83Sjl
	PatkzwPocC3MJTg2oj0LrC4=
X-Google-Smtp-Source: ABdhPJzgicMpzLh5bZMPsx62eBNKrcy04WIKYCttKwTTO0YhKS4Ms+svmfp8nsdqmDgGKwUZ4BIHQw==
X-Received: by 2002:a7b:c1ce:: with SMTP id a14mr24077747wmj.180.1623489788393;
        Sat, 12 Jun 2021 02:23:08 -0700 (PDT)
Received: from localhost.localdomain (haganm.plus.com. [212.159.108.31])
        by smtp.gmail.com with ESMTPSA id a3sm10262253wra.4.2021.06.12.02.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Jun 2021 02:23:08 -0700 (PDT)
Subject: Re: [PATCH v2 2/5] ARM: dts: NSP: Add Meraki MX64/MX65 to Makefile
To: Vladimir Oltean <olteanv@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Krzysztof Kozlowski
 <krzk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210610232727.1383117-1-mnhagan88@gmail.com>
 <20210610232727.1383117-3-mnhagan88@gmail.com>
 <20210611202434.flnqrzbbxicw5c3t@skbuf>
From: Matthew Hagan <mnhagan88@gmail.com>
Message-ID: <e9d5fffd-4483-8342-c97e-a115894ca93b@gmail.com>
Date: Sat, 12 Jun 2021 10:23:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210611202434.flnqrzbbxicw5c3t@skbuf>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 11/06/2021 21:24, Vladimir Oltean wrote:
> On Fri, Jun 11, 2021 at 12:27:14AM +0100, Matthew Hagan wrote:
>> Add Makefile entries for the Meraki MX64/MX65 series devices.
>>
>> Signed-off-by: Matthew Hagan <mnhagan88@gmail.com>
>> ---
>>  arch/arm/boot/dts/Makefile | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index f8f09c5066e7..033d9604db60 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -154,6 +154,12 @@ dtb-$(CONFIG_ARCH_BCM_NSP) += \
>>  	bcm958525xmc.dtb \
>>  	bcm958622hr.dtb \
>>  	bcm958623hr.dtb \
>> +	bcm958625-meraki-mx64.dtb \
>> +	bcm958625-meraki-mx64-a0.dtb \
>> +	bcm958625-meraki-mx64w.dtb \
>> +	bcm958625-meraki-mx64w-a0.dtb \
>> +	bcm958625-meraki-mx65.dtb \
>> +	bcm958625-meraki-mx65w.dtb \
>>  	bcm958625hr.dtb \
>>  	bcm988312hr.dtb \
>>  	bcm958625k.dtb
>> -- 
>> 2.26.3
>>
> It is odd to add the device trees to the Makefile in a separate patch
> compared to their actual introduction. Does the tree even compile at
> this stage?

Will rectify this. Thanks!

