Return-Path: <SRS0=yAmP=7C=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210A2C6FA99
	for <soc@archiver.kernel.org>; Fri, 10 Mar 2023 10:46:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E117DC433D2; Fri, 10 Mar 2023 10:46:50 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C324C433A0
	for <soc@kernel.org>; Fri, 10 Mar 2023 10:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1C324C433A0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id j11so18739493edq.4
        for <soc@kernel.org>; Fri, 10 Mar 2023 02:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678445207;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KQkIKHTqSRFxycgFJncBZ6qruloLEWGLx4Mzr1FPwK0=;
        b=YWeVjmN27CXtE27JtCd+rfW6I6wbiQ86OTH9owamL/1fTkN8J6ROvEMPH4Gv3PG94r
         XpeYP+Ld0iolsjgDCQZ//bHrSC67FlDCTewAypQb9HiivrdoASTiPBbF4Qgg4IkaGM+l
         cDBy3ZQoDFGXpAaJVg4G5AcanRxOjzDv47xe31DW0snxDleOsvufHpIVkzC1V06Osz0C
         yq+tBY3xfVML+VgDgJbaL4FPmp9GKdHP8tYwogOvB/7eTY3YFL6pmtc0P5O1Q3oYL9rQ
         A1ZamJhpjtiFp80mQgFOCY2UY5DOQQ7xzP1tV3DgLR/cjsUy1OlydZ84bWPNvPsb3l8z
         YHBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678445207;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KQkIKHTqSRFxycgFJncBZ6qruloLEWGLx4Mzr1FPwK0=;
        b=LHSMOpgbZdpUbGb+vOOW94uwED8LTJREeE+4RWV8KH9TSoaOzgjN3PMbfLJxDEpbdv
         Pi0DhKkKoqvYIfslIgiasywMQzRvSESVjOFfnlPnkS6jizpygfQboIQ1M40gjeyM94ZY
         PA3R+t1szfnKcp6mQTsVbhieb6WA8e96lGWOQ5Jm3ndAbw4rFMWt24s/dllr0zwC5EIN
         5SVdaV+EU0KSYqhvMmsSrHfaOeWN0iLs7YGnPE+20YRf6zNwFuTuDdQDgBspeXj+yl4b
         IRuMYraLgn+DxhU1e0mnJeHmCHj0ptgU3w8Bo/Ac/AtwBADedHBDxvKKaLwKf6onWnoK
         K+kA==
X-Gm-Message-State: AO0yUKV+l5FztSNGvOoeb+On/kGteabJTumi7pfvM5xhl8AVvwU3WHNT
	p4ff5E9fuA5lba4E5hwuB1/rrw==
X-Google-Smtp-Source: AK7set/JBfPGNe1lUH3w56wy9WPO/I94QYC3k3KIoV1A+ZXOpZ+UJYaPgCXK1zDRpsXttpBn+GE71w==
X-Received: by 2002:a17:906:2201:b0:8b1:347c:85c8 with SMTP id s1-20020a170906220100b008b1347c85c8mr25143448ejs.17.1678445207261;
        Fri, 10 Mar 2023 02:46:47 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:2a59:841a:ebc:7974? ([2a02:810d:15c0:828:2a59:841a:ebc:7974])
        by smtp.gmail.com with ESMTPSA id mf5-20020a170906cb8500b008de50990fa7sm806352ejb.21.2023.03.10.02.46.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 02:46:46 -0800 (PST)
Message-ID: <16bf991e-6b8a-2657-dedc-222ca6a7fd87@linaro.org>
Date: Fri, 10 Mar 2023 11:46:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 6/8] dt-bindings: ARM: fsl: Add chargebyte Tarragon
Content-Language: en-US
To: Stefan Wahren <stefan.wahren@i2se.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Evgeniy Polyakov <zbr@ioremap.net>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, Li Yang <leoyang.li@nxp.com>,
 Denis Ciocca <denis.ciocca@st.com>, soc@kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <stefan.wahren@chargebyte.com>
References: <20230306172249.74003-1-stefan.wahren@i2se.com>
 <20230306172249.74003-7-stefan.wahren@i2se.com>
 <a38cb5d4-91d3-0d9a-41d3-44fed9d39512@linaro.org>
 <3c5992f3-269f-8af5-0062-7653c53feffb@i2se.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3c5992f3-269f-8af5-0062-7653c53feffb@i2se.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/03/2023 11:08, Stefan Wahren wrote:
> Hi Krzysztof,
> 
> Am 07.03.23 um 09:24 schrieb Krzysztof Kozlowski:
>> On 06/03/2023 18:22, Stefan Wahren wrote:
>>> From: Stefan Wahren <stefan.wahren@chargebyte.com>
>>>
>>> This adds the compatibles for the chargebyte Tarragon boards.
>>>
>>> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>
>>> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
>>> ---
>>>   Documentation/devicetree/bindings/arm/fsl.yaml | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
>>> index dece3e9ba7fd..2b430e20a7a6 100644
>>> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
>>> @@ -781,6 +781,15 @@ properties:
>>>             - const: tq,imx6ull-tqma6ull2l      # MCIMX6Y2, LGA SoM variant
>>>             - const: fsl,imx6ull
>>>   
>>> +      - description: chargebyte Tarragon Boards
>>> +        items:
>>> +          - enum:
>>> +              - chargebyte,imx6ull-tarragon-master
>>> +              - chargebyte,imx6ull-tarragon-micro
>>> +              - chargebyte,imx6ull-tarragon-slave
>>> +              - chargebyte,imx6ull-tarragon-slavext
>>> +          - const: fsl,imx6ull
>> I don't think you put it in correct place. Didn't you just stuff it at
>> the end?
> 
> Yes, i just put it at the end. But to be honest, i'm not sure about the 
> order:
> 
> armadeus,imx6ull-opos6uldev
> ..
> dh,imx6ull-dhcom-drc02
> ..
> phytec,imx6ull-pbacd10-emmc
> ..
> toradex,colibri-imx6ull-aster
> ..
> kontron,bl-imx6ull
> ..
> tq,imx6ull-tqma6ull2-mba6ulx
> 
> Does the order depend on the compatibles and vendor is relevant?
> 
> So your expectation was between armadeus and dh?

This I don't know :). I think order was by description (name of board)
but maybe by compatibles.

Best regards,
Krzysztof

