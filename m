Return-Path: <SRS0=HpX/=3I=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DB7DC433FE
	for <soc@archiver.kernel.org>; Tue,  8 Nov 2022 15:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B514C433B5; Tue,  8 Nov 2022 15:08:11 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BB33C433C1
	for <soc@kernel.org>; Tue,  8 Nov 2022 15:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2BB33C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id b9so21543494ljr.5
        for <soc@kernel.org>; Tue, 08 Nov 2022 07:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dxuSjQQzX1RM95YkYXalJ1eZyx8ddLlbivHitTI2euw=;
        b=UDkV2KaRJwIbQGfRAf9vTI1RRf0tgbk7J70ljv4JduqyU7stB0Mnx+kzPaYRCqUU8C
         qkp5u7KSAw7jQML1Tfu3PliM8r+sZG18s4obfyG0o7U7LAPEC8jh9Uaa1d29JlIzEqbP
         GXS7dBE6yiKMSf8HDrSw/bo5qTOErtR99iHpsSVv8nY9v/Da4oko5bUtuhv2X/qkfnPv
         0BySFbxBIV316vZ2/uhD/qzDHg0bZnR3Q8X6fMZqyleh07c24IFp2ZbzgTezNJ361KiJ
         RGnVOCYCzM0wpIV1M653iX9Z3qQJrn03vbqbffY0OW+Ok5L+Wl6uAURiuGD1WLIyT3Tt
         qkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dxuSjQQzX1RM95YkYXalJ1eZyx8ddLlbivHitTI2euw=;
        b=uV7QSQgfyuFtI1jzjA8+mfAMDA2DT2S78J52RwbTVhvtlG8IfpU8g/RhjZhcHzo6Nn
         T9pvzMhMc3XeQMwSr+q3MRgNeBIav+Jconud5vjU/R4zyTRIaeurUs7cojvrTI57DmWO
         sotBNNLQRyXjlodkLiMQCz7uPL6DYdSvkOu52sm6p8wEYd2090pgrSonLeTod+LdjZ1S
         IHpEqGjWy+w7QiPfzxqWYzmLqYhRPQXDL7b/mXaw8sjrfxGUYvMqX7RXXLhrm2d/q+Oe
         mwq4de3DlhZPylVAqAUXG0gGpJ8rX7QNKO49299fmt4IBdxG22eUkOEnqVB5rroqwOL3
         09GQ==
X-Gm-Message-State: ACrzQf3tAR34R80sV82r8DNoObEXe20at5AKP7gvw5rttPx+xDZN+z3v
	8yNZEb71mfZam9A10El0T6kcBA==
X-Google-Smtp-Source: AMsMyM7koYXxWta2JrWEZEMkyOKz1kAmD5fKSddG0qWZ3clprpPepriJeX/xC31/PxrQgRAPOAXx5A==
X-Received: by 2002:a2e:8ecc:0:b0:277:34bb:ea2 with SMTP id e12-20020a2e8ecc000000b0027734bb0ea2mr6538534ljl.427.1667920088283;
        Tue, 08 Nov 2022 07:08:08 -0800 (PST)
Received: from [192.168.0.20] (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
        by smtp.gmail.com with ESMTPSA id cf36-20020a056512282400b0049313f77755sm1809536lfb.213.2022.11.08.07.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 07:08:07 -0800 (PST)
Message-ID: <784c5975-661a-c71c-1489-229ada0a4e72@linaro.org>
Date: Tue, 8 Nov 2022 16:08:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/5] dt-bindings: arm: uniphier: Add system controller
 bindings
Content-Language: en-US
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Masami Hiramatsu <mhiramat@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221107103410.3443-1-hayashi.kunihiko@socionext.com>
 <20221107103410.3443-2-hayashi.kunihiko@socionext.com>
 <48988a50-3c3d-7a85-af28-66f7842e5893@linaro.org>
 <3fcebf71-bdcb-8592-020c-4aa240a9e9a7@socionext.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3fcebf71-bdcb-8592-020c-4aa240a9e9a7@socionext.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08/11/2022 15:30, Kunihiko Hayashi wrote:
>>> +additionalProperties:
>>> +  type: object
>>
>> No, instead you should describe the children. This must me
>> additionalProperties: false
> 
> Each controller has different children, so need to define children
> for each controller using "if".

Then you should have different binding documents. Bindings should be
specific.

Best regards,
Krzysztof

