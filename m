Return-Path: <SRS0=Ae6K=6X=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C84B5C7EE23
	for <soc@archiver.kernel.org>; Mon, 27 Feb 2023 14:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 832FEC433A1; Mon, 27 Feb 2023 14:46:55 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 66C7FC433EF
	for <soc@kernel.org>; Mon, 27 Feb 2023 14:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 66C7FC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id l1so3447154wry.12
        for <soc@kernel.org>; Mon, 27 Feb 2023 06:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p5uPmXHKG/K2eyX0uTKfopGR5q6ewnoODzWdHrgpksY=;
        b=xsDmR4Do5X7GXRqXrx1sWPPfkkQPSeeWpP2+i4dOxIWxcR7fP6Movgw/jx9+PTcgt7
         hZJVmOvfvsqEjjlzatHhw1inycwyCGnF5AWqhfEdY8DqC4BB+6YJ8HfIKyumuaLjA4+6
         8DWMB+gPmdduGXGL0H74VPktXjL82h5h0pmTvXBxiNrZiftH4CdztJlVo01814iYUGpJ
         ZLIXJh4m2TyOrtln5FH1941ZRWVUy077IrohbwK1dJZBaR5k9BFLu0Y4QYZXkQZm0Bh0
         XeG4HbNyRQ4pE6zIAYWUiZUqw0AU4Cm5MppLmtKFbDPVVXqXg5hGfBkZrOCekLklyq8S
         0OFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p5uPmXHKG/K2eyX0uTKfopGR5q6ewnoODzWdHrgpksY=;
        b=DWuSyAIdz1R/CvJZ/IqMEc6Mc0gnl4zoo6ZHM93OnMyZGQ1J2x6jfSqKXNG7r5pRBW
         Hfu9TcX1QR9f0MuyGPiC55jbQEjEAmgqlnzPyRrGeYDOHHEO2X0AACfGbipdwnybYzrH
         7zIUWAzBqeliE1ZOBEz/YS4dNBFafuUjJ0hjLvop44ByaKGr0fvYZRwXw0/FRll3Le5x
         MBT69oSyxBvjvO1rTz++1AiCj2XAefT83L5bxlUKbqLnq7lagCP2/uwvb2DrZCMIyqeI
         Nb9V3sStf+/bhh2Ni2j4oI0l+IG5jmR9/qYNkz1wZ3hCn63U2nAucIuVMGk/VxHhZ5mA
         vthw==
X-Gm-Message-State: AO0yUKX7dxvCAU/6Pi+eDoinmVb8ENbmEBr1sjT3JxXd+ylaT1nOcmYU
	rjkeYhk1AvR/vrpudPfUiv7WAQ==
X-Google-Smtp-Source: AK7set+8chJEYzHKg+uduZ4y4OCNK6TUtWWaAIZZOVMlrI6GcnZITmCye0/0qIuUiQY19BZvAuI4wg==
X-Received: by 2002:a5d:6187:0:b0:2c8:b9cb:885e with SMTP id j7-20020a5d6187000000b002c8b9cb885emr7599221wru.24.1677509212571;
        Mon, 27 Feb 2023 06:46:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:94c3:7db:6fa6:5605? ([2a01:e0a:982:cbb0:94c3:7db:6fa6:5605])
        by smtp.gmail.com with ESMTPSA id n4-20020a7bcbc4000000b003dc3f3d77e3sm8873890wmi.7.2023.02.27.06.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 06:46:52 -0800 (PST)
Message-ID: <13cf3223-d3fb-1a3e-f13a-77db3b6d144c@linaro.org>
Date: Mon, 27 Feb 2023 15:46:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
List-Id: <soc.lore.kernel.org>
To: Dmitry Rokosov <ddrokosov@sberdevices.ru>, arm@kernel.org, soc@kernel.org
Cc: Alexey Romanov <avromanov@sberdevices.ru>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linus.walleij@linaro.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@sberdevices.ru
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
 <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/02/2023 15:28, Dmitry Rokosov wrote:
> Hello Neil!
> 
> On Mon, Feb 27, 2023 at 09:15:04AM +0100, neil.armstrong@linaro.org wrote:
> 
> [...]
> 
>> I'm aware Amlogic also runs their kernel as 32bit to gain a few kbytes
>> of memory, but those processors are ARMv8 and the arm64 arch code
>> has been designed for those CPUs.
>>
>> So far I didn't find a single good reason to add 32bit support for
>> ARMv8 Amlogic based SoCs, if you have a solid reason please share.
> 
> I totally agree with you, but I suppose it's fully related to 'big'
> Amlogic SoC like S905_ or A311_ series. A113L (aka 'a1') is
> a cost-efficient dual-core SoC which is used for small, cheap solutions
> with cheap components. Every cent is important during BoM development.
> That's why usually ODMs install small ROM and RAM capacity, and each
> megabyte is important for RAM/ROM kernel and rootfs footprints.

Do you have figures ? is 32bit ARM kernel really lighter when ARM64 one is correctly configured ?

> Why am I talking about rootfs? For such small projects a good
> choice is buildroot rootfs assembling framework. Unfortunatelly,
> buildroot doesn't support 'compat' mode when kernel and userspace have
> a different bitness. 

well this is a buildroot problem... the kernel itself is perfectly capable
of running an AArch32 userspace.

> In the internal project, we save several
> percents of ROM/RAM free space using 32-bit configuration (mostly rootfs
> ROM space, to be honest). Therefore, for such 'little' cost-efficient
> SoCs we can make an exception and support 32-bit configuration, from my
> point of view.

32bit ARM is now "legacy", I would need to have an advice from the ARM SoC
maintainers, but AFAIK new ARMv8 SoCs should stay in arm64 arch.

Arnd ? Olof ? do you have an opinion on this ?

> 
> What do you think about that?

>>
>> And as Krzysztof stated, the support is incomplete and cannot work
>> without a dts file.
> 
> Agreed, we shouldn't merge dead code. But there are several question to
> discuss there. Please check my reply to Krzysztof message.
> 
> [...]
> 

