Return-Path: <SRS0=BEay=XC=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3911C43334
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 22:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 66C26C341C8; Mon, 27 Jun 2022 22:18:16 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97135C34115;
	Mon, 27 Jun 2022 22:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 97135C34115
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f42.google.com with SMTP id v185so4430164ioe.11;
        Mon, 27 Jun 2022 15:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YibwpeFlLUAXldT3IcMtZUEv7yVm8RZ87dZAwMJufVw=;
        b=2RAuMMqhEKGgZhbcwRkjY/u+05AIXZuKZJmKzTPUEdSGbwyJdbL8ye7c5V4X62eBlt
         70ogyxRMUkKC/v1TJxNZuEhgw1OuxDiIupOdVeOoaodssaBY8g8dZr6BddB51dFR260Y
         FVoLXRBqjoU4t1r0mDEbC7sNltOqVtB4/oRz0U270GDDfKDCzW+gQjR9u/u1vUbjgNZ4
         BCcPNIWa9uY5duwIs4iRhb0l8IRxxLiblEmO7Dkjbu2uVKS6T96pNdqNTChI/gPA5Zpe
         qUfs5wynKd3QDI+4WcmEDMcNzC5jEFqhvUwBSrQ5DrLWhYKGW9HjsiwqlYHjTeAjUZhN
         +LKg==
X-Gm-Message-State: AJIora+LSw2JqfPvQUWjmAw7CLteOPW04NFZMTbmz4Bz0dC1ANkqPqGi
	Vo6fCybpz6UD64lowhlT4A==
X-Google-Smtp-Source: AGRyM1v1uMcYY0sXxp0P098New6WbDFXGNit8XNV3ZEYVn08nGYcoSP532Tx60bnDX9w8a+/DBwomQ==
X-Received: by 2002:a05:6602:13c3:b0:672:6e5b:f91d with SMTP id o3-20020a05660213c300b006726e5bf91dmr7538403iov.68.1656368294681;
        Mon, 27 Jun 2022 15:18:14 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id z18-20020a92bf12000000b002d11c598e12sm5052398ilh.61.2022.06.27.15.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 15:18:14 -0700 (PDT)
Received: (nullmailer pid 3065966 invoked by uid 1000);
	Mon, 27 Jun 2022 22:18:12 -0000
Date: Mon, 27 Jun 2022 16:18:12 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, arm@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Olof Johansson <olof@lixom.net>, linux-gpio@vger.kernel.org, Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>, linux-kernel@vger.kernel.org, soc@kernel.org, Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 04/40] dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl:
 align key node name
Message-ID: <20220627221812.GA3065912-robh@kernel.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616005333.18491-4-krzysztof.kozlowski@linaro.org>

On Wed, 15 Jun 2022 17:52:57 -0700, Krzysztof Kozlowski wrote:
> gpio-keys schema requires keys to have more generic name.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v2:
> 1. Name it "button-uid"
> ---
>  .../devicetree/bindings/pinctrl/nuvoton,wpcm450-pinctrl.yaml    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
