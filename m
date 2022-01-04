Return-Path: <SRS0=72Bi=RU=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DD37C433F5
	for <soc@archiver.kernel.org>; Tue,  4 Jan 2022 21:57:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6D9A4C36AEB; Tue,  4 Jan 2022 21:57:33 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94B13C36AE0;
	Tue,  4 Jan 2022 21:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 94B13C36AE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id c9-20020a17090a1d0900b001b2b54bd6c5so1115290pjd.1;
        Tue, 04 Jan 2022 13:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+m8XHy9GLWxGLvp8PnRUnsnL00CiCJ1paOrfejaQ6Wk=;
        b=UsFyD6JzmErDVpwH2jhEW0jKQYnviPyZj2wtM0Zy1ryUv3BKM+jt8ln1uTqxy17s+2
         j8jWYY/Snq94uexghYoUA82QE4cHCfjTsLjNikT/tj39SG1pkz3WGS9Ya/6GZEdp0/OS
         E0sWzSrJcw1+btjvTYHfetZf/PWuUysgj1h3HjcaLmAFsy613HF86ByhUOeJZ7yiVTC9
         HbY0VR3KiKCR4S0P4NpDEM0Gw1vPu5cUzo2DFssXIrUBnAQurUufYnZ/hiXEl3IraOjz
         82Fq7SKjT82eQhYUBCMAs2gAR8lHukJgKBbv5tCqPWD9dK8rnedWLlBQGo9M03d8DVJR
         c4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+m8XHy9GLWxGLvp8PnRUnsnL00CiCJ1paOrfejaQ6Wk=;
        b=WLa4ArXbdtnP71SPfhq5WtCM14UwPE3JBMGn7aLwTZ+FHUHVSeT1K+Pr9EcRPNRTmX
         wnopj3QOv7W1M4sRc6+ECl57sV+6oO9XnmM2pjwsNCYG5r0fVAli+RZma9zt4LfYP/7P
         weRqvWj/dzH5Ruw4ukBRtRecIwcBXuP5j9BkiJ26Ecbw/xqiIkCypLTw9QdZGCdtiJPe
         My8JHzSi8saSH9LI1AKbDk5NfsyD3/pcWIvObutJDSjfh+2HduckUkOThpeLasnUCxDZ
         TZTenUpMR7/krQvMRbb2KliRaYHLIORmixrFSfTpg8lWYo6v2d+lv8PsHyJ6aO6wgshP
         dQPA==
X-Gm-Message-State: AOAM531hnJrlBJQXzLVRVUWRNcqshn+o/bqJ7CEI2pA/9I6bT8vBi55n
	FDLwkuxNZSPS3THmv7UtUjU=
X-Google-Smtp-Source: ABdhPJzIt3U1Vxn8LL43nXl0QNivPazdOuBn/xIPyLgpgotXxF5e90iXQu74s9mqVKf4eszMoRmjcw==
X-Received: by 2002:a17:902:c745:b0:143:d220:9196 with SMTP id q5-20020a170902c74500b00143d2209196mr50344497plq.74.1641333452051;
        Tue, 04 Jan 2022 13:57:32 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id k2sm44953696pfc.53.2022.01.04.13.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 13:57:31 -0800 (PST)
Subject: Re: [PATCH] ARM: dts: gpio-ranges property is now required
List-Id: <soc.lore.kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>, arm@kernel.org, soc@kernel.org,
 Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 Stefan Wahren <stefan.wahren@i2se.com>, Jan Kiszka <jan.kiszka@web.de>
References: <20220104170247.956760-1-linus.walleij@linaro.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <6f42ceda-c000-7506-65ec-53534b5aef7d@gmail.com>
Date: Tue, 4 Jan 2022 13:57:30 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220104170247.956760-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/4/22 9:02 AM, Linus Walleij wrote:
> From: Phil Elwell <phil@raspberrypi.com>
> 
> Since [1], added in 5.7, the absence of a gpio-ranges property has
> prevented GPIOs from being restored to inputs when released.
> Add those properties for BCM283x and BCM2711 devices.
> 
> [1] commit 2ab73c6d8323 ("gpio: Support GPIO controllers without
>     pin-ranges")
> 
> Fixes: 2ab73c6d8323 ("gpio: Support GPIO controllers without pin-ranges")
> Fixes: 266423e60ea1 ("pinctrl: bcm2835: Change init order for gpio hogs")
> Reported-by: Stefan Wahren <stefan.wahren@i2se.com>
> Reported-by: Florian Fainelli <f.fainelli@gmail.com>
> Reported-by: Jan Kiszka <jan.kiszka@web.de>
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/r/20211206092237.4105895-3-phil@raspberrypi.com
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Hi SoC maintainers, please apply this directly for fixes, the
> missing patch is wreacking havoc in the RPi world.

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Now that "pinctrl: bcm2835: Change init order for gpio hogs" is in
Linus' master this patch can go in... what a mess, let's not do this again.
-- 
Florian
