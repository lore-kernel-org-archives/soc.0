Return-Path: <SRS0=Fy8E=XS=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84787C43334
	for <soc@archiver.kernel.org>; Wed, 13 Jul 2022 16:35:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3FCD0C3411E; Wed, 13 Jul 2022 16:35:27 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B9B3C34114;
	Wed, 13 Jul 2022 16:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B9B3C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id v7so8643152pfb.0;
        Wed, 13 Jul 2022 09:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=o7YYzHzRtbkclJ1dhZwxcUPrq4NvCPI4BIS17oQmiyI=;
        b=BwgbUAj/rkUIu2N2il8kHNbl6Q0K7fIysaUmm4b+GjM4gsFOf4XnBWRDPqi8nQUffZ
         N/VXTsZgtTLDTC+dZpacjUrWZBdgGnJ2zpxMb2IZNZ8bFUkIdPzVLQsb3p+1L0061XWe
         7JO4S+zA/nRBk13FC2YWbzkHfWl3T2GhIi8TeyEQLEm6V5g/h1R9m87H7wH99TjIgG1W
         8Bod0ZIZJxTcibMCY3//3vzroI37D2IH3mz1fpMoH+wlsx00qI8uq5e6HMpOtCHI2RVV
         MnwYvLPqD9U9bztJreGWk5sed1/FEvKVQvi/90k3JCQ/EjDHcopUV/u4wXdUi53ocxff
         6NDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=o7YYzHzRtbkclJ1dhZwxcUPrq4NvCPI4BIS17oQmiyI=;
        b=mVLWa2q6lnHq5CguZamKctJzwTT+4u9kMqb4U7yplZyCNjdELBlYlLQD3vH4rd/lJ0
         AZzOcfOhSlFc34NjY1Q/4OskHuwGAFXHidS2slbaED7JqHRPbpckgtsmB8RWOtCWvuDv
         DlDASfo8yRr4uXaLPscTXCdQfImfxNZeDbTq8IqrpAanzBxvS30Ulr0EXcT6yvX2Ej+d
         qaCaXJBMOU3/o+3WobvzXsPufhR9NxMqAaZujaCsgScdSz+H4cn9FImTT8a4/mDTmkLo
         GoMpJSjg3B5q6Ul5M3wwxjLeOcwuZzw1cve2uhw8l5VYen07LpjP+LrPR2Evk50trmv+
         IyrA==
X-Gm-Message-State: AJIora/iDmOK5s+fVnepDYeVjaL7HtyjNZe6Z25O06omQniklfxtP1kp
	UYbnGk3y7zESYi9KI18+B44=
X-Google-Smtp-Source: AGRyM1tO0SKrl38orlze+qkf0akSz/oeJOz4cBwMOq1GXUHj2ao1hhrmhxBTyJJ7VwOa+P0mfN+ArA==
X-Received: by 2002:a63:4711:0:b0:415:ff46:ba5 with SMTP id u17-20020a634711000000b00415ff460ba5mr3675367pga.133.1657730125871;
        Wed, 13 Jul 2022 09:35:25 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id r29-20020a63a55d000000b00412a9c2217asm8095477pgu.64.2022.07.13.09.35.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 09:35:25 -0700 (PDT)
Message-ID: <8b11eac7-cabe-a0bc-061f-7b9936c3696f@gmail.com>
Date: Wed, 13 Jul 2022 09:35:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/8] ARM: dts: Move BCM963138DVT board dts to
 ARCH_BCMBCA
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 William Zhang <william.zhang@broadcom.com>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
Cc: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
 joel.peshkin@broadcom.com, dan.beygelman@broadcom.com,
 kursad.oney@broadcom.com, f.fainelli@gmail.com, anand.gore@broadcom.com,
 Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org
References: <20220707070037.261532-1-william.zhang@broadcom.com>
 <20220707070037.261532-3-william.zhang@broadcom.com>
 <304678bb-f49c-9c3b-e15e-df6c9e8a4ea2@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <304678bb-f49c-9c3b-e15e-df6c9e8a4ea2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/13/22 08:26, Rafał Miłecki wrote:
> On 7.07.2022 09:00, William Zhang wrote:
>> Use CONFIG_ARCH_BCMBCA to build all the BCMBCA SoC dts and remove
>> CONFIG_ARCH_BCM_63XX from the makefile
>>
>> Signed-off-by: William Zhang <william.zhang@broadcom.com>
>> ---
>>
>> (no changes since v1)
>>
>>   arch/arm/boot/dts/Makefile | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>> index 38d9c60aece7..1bf8e2f8ee68 100644
>> --- a/arch/arm/boot/dts/Makefile
>> +++ b/arch/arm/boot/dts/Makefile
>> @@ -147,8 +147,6 @@ dtb-$(CONFIG_ARCH_BCM_53573) += \
>>       bcm47189-luxul-xap-810.dtb \
>>       bcm47189-tenda-ac9.dtb \
>>       bcm947189acdbmr.dtb
>> -dtb-$(CONFIG_ARCH_BCM_63XX) += \
>> -    bcm963138dvt.dtb
>>   dtb-$(CONFIG_ARCH_BCM_CYGNUS) += \
>>       bcm911360_entphn.dtb \
>>       bcm911360k.dtb \
>> @@ -184,6 +182,7 @@ dtb-$(CONFIG_ARCH_BRCMSTB) += \
>>       bcm7445-bcm97445svmb.dtb
>>   dtb-$(CONFIG_ARCH_BCMBCA) += \
>>       bcm947622.dtb \
>> +    bcm963138dvt.dtb \
>>       bcm963148.dtb \
>>       bcm963178.dtb \
>>       bcm96756.dtb \
> 
> Do we want to mix all that DT files? Are ARCH_BCM_63XX (ex-)users
> interested in compiling all of them?
> 
> For IPROC SoCs we have separated symbols: ARCH_BCM_CYGNUS / ARCH_BCM_HR2
> / ARCH_BCM_NSP / ARCH_BCM_5301X and we compile arch specific DT files
> only.

I am fine with that and build systems (buildroot and OpenWrt at least) 
typically offer a way to produce a device specific image that will 
contain a single DTB fit for the target device.

What we would be optimizing for would be build time vs. coverage, as a 
maintainer I favor coverage as it allows me to build everyone in one 
sweep. We could make the building of the 63138 conditional upon 
BCMBCA_CORTEXA9 if that bothers you.
-- 
Florian
