Return-Path: <SRS0=brjC=HC=gmail.com=groeck7@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B358FC61D85
	for <soc@archiver.kernel.org>; Tue, 21 Nov 2023 18:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8D1A5C433C9; Tue, 21 Nov 2023 18:10:40 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4005BC433C8;
	Tue, 21 Nov 2023 18:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4005BC433C8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-5c85e8fdd2dso45063697b3.2;
        Tue, 21 Nov 2023 10:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700590238; x=1701195038; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XSGDO0qxcc9Ud2kE8ZCLHb5Pa7tgaGHF2YUCWnyFA10=;
        b=BLzHjovjC4BTDSRXmkV+HgZmqaIo8RBttp7SeJRdaAmHvGx7Nlw8W1ICQxCZM8wWSd
         9SO+2AJGpiPTx5Py0s8MHu8Xr5wSO1yB/tzrjaNSE39FuEOIVaUaIiKSYSLGISfMWuGX
         OGpTfoOZfXqp79Uf4D5gMdAgevVFTmsb4i/qT9IOKRi+WIQ8jM2gtSTwWfykIpbO+wq+
         cQ3V0jZMDvxqTczRZd0QUWcpOr0UeX734fd46GQCM8g/QOnk4owUWtSXEGqYbP1Ni62R
         SXb3GIbgcjMtJ1WLIPTKZm/AG7CaqO8IWRHvDtvDUI5KgcAww1cJwba9NMIm2L2dI3ad
         h3Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700590238; x=1701195038;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XSGDO0qxcc9Ud2kE8ZCLHb5Pa7tgaGHF2YUCWnyFA10=;
        b=l1Zg5TFAfOXDJYzK/R1fmWAyYdrLmxqpalGBaBHJ/hu4sRAGVJfBWPeJtwgv1/AoR4
         zwmxHxZwWb8sErCcp5jxPavnaPkOGJEZ834Q61daJO6kOtldv0haXn7hHJxfnBQyKdHg
         lS+S/jgHrguGu552fmblkDag8DK7LODgSsYzsGj/ozVQyuxHTXCIwXavLMVIIHP7KvL/
         lB5nMcfIm5KEhxYCdm/CoSOz78QXXFuda12AUUZiKHVYtM4RFm1BnFZF8DwL6RTEsyC8
         dN5cdIhBGifKKIcfimyH+3+pKRU+ymQDLWMhfkhXqh//S2EUEqthkeBWLnOSJrU9g8TY
         c0DA==
X-Gm-Message-State: AOJu0Yzf44QxeLaXaWrrd5mciXEVDBEQp9kk32koCaPebt4TaOXlCW42
	rV+mUQHvYF622m0fba15+AA=
X-Google-Smtp-Source: AGHT+IHUIw3AdAn4kIG5DXgr1aU9R6c3URGa4QUM/YnqGSHjxfjtf4gytlVhbe0m7vBdDbxOvNcxHw==
X-Received: by 2002:a81:ca04:0:b0:5ca:15db:5c66 with SMTP id p4-20020a81ca04000000b005ca15db5c66mr6899032ywi.18.1700590238056;
        Tue, 21 Nov 2023 10:10:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r63-20020a815d42000000b005a42740fcd4sm3170890ywb.94.2023.11.21.10.10.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 10:10:37 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8d838a0b-6a13-4538-8dd6-e044ebfabca7@roeck-us.net>
Date: Tue, 21 Nov 2023 10:10:32 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 15/19] watchdog: s3c2410_wdt: Add support for WTCON
 register DBGACK_MASK bit
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
 tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org,
 wim@linux-watchdog.org, catalin.marinas@arm.com, will@kernel.org,
 arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com,
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com,
 willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-16-peter.griffin@linaro.org>
 <CAPLW+4m+vG62V++izkycRYEhcTpoT+G=g+3Y4j8vqEpeX2uEPw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAPLW+4m+vG62V++izkycRYEhcTpoT+G=g+3Y4j8vqEpeX2uEPw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/21/23 09:52, Sam Protsenko wrote:
