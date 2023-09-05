Return-Path: <SRS0=//03=EV=gmail.com=peteryin.openbmc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC940C83F3E
	for <soc@archiver.kernel.org>; Tue,  5 Sep 2023 15:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F130C433C8; Tue,  5 Sep 2023 15:21:20 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6E1DDC433C7;
	Tue,  5 Sep 2023 15:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6E1DDC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-268bc714ce0so2272178a91.0;
        Tue, 05 Sep 2023 08:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693927278; x=1694532078; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tl1B7J0NnXr4SILiYpt6+iuxshEs/q2lTGYJqQ90wVE=;
        b=LLSRtzNpOPXhPytxUyTa1iXEk7Niz0Q6XD19pogtzut1RSaMS8ovmWoMw1NnDlQ4jx
         9h4M3SzVEBCiQLO+EeqsE11994FLdY+freHfGTlz9x+UWq7tj0CBwLA/x+XqrSM/WlmL
         93pu9kWYnU1LTp1uiE05BBO3/7jS0qT98VasBWMKHVC/vzYHt08xqesiWXosQusGO9sU
         yHnsuq8NWvyyDu82k2zDeZMdFlqJp4qwF5jaGlSzQoBAvXsK1/xeDUzU+8wEOMCweMxP
         aurr19ZbcnbQiwGmdNWzD9trAEnloZnFKUt2LAIGxqUKjLtJkOeyiYi+2v5Ota6ZOD3A
         Oimg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693927278; x=1694532078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tl1B7J0NnXr4SILiYpt6+iuxshEs/q2lTGYJqQ90wVE=;
        b=Vc6NNWPQwXvLfOu3phEBl3hBD5+/5c5XcY77YjMTjSdPFcoZmP38UWgJlYRjcX6mzx
         PxcDi0rRV4ZiL+ec0Iz8BxYVhHtWOjYgrS71/91osL+7dv1AnwyrXCF76oU13XpN9mWb
         I0HgxBNR3r87625LN59Ae2mktzlqtnpzgE1cX6XTnT3fi1I6dsKmDFBwFmEGqepHi5Z7
         dFjZFUoN0i16sv7M6z0y0fmkq+hPLVbFZmtNfAVJX/ayvrggVd6soULZ02881foWzbLW
         RVTxB4MladcBS4wf6/2zafIbnAPGRzIaFeeTYu+JuZe7Hl79zjFbj024/7PEdbjWKt1H
         Lt4A==
X-Gm-Message-State: AOJu0YyXv7rDy/mSjEHc3OToUhuBfihaZ0q1S8d/iHZsNVLzCkA1AV04
	Z3TC2bJp9tTg9sS/Kj8W0eaGvFVjr7BhfQ==
X-Google-Smtp-Source: AGHT+IHX/TdJ+yKBQpB3iWV5gCGpHJhkVqqjhuGJUNPhKasBAK7ZbJ2f9CazW+5woOqUfHNU7tih/w==
X-Received: by 2002:a17:90a:ff05:b0:26f:6f2a:a11 with SMTP id ce5-20020a17090aff0500b0026f6f2a0a11mr17587394pjb.12.1693927278451;
        Tue, 05 Sep 2023 08:21:18 -0700 (PDT)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id q14-20020a170902788e00b001bc930d4517sm9506745pll.42.2023.09.05.08.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 08:21:18 -0700 (PDT)
