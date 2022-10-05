Return-Path: <SRS0=G+i8=2G=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E09CC433F5
	for <soc@archiver.kernel.org>; Wed,  5 Oct 2022 15:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11047C433D7; Wed,  5 Oct 2022 15:02:52 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F3EC2C433C1
	for <soc@kernel.org>; Wed,  5 Oct 2022 15:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org F3EC2C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id d6so11819160lfs.10
        for <soc@kernel.org>; Wed, 05 Oct 2022 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=94mwMcPTU0fA4GC+JR+9ZWgjXzSQUOmYw33Hhdzn4ZY=;
        b=utnjQ6UduXlYMm84LFM1+C53Zd4+3CYWVgEibonC+mKvHo+QrpQNKpr6nfrkn3pdY+
         7sOsaDoI5FAkzd40PI7MUVWG8C8wk+ON1W4Fygngosg8LU5l5LSA0nSk0jisnnansQgh
         Ov3PcDgglKHzvxqQS+INU8gDqGh1Z1XW/YXM7EtBHQ8e4i43HqL9FxitMtXNyZTNIsV/
         RFhNp/wQwfBveHuDbg3wlzSU+M2tVoFdX4lm9uZtvd+Zj1gSnlT8rBnb6LoNTi2om1Z3
         AWVcHcEnJOoMkFI+n04+VIwVz1cMlasKLKrLjgHv7xf1B2QfnPTTOwTe/q+yLPedGquv
         /F3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=94mwMcPTU0fA4GC+JR+9ZWgjXzSQUOmYw33Hhdzn4ZY=;
        b=jFx3N2SG5FOGGMSFsAfVCi6qYmdl7kKAouodYU3deEBCpKyrKhQDqBpIvEdfxTxHNg
         U7iAaJc0IWrrKn2zte/STuFb1VVX0SryPDQO/2zmzxWLYkYxzNPNH2SvGkji99JCqwmk
         Td4B5yNIOaOaOJn9x+9YQzBf9925xrqEejHsJTm0t8UlxGKP1vNrZiexv9jJh49Vd417
         uZ1TVTBReLPzkEGKyjJ4E0FHod95ID3fWOxiPWLUy/+cX4y3u6eGX774He/H/K7z/SZv
         a1/jo0EeNX6R+xkdmwIDKr7uCmj3a+um76f8vHJdPfvCxJRR2qZPBykGcz8J3vo27o03
         6L1A==
X-Gm-Message-State: ACrzQf1JHWfoSiXkpv2/Qc2ah1Z/bDlBdIJxzYleGzQfQAFnzcSNHAph
	j8v7TMQOa9+p6VKpJ+BVy526tw==
X-Google-Smtp-Source: AMsMyM68CmHG8MAbjGQCkuqDxcQYTAxCVd79Bsg/zhnTRlr1jiMxC2JAlMKCjvGfJEcUGXlkG0MctA==
X-Received: by 2002:ac2:5b10:0:b0:4a2:5c4b:100c with SMTP id v16-20020ac25b10000000b004a25c4b100cmr91556lfn.406.1664982167969;
        Wed, 05 Oct 2022 08:02:47 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k6-20020a2eb746000000b0026a92616cd2sm887853ljo.35.2022.10.05.08.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Oct 2022 08:02:47 -0700 (PDT)
Message-ID: <6f11e588-c899-8d5d-1ef1-22535d251901@linaro.org>
Date: Wed, 5 Oct 2022 17:02:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH] greatlakes: dts: Add Facebook greatlakes (AST2600) BMC
Content-Language: en-US
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>,
 "joel@jms.id.au" <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: "patrickw3@fb.com" <patrickw3@fb.com>, "garnermic@fb.com"
 <garnermic@fb.com>, Delphine Chiu/WYHQ/Wiwynn <DELPHINE_CHIU@wiwynn.com>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andrew Jeffery <andrew@aj.id.au>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
 Bonnie Lo/WYHQ/Wiwynn <Bonnie_Lo@wiwynn.com>
