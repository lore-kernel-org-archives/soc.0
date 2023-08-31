Return-Path: <SRS0=f61G=EQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2D96C83F2B
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 06:45:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D337BC433CA; Thu, 31 Aug 2023 06:45:04 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD475C433C9
	for <soc@kernel.org>; Thu, 31 Aug 2023 06:45:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD475C433C9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-99bcc0adab4so45967466b.2
        for <soc@kernel.org>; Wed, 30 Aug 2023 23:45:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693464302; x=1694069102; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7dWDS9dtVikyI/W6YgtSMrS78Am1qgdN+VctPtJJV0I=;
        b=lEs++7gLv0Mj1/8hlE0Fh3sVwhvltSXLjt/x4XtTDYGiXz/z7lycSPm4L1e4lJLHQ1
         nQE89YlOY1pbsoI5f+qQ1rqqRxtqRdWECxTSX+/9wSns8+d/fhFjahdRezATE9yWsrJM
         TKtNQ8CT6OvORptiQrpJFRCM+C/yrO6Gtm/ufB+n9Tn5gON0fdDrIuH6i9inCgTbLRuy
         S8C83lVlnegbGgpfX9rkcn7ipARw16mE1Oyc3IrxuHNFkrf6DR1hbsUhtivPSU+P3obf
         +QdsR3Vb/JeQv4GnqTdTrKafSSyQaak+ZOFmOzwNLcF/plNtnyshVeHqdu46yvmXzH4r
         4jsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693464302; x=1694069102;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7dWDS9dtVikyI/W6YgtSMrS78Am1qgdN+VctPtJJV0I=;
        b=jb34713tcwXlj7bltFp8mA9feHFp4kEKZAXrvUTBx0090wv8TA6o95PYhZ9Pj1nSMt
         xsNjTenXdG23pBnqamlLxU5wafn0mbL4cQIG1Q5J6Okw1SqlmpqTYEE3jVua9eDUXfbe
         etDHi97S9x+Si7ksLoD+MVbKj/gUbJgxzRi1HWGXl81ClFh0VM5sQ+T0QxCKO76Lbofc
         wlMY0B4x/kAkwCZGMgLipAyyWVCFNpcdP1iGsEjaMY2RVKMO8IZWpzDX+C+hnoSJBX46
         c1uciKXT5wzElD4NYgx3pGyTzW8jPxvvAvrisYpU8uWBJP42x96UNz1+1uZ7q/lqM+Qc
         aiqQ==
X-Gm-Message-State: AOJu0YzXoS+awwVZOMCMGMTsi2cb+VJ3u9Fq9OPFQGEYVuoW1z0OgyJ4
	Vmzfl+VzXmHIWyako4oGfCaI3g==
X-Google-Smtp-Source: AGHT+IG8ER1DZkwLkS8ltwacGdYzwYVFueweMXPTg7CdldbbujGszPJH8OBoJS3YdZo+OIGoPR3GsQ==
X-Received: by 2002:a17:906:318a:b0:9a5:8afe:8c5d with SMTP id 10-20020a170906318a00b009a58afe8c5dmr2942537ejy.16.1693464301690;
        Wed, 30 Aug 2023 23:45:01 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id a3-20020a17090680c300b009a19fa8d2e9sm383452ejx.206.2023.08.30.23.45.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 23:45:01 -0700 (PDT)
Message-ID: <9c23d906-bba3-533e-ac31-3bad4fa46d64@linaro.org>
Date: Thu, 31 Aug 2023 08:44:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v5 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
 (AST2600) BMC
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
References: <20230831055030.3958798-1-peteryin.openbmc@gmail.com>
 <20230831055030.3958798-2-peteryin.openbmc@gmail.com>
 <4cbe662d-cd20-ceef-e3e4-6608029f94b7@linaro.org>
 <5347163b-c225-d805-d851-fe28e6b57c56@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5347163b-c225-d805-d851-fe28e6b57c56@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/08/2023 08:34, PeterYin wrote:
> 
> On 8/31/23 14:20, Krzysztof Kozlowski wrote:
>> On 31/08/2023 07:50, Peter Yin wrote:
>>> Add linux device tree entry related to
>>> Minerva specific devices connected to BMC SoC.
>>>
>>> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
>>> ---
>>>   arch/arm/boot/dts/Makefile                    |   1 +
>>>   .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 377 ++++++++++++++++++
>>>   2 files changed, 378 insertions(+)
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
>> Third or fourth time: that's not a correct order. This is a nit, but
>> since you keep ignoring it, I don't believe any other feedback was
>> applied. Why you did not respond to my comments but just ignored them?
> Sorry, I don't notice this is different file.

You just skipped that comment and did not respond to it in your last
private reply... Just like in previous versions. Go through all the
comments from previous versions, not few.

Best regards,
Krzysztof

