Return-Path: <SRS0=17+H=XC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB7AC433EF
	for <soc@archiver.kernel.org>; Mon, 27 Jun 2022 08:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 680ACC341CD; Mon, 27 Jun 2022 08:49:54 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 96299C341C8
	for <soc@kernel.org>; Mon, 27 Jun 2022 08:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 96299C341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id c65so11940138edf.4
        for <soc@kernel.org>; Mon, 27 Jun 2022 01:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:cc:from:in-reply-to:content-transfer-encoding;
        bh=FP/GaPcBvGjggyyQ1dCEEdUzjPdfMITFn6wRnSlyWGg=;
        b=yjbLzOF5j+urN6XfJzvyPM94OzRtbJ+8bFayxKEE6RW2z5v6WIFQgMaz/BKF/+PGiX
         MQWIwRZh9zhvFB4Bvy8mwM2Fiw8cEH0O8PxPodp9w3Z+rAcO8C+163DcL57nJO0+D6gF
         9NfyKJ34gwqAvt9G944h4LBPedW6fLjvGONSuT1JGZXt+5wY340l1OGCF/gk8xsaD2Y7
         dtavos2IiyqFEL7qHS9C4OzA1kvPT7Lo3ICQy8XHVBUylKFt5vcOBpBe62Ns+ts+5bCc
         YIf30U9DAP/DIn5vdQG0pRCorA4Ghv80NGfhsKEEKlKuNwqH09aPAvpw0KF/f2fUNZsa
         iuVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:cc:from:in-reply-to
         :content-transfer-encoding;
        bh=FP/GaPcBvGjggyyQ1dCEEdUzjPdfMITFn6wRnSlyWGg=;
        b=tKNVO7d8klFHcXHBOITzuiL/XDIUJkyJ3HMHUDrsErnq2CkuLgAfWJZJDdrf9HhNHN
         ZIyUqL8ZUVWs8QU3YF1nK64bmb7Wss6PkvEw73vws+AMOlb8v9Osx0gKDfkdMFVscnt5
         PoQFjSnJ8r9/5OKMi8M8kSfvMhpE9Qb211WJXYLTmQycCEOqnTMggSXr8El5sFmFZCY7
         Bk0hXVUC7894JnGwjTiVhfHks3QLtI5lbwZSCkE+6C7adTaOs6DRZSAmnQpbYHmzUzXq
         S4qpUl5gLQAu36PkTPU3xPTUursioYdNb+CuZGQmbc+CRCk/ZkiGt0qyFoKGinBbtdXr
         8OTw==
X-Gm-Message-State: AJIora+4hlCsexTw/wno4BZTL874jfzcDkAFgj32BxQJC0vx3rCyH5M4
	mSZopgkIWjuOuQNX+B0oz1+TxA==
X-Google-Smtp-Source: AGRyM1vWeJVmejaOPOyVJ0lfNvFasd3Lk5cx3A4395nD73h1yXyEWVIEMiYkIg8YEEoeEq8raaeW5A==
X-Received: by 2002:aa7:c881:0:b0:435:5dc4:5832 with SMTP id p1-20020aa7c881000000b004355dc45832mr15297321eds.265.1656319791931;
        Mon, 27 Jun 2022 01:49:51 -0700 (PDT)
Received: from [192.168.0.247] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j12-20020a1709062a0c00b00722e1bca239sm4810194eje.204.2022.06.27.01.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:49:51 -0700 (PDT)
Message-ID: <5e0d5cca-c4a8-6651-0e67-47b5fc23c5c7@linaro.org>
Date: Mon, 27 Jun 2022 10:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 36/40] ARM: dts: aspeed: align gpio-key node names with
 dtschema
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
 <20220616005333.18491-36-krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, arm@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220616005333.18491-36-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/06/2022 02:53, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts | 30 ++++++------
>  .../boot/dts/aspeed-bmc-bytedance-g220a.dts   | 48 +++++++++----------
>  arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  |  8 ++--
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  | 12 ++---
>  .../boot/dts/aspeed-bmc-inspur-fp5280g2.dts   | 22 ++++-----
>  arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts   | 23 ++++-----
>  arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts   | 20 ++++----
>  arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts   |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts  |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts    | 30 ++++++------
>  arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   | 12 ++---
>  arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts   |  4 +-
>  .../boot/dts/aspeed-bmc-opp-witherspoon.dts   | 16 +++----
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts    |  4 +-
>  15 files changed, 118 insertions(+), 117 deletions(-)
> 

Joel,

Any comments on the Aspeed patches? Do you intend to take them or shall
I handle them with the rest?

Best regards,
Krzysztof