References: <20220915072304.1438-1-Bonnie_Lo@Wiwynn.com>
 <10176630-3ff7-54f7-8836-779e5a2bf6d4@linaro.org>
 <HK0PR04MB3105F759F43FEDE24C24FB3AF84C9@HK0PR04MB3105.apcprd04.prod.outlook.com>
 <61de4c6c-84e9-345a-495d-4d44d9351d84@linaro.org>
 <HK0PR04MB3105AE7BA97942C160A6939AF85D9@HK0PR04MB3105.apcprd04.prod.outlook.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <HK0PR04MB3105AE7BA97942C160A6939AF85D9@HK0PR04MB3105.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/10/2022 10:43, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>> On 20/09/2022 09:45, Bonnie Lo/WYHQ/Wiwynn wrote:
>>> Hi Krzysztof,
>>>
>>> I revise the device tree as following and resend the mail.
>>> It create a new mail thread " [PATCH] ARM: dts: aspeed: greatlakes: Add
>> Facebook greatlakes (AST2600) BMC".
>>> Kindly to correct me, if there is any problem.
>>>
>>>> Use subject prefixes matching the subsystem (git log --oneline -- ...).
>>>>
>>>>>
>>>>> Add linux device tree entry related to greatlakes specific devices
>>>>> connected to BMC SoC.
>>>>
>>>> Please wrap commit message according to Linux coding style /
>>>> submission
>>>> process:
>>>> https://apc01.safelinks.protection.outlook.com/?url=https%3A%2F%2Feli
>>>>
>> xir.b%2F&amp;data=05%7C01%7CBonnie_Lo%40wiwynn.com%7Ca2eecb3c2d
>> ff4eff
>>>>
>> 361b08da9ae190fd%7Cda6e0628fc834caf9dd273061cbab167%7C0%7C0%7C6
>> 379925
>>>>
>> 90848633103%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI
>> joiV2luM
>>>>
>> zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=MJn
>> u2iv19
>>>> dvbcMH7SJSExKOFV18dUtGRFSKO6Au2tFg%3D&amp;reserved=0
>>>>
>> ootlin.com%2Flinux%2Fv5.18-rc4%2Fsource%2FDocumentation%2Fprocess%2
>>>>
>> Fsubmitting-patches.rst%23L586&amp;data=05%7C01%7CBonnie_Lo%40wiw
>>>>
>> ynn.com%7C1dee8dcb540a49522fb608da98cdba6f%7Cda6e0628fc834caf9dd
>>>>
>> 273061cbab167%7C0%7C0%7C637990306620286314%7CUnknown%7CTWFp
>>>>
>> bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
>>>>
>> 6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=mC2E3dJbuYgXklS%2Fw8s2w%2
>>>> BKH%2BZ3CsZSndFTgPBjyvpw%3D&amp;reserved=0
>>>>
>>>
>>> I have add " ARM: dts: aspeed: greatlakes:".
>>>
>>>>>
>>>>> Signed-off-by: Bonnie Lo <Bonnie_Lo@wiwynn.com>
>>>>> ---
>>>>>  arch/arm/boot/dts/Makefile                    |   1 +
>>>>>  .../dts/aspeed-bmc-facebook-greatlakes.dts    | 248
>>>> ++++++++++++++++++
>>>>
>>>> Missing documentation of board compatible (bindings) as first patch.
>>
>> Why did you ignore it?
> 
> We need to look at this more. There might be something under the Documentation tree.
> Could you guide us an example for adding the document?

https://lore.kernel.org/all/?q=s%3A%22dt-bindings%3A+arm%3A%22

Fix your email server so it won't add footers making open-source
collaboration not possible. You said that this email "contains
proprietary or confidential information", therefore it is not suitable
for open-source discussions.

Best regards,
Krzysztof

