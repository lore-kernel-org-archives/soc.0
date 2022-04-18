Return-Path: <SRS0=Kfe6=U4=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75930C433F5
	for <soc@archiver.kernel.org>; Mon, 18 Apr 2022 12:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5D131C385AC; Mon, 18 Apr 2022 12:11:39 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 957DEC385A1
	for <soc@kernel.org>; Mon, 18 Apr 2022 12:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 957DEC385A1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id k23so26505823ejd.3
        for <soc@kernel.org>; Mon, 18 Apr 2022 05:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=+Nbh/Prc/5H/cORCat6vWbX6y9/y12F3+R8EiMn4z8U=;
        b=Dm4XMjPYCtdWA3+pMzuuvBgBW44TWQH3InrfQd1a0hq7Ob49UlvwiCHAN4ZWvJ2y2q
         +yzvclbmmfLi8ARs9lokw+4HyAR4OfObvE+VJm1/QHMoG8/6c73qAkgTz3aC8v29MHz7
         qVaiWh5oclYzdnwqFl/v0Kdtyjc33wAKTtZBwPgH+dP75Zei0myGjOASKfxImNlyCHXi
         x6yFw94J3CaPW2OBnqLltUmOjDHvVj9PyIdhil2JglCu/pso0MDmodEaDLL0QCVnq2AB
         NZMS5jHhb5h4lNtVobaLz4MrJm3uiX64/3mkg2BeGQG7KiQC50PvFPOt3j1FcgFhI71w
         ur7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=+Nbh/Prc/5H/cORCat6vWbX6y9/y12F3+R8EiMn4z8U=;
        b=gIaaqsofhvnjeHpx/h2ZdLIAzu27kBUdyY9UMCy84SlWQ8YBgqH3yx+1B2+fzDJKKt
         XxlzqvBeT0LWZWFsgye8fJa4LzeVqbka0X8T2e5PV3aUeFJNBjoV6SMGUnW8vKiBdEp9
         GfdqrnNAW1NMDO3Cx0ninRJud1nIiRnSnN2IzeMwCnCk2LyPgY5+1+BccO9Mhibhei7+
         mNPvzD1Zc/akji0ZqlG6ZRga7KT85VaQEpF6s7dPsGqFUBjxpT/GQytZ7vPGP46K+HMJ
         hF8JMgHTTbYqaNIDsuiLVrwotTduZBrWYlKMLfG8GvckrmfucRqri8wWR0PD3JuBoHp4
         n4iQ==
X-Gm-Message-State: AOAM530FIZZ4Syl7GaTL/7+dFfBOuc8GhAr7UzxoDmzrWbu3tZB5b4Xf
	3GEoJVY1/SrW0odq9kphIZnAPw==
X-Google-Smtp-Source: ABdhPJxwyW9e6YDW1vaDtAloi25ghlPcrr65ZHDnvPjhycYnJSWeOGX1Kex17Bi6It3cYwT7mCnGZA==
X-Received: by 2002:a17:907:60c9:b0:6e8:ae9e:d052 with SMTP id hv9-20020a17090760c900b006e8ae9ed052mr8666429ejc.628.1650283896988;
        Mon, 18 Apr 2022 05:11:36 -0700 (PDT)
Received: from [192.168.0.217] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h9-20020aa7c949000000b0041b4d8ae50csm6861903edt.34.2022.04.18.05.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Apr 2022 05:11:36 -0700 (PDT)
Message-ID: <fd9316a6-7df6-e1fa-50dc-ff50934afb5c@linaro.org>
Date: Mon, 18 Apr 2022 14:11:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 5/5] dt-bindings: arm: Add initial bindings for Nuvoton
 Platform
Content-Language: en-US
To: Jacky Huang <ychuang3@nuvoton.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, ychuang570808@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, arnd@arndb.de,
 olof@lixom.net, will@kernel.org, soc@kernel.org, cfli0@nuvoton.com
References: <20220418082738.11301-1-ychuang3@nuvoton.com>
 <20220418082738.11301-6-ychuang3@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220418082738.11301-6-ychuang3@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/04/2022 10:27, Jacky Huang wrote:
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    items:
> +      - enum:
> +          - nuvoton,ma35d1
> +          - nuvoton,ma35d1-evb
> +          - nuvoton,ma35d1-iot
> +          - nuvoton,ma35d1-som512
> +          - nuvoton,ma35d1-som1g

This does not match your DTS and does not look reasonable (SoC
compatible should not be part of this enum). Check some other board
bindings for examples.


Best regards,
Krzysztof
