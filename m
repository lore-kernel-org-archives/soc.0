Return-Path: <SRS0=/aL8=DH=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52347EB64DC
	for <soc@archiver.kernel.org>; Fri, 21 Jul 2023 07:55:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 37375C433C7; Fri, 21 Jul 2023 07:55:12 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 54A8FC433C8;
	Fri, 21 Jul 2023 07:55:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 54A8FC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-666eb03457cso1120158b3a.1;
        Fri, 21 Jul 2023 00:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689926110; x=1690530910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5xW1jRQSZihGEtMJPZeQmnAS3v2SxkbZcL5e7ETIR+0=;
        b=i87Mf0HStvpFjpfG/RzgKDWpiKNE7zgQ3mdRwkTLfdHvA7yZRr64WZYhO7GfciUaE8
         Bn5RYK0RaQ1sE324Kp1NVHg2DU4tv5jkmJGfNtX38GHFyhGkLvRhMu7ivVtFNr+c4kVw
         E+uHgn1wPatvF9Dw3HQ8W+axpB29bnCE1myI20FARQ51yshgE+3g1Uht270Kkh9MdrDJ
         cUY8oY2CYqGyzGrSerfWHSa8vDRRfzWgC39jzZjoBNioFkJjoACePKNI0amKkpQBc9bn
         rZPBaKfEda4J/hoWEZMVOtJRjvpKq2KJmUovHK8RVU1HhKWDgTJNDoUsx6jXNK+1Ogwo
         glgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689926110; x=1690530910;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5xW1jRQSZihGEtMJPZeQmnAS3v2SxkbZcL5e7ETIR+0=;
        b=GdKjXxYIYgwKw+y6O5rbJ35HkH3OC5On49iSZzx59HAJ7wU8H3v1WVLZijcMPO/rM/
         C6SlIWQHAfuARTPGXKiNBuiW/TvgT4nV3CWduEw+jzLgyeEFyLIdHH5NyYdPrEfPzGPU
         jv3BXjAayP/F2SejfeJ1ngbI47zr3lDHU7VHSuEfghNltxmkp0KOy/y6k0KVkCiZrw6q
         4BKi8lWgMJk2klaplGgZT8ozTePZq3h/Zguhyxi2C2D1L99BVeflcn4TkBAhKdO2EJYE
         8FchZoKxw/Z69i9Ok2hRRCMl6/qyrFZdhL1H3Nuv6GBSAqIIFkZMyqAhVN2ZuZ0uuQ2t
         P4kA==
X-Gm-Message-State: ABy/qLb3KIHTPtwJ7wbR9ToVRcVSFxIdJVzPDKn0YI9tkgjgzAYgJYuT
	M9bSGh9PcajciidtAPQ6Dx0=
X-Google-Smtp-Source: APBJJlFF4Iz9CsoLhkHQ2KETwbX5uXeLZIrl23phg9ovDuqpAxWBDtOWbXu5KHlKpF9x+RGF+XoQXw==
X-Received: by 2002:a05:6a20:96d3:b0:133:b0d5:b3fc with SMTP id hq19-20020a056a2096d300b00133b0d5b3fcmr954086pzc.7.1689926110426;
        Fri, 21 Jul 2023 00:55:10 -0700 (PDT)
Received: from [172.19.1.47] (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id c2-20020a170902d90200b001b9ff5aa2e7sm2755789plz.239.2023.07.21.00.55.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 00:55:10 -0700 (PDT)
Message-ID: <e2d76107-5b25-c3ce-8741-50b0f0498284@gmail.com>
Date: Fri, 21 Jul 2023 15:55:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] dt-bindings: rtc: Document nuvoton ma35d1 rtc driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 soc@kernel.org, mjchen@nuvoton.com, schung@nuvoton.com,
 Jacky Huang <ychuang3@nuvoton.com>
References: <20230720012826.430026-1-ychuang570808@gmail.com>
 <20230720012826.430026-2-ychuang570808@gmail.com>
 <7889ef36-90ee-222b-fe67-ab4e127d1df6@linaro.org>
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <7889ef36-90ee-222b-fe67-ab4e127d1df6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2023/7/20 下午 02:10, Krzysztof Kozlowski wrote:
> On 20/07/2023 03:28, Jacky Huang wrote:
>> From: Jacky Huang <ychuang3@nuvoton.com>
>>
>> Add documentation to describe nuvoton ma35d1 rtc driver.
>>
>> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
>> ---
>>   .../bindings/rtc/nuvoton,ma35d1-rtc.yaml      | 45 +++++++++++++++++++
>>   1 file changed, 45 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
>> new file mode 100644
>> index 000000000000..08c30f3018fb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/nuvoton,ma35d1-rtc.yaml
>> @@ -0,0 +1,45 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/rtc/nuvoton,ma35d1-rtc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 Read Time Clock
>> +
>> +maintainers:
>> +  - Min-Jen Chen <mjchen@nuvoton.com>
>> +
> Missing ref to rtc.yaml.
>
>
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - nuvoton,ma35d1-rtc
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +
>> +additionalProperties: false
> And then use unevaluatedProperties: false instead.
>
>
> Best regards,
> Krzysztof
>

Thank you for the advice.
I will fix these two issues in the next version.


Best Regards,
Jacky Huang

