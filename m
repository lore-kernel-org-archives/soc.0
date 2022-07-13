Return-Path: <SRS0=TPwh=XS=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22393C433EF
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 08:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DE429C341C0; Wed, 13 Jul 2022 08:40:12 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 839C5C341C6
	for <soc@kernel.org>; Wed, 13 Jul 2022 08:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 839C5C341C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id bn33so12649568ljb.13
        for <soc@kernel.org>; Wed, 13 Jul 2022 01:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=rFBl54go6bbp895f6CpJo/cJgp+SQIq2apGuPfKEw8I=;
        b=HJy70qwl9lN8HnV2r/htxl8ByNBeHMo2DaIIq8mk7an1rDp/Hy4hkXfktfvmdxUaxv
         3A8sUvjtVkw53mw340DrAJeHLmOzxTyLbalQEkV/XibwwFuwinmbY8O4rPtYpX5yrLiy
         JCufh3uEsQSrI+YvGbyX9Y+722Yi/OGL4EsdeTD0EdSrLJ29gdu6g6g4kPCs/WNN/s56
         Ok1r003S2vR+FcsNad/mJW0vO/uHVdrcEbuS7mChc7ssvfhznEANrqB0zDNs+h4LpO7Z
         +re5NfTf0wvT6R8Qp16Ggu7kuyCNhK8MTP9WtoFIw6A9JRGk4YAt/6tiRiaJDLitsXUv
         FA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rFBl54go6bbp895f6CpJo/cJgp+SQIq2apGuPfKEw8I=;
        b=1VeKtS422ekswuyN+//TDAJSOXOkX+hiLksrFUJEnPUgf498+6x7Rv9XlE/lCzRW4C
         L6tH2TUPEPPf4TPBUE82OukU2jaXweNJdWDy8s2f7Y93QjD7sm9YpX/kDzIowY6f2S2M
         SxQSPI1RRQ87wKyBOXyQYJk7M9ADGtpg+vNn09wV0jNh2rncB+2LyAK0J+QbWfl17HMx
         smxPbrya91Pw60d9mlSgK5EeQoTVjjtNYwFrF5Cf1x62SlA8LqVr6XjyqUK3EVMyQ07S
         8DgK7sNDfIHw+ApzBsfmM2XMuQH9jz+tswgzcY1gA1IQ35r1w5l8WpHLM077cG9VjdKP
         om9A==
X-Gm-Message-State: AJIora+RoIqG/2HNEn6NrAmKkuGWwc2h741XgKN+M+/s0WsQKmWTNUmK
	9rfK4zo1Zd6TOV6qJPJIX5l1Xw==
X-Google-Smtp-Source: AGRyM1vqC3mk/Y63Y88qA3IPGzsb8ZUXDS2zCGPmro0xfJGvd0YSbgfDR3MJrICvvK8L1MwmkoFzRw==
X-Received: by 2002:a05:651c:1038:b0:25d:53cb:ba22 with SMTP id w24-20020a05651c103800b0025d53cbba22mr1104823ljm.407.1657701609473;
        Wed, 13 Jul 2022 01:40:09 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025d6ecbc897sm1720865ljc.46.2022.07.13.01.40.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 01:40:08 -0700 (PDT)
Message-ID: <0131e1d6-09c0-31a4-5b9d-0e2fc49d61ac@linaro.org>
Date: Wed, 13 Jul 2022 10:40:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] arm64: Kconfig.platforms: Re-organized Broadcom menu
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 SoC Team <soc@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 william.zhang@broadcom.com, anand.gore@broadcom.com,
 Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Wei Xu <xuwei5@hisilicon.com>, Andrew Lunn <andrew@lunn.ch>,
 Gregory Clement <gregory.clement@bootlin.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Matthias Brugger <mbrugger@suse.com>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
References: <20220712164235.40293-1-f.fainelli@gmail.com>
 <CAK8P3a2QrYbWOqV+CG-W0ZkzW6ORgw8R6Dv-L3o2ZAtJs-B3Kw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAK8P3a2QrYbWOqV+CG-W0ZkzW6ORgw8R6Dv-L3o2ZAtJs-B3Kw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/07/2022 10:25, Arnd Bergmann wrote:
> On Tue, Jul 12, 2022 at 6:42 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>>
>> There are now multiple Broadcom SoCs supported so group them under their
>> own menu such that the selection is visually more appealing and we can
>> easily add new platforms there in the future. This allows us to move
>> ARCH_BRCMSTB back to its siblings.
>>
>> No functional changes introduced.
>>
>> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
>> ---
>>
>> Note this is based on "arm64: bcmbca: add arch bcmbca machine entry"
> 
> Hi Florian,
> 
> So far, we have tried to keep the Kconfig.platforms file rather coarse-grained,
> mainly limiting it to company names and high-level families, but avoiding
> sub-menus or adding too many sub-families.
> 
> If we add per-vendor submenus, we should probably first decide how we
> want to structure this across vendors. I've added maintainers and lists to
> Cc for a couple of the ones that are in a similar situation.
> 
> I can see a couple of ways we can do this:
> 
> a) keep the list of platforms as short as possible, combining related
>   SoC families from a single vendor wherever possible, but no sub-menus
>   (same as today)
> 
> b) Always use sub-menus when there is more than one family, but
>    keep relatively coarse platform selection.
> 
> c) Use sub-menus and also move to a more fine-grained SoC
>     selection, similar to what we have on 32-bit arm.
> 
> I would not really want to go to c), but a) and b) both make sense to
> me as long as do it consistently across all platforms.
> 
> Any other ideas or opinions?

Whatever we decide here, the SoC can override in drivers/soc, just like
Renesas did. I think Renesas chose option c), but made it in
drivers/soc. I would vote to have consistent policy, so if arch/arm64 is
a) or b), sub-archs should not redefine it in drivers/soc.

Or we could choose d)
d) keep arch/arm64 list of platforms as short as possible, but sub-archs
can do whatever they like on drivers/soc.

Personally, I find fine-grained SoC selection a bit ridiculous
optimization, like compiling kernel, Glibc and userspace with -O3,
-funroll-loops and many other flags. One gets smaller size but looses
multi-platform and ability to test one kernel on different boards.
Therefore I would vote for b) with disallowing drivers/soc defining more
ARCH_ and more SOC_.

Best regards,
Krzysztof
