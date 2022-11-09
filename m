Return-Path: <SRS0=E1K6=3J=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E9EC433FE
	for <soc@archiver.kernel.org>; Wed,  9 Nov 2022 11:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88D43C433B5; Wed,  9 Nov 2022 11:05:32 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7AD55C433D7
	for <soc@kernel.org>; Wed,  9 Nov 2022 11:05:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7AD55C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id d20so25174083ljc.12
        for <soc@kernel.org>; Wed, 09 Nov 2022 03:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KzaCvH3xkARHHfJKzBlJJDQJiXN89YFdinP6IW/0fKQ=;
        b=h5S0vl+gwxO3+hZ1VmiEIxOPNO/y3K372NLE/9cA+qNUI/BhCEdUwZ1Z3z1sTh6GpU
         V90cw/FEBs6QSt655LhsMF1AGo7wDl03wHn6S5EaI+RJLKH40Qq7XRFAgsq5mFr5u1S8
         Ic1Y6akI7pTH7tfxZBqnKi3LSVrbGkuDJIQiYh6IBr1agVGGN1Utqdf28jo1DMQYiDS9
         a4PmqaCX8ptMAm+WudXQ0JKu+FbUAdBMaohGMElD2Wfw6RW6hU7cNwrXH/HMmjsp/jNv
         7BVDMhvoRkXVocpmgnk2dZhrXfsYqV/6M69E3qTG3JL47J+8RxCVBj6szGHAhut6hMMo
         Ck5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzaCvH3xkARHHfJKzBlJJDQJiXN89YFdinP6IW/0fKQ=;
        b=e/mEXwQb/KhjJT4LFWL8mkTpxo1fK14aBVJdvF4DqQuD5EPUxMayNlO64B8BFNbbxH
         qZF7TSeavOc4NICuirrl1athYRrE6FPS+F1cA77cMSjkEG+LzB+yxxRcwor7f8zBvDAX
         MK7KSvukXFHSIGH3gbcIx9w5pz34yx1GnF7ZpRvDc4tPFCQY91Sxm02mhTaLATlmsX7F
         hTCubS9fKc4x4WRk9xQ6rquBkSxkkBWMb7pLda6KxsU1HVGPmcewbponHuocLafNH6/J
         kE+3xeOFJ2RksypotPvBFJiNcI5vsVg0GCMllHCz1iXnUyQS/wMalIaPsQmJADVE1uV3
         UI9g==
X-Gm-Message-State: ACrzQf3CLtmIqpNeDwtjSOazhoSgcXrOe0cLzk0KaRT9s+fJJ7I3Xud+
	qHRcNLnJMGRvrV2frpVYznDVhA==
X-Google-Smtp-Source: AMsMyM5EaAzEjE2wqAIdQQS9DKHqggJlSiktGSWvrpBK/emQnzuqrjmMZklhZEQDYjO0bXVRuJtiSw==
X-Received: by 2002:a2e:953:0:b0:277:3609:bd2b with SMTP id 80-20020a2e0953000000b002773609bd2bmr7300851ljj.340.1667991929507;
        Wed, 09 Nov 2022 03:05:29 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id z4-20020a056512376400b00499b1873d6dsm2177860lft.269.2022.11.09.03.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 03:05:29 -0800 (PST)
Message-ID: <fe352971-dcb2-c33f-285b-a47c40dbcf2a@linaro.org>
Date: Wed, 9 Nov 2022 12:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 1/2] soc: loongson: add GUTS driver for loongson-2
 platforms
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>, Yinbo Zhu
 <zhuyinbo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Hector Martin <marcan@marcan.st>,
 Lubomir Rintel <lkundrak@v3.sk>, Conor Dooley <conor.dooley@microchip.com>,
 Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Heiko Stuebner <heiko@sntech.de>, Brian Norris <briannorris@chromium.org>,
 Sven Peter <sven@svenpeter.dev>, loongarch@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org
References: <20221104024835.3570-1-zhuyinbo@loongson.cn>
 <57c9f565-e75b-0c8f-fdce-9dc8c334d50f@loongson.cn>
 <CACRpkda=-_a+gWQVk1vi4QJ30j-hzeraX-wr86RcQ9xne4-d6Q@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CACRpkda=-_a+gWQVk1vi4QJ30j-hzeraX-wr86RcQ9xne4-d6Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/11/2022 11:15, Linus Walleij wrote:
> On Wed, Nov 9, 2022 at 11:03 AM Yinbo Zhu <zhuyinbo@loongson.cn> wrote:
> 
>> Hi maintainer,
>>
>> This patch I had verified that base on mainline 6.1-rc3 tree, it is
>> okay, if no other issue, please you help me merge it to upstream.
> 
> Aren't these loongarch maintainers listed in MAINTAINERS able to
> merge this? Certainly Huacai can merge stuff to drivers/soc as
> need be. drivers/soc is a bit shared between different archs.

The problem was they were not cc-ed on these patches for some reason.
Maybe the maintainers patterns are incorrect...

Best regards,
Krzysztof

