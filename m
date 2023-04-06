Return-Path: <SRS0=RqzZ=75=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77390C7618D
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 17:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40B6CC433D2; Thu,  6 Apr 2023 17:21:51 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 94E9CC433EF
	for <soc@kernel.org>; Thu,  6 Apr 2023 17:21:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 94E9CC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-93db98f7b33so111784566b.2
        for <soc@kernel.org>; Thu, 06 Apr 2023 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680801708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=145yGzODgxY+rJbwAEpe0vSJYcWx7FkVo4x57vw/2Ds=;
        b=J3QonWmOAxHMqJ1EOSUj4Rs4updaQcuUihcgcTFNhvmsCy6vBtmalIIUSokDtx0F3o
         6nHdCIpzrLSH+VxgApjJ8P2UKckkNOkxX/fwqeuvB1cGopdBPEPwOnwC0KJ3GsZyHB2W
         lszpadIv4hDgi03TskBGJpV3t+bDZsTEL0pGZgx1pl2e+DHeJwKaUvIFHVjPHSxHNkqP
         jZtZPk3HiuFjSs3/9EMd2Q1h/dPqJqn3uopp1XusIxh+cfVVyR84rP6A1HeFr3Huklb5
         JjnpiK3qXY8wlTF4ziKCllgSkJV7EMH3nOtGeRVKFnwORSESnC2LfbhneG+9pO1Bz2WS
         sPmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680801708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=145yGzODgxY+rJbwAEpe0vSJYcWx7FkVo4x57vw/2Ds=;
        b=N9qFfqnb07E/lwTuz9uoU1uUMwbWjp13hSxqRiZRvBErZ3LgZO8YDhJwh7DR0XCgnF
         cZxeJJWNqX66shlmB2lQdCS7pj1FZuoBT/bB2grTlOZGHuITbC0KaLvF34C9adYrbsTl
         +RzAcusEEqt+peShLNtL2STrVubEYooQgupnZug8ZKgZKKKiM0djSOdDkF3FDzwH99wV
         B52vaV59Kj0kDTo1PPToCbo7trH1ZRDYoi2BbuEX8wZZVdSBDV6p+mUe99FIoh9bdr0b
         WizwfA9HOqiQaWwshf3o0I5BAiyP+a6eT4NIhAIZPorY8VUhWNtV3GfSMvD/iiTagxqW
         8ncg==
X-Gm-Message-State: AAQBX9c+n2tIglaghYndrWcpp5aJZeGCayJrNX12pGO16gOwYEaYE372
	jCZA5c+Scl53dVeNGjIVXFFTpg==
X-Google-Smtp-Source: AKy350YRBx7KoZyPvNoeZ4w8rpaupgS8OEN5BdZpbF0ZP0CslF/6SZi49GUb5ys+HM8ofDMXceerJw==
X-Received: by 2002:a05:6402:344:b0:502:246e:6739 with SMTP id r4-20020a056402034400b00502246e6739mr235993edw.27.1680801707878;
        Thu, 06 Apr 2023 10:21:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id jr3-20020a170906a98300b00933356c681esm1046545ejb.150.2023.04.06.10.21.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 10:21:47 -0700 (PDT)
Message-ID: <c79ca1c4-d7d7-50f5-ee2c-1c1ff459c429@linaro.org>
Date: Thu, 6 Apr 2023 19:21:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/5] dt-bindings: Add Blaize vendor prefix
Content-Language: en-US
To: Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: "soc@kernel.org" <soc@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 James Cowgill <james.cowgill@blaize.com>,
 Matt Redfearn <matthew.redfearn@blaize.com>,
 Neil Jones <neil.jones@blaize.com>
References: <20230406102149.729726-1-nikolaos.pasaloukos@blaize.com>
 <20230406102149.729726-2-nikolaos.pasaloukos@blaize.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406102149.729726-2-nikolaos.pasaloukos@blaize.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/04/2023 12:22, Niko Pasaloukos wrote:
> Blaize, Inc. (www.blaize.com) is a SoC manufacturer with integrated
> programmable Graph-Streaming-Processors for AI and ML.
> 
> Co-developed-by: James Cowgill <james.cowgill@blaize.com>
> Signed-off-by: James Cowgill <james.cowgill@blaize.com>
> Co-developed-by: Matt Redfearn <matt.redfearn@blaize.com>
> Signed-off-by: Matt Redfearn <matt.redfearn@blaize.com>
> Co-developed-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Neil Jones <neil.jones@blaize.com>
> Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>

Four people were working on one pattern in vendor prefixes? I have
doubts, because this is very trivial patch.



Best regards,
Krzysztof

