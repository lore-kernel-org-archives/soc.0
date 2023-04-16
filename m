Return-Path: <SRS0=JHH0=AH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187E0C77B61
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 18:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F2304C4339B; Sun, 16 Apr 2023 18:11:49 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C1D4C433A1
	for <soc@kernel.org>; Sun, 16 Apr 2023 18:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2C1D4C433A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id fw30so5746651ejc.5
        for <soc@kernel.org>; Sun, 16 Apr 2023 11:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681668706; x=1684260706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B6n5E4CO4kCJf3nGE58OKGGQOMHXRP5JjX8b0teIIoI=;
        b=ZzVcFejIqZ1u900JscVEO4eycpl/XhuypeXEfmIP1+mFuDcrOetJZg9pgtiTzhk7bV
         yv+jXuVWrZrgi63qs845JZT4+uDvwzRhGZg2n8vWHSdukWIGgXUdjiaR6Ge0TZTpLakV
         sd9idN4jVXnhSaWMnTx16O7GNfJwl2RJxPmgaOwy2gM80ImGxbWJ/eBotoETGIePkDwX
         DJuJA5rWLDcRjNYG3lJteHo2gmKiS1ZWg2Ezw/JZWqRmDGp+QFDFE0ULQWWs42ga2lHp
         SyfjD4jeLBXHheEGulco2Ne/KNSZYlVccr3fXkNH7H4NRBwIMAyPeussFZvDI/E9VsQD
         E4DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681668706; x=1684260706;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6n5E4CO4kCJf3nGE58OKGGQOMHXRP5JjX8b0teIIoI=;
        b=OWgJbXOxSTXp0gw3BVQ4e4shsk0OHzYuM7/pmetT1hMQOe+xWyDpqMKtdqk/lfiJOf
         uP2NKGfWk6em5cv32LMZ08/r54fcfY0hxyskvTZU/C2vJOvboV47YcQDwDcYcAQAIQ7W
         jGK/6yVjzN6a3zkZF0RoqKdqin/GN3bRMMGKkTFj4IdWx5znh2kRemgZw/Xw0T38uZtA
         tBOfrCwQGBWDcfqlR8VWx7n+tqDv7hJdczHrlZfsEcv7VUTRPduI7WvxRBxnBsck5AXq
         Lvp5j6+Upr6xMnoTQhR/k1iC3b1otQ5viPn6A9LiNzpXQ1kygkX8RRXpykWJH+bfbH7I
         akmg==
X-Gm-Message-State: AAQBX9dY3pjox+slT3VRJnXyedvTAEfWh7bEEzWiLez2Dj5C7DUkRXtS
	PPAH8JKmrUqf/mpxDsCfFV3RUQ==
X-Google-Smtp-Source: AKy350YdJ7HOUBtJuBV+9N3nl3r0pYo2W9W9x4AL+g+AIjJcSDFtAAeTr6+vxOUNtnVBQv5afOfW7w==
X-Received: by 2002:a17:906:c294:b0:94f:5242:a03a with SMTP id r20-20020a170906c29400b0094f5242a03amr2582922ejz.63.1681668706168;
        Sun, 16 Apr 2023 11:11:46 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id j15-20020a1709066dcf00b0094e0fab7705sm5375294ejt.107.2023.04.16.11.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 11:11:45 -0700 (PDT)
Message-ID: <930d9bfe-7b23-766a-a968-4d3822dede74@linaro.org>
Date: Sun, 16 Apr 2023 20:11:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 11/12] dt-bindings: arm: samsung: Add Samsung Galaxy
 Tab3 family boards
Content-Language: en-US
To: Artur Weber <aweber.kernel@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
 <20230416133422.1949-12-aweber.kernel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416133422.1949-12-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/04/2023 15:34, Artur Weber wrote:
> Add the compatible strings for the Samsung Galaxy Tab 3 8.0 series
> of tablets.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  .../bindings/arm/samsung/samsung-boards.yaml           | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index deb2cf971871..4ee026e7f7ad 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -104,6 +104,16 @@ properties:
>            - const: samsung,exynos4412
>            - const: samsung,exynos4
>  
> +      - description: Samsung Tab3 family boards

s/Samsung Tab3/Samsung Galaxy Tab3/

> +        items:
> +          - enum:
> +              - samsung,t310                    # Samsung Galaxy Tab 3 8.0 WiFi (SM-T310)
> +              - samsung,t311                    # Samsung Galaxy Tab 3 8.0 3G (SM-T311)
> +              - samsung,t315                    # Samsung Galaxy Tab 3 8.0 LTE (SM-T315)
> +          - const: samsung,tab3
> +          - const: samsung,exynos4212
> +          - const: samsung,exynos4

The entries are ordered by SoC compatible, so this should go before
Exynos4412.

> +
>        - description: Exynos5250 based boards
>          items:
>            - enum:

Best regards,
Krzysztof

