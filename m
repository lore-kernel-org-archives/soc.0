Return-Path: <SRS0=//03=EV=gmail.com=peteryin.openbmc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26E6C83F3E
	for <soc@archiver.kernel.org>; Tue,  5 Sep 2023 09:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3407EC433BB; Tue,  5 Sep 2023 09:57:43 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 78810C433AB;
	Tue,  5 Sep 2023 09:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 78810C433AB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-68a42d06d02so1394751b3a.0;
        Tue, 05 Sep 2023 02:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693907859; x=1694512659; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9MXWXFgX5aFPhZ6qllDXEBQgIeC6Jxy5NEVmVqVP4Hs=;
        b=rnB9ibrZA8BR6GtnW+D8j14e+3b3oxHLu3OmIuQGHyzylWG9v4o+wFo7M+hMfSbwMn
         xsZnf3D4feUVDOLuZbsiONGQxUfJp8vKsFAKatDynzOGi16fzolr9Fz7fWNvSf9VzjP9
         bb/o4aK0lq87zTNo1/WxT369WygonJ0Mp6FowfFDD2POm3gUrqTlxAs+g2PKAlaKPLFI
         vTgVpvcZpgdwVfX1A09JaO2ZJC2FDtfg7BkflIp4jnMkzxOE8UGXd7WEyIv3Ik+SPBw+
         0q/EpM7v+poRQzzGqHN8saSCPLnk+RSdzKtn1i8VLlPqqRbrlPZNwTVu9Qc019RDa8E+
         BgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693907859; x=1694512659;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9MXWXFgX5aFPhZ6qllDXEBQgIeC6Jxy5NEVmVqVP4Hs=;
        b=fIy1W248dggUybdxCAjlD0u3gXaLIM4iDnlPOdfcQW2uzR+LJjlqdpRtZFn6GX+kt3
         5wQ+fkR9Z4YkwtEJsLdQM+cOkIvqc281DZowLZfRSUXVsE5cozRqw1R1i5ojJLepWr2l
         469D49+RdUReKh/lwEWmWgX+XzTkGFtWwcUACAvXS0gnkrnO2tcGkVOSF0DmrBgz8+Rv
         bVxZVYflrz+tyWwZZqOcygiG4eRQa7VnSTbzBbLL1/Xu4mazzXMfMChxL+6EZ7j69LIc
         e9nQUXv9Qf1LfLaasw0fD2ZRt6B/nyor2T6A6JBdVZuq53XZRt+IIb8MXMvR//guT67s
         BTAg==
X-Gm-Message-State: AOJu0YzS1xhz5qZ261hqVUveFXu1tQkLTIS2qS2tcgAXxpCFaySgtA0g
	OQHz5uNkBV8NzQRcaQFA+Gk=
X-Google-Smtp-Source: AGHT+IG9oGAsnYDLZhL+LakWC4U811CoL+trnqHsY45OMKtbt/MUxwWcgiOmJozHaNgB60WIAUpsRQ==
X-Received: by 2002:a05:6a20:748d:b0:13b:9e04:5466 with SMTP id p13-20020a056a20748d00b0013b9e045466mr12415184pzd.49.1693907859389;
        Tue, 05 Sep 2023 02:57:39 -0700 (PDT)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id x26-20020aa784da000000b0064d57ecaa1dsm8710981pfn.28.2023.09.05.02.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 02:57:39 -0700 (PDT)
Message-ID: <18b78489-6a12-a09f-620d-985be747f9da@gmail.com>
Date: Tue, 5 Sep 2023 17:55:25 +0800
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
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <b9cbe9be-b03e-6c7a-d06c-b75b012b5b25@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/30/23 17:44, Krzysztof Kozlowski wrote:
> On 30/08/2023 11:02, peteryin wrote:
>> Add linux device tree entry related to
>> Minerva specific devices connected to BMC SoC.
>>
>> Signed-off-by: peteryin <peteryin.openbmc@gmail.com>
> To clarify: your full name or known identity is "peteryin"?
>
>> ---
>>   arch/arm/boot/dts/Makefile                    |   1 +
>>   .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 385 ++++++++++++++++++
>>   2 files changed, 386 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-minerva.dts
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 9e1d7bf3cff6..edb0b2105333 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -1604,6 +1604,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>>   	aspeed-bmc-facebook-wedge400.dtb \
>>   	aspeed-bmc-facebook-yamp.dtb \
>>   	aspeed-bmc-facebook-yosemitev2.dtb \
>> +	aspeed-bmc-facebook-minerva.dtb \
> Nothing improved here.
>
>>   	aspeed-bmc-ibm-bonnell.dtb \
>>   	aspeed-bmc-ibm-everest.dtb \
>>   	aspeed-bmc-ibm-rainier.dtb \
>
>> +	"","","","","","","","",
>> +	/*O0-O3 line 224-231*/
>> +	"","","","","","","","",
>> +	/*O4-O7 line 232-239*/
>> +	"","","","","","","","",
>> +	/*P0-P3 line 240-247*/
>> +	"","","","","","","","",
>> +	/*P4-P7 line 248-255*/
>> +	"","","","","","","","";
>> +};
>> +
> Nor here.
>
> This is a friendly reminder during the review process.
>
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
>
Could you please clarify for me?

Are you asking if the last line should not have a blank line, or I can't 
set a comment for the sgpio line like this:

/*P4-P7 line 248-255*/

> Thank you.
>
> Best regards,
> Krzysztof
>
