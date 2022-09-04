Return-Path: <SRS0=nk1u=ZH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C1EECAAD3
	for <soc@archiver.kernel.org>; Sun,  4 Sep 2022 19:32:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 78A47C4347C; Sun,  4 Sep 2022 19:32:57 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE821C43470
	for <soc@kernel.org>; Sun,  4 Sep 2022 19:32:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DE821C43470
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id w19so7293023ljj.7
        for <soc@kernel.org>; Sun, 04 Sep 2022 12:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=v94704O0TujNsYv17nMnBtu+OH84/eWQsf7ETYu5jHU=;
        b=raPVkER/pA/imnNF3kT8eAcWerRaKCjrqBh/wET6ENZryx2c7P8UT3SIFG8eB/Qlq0
         tE/YDV+OC6gtDr5gXzoGgkMLmAbYi6Qh4HclWcsAZ06fe1mpQwlQLrlOEiI1qQ9Dyy0H
         3GYilxmuI4B4dkhfvCffFepqRjpB0jvtGAq9qnbKgpeV/M21yrwAqADL7HO9zkmnnxnm
         xNfpjh/E0ooeAQJWMS0K7sZbigbdYL0hWMkZoRqOTqjU+bUXWIMUCtNocmCRcW+VXF+y
         gNCsQ381EOG6ADOir1Pwr7PkgAKuK7G1iKTHWeyOT1qTcgNJaMHVMNyC+WQkqPWIi2O7
         XQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=v94704O0TujNsYv17nMnBtu+OH84/eWQsf7ETYu5jHU=;
        b=l+sm9bBdkqXszQRQc6qmy40/yLT7FfFRpYNixUTv3ZTT7p9YWaZSTGwSUzM+ctFH3d
         nCy8wolNRaMXiyHjZueIK5Q/Dt/Xfixerln/WCog/zNLJF8Ocbk4HGBUYsGWdgWsi5kX
         PQRK4R4o8EXGXISPks25X90Q5ki7A7B6vOaz1ACtQmDLX5TFRWcUlhPcjR1FXdwtSsFr
         EGYgc/u4J8IX2mLay2wJOV088Anv4r+wBizvAZDmBFBBmm1P69V0q0SvXpfm9v8fGeh8
         AhE7QuaBo85J85clTtGSatJwOHdZVWChk2MA6tN8DTpYhl6LIap1jQlm7blIaVt6nNFr
         zPmg==
X-Gm-Message-State: ACgBeo1XG+ARoAYI0iPp6uVtDgpRdt1ANv8ZH461AyC2Btf1RlagyyWP
	JQmkg8VMZXmHxDykK2QZGexAAA==
X-Google-Smtp-Source: AA6agR5REWTNOc8xN6hgbVoCILU5d1wRngjWNHHWSEPfiwS7FtzGVXNiGV9cwF3kbGOmN7JE7NzJSg==
X-Received: by 2002:a2e:7207:0:b0:269:1f9:6365 with SMTP id n7-20020a2e7207000000b0026901f96365mr2851875ljc.201.1662319974001;
        Sun, 04 Sep 2022 12:32:54 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x12-20020ac259cc000000b0049497a2b288sm996454lfn.58.2022.09.04.12.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Sep 2022 12:32:53 -0700 (PDT)
Message-ID: <3ff2773d-92e0-d52d-4350-d63a40a70f07@linaro.org>
Date: Sun, 4 Sep 2022 22:32:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [RESEND PATCH] arm64: defconfig: enable newer Qualcomm SoC sound
 drivers
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org, soc@kernel.org,
 Olof Johansson <olof@lixom.net>
References: <20220831141218.516100-1-krzysztof.kozlowski@linaro.org>
 <81ed8e35-fa70-4b0e-9601-131c9d0c46d4@www.fastmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <81ed8e35-fa70-4b0e-9601-131c9d0c46d4@www.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02/09/2022 12:34, Arnd Bergmann wrote:
> On Wed, Aug 31, 2022, at 4:12 PM, Krzysztof Kozlowski wrote:
>> Enable sound support (machine drivers) for Qualcomm SC7180 and SC7280
>> SoCs.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>
>> Resending because I missed ARM SoC maintainers and Bjorn.
> 
> No objections to the patch, but I'm unsure what I'm supposed to
> do with it. Is this for Bjorn or me to pick up? 

It seems usually Bjorn picks his parts of defconfig changes, so I guess
this can go indeed via Bjorn.

> Do we need it
> as a 6.0 fix or should this wait for 6.1?

Can wait for v6.1.


Best regards,
Krzysztof
