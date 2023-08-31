Return-Path: <SRS0=mcdX=EQ=gmail.com=peteryin.openbmc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BF9C83F10
	for <soc@archiver.kernel.org>; Thu, 31 Aug 2023 06:36:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 13300C433C9; Thu, 31 Aug 2023 06:36:41 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1E5D4C433C8;
	Thu, 31 Aug 2023 06:36:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1E5D4C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1bf1935f6c2so2810555ad.1;
        Wed, 30 Aug 2023 23:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693463799; x=1694068599; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/kyvkupLew9Yd6VCA9XQC4cAMSTlDnrwdbWSR056bSo=;
        b=LpgpzxjhsAX1+6ksrR1fBgyqUb4xrOZm0JSXghbWZ7xdk8v+0my7vluOBUqtQtr8tE
         nfcaRsT9FhVaQ8mflC/9LJV1gaej+VERzveEtFJ3MFec4MvkWrgfM7+M/WiJmzRqXcEY
         ChZqRmwRCpn6yJNWKHYpcQS748ml9mzyVXUFsHyIYwQuABCNH8pDOU+6HWOmXdg2QwgW
         0ss+HwNzV04OeYiRfCWAvmaIIrpg+zQzuNqY5316FBEgPX/rJipsTvfUo3JKYZCk5Yl2
         08ugofAy8QHwLMy34VGfNlgFjhTKOHWllm7pErb1TrIZwOz5R6jV83pAhuTMngx34eZc
         9hgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693463799; x=1694068599;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kyvkupLew9Yd6VCA9XQC4cAMSTlDnrwdbWSR056bSo=;
        b=XuumysWxSp2+lG0ccePPq3O5cUhChVvgFjVYQ+O+5O9hkEKYPS03Pu5TvRw340Mvbw
         205HUTtqVl5+UyRXIyiQyf/NZBYk2bFDlL9fs1OTqkcELmGpRl1hZ9GViRyBTM1MtPFN
         O+HgBGrjnxTmSSVVtaHpyzq6MQruly8CBRTwMgk2TpGXRyOiPFYMCi1zPiHMfiUmV6yw
         dTZe7BM1Cbq8pnZYYqVDv4i5T7zt0vh77j9Z53oECrCEZ51IBcZhgXCbCDbIHWKux8hO
         mzmQFqPUEZdV2j/g7z2XriL63X53fYe0NdoetETMqCwMKPsTHYpDMldmP+woms7LPUvP
         FGXg==
X-Gm-Message-State: AOJu0YzViqTSRGKmM0V4qErMdsrRvIGgGnWAqIE1AS8p8ofwvl8eacRA
	n6T0jr3sNGP8IDK9bv0Sg7M=
X-Google-Smtp-Source: AGHT+IF/QcbvfmvsqDftpHC9Yc9k9k1Flp6pBjturyK95MU7VeorHlVJlOFx/tBxCTurN4IFl3DROQ==
X-Received: by 2002:a17:903:18a:b0:1b7:ca9c:4f5c with SMTP id z10-20020a170903018a00b001b7ca9c4f5cmr2147913plg.28.1693463799233;
        Wed, 30 Aug 2023 23:36:39 -0700 (PDT)
Received: from [10.10.14.80] (1-34-21-66.hinet-ip.hinet.net. [1.34.21.66])
        by smtp.gmail.com with ESMTPSA id l19-20020a170902eb1300b001bf00317a49sm552633plb.104.2023.08.30.23.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 23:36:38 -0700 (PDT)
Message-ID: <5347163b-c225-d805-d851-fe28e6b57c56@gmail.com>
Date: Thu, 31 Aug 2023 14:34:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v5 1/2] ARM: dts: aspeed: Minerva: Add Facebook Minerva
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
References: <20230831055030.3958798-1-peteryin.openbmc@gmail.com>
 <20230831055030.3958798-2-peteryin.openbmc@gmail.com>
 <4cbe662d-cd20-ceef-e3e4-6608029f94b7@linaro.org>
From: PeterYin <peteryin.openbmc@gmail.com>
In-Reply-To: <4cbe662d-cd20-ceef-e3e4-6608029f94b7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 8/31/23 14:20, Krzysztof Kozlowski wrote:
> On 31/08/2023 07:50, Peter Yin wrote:
>> Add linux device tree entry related to
>> Minerva specific devices connected to BMC SoC.
>>
>> Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
>> ---
>>   arch/arm/boot/dts/Makefile                    |   1 +
>>   .../boot/dts/aspeed-bmc-facebook-minerva.dts  | 377 ++++++++++++++++++
>>   2 files changed, 378 insertions(+)
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
> Third or fourth time: that's not a correct order. This is a nit, but
> since you keep ignoring it, I don't believe any other feedback was
> applied. Why you did not respond to my comments but just ignored them?
Sorry, I don't notice this is different file.
>
> Best regards,
> Krzysztof
>