> On Mon, Nov 20, 2023 at 3:21 PM Peter Griffin <peter.griffin@linaro.org> wrote:
>>
>> The WDT uses the CPU core signal DBGACK to determine whether the SoC
>> is running in debug mode or not. If the DBGACK signal is asserted and
>> DBGACK_MASK is enabled, then WDT output and interrupt is masked.
>>
>> Presence of the DBGACK_MASK bit is determined by adding a new
>> QUIRK_HAS_DBGACK_BIT quirk. Currently only gs101 SoC is known to have
>> the DBGACK_MASK bit so add the quirk to drv_data_gs101_cl1 and
>> drv_data_gs101_cl1 quirks.
>>
>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>> ---
>>   drivers/watchdog/s3c2410_wdt.c | 32 +++++++++++++++++++++++++++-----
>>   1 file changed, 27 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
>> index 08b8c57dd812..ed561deeeed9 100644
>> --- a/drivers/watchdog/s3c2410_wdt.c
>> +++ b/drivers/watchdog/s3c2410_wdt.c
>> @@ -34,9 +34,10 @@
>>
>>   #define S3C2410_WTCNT_MAXCNT   0xffff
>>
>> -#define S3C2410_WTCON_RSTEN    (1 << 0)
>> -#define S3C2410_WTCON_INTEN    (1 << 2)
>> -#define S3C2410_WTCON_ENABLE   (1 << 5)
>> +#define S3C2410_WTCON_RSTEN            (1 << 0)
>> +#define S3C2410_WTCON_INTEN            (1 << 2)
>> +#define S3C2410_WTCON_ENABLE           (1 << 5)
>> +#define S3C2410_WTCON_DBGACK_MASK      (1 << 16)
>>
>>   #define S3C2410_WTCON_DIV16    (0 << 3)
>>   #define S3C2410_WTCON_DIV32    (1 << 3)
>> @@ -107,12 +108,16 @@
>>    * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
>>    * with "watchdog counter enable" bit. That bit should be set to make watchdog
>>    * counter running.
>> + *
>> + * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Enables masking
>> + * WDT interrupt and reset request according to CPU core DBGACK signal.
>>    */
>>   #define QUIRK_HAS_WTCLRINT_REG                 (1 << 0)
>>   #define QUIRK_HAS_PMU_MASK_RESET               (1 << 1)
>>   #define QUIRK_HAS_PMU_RST_STAT                 (1 << 2)
>>   #define QUIRK_HAS_PMU_AUTO_DISABLE             (1 << 3)
>>   #define QUIRK_HAS_PMU_CNT_EN                   (1 << 4)
>> +#define QUIRK_HAS_DBGACK_BIT                   (1 << 5)
>>
>>   /* These quirks require that we have a PMU register map */
>>   #define QUIRKS_HAVE_PMUREG \
>> @@ -279,7 +284,7 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
>>          .cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
>>          .cnt_en_bit = 8,
>>          .quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
>> -                 QUIRK_HAS_WTCLRINT_REG,
>> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
>>   };
>>
>>   static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
>> @@ -291,7 +296,7 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
>>          .cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
>>          .cnt_en_bit = 7,
>>          .quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
>> -                 QUIRK_HAS_WTCLRINT_REG,
>> +                 QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
>>   };
>>
> 
> This patch states it's adding the feature, but in fact it's also
> enabling this feature for gs101. Suggest moving this patch before the
> one enabling gs101 wdt. This way, one patch will only add the feature,
> and another patch will enable gs101 entirely (with this feature used).
> At least it seems like more atomic approach to me.
> 

Both approaches have their merits and their downsides. I for my part am not
even sure if DBGACK_MASK should be enabled unconditionally if supported.
With your approach, it would be impossible (or at least more difficult) to
revert if it turns out to be broken and/or have unexpected side effects.
That seems less desirable to me than the current approach.

Guenter

