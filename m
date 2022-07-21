Return-Path: <SRS0=i+5e=X2=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED3EC433EF
	for <soc@archiver.kernel.org>; Thu, 21 Jul 2022 07:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CE6D9C341CB; Thu, 21 Jul 2022 07:11:39 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13681C341C0
	for <soc@kernel.org>; Thu, 21 Jul 2022 07:11:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13681C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id m9so751880ljp.9
        for <soc@kernel.org>; Thu, 21 Jul 2022 00:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=VBDe4gorRUprlTmBClJI/DlecJjKNCX0yBbr1Si/Kq4=;
        b=UY8lpCxmvbtL/toGtsqltQnAwxXPAPj/BCPbeGrIolwMwllrvM9dWaWjlPyDIKSFQR
         N8A4f2HAiYO7ETqOVF6xYsfX8YcjEL2Ts5VkzkYYcT6bbgiSF/5xTTJcb48nsn1wYTtC
         3tT1PfchNwMIwVobbX17i2WWsNDAe+okLqFBmvAM5WT1vZMy5siVrVW/I02HtMI4zaFd
         SpeZPF9BpsR1vPBEwDoJVjQleSxqTT+xjGj113pcLEyxUfRFq4xFnS0bm/GboRE10dI0
         I/x5/rrcTMDs/IT7G0+IUi7cSCbkXZR6BiIfInjMFX/BGD8oKFmWlHMGNLCL+u5EKu+c
         SRVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VBDe4gorRUprlTmBClJI/DlecJjKNCX0yBbr1Si/Kq4=;
        b=qyputABknecNsbIi3khorD+amW3BjLR3LXumsvM2BUK3fVRRUsXlpEFKYjuaVAdLzC
         wyC7jDfnSZoTfsLhXiNZfU+fwwPpcJPJ1vm3FYvbNv/kOpMrEr2btycWiqpjB1IzZNxo
         mtdlLBbv3dhV2hFF14uXgBeRurYSVbILsdorOH+ZQwuDs4J4Lm/5m+I/7iusd6r52A/8
         hWLyllsqtgicVOSMqehq2Qo0G6cTB1FwyjegFZpAgbxgittnAD7PkRSTXZWntn/d059+
         LqaG+MZeVfMU03KzmXGbtOFSG1sRDOJliK6kXCsCCrZ1/tlAiZYeUqH7epaNVUBbQARh
         aa0Q==
X-Gm-Message-State: AJIora+MjdAXPKUtWUjVXrF7TJQGaeU586BDnvx9+0Ty5+gTJuX/fk1j
	qiocH9EdREzNy3epVj4K1mAMpA==
X-Google-Smtp-Source: AGRyM1sP/W0gXXiVd0E1gcpliLF83/mwjurfkbq28/xa3UPvrWoPr9+eLGizH6pNBoPYCugtoCbZfQ==
X-Received: by 2002:a2e:a287:0:b0:25d:b515:430c with SMTP id k7-20020a2ea287000000b0025db515430cmr9235376lja.358.1658387496614;
        Thu, 21 Jul 2022 00:11:36 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id 23-20020ac25f57000000b0048159b43083sm255519lfz.201.2022.07.21.00.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 00:11:36 -0700 (PDT)
Message-ID: <174eaacb-27e6-0ce3-3a27-07137a4d1a0d@linaro.org>
Date: Thu, 21 Jul 2022 09:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: aspeed: document Ampere
 Mt.Mitchell BMC compatibles
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Quan Nguyen <quan@os.amperecomputing.com>, openbmc@lists.ozlabs.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 Open Source Submission <patches@amperecomputing.com>
Cc: Phong Vo <phong@os.amperecomputing.com>, thang@os.amperecomputing.com
References: <20220720085230.3801945-1-quan@os.amperecomputing.com>
 <20220720085230.3801945-2-quan@os.amperecomputing.com>
 <0a5cbaaa-565a-7215-5e31-12c52f4bbcbd@linaro.org>
 <4516d7a6-f493-aa51-2700-bbab8ea8533a@os.amperecomputing.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4516d7a6-f493-aa51-2700-bbab8ea8533a@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/07/2022 04:46, Quan Nguyen wrote:
> 
> 
> On 20/07/2022 17:34, Krzysztof Kozlowski wrote:
>> On 20/07/2022 10:52, Quan Nguyen wrote:
>>> Document Ampere Mt.Mitchell BMC board compatible.
>>>
>>> Signed-off-by: Quan Nguyen <quan@os.amperecomputing.com>
>>
>> Thank you for your patch. There is something to discuss/improve.
>>
>>> ---
>>> v2:
>>>    + Introduce in v2 to add Ampere Mt. Mitchell BMC compatible [Krzysztof]
>>>
>>>   Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>>> index d61408194998..b8146d5c4431 100644
>>> --- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>>> +++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
>>> @@ -71,6 +71,7 @@ properties:
>>>             - enum:
>>>                 - aspeed,ast2600-evb
>>>                 - aspeed,ast2600-evb-a1
>>> +              - ampere,mtmitchell-bmc
>>
>> Put the entry ordered alphabetically.
>>
> 
> Thanks Krzysztof for the review.
> 
> Will change to :
>               - enum:
>   +              - ampere,mtmitchell-bmc
>                  - aspeed,ast2600-evb
>                  - aspeed,ast2600-evb-a1
> 
> But, should we correct the below as well? ie: to move 
> "ampere,mtjade-bmc" to before "aspeed,ast2500-evb" ?
> 
Oops, indeed, I added aspeed in wrong place. I'll correct it in my tree.

Best regards,
Krzysztof
