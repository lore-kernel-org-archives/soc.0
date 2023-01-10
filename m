Return-Path: <SRS0=trVk=5H=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C5FC54EBE
	for <soc@archiver.kernel.org>; Tue, 10 Jan 2023 09:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DF030C433F0; Tue, 10 Jan 2023 09:50:22 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 00E7DC433F1
	for <soc@kernel.org>; Tue, 10 Jan 2023 09:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 00E7DC433F1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id ja17so8336386wmb.3
        for <soc@kernel.org>; Tue, 10 Jan 2023 01:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L4yGKxMFUOcNBd6qiW0DqHiMOl0hGvG8vDnOMvgUfjc=;
        b=XW/4ajK6NJZkDCNFanPST16zWwxAlxlk3sYGGl4Gx+g0Q+Fs3MRmm6T9TWN1cAkh6B
         bRgpGd+WD2R8lKNNHJq314pLuMw2cApUSE1nkVQZZ25uyE675d4o62BqilyO1mq/Lct2
         NrsjVafJKm8lb+4YvD1aTH2eDAo+U4mWe9WMJCv9zvWhsjC21g4KUU9rHrNCfHd3oisD
         gT52qgRMVOarywLkM7xqyscWWxx7gNhEhWTOqoaGPAKdJvFIeU+YjH6BjxXOQyLxpwhk
         UXWtwYouw7GigPohSp4fNQ9Kw4YHxUfH5KpAN2IcheCJaLdRAMM6qM/wd6Yy1/dXYvot
         HoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L4yGKxMFUOcNBd6qiW0DqHiMOl0hGvG8vDnOMvgUfjc=;
        b=kU+KaNvnsmcrn1Gc+67CH26Y80JY2f3narvSjh1NA/uJzosI5taMBqWP+XYhZKCW1w
         nBJqmJofV1MiabxCJJ8Xdy7znq2LV7osWzeJRnNPYq5UJ3xBG84btq3OVRn2Wr1eMPFJ
         Wxt/LiLXI/zBqxZfhLow24Q8yH1pLEAqCMBzaMmBV5EPZ2jfMuKK+F4Iq9rMZ0A9wSUr
         UUJ1ilZa0aV/XwQn4999p1swpO+TtA3z+1PUWEaA1s4+rJIab5vNRdSvr6Z9ysMUmRDH
         oML5KPUvE9U8goOVbh0IDyu8LZG8i5YNuEMhUXjfiXPFVxxlBBYrqPbWpCvyNzXrV/Al
         mjPA==
X-Gm-Message-State: AFqh2kr5l6IN7mnE2FJMOdTuPqO2cglRnIlPTRslWqFNQyjSka6JGrSz
	2y8unyU5p8F92q8BVqDVaKRSzw==
X-Google-Smtp-Source: AMrXdXvX+AzEuLqk86WrbSte1x6SF0u8eJ/fFDUKzUQkfQ+FvjE5ciHth+Qsza1APOyMtnmjElzdwg==
X-Received: by 2002:a1c:5442:0:b0:3cf:7385:677f with SMTP id p2-20020a1c5442000000b003cf7385677fmr47412192wmi.35.1673344220288;
        Tue, 10 Jan 2023 01:50:20 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id i6-20020a05600c4b0600b003d9e91cd08dsm9203363wmp.4.2023.01.10.01.50.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jan 2023 01:50:19 -0800 (PST)
Message-ID: <39774fd1-e89a-9c16-7833-80cae36133ca@linaro.org>
Date: Tue, 10 Jan 2023 10:50:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/5] ARM: multi_v7_defconfig: Add GXP SROM Driver
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: clayc@hpe.com, linux-kernel@vger.kernel.org, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 verdun@hpe.com, nick.hawkins@hpe.com, arnd@arndb.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux@armlinux.org.uk, olof@lixom.net
References: <20230110042533.12894-1-clayc@hpe.com>
 <20230110042533.12894-5-clayc@hpe.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230110042533.12894-5-clayc@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/01/2023 05:25, clayc@hpe.com wrote:
> From: Clay Chang <clayc@hpe.com>
> 
> Add the CONFIG_HPE_GXP_SROM and CONFIG_HPE_GXP_SOCLIB.
> 
> Signed-off-by: Clay Chang <clayc@hpe.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index ee184eb37adc..f50a3731b84c 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -1254,3 +1254,5 @@ CONFIG_CMA_SIZE_MBYTES=64
>  CONFIG_PRINTK_TIME=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
> +CONFIG_HPE_GXP_SOCLIB=m
> +CONFIG_HPE_GXP_SROM=m

Don't add stuff at random places or at the end. Add in proper place,
defined by savedefconfig.

Best regards,
Krzysztof

