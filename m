Return-Path: <SRS0=QEF6=24=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5FDFA3740
	for <soc@archiver.kernel.org>; Thu, 27 Oct 2022 13:29:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1F19C433B5; Thu, 27 Oct 2022 13:29:39 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C7241C43470
	for <soc@kernel.org>; Thu, 27 Oct 2022 13:29:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C7241C43470
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qk1-f176.google.com with SMTP id d13so851354qko.5
        for <soc@kernel.org>; Thu, 27 Oct 2022 06:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TTwpwzBOTSlAfdzeffXJwW5XqdT/26wnvCx1vR6fN88=;
        b=qv4+MlbR8K3ZN+euxZlSZqM+OWMHZZDS2wpH/eO7JYgtfoc4JO8MkbwHp6in9KRUgL
         EKxJZFAD2XJgdpYDd6Impc+m3WR0/i65Kzy+vgOBF4WTCNOIw4eIhgIL4qgXAQKHYBJ8
         k+v0AvhZoHNT/it7B0loctrkhRg4xiw/j7qCqZZDxB/XBJSenlbcMUtNxpoPEsR3kCtS
         xQMqm7RF/3RBQFhCtUurSD49SgmudmIjCPdRwcr2LZomUyTzp5RmoPivJVrEa8ZLoqQQ
         QwKlZq0atgBEh1mx4sJw/Iwk8lfz+idUnJKx8+WjjNayF5jWgAj77YVOf+qLCwzKhnma
         CLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TTwpwzBOTSlAfdzeffXJwW5XqdT/26wnvCx1vR6fN88=;
        b=FTwOXA0sDAQv5vrE4vXcUnwRBpy78GulpeaPsTu7nrOEaxb62rD7IV3CulGg4OaAyv
         HCdRQVlh2LMyHSTbrnlZIZRvelx6I9ZhSNZTMYPt1qLzfiT8KYl3e7/7FPyFXvjBV361
         klTgZtseGLXV7ujRy+pMCbPZe1162ds0e7frnlgISbLRzwkh8xF2dVGJjrqJK1KORVYo
         7DPLHko6xUbE8dmphYGjjsP7ux3oEkPYzQgJ36weUkYlbmc2tN+mHtzWXk9QPOUO3piR
         vteiGHsfrbYjCeIJaRH4FD01Iw9H+c0CCDxHRX2lrcPdj/ZHqEAKhpTSRx/wEY473DK6
         +kUg==
X-Gm-Message-State: ACrzQf1j8Du1AbpFob9cdt4i8tlkinxx/bMKmv/ajKHcgQROD9xf6zf7
	Uf7EoXZywdLvLy2rfYztLKdYFLzgBlzNjQ==
X-Google-Smtp-Source: AMsMyM5amd8emuD3HyWk/ILmdeMMES4jzpPlL62uVD1DdECOo2koSyCcCjBVdNr4ZOTDTPegg12wmg==
X-Received: by 2002:a05:620a:438d:b0:6e2:a30c:25d1 with SMTP id a13-20020a05620a438d00b006e2a30c25d1mr34590135qkp.155.1666877366801;
        Thu, 27 Oct 2022 06:29:26 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id j6-20020a05620a288600b006f474e6a715sm927262qkp.131.2022.10.27.06.29.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 06:29:26 -0700 (PDT)
Message-ID: <d90844d5-19c8-06f2-ac99-2befc57e539e@linaro.org>
Date: Thu, 27 Oct 2022 09:29:24 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 3/4] dt-bindings: arm: uniphier: Add NX1 boards
Content-Language: en-US
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Masami Hiramatsu <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221027045157.23325-1-hayashi.kunihiko@socionext.com>
 <20221027045157.23325-4-hayashi.kunihiko@socionext.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221027045157.23325-4-hayashi.kunihiko@socionext.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/10/2022 00:51, Kunihiko Hayashi wrote:
> Add compatible string for NX1 SoM board, evaluation board, and reference
> board support.
> 
> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

