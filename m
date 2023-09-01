Return-Path: <SRS0=edI6=ER=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10984CA0FE6
	for <soc@archiver.kernel.org>; Fri,  1 Sep 2023 09:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0CC1C433CC; Fri,  1 Sep 2023 09:06:57 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8960CC433CA
	for <soc@kernel.org>; Fri,  1 Sep 2023 09:06:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8960CC433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso207628066b.1
        for <soc@kernel.org>; Fri, 01 Sep 2023 02:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693559213; x=1694164013; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CL2wZFAQ9DQMYKYYGQQIGah4zjC0ig67LMgG+Wt4f1Y=;
        b=l/HaoMLCw0oDsRjJ+DAXYT0zfx80V1+6wYY4sK+qqSlyzk7cTfpqNhl0xE6g7aWeaX
         tZZcbGN6hl62brcxIOavzN7Kw+2KwzKKMglwhXWF2QMxscpJSvoQxrj2YGExjKhKb9FI
         nVhLMKwbdpcW/Sr8Z6w4i0hrYkDkPauX9uysg3nz2HmwI9xX02hIKJzVkAEdTbjO8jmN
         JScED/1tyRIgCSeMsmyProW754BSCfVyS6sCNFqblkYQ9Xqqns13JZQnmzoWwr280zjk
         tUjM30Aj5ZAolGjjklXxP4EC7VqUwKMMcUoLpnZU52WF7dHV+B/aKwz6JCJRM1IE3C2l
         CiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693559213; x=1694164013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CL2wZFAQ9DQMYKYYGQQIGah4zjC0ig67LMgG+Wt4f1Y=;
        b=Rj2rR4U36+x+z6fJHpBoYkCnecMyFnXw0GXXoYDq8lU3usntYXs+twdc+NLIsbWJKa
         yNpiaqaDbYUb7dVUdOtOrgSqMJ1CUuAhKRLI8X/veFmCKE30o6Zf0UUWj9/JlQA5yL5k
         5pqxXjkqgb5plqp52b/ER1VYvz0vD+YUq1ghny6Fa/g1ABgeV43muLdckAwaQh960zeZ
         0Lc/tduNGZ5/2FxzBoFcJl13cwU0mEttbJKRznyFrQV6uxMl92FGBrsI2cZeIJLQrwqA
         XZ6nXi0Ls8Xn5IeCk/KFlVZO0zD1QCDYdXWnEAFqOP4Wbb+3PvOJXMhBI7qCTAshW0oi
         1R4A==
X-Gm-Message-State: AOJu0Yx3N+J9C5GZXHcPLKJqLrkXnw6+3c7rtR1AcKR0KZnfytHllE4z
	scKk4CnF0c2XkMatwpsHPEzRBQ==
X-Google-Smtp-Source: AGHT+IFgycuMFi2b9nbCWqWNuNSEcE07Zi45QXIvtjzYup3K8uPK4QvdgSYexfoBzJlc6i5xrD3o3g==
X-Received: by 2002:a17:907:75fa:b0:9a5:7ade:b5e8 with SMTP id jz26-20020a17090775fa00b009a57adeb5e8mr1170613ejc.10.1693559213457;
        Fri, 01 Sep 2023 02:06:53 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id e7-20020a170906248700b009920a690cd9sm1727779ejb.59.2023.09.01.02.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Sep 2023 02:06:52 -0700 (PDT)
Message-ID: <cfa55813-946e-7aad-b7a4-54450a1ea5d5@linaro.org>
Date: Fri, 1 Sep 2023 11:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 4/5] dt-bindings: soc: loongson,ls2k-pmc: Allow
 syscon-reboot/syscon-poweroff as child
To: Binbin Zhou <zhoubinbin@loongson.cn>, Binbin Zhou
 <zhoubb.aaron@gmail.com>, Huacai Chen <chenhuacai@loongson.cn>,
 Yinbo Zhu <zhuyinbo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, loongson-kernel@lists.loongnix.cn,
 soc@kernel.org, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Xuerui Wang <kernel@xen0n.name>, loongarch@lists.linux.dev
References: <cover.1693474728.git.zhoubinbin@loongson.cn>
 <38e811816c37a2d52374fa04864654ff1e9b4dc8.1693474728.git.zhoubinbin@loongson.cn>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <38e811816c37a2d52374fa04864654ff1e9b4dc8.1693474728.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/08/2023 13:43, Binbin Zhou wrote:
>  required:
>    - compatible
>    - reg
> @@ -54,4 +66,18 @@ examples:
>          interrupt-parent = <&liointc1>;
>          interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
>          loongson,suspend-address = <0x0 0x1c000500>;
> +
> +        syscon-reboot {
> +            compatible = "syscon-reboot";
> +            offset = <0x30>;
> +            mask = <0x1>;
> +        };
> +
> +        syscon-poweroff {
> +            compatible = "syscon-poweroff";
> +            regmap = <&pmc>;

???

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