Message-ID: <0a7755e4-1d6a-1f35-6826-cd54b46f0fea@gmail.com>
Date: Tue, 5 Sep 2023 23:19:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, patrick@stwcx.xyz,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: cosmo.chou@quantatw.com, potin.lai@quantatw.com, daniel-hsu@quantatw.com
References: <20230830090212.3880559-1-peteryin.openbmc@gmail.com>
 <20230830090212.3880559-2-peteryin.openbmc@gmail.com>
 <b9cbe9be-b03e-6c7a-d06c-b75b012b5b25@linaro.org>
 <18b78489-6a12-a09f-620d-985be747f9da@gmail.com>
 <a0f0ab97-2333-542a-327f-f5711136b35a@linaro.org>
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <a0f0ab97-2333-542a-327f-f5711136b35a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 9/5/23 18:38, Krzysztof Kozlowski wrote:
> On 05/09/2023 11:55, PeterYin wrote:
>> On 8/30/23 17:44, Krzysztof Kozlowski wrote:
>>> On 30/08/2023 11:02, peteryin wrote:
>>>> Add linux device tree entry related to
>>>> Minerva specific devices connected to BMC SoC.
>>>>
>>>> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
>>> To clarify: your full name or known identity is "peteryin"?
>>>
>>>> ---
>>>>    arch/arm/boot/dts/Makefile                    |   1 +
>>>>    .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 385 ++++++++++++++++++
>>>>    2 files changed, 386 insertions(+)
>>>>    create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
>>>>
>>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>>> index 9e1d7bf3cff6..edb0b2105333 100644
>>>> --- a/arch/arm/boot/dts/Makefile
>>>> +++ b/arch/arm/boot/dts/Makefile
>>>> @@ -1604,6 +1604,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>>    	aspeed-bmc-facebook-wedge400.dtb \
>>>>    	aspeed-bmc-facebook-yamp.dtb \
>>>>    	aspeed-bmc-facebook-yosemitev2.dtb \
>>>> +	aspeed-bmc-facebook-minerva.dtb \
>>> Nothing improved here.
>>>
>>>>    	aspeed-bmc-ibm-bonnell.dtb \
>>>>    	aspeed-bmc-ibm-everest.dtb \
>>>>    	aspeed-bmc-ibm-rainier.dtb \
>>>> +	"","","","","","","","",
>>>> +	/*O0-O3 line 224-231*/
>>>> +	"","","","","","","","",
>>>> +	/*O4-O7 line 232-239*/
>>>> +	"","","","","","","","",
>>>> +	/*P0-P3 line 240-247*/
>>>> +	"","","","","","","","",
>>>> +	/*P4-P7 line 248-255*/
>>>> +	"","","","","","","","";
>>>> +};
>>>> +
>>> Nor here.
>>>
>>> This is a friendly reminder during the review process.
>>>
>>> It seems my previous comments were not fully addressed. Maybe my
>>> feedback got lost between the quotes, maybe you just forgot to apply it.
>>> Please go back to the previous discussion and either implement all
>>> requested changes or keep discussing them.
>>>
>> Could you please clarify for me?
>>
>> Are you asking if the last line should not have a blank line, or I can't
>> set a comment for the sgpio line like this:
> 6 or 7 versions ago I said:
> "Still redundant blank line."
> so it is about stray blank line.
>
> https://lore.kernel.org/all/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/

Thanks for your reply.

Do you mean that I should make corrections starting from this point in my 7?

from

&i2c15 {
 >-------status = "okay";
--blank line
 >-------// SCM FRU

to

&i2c15 {
 >-------status = "okay";
 >-------// SCM FRU


or I can't  add blank line before comment

from

+    "","","","","","","","",
+    /*O0-O3 line 224-231*/
+    "","","","","","","","",
+    /*O4-O7 line 232-239*/
+    "","","","","","","","",
+    /*P0-P3 line 240-247*/
+    "","","","","","","","",
+    /*P4-P7 line 248-255*/
+    "","","","","","","","";
+};

to

+    "","","","","","","","",
/*O0-O3 line 224-231*/
+    "","","","","","","","",
/*O4-O7 line 232-239*/
+    "","","","","","","","",
/*P0-P3 line 240-247*/
+    "","","","","","","","",
/*P4-P7 line 248-255*/
+    "","","","","","","","";
+};

If not, could you please provide guidance on the expected format?

Thanks.

> Best regards,
> Krzysztof
>
