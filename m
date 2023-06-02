Return-Path: <SRS0=uson=BW=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 038BEC7EE29
	for <soc@archiver.kernel.org>; Fri,  2 Jun 2023 13:13:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9D92C4339B; Fri,  2 Jun 2023 13:13:46 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C8660C4339E
	for <soc@kernel.org>; Fri,  2 Jun 2023 13:13:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C8660C4339E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5147f7d045bso3007001a12.2
        for <soc@kernel.org>; Fri, 02 Jun 2023 06:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685711623; x=1688303623;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=57q4TdWvHlrEcIXeoi1W6gK5/9KE0SGJz/XNivOKPnk=;
        b=m9GaBMggEI20VXMLlKimzmXgfD2tFFpsgnDCnJnAzGBiSIil3R7xyTQsrSZ0tkBKQ2
         Dan82iwCSen/4Qc7ylIOt8DQXGEvhxbZlViE149oQ6jXGm0iWDn+RXA1eGo8J0vDX3Mc
         qYGzE3Tb04bFDQ5oz9hGJRnHjVJJgpU6m8ZmOe2V5iTi5SiokNy886+NLJrDVBOK+Wfq
         YrEoS1xUKfBU4khc/qPtsNsgb8BQAioPYPCu0YnueaAFfAUhR89gr80YqopukdfPwaHg
         zM4Ev9JbZ3Dtm1Asdwd8VYPDEs3pYrQ8nsOUW3nPQvLoqWmVbKq0aoIjDRmwnTj7Mog5
         7BPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711623; x=1688303623;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=57q4TdWvHlrEcIXeoi1W6gK5/9KE0SGJz/XNivOKPnk=;
        b=mGX3Ts0ZcPK7hfoHLUjRwhAYEvkhxRKXv/WNWz1XQ1dXPZlLS6Rd8X8r7jQiv3VwkY
         55zLQBwbaoVqbuC4Vc3fo6k+9T28INr+K8bT43Pma3+DCi5twcWSRA+vib5BtY8FYKPt
         pl48VYS4XT31eLij8BrjOmUgFWj9qo9iePNqJnFc2A+a1apo73UTznSKULT5FhLe6dgQ
         i2AtAZNVQpKfM/JHHJQUG+oTMKDgbKb2ufeio4y2+5yzYhxcnj7/8p3085yPk7xdH+gY
         jl793LSSgnjHnzVZwH/TEI8zaaXG18QGePmkmAJmXiOYbSCN3ysNQnGn4pg2Qn9F0biD
         2mUA==
X-Gm-Message-State: AC+VfDzXNftT/uWEIXyBL4ZlZh38RWoRDV5z31qP/YgOS5yNHF/Newpl
	MhoGRBxl1gAkwh92oZGsRQ1FKQ==
X-Google-Smtp-Source: ACHHUZ43d+sUWltwQzDiB3YR6CO9kaf0tCGFKY31o/sI7+FHsx2VcAbPoNydH2HsLkQ4RBU6XfW+uw==
X-Received: by 2002:a05:6402:205c:b0:50d:8979:5722 with SMTP id bc28-20020a056402205c00b0050d89795722mr1868357edb.39.1685711622721;
        Fri, 02 Jun 2023 06:13:42 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id a15-20020a50e70f000000b0050d83a39e6fsm682708edn.4.2023.06.02.06.13.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 06:13:42 -0700 (PDT)
Message-ID: <955b84da-7d7c-1a30-680f-530c7593643d@linaro.org>
Date: Fri, 2 Jun 2023 15:13:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 04/11] dt-bindings: stm32: add st,stm32mp25 compatibles to
 the stm32 family
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>,
 Conor Dooley <conor@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20230529162034.20481-1-alexandre.torgue@foss.st.com>
 <20230529162034.20481-5-alexandre.torgue@foss.st.com>
 <20230529-backlit-dealing-b099e4eb5210@spud>
 <c805cd5f-92b1-eb56-d9bc-66814705e848@foss.st.com>
Content-Language: en-US
In-Reply-To: <c805cd5f-92b1-eb56-d9bc-66814705e848@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30/05/2023 10:39, Alexandre TORGUE wrote:
> Hi Conor
> 
> On 5/29/23 20:05, Conor Dooley wrote:
>> On Mon, May 29, 2023 at 06:20:27PM +0200, Alexandre Torgue wrote:
>>> STM32 family is extended by the addition of the STM32MP25 SoCs. It is composed
>>> of 4 SoCs: STM32MP251, STM32MP253, STM32MP255 and STM32MP257.
>>>
>>> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>> index 4af5b8f4f803..7d7ca33d2e61 100644
>>> --- a/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/stm32/stm32.yaml
>>> @@ -161,6 +161,15 @@ properties:
>>>             - const: phytec,phycore-stm32mp157c-som
>>>             - const: st,stm32mp157
>>>   
>>> +      - items:
>>> +          - const: st,stm32mp251
>>> +      - items:
>>> +          - const: st,stm32mp253
>>> +      - items:
>>> +          - const: st,stm32mp255
>>> +      - items:
>>> +          - const: st,stm32mp257
>>
>> I assume the slightly odd format is just to avoid churn when adding
>> the board compatibles.
> 
> Yes, exactly.
> 

I don't get it. How are you going to extend it? Or rather - what are you
documenting here? If these are SoCs, then this is not valid. We do not
allow these alone.

No, please drop it.

Best regards,
Krzysztof

