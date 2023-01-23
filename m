Return-Path: <SRS0=EM81=5U=gmail.com=markuss.broks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14563C05027
	for <soc@archiver.kernel.org>; Mon, 23 Jan 2023 15:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D4C1EC433D2; Mon, 23 Jan 2023 15:24:32 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D7993C433EF;
	Mon, 23 Jan 2023 15:24:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D7993C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id ss4so31343016ejb.11;
        Mon, 23 Jan 2023 07:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=quFutVDzXOuiGFOnAIlXrcYj/4FfLNEimxfsbTCP31g=;
        b=casY42fp0CPsxMpDebmQUR6sYU5KhJU1Dyv0pYM4Y1JmNEFcoiTmZm5cwTHNGJc3R3
         ty3pD1p43EHIPGwphlwumHC3o6XpXJ14ityW2AQk2dCZ3idvZ1t8Q1MBLl04n1nYy6Ov
         uqoPh27+B6vzYNUtCsJxicjfc5yIQt80MoP80a+E5W9IxgSyUx0sdbj5RTOh/qbmlj/U
         GIQFkgaFJpCQzf2rOTCH8PV8mjg/YOHgKcoK73ucH7g7NUbGXL8aSYvK7uhvaQJrOdIo
         18RxGduHZxG++UFh4uSyQFLxTVgBjNrDEGtaHRl3Oz0jgwIjiBvNNTvQ7SZlmI2mPF9o
         D+/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=quFutVDzXOuiGFOnAIlXrcYj/4FfLNEimxfsbTCP31g=;
        b=JBOdnSvsHn6zJc20T+6vGcu5/YB16X7CQYOZ8Cnmp4S8XuBUdXFs9WKXL3XPSsZoZe
         t++7gn+24/SZnCmNC1HkehlBq2/qCHCrEhp9aNIip3yA6R9Tg+U/On/A0fLWPk0VcK0C
         L/4OeX4MuVuz6G+D4MwVEuFIA5YyZcNmPZf8wr+8l66utN7GY3dUoXhD/L9uHunaurTv
         qize39GgNLZmSk8yjfULR9Ea20Gm6UKecOVRzVv4MYHYud3hgfwK/VNhdxPXf7GsjYZE
         B7KLx25BTdckj8QV7iMK5L1j/BzeiUmjlIje264xBl2RYWh43HfiL0qBCqegaALvpT0P
         RaJQ==
X-Gm-Message-State: AFqh2koMmz0pPwCTilI8GKqq3i5od/cud8J6tLf0YdbKv0c2PyQsJyEm
	6gfrT4vnxLuTgkmREs1v8d0Gjjfv1u4=
X-Google-Smtp-Source: AMrXdXsNXZAjwBSF2rV5p0/d14xBhorkGt2j6MBSzb7IRXW1/AvdX71aI7knW2abe2geUXIw0Crd+A==
X-Received: by 2002:a17:906:79d8:b0:877:a2d1:7560 with SMTP id m24-20020a17090679d800b00877a2d17560mr12044853ejo.27.1674487469938;
        Mon, 23 Jan 2023 07:24:29 -0800 (PST)
Received: from [192.168.3.54] ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id i20-20020a1709064ed400b00872a726783dsm9878482ejv.217.2023.01.23.07.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 07:24:29 -0800 (PST)
Message-ID: <ecfc1831-6500-e9fc-efec-b4574c3a61bb@gmail.com>
Date: Mon, 23 Jan 2023 17:24:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 0/2] Add support for Samsung Galaxy S5 (Exynos)
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230121201926.46990-1-markuss.broks@gmail.com>
 <703ad169-fb10-651c-96fe-22d2eae959b6@linaro.org>
Content-Language: en-US
From: Markuss Broks <markuss.broks@gmail.com>
In-Reply-To: <703ad169-fb10-651c-96fe-22d2eae959b6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

On 1/23/23 11:59, Krzysztof Kozlowski wrote:
> On 21/01/2023 21:19, Markuss Broks wrote:
>> Samsung Galaxy S5 (Exynos) is a mobile phone released in 2014.
>> It has an Exynos5422 platform. This version of Galaxy S5 is only
>> capable of 3G communication using the Intel modem, while the
>> LTE version of the device (klte) has a Qualcomm Snapdragon SoC.
>>
>> Currently, internal eMMC, USB, regulators on a PMIC, and touchscreen
>> are enabled in the device-tree.
>>
>> It also has the following peripherals:
>>
>> - 5" 1080p S6E3FA2 DSI display,
>> - Cypress StreetFighter touch buttons,
>> - Broadcom BCM4354 wireless connectivity module,
>> - Intel XMM6360 3G modem,
>> - STM32F401 serving as a sensor hub,
>> - Validify Solutions VFS61 series fingerprint sensor,
>> - Lattice ICE401M FPGA as an IRDA controller,
>> - Maxim MAX86900 heart rate sensor,
>> - NXP PN547 NFC controller,
>> - Wolfson WM5110 Audio DSP,
>> - Broadcom BCM4753 GPS radio,
>> - Maxim MAX77804 PMIC,
>> - Silicon Image SII8240 MHL controller,
>> - TI LP5562 LED driver
>>
>> Cc: Mark Brown <broonie@kernel.org>
>>
>> v1 -> v2:
>> - use better subject prefixes
>> - rename Galaxy S5 (Exynos) to Galaxy S5 (SM-G900H)
>> - align the compatibles and clock output names
>> - reorder the includes
>> - generic node name for regulator-tsp-vdd-en
>> - GPIO flag for regulator
>> - rename all the regulators, leaving the voltage values only where
>>    it makes sense (e.g. on 3V3 and 1V8 supplies for the HRM)
> I got two v2 patchsets from you. No clue which one is correct. Please
> send v3 if there were differences. Otherwise please annotate somehow...
Sorry about that, the first time I sent v2 it lacked the v2 tag in 
actual patch letters, but contained the tag in the cover letter, so I 
thought it would make confusion, so I fixed it and sent it properly. The 
patchsets are identical otherwise.
>
> Best regards,
> Krzysztof
>
- Markuss
