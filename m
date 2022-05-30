Return-Path: <SRS0=Wjvf=WG=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE1AC433EF
	for <soc@archiver.kernel.org>; Mon, 30 May 2022 18:58:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6B1A3C385B8; Mon, 30 May 2022 18:58:23 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CE14C34119
	for <soc@kernel.org>; Mon, 30 May 2022 18:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2CE14C34119
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id gi33so22532622ejc.3
        for <soc@kernel.org>; Mon, 30 May 2022 11:58:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=aZ4hSZLty16XZtYDyN1iI3FQFX0xiK9Qd3Z5M2gZKCw=;
        b=wM7WyZVXegXf3sHYj6hVYcw/P4aAaMlv3drBS/wJer6tcwr8R1qIAg3jY7R56/uLJg
         AkL4lRXKVL+atJXRI1RwFtm5scfXzyPz4HyY8sQsjVcPPuE+gbnmz9tbOijbaY0wsPat
         VVzNGtmHf0lgbCz1TkCONCrCNpok5C64WaRx+ieOXzsugLNAWuTh8WPpQqGOxqj3Pwc+
         lrGiLArhPWW0Lo5gt/uJUyJVtgKc7QeaFUgTRk0WMiNzSz++hob/ExUe9G6w/1OufoFX
         cgRJwS3fGl7Q3zjhcQWOWsN65HPQzv2gYTMMafViqZY+pSexHwyZce8rTbnesrdKWTm4
         olaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=aZ4hSZLty16XZtYDyN1iI3FQFX0xiK9Qd3Z5M2gZKCw=;
        b=3Lv/ceXn6xftSNkEzF/OqtrxFterBxRGBPCw/vz808Lpna5fH4wPmfAiCFvTENdhaw
         vlS5mDP7RG7iiZM/xWIqu4THfOT9LG1HojB+K40t7N2u+kzQszzxUQXz90LQK9Uq/cbE
         9H/WWy+Dkin5dVouS3weLpEnoxgrnjYSQwnWi26IMsks2FIV4/v7xTbQZPpck5UiGKJY
         labbytWcFxA9uNwJN3ZZqYC64ty8CFJt3lFtJdCGKCVbsRaudMx3ABN7A7SoDbGrsbve
         1YaskugIBUpT2M6amNzm6fG+N+QhToZx63+vjl74VQjtCTWz7E5JkqCzQXGlzsCbu1po
         n0vQ==
X-Gm-Message-State: AOAM532qPbuy+MATKhDZzLKWBkRrCIk5AFl9QHKa168kQRxV+3ifWBof
	+jfhc4TvU3megE0m573NE0QKDw==
X-Google-Smtp-Source: ABdhPJz6VqYPIb7dFTIdH5KP/w/rMk6xgXoHqfYCoOM6vHY7XEp3TXC9rduj5i3qN1TaEaiRI1+kGQ==
X-Received: by 2002:a17:906:fc20:b0:6fe:a5f6:379d with SMTP id ov32-20020a170906fc2000b006fea5f6379dmr44922645ejb.503.1653937100528;
        Mon, 30 May 2022 11:58:20 -0700 (PDT)
Received: from [192.168.0.179] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v15-20020a17090606cf00b006feaa22e367sm4365712ejb.165.2022.05.30.11.58.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 May 2022 11:58:20 -0700 (PDT)
Message-ID: <615ac44b-fd9b-332c-5ea0-8775cda8cb00@linaro.org>
Date: Mon, 30 May 2022 20:58:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/3] dt-bindings: altera: Update Arria 10 boards
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: arnd@arndb.de, olof@lixom.net, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, dinguyen@kernel.org
References: <20220530130839.120710-1-pan@semihalf.com>
 <20220530130839.120710-4-pan@semihalf.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220530130839.120710-4-pan@semihalf.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Subject is too generic, please describe what are you doing. Anything
could be an "update".


On 30/05/2022 15:08, Paweł Anikiel wrote:
> The Mercury+ AA1 is not a standalone board, rather it's a module with
> an Arria 10 SoC and some peripherals on it.
> 
> The Google Chameleon v3 is a base board for the Mercury+ AA1.
> 
> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
> ---
>  Documentation/devicetree/bindings/arm/altera.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/altera.yaml b/Documentation/devicetree/bindings/arm/altera.yaml
> index 5e2017c0a051..c6e198bb5b29 100644
> --- a/Documentation/devicetree/bindings/arm/altera.yaml
> +++ b/Documentation/devicetree/bindings/arm/altera.yaml
> @@ -25,7 +25,7 @@ properties:
>          items:
>            - enum:
>                - altr,socfpga-arria10-socdk
> -              - enclustra,mercury-aa1
> +              - google,chameleon-v3

As mentioned in patch 2, I would expect to have still enclustra
compatible. It's a SoM, so as usual it goes with its own binding, even
if not used standalone.

Best regards,
Krzysztof
