Return-Path: <SRS0=Epxo=AG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 132A9C7619A
	for <soc@archiver.kernel.org>; Sat, 15 Apr 2023 09:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D14BEC4339C; Sat, 15 Apr 2023 09:35:03 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3C3AAC433EF
	for <soc@kernel.org>; Sat, 15 Apr 2023 09:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3C3AAC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id si1so21470676ejb.10
        for <soc@kernel.org>; Sat, 15 Apr 2023 02:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681551299; x=1684143299;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iHe7+ZI9vcMXozuw5wEOyHlKfGeNE+50N2oMm3v17Pc=;
        b=I9Y9n63XJPOuSMT1dpoJVmH4Gfyim7lTooHc+4cAPZv4P77Ycc3njmUKzsvxuZSFtU
         /GnRkwHL625syL22vp7hxZNhILWz+JsWf7nDqghpGqXTMbQN8lVd/iAygpF5FG/8kYYc
         VhxtUHF2jaAy7vCIerZT3aMgrZdEi6vxdqBKARG5OifeWzkOltADArVXmgUn8KnTeVmM
         mP60tMI5IfyMxz7knXL7hvb/uTdx8WLM5BZn5O2eL5Gsub9VPFK/1tXAHs1dNcAYZh9h
         w6oGDVsNrB3zziyT9w0uUPyftY06W9T8xnDCobM4F77Ht08xspMYeEbgT6tqcj2sgrL+
         dRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681551299; x=1684143299;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iHe7+ZI9vcMXozuw5wEOyHlKfGeNE+50N2oMm3v17Pc=;
        b=gwe1QhGK4XXcRMKiMeBoKEtQvthlsrGlAGvea6Sci9Fz6hi4OUpBjFuxT/SBfCVF8r
         eHgpsupMGXjkL52J0Y3Vq2oncZ9/2du5K2zlJ3LLYRJT/blU8ruHPnJQ97duIdF1NJzH
         4CKSQEEeGiz9F8I0fPD7SsrA5AKLRvDLIniE1f3KsErUZn9hQgg4g/DT1s4c9fzIDLZA
         s7d6ElPADBzMqRFn3Fx7nxacVBrUpJCIiHPLuDwidHZJFm/BwYv1l1m19AZvA5G7AHP0
         YGkLEN7GQUlts1FItywo6tXcVQX/8PCU/npzTdvvCLT6TzBPv7gtFCp5iF2zmQg2M+yB
         9/Pw==
X-Gm-Message-State: AAQBX9cuQTevjZtKPvZUWF/wdl9N92kVuUF8BeI+RNjKxW7swvKJiwZ3
	pstnbb4JMF2Jsi+Dvx7tsjRiRg==
X-Google-Smtp-Source: AKy350YPr/pPCvzamHm2jAQZ1MFJBtpP8e/tuf9tFawxc3zwEKLFtjR2S3JdniMPaZ5p5oFz1HNqLQ==
X-Received: by 2002:a17:906:9711:b0:94e:dda6:993d with SMTP id k17-20020a170906971100b0094edda6993dmr1580355ejx.3.1681551299400;
        Sat, 15 Apr 2023 02:34:59 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a3bf:4ed:6c53:2a36? ([2a02:810d:15c0:828:a3bf:4ed:6c53:2a36])
        by smtp.gmail.com with ESMTPSA id r7-20020a170906958700b0094efdfe60dcsm1330403ejx.206.2023.04.15.02.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 02:34:58 -0700 (PDT)
Message-ID: <4649763c-4355-758e-dcdc-5bdb4277c441@linaro.org>
Date: Sat, 15 Apr 2023 11:34:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH V5 2/6] dt-bindings: w1: Add DS2482/DS2484 I2C to 1-W
 bridges
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan Wahren <stefan.wahren@i2se.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-imx@nxp.com, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Stefan Wahren <stefan.wahren@chargebyte.com>,
 Evgeniy Polyakov <zbr@ioremap.net>
References: <20230404080243.9613-1-stefan.wahren@chargebyte.com>
 <20230404080243.9613-3-stefan.wahren@chargebyte.com>
 <20230404133937.GA3778861-robh@kernel.org>
 <e2afed14-fed3-772c-3acc-dc132b5a1078@i2se.com>
 <2023040651-baboon-busybody-6175@gregkh>
 <bdcf41d5-cd61-1e95-0b21-b8fe401644bd@ioremap.net>
 <dc794f94-42ff-33a5-facc-5fe09f6da295@linaro.org>
In-Reply-To: <dc794f94-42ff-33a5-facc-5fe09f6da295@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/04/2023 20:10, Krzysztof Kozlowski wrote:
> On 06/04/2023 13:47, Evgeniy Polyakov wrote:
>> Stefan, Greg, hi
>>
>> On 06/04/2023 10:58, Greg Kroah-Hartman wrote:
>>> On Thu, Apr 06, 2023 at 11:53:28AM +0200, Stefan Wahren wrote:
>>>> Unfortunately no feedback from Evgeniy so far. Should i resend these two
>>>> patches for you?
>>>
>>> Please do.
>>
>> Thank you for the patches Stefan, but I'm no longer a w1 maintainer, 
>> sorry I haven't updated the maintainers file, please send all w1 patches 
>> to Greg.
> 
> Thanks Evgeniy.
> 
> If the one-wire subsystem is orphaned, I can manage the patches to
> offload Greg a bit.

There was not feedback on my proposal, which I am optimistically going
to understand as "go ahead". :)

I'll send a patch, assuming Evgeniy that you are not planning to
maintain w1 anymore and a new maintainer would be useful.

Best regards,
Krzysztof

