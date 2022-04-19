Return-Path: <SRS0=Uf7n=U5=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B059C433EF
	for <soc@archiver.kernel.org>; Tue, 19 Apr 2022 10:39:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E98EEC385AA; Tue, 19 Apr 2022 10:39:55 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9501C385AC
	for <soc@kernel.org>; Tue, 19 Apr 2022 10:39:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A9501C385AC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id g13so4257538ejb.4
        for <soc@kernel.org>; Tue, 19 Apr 2022 03:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GL2fYhpPazaoZcNVvKzwIzbLVWsgi0SqDsBRdlVnGFE=;
        b=gU9fKApCIgWofdlZwPbCJoYJui79+QQoAMZ+f4btrxoIXH53zopKm0uPJ6pUKWZsWc
         gnHSKHPdLUXuvoNRjU+smc3AFSRKapOOz1l2A93Tr56xhzFtCnJXZICCsNTEIC1QOjAa
         y6WteyMqxwZuUXv/QrGy3nvxqzSXhWUi/WnOFo7DxBeRC7XHUww41gI6cmkEmdHIG3yI
         O+364XZYQDQEFok1MDIIefNvKaokOD8yWwKrqQcpAO+hLsVB3TThs1dInqp38Bbkugnt
         hvuYkI1b/6lQWTaNWVFQR4iYI+csOEqjepIweK8TweLlm0GihscIjXij9HRmrPOmDhLn
         2+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GL2fYhpPazaoZcNVvKzwIzbLVWsgi0SqDsBRdlVnGFE=;
        b=I0U3EiZPKnT9qLDUCtYMi6xgG8zgqY4qHQZupXL8lYZAwkstCqg9v5Wu5f0SlKT3ov
         B291Lxwim5Ko+tcK33Af9xdz8q58ZJoisj8j4Tyysky+agOwwLqd7tNobr99MPyID4lX
         kR8zPJfYgY9x/ECh9Fnpd3nNTuTtEDjqVoIhSWwQRAAyo5I/pG6S0hWpMatuzLcHOQLj
         UflnreV5GRjThhgn/qXxn9Rk9pxKiObbh0u2nOaNYCMo0WTHYu+HqrAsyiWBmgMDpElC
         SA2lnDjz71YCBY1B6FADbB5aF0zl1N5Ghjym9UVvlEcNzKfbb313cODMu2J9bV6XPfs7
         KXXg==
X-Gm-Message-State: AOAM532IS4ZHBqYTU4a8RXx4mfOR3ELwmENABpZvfK0GKANxaMhY6YKH
	vWRUTMeZQdApXei+NGld1cIVjw==
X-Google-Smtp-Source: ABdhPJx155Ovc/3OaXt56VJVSQL+8VeYbvwvfy68N2lcRmJQt54ZzMqfT/zGyNp+W/WNmFB8c5CVsw==
X-Received: by 2002:a17:906:9c09:b0:6e8:89e7:9807 with SMTP id ff9-20020a1709069c0900b006e889e79807mr13019845ejc.473.1650364792867;
        Tue, 19 Apr 2022 03:39:52 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lb4-20020a170907784400b006e0d13f65e5sm5502888ejc.167.2022.04.19.03.39.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Apr 2022 03:39:50 -0700 (PDT)
Message-ID: <b2e32685-73a6-98be-50be-5121c67431ed@linaro.org>
Date: Tue, 19 Apr 2022 12:39:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: Document MA35D1 clock
 controller bindings
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
 olof@lixom.net, will@kernel.org, soc@kernel.org, cfli0@nuvoton.com
References: <20220418082738.11301-1-ychuang3@nuvoton.com>
 <20220418082738.11301-3-ychuang3@nuvoton.com>
 <2f8d2f6a-32dc-15cc-321c-f75721edf8a2@linaro.org>
 <29b00c24-681a-7f6f-f27d-b7525c5b8485@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <29b00c24-681a-7f6f-f27d-b7525c5b8485@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19/04/2022 12:12, Jacky Huang wrote:
>>> +
>>> +  assigned-clock-rates:
>>> +    minItems: 5
>>> +    maxItems: 5
>>> +
>>> +  nuvoton,clk-pll-mode:
>>> +    A list of PLL operation mode corresponding to DDRPLL, APLL, EPLL,
>>> +    and VPLL in sequential.
>> This does not look like a binding which was tested. Read
>> "writing-schema" and test your bindings.
> 
> "nuvoton,clk-pll-mode" is a nonstandard property used to describe the 
> operation mode of
> corresponding PLLs.
> 
> (According to Device tree Specification section "2.2.4 Properties"
> Nonstandard property names should specify a unique string prefix, such 
> as a stock ticker symbol, identifying the name of
> the company or organization that defined the property. Examples:

I am not saying about property name. I replied under some description
below which fails to build.

Instead please test your bindings.

Best regards,
Krzysztof
