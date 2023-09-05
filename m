Return-Path: <SRS0=BZlG=EV=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D904C83F2C
	for <soc@archiver.kernel.org>; Tue,  5 Sep 2023 10:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 06322C433CA; Tue,  5 Sep 2023 10:38:37 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D5531C433C9
	for <soc@kernel.org>; Tue,  5 Sep 2023 10:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D5531C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-98377c5d53eso335883866b.0
        for <soc@kernel.org>; Tue, 05 Sep 2023 03:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693910314; x=1694515114; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4WKpCpzUJa8iRluzL4OMCEUy6exJH98L6niCS735SFI=;
        b=QqHghr6clz+uMJGGNx/+rBJQlSmBIdWHiIfU/MHOlCnjHeSIgZLjP/BcFZ+yb5p59s
         ynxLTEJpLT+O9Qp75k4udwway70ArCBWaQhMjGHMODTS/d2OguyjhSZ+XHPi8UmdPbn9
         3bcso8ehuwxnJv9Ayx+bNiDVC6ZchxLQYs/xBZ9XcdtkTGEfJbmZC5m7JCwwVip32xLw
         36ZINonVrarnPQjVOVlHaG0yyDDXsDf1/qdmPK6WksTQ/c7sMvJ65wu/8gh1zmJymwXC
         8gxZTONBOIAJu8hRk825NtjEbvixPhmFtpOvb/AF9bxKQtutgY8Y5mGHN6DhKqJpS4xK
         7yyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693910314; x=1694515114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4WKpCpzUJa8iRluzL4OMCEUy6exJH98L6niCS735SFI=;
        b=l46I2fKY/9+MMdiCVkpYwZ32ZD2hmirr+TkFFzlbNy2+6WFUp2uRqdCRcvwa4yMp+Y
         5FM6APKR1SMmFk8qbq6pXeC6Lzi2+7Rgo9DPDa8G0Leb/m16kiL/Tt7XkTcxczTgjrYN
         /ZSCtpLlw3u1T0fc9tWESh+TVVK6Xjv55FOONoaaG4yi2r1A7dCCw6UIXzhl6MGC+mIg
         Qw9ZphqhTr9Cbwc4CrKlPHHRMkOReaEjcapfIERF7A1Ofx2ERRoVjOs9NAqGbln424BA
         eGzprGNwNAe5DEkBNS78VZak/UrRLnymc1nU2ED/VXuKx3pphvb6QVOwyn7wWJxZlgl2
         4L5Q==
X-Gm-Message-State: AOJu0YxJU+j13W3EfNBfjsfa4vhw66MH4oXL0Cyg6A/Zs4gU4pxBs1fF
	34etrjySLeKBcZPLqozmWhNJaw==
X-Google-Smtp-Source: AGHT+IGDPbqZkn81hlAaihoCBFF4Kq/KErYZluh4+aPmtASgvaAQ5tkK7GxPPmEKCJnHVZaZn7mygQ==
X-Received: by 2002:a17:906:319a:b0:9a5:d095:a8e4 with SMTP id 26-20020a170906319a00b009a5d095a8e4mr8946249ejy.1.1693910313669;
        Tue, 05 Sep 2023 03:38:33 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id ss22-20020a170907c01600b00992e14af9c3sm7437367ejc.143.2023.09.05.03.38.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 03:38:33 -0700 (PDT)
Message-ID: <a0f0ab97-2333-542a-327f-f5711136b35a@linaro.org>
Date: Tue, 5 Sep 2023 12:38:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: PeterYin <peteryin.openbmc@gmail.com>, patrick@stwcx.xyz,
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <18b78489-6a12-a09f-620d-985be747f9da@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/09/2023 11:55, PeterYin wrote:
> 
> On 8/30/23 17:44, Krzysztof Kozlowski wrote:
>> On 30/08/2023 11:02, peteryin wrote:
>>> Add linux device tree entry related to
>>> Minerva specific devices connected to BMC SoC.
>>>
>>> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
>> To clarify: your full name or known identity is "peteryin"?
>>
>>> ---
>>>   arch/arm/boot/dts/Makefile                    |   1 +
>>>   .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 385 ++++++++++++++++++
>>>   2 files changed, 386 insertions(+)
>>>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
>>>
>>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>> index 9e1d7bf3cff6..edb0b2105333 100644
>>> --- a/arch/arm/boot/dts/Makefile
>>> +++ b/arch/arm/boot/dts/Makefile
>>> @@ -1604,6 +1604,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>>   	aspeed-bmc-facebook-wedge400.dtb \
>>>   	aspeed-bmc-facebook-yamp.dtb \
>>>   	aspeed-bmc-facebook-yosemitev2.dtb \
>>> +	aspeed-bmc-facebook-minerva.dtb \
>> Nothing improved here.
>>
>>>   	aspeed-bmc-ibm-bonnell.dtb \
>>>   	aspeed-bmc-ibm-everest.dtb \
>>>   	aspeed-bmc-ibm-rainier.dtb \
>>
>>> +	"","","","","","","","",
>>> +	/*O0-O3 line 224-231*/
>>> +	"","","","","","","","",
>>> +	/*O4-O7 line 232-239*/
>>> +	"","","","","","","","",
>>> +	/*P0-P3 line 240-247*/
>>> +	"","","","","","","","",
>>> +	/*P4-P7 line 248-255*/
>>> +	"","","","","","","","";
>>> +};
>>> +
>> Nor here.
>>
>> This is a friendly reminder during the review process.
>>
>> It seems my previous comments were not fully addressed. Maybe my
>> feedback got lost between the quotes, maybe you just forgot to apply it.
>> Please go back to the previous discussion and either implement all
>> requested changes or keep discussing them.
>>
> Could you please clarify for me?
> 
> Are you asking if the last line should not have a blank line, or I can't 
> set a comment for the sgpio line like this:

6 or 7 versions ago I said:
"Still redundant blank line."
so it is about stray blank line.

https://lore.kernel.org/all/9f499fe5-db59-f4c8-6a50-93725b7287fd@linaro.org/

Best regards,
Krzysztof

