Return-Path: <SRS0=5dap=HY=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB11CC4332F
	for <soc@archiver.kernel.org>; Wed, 13 Dec 2023 19:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9170AC43395; Wed, 13 Dec 2023 19:14:35 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C48C1C433CC
	for <soc@kernel.org>; Wed, 13 Dec 2023 19:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C48C1C433CC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3363653e180so1652944f8f.0
        for <soc@kernel.org>; Wed, 13 Dec 2023 11:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702494872; x=1703099672; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58ahTGdMG02plraZ6aCkVEXNKyX3UuTLA6uaOV/z8Io=;
        b=DIHtcWyH8TaNsfnI6yOhwYuuRaLYEp9qdijmE1EPF5hxAsOz8Xc28eB+hLCerVK8f2
         +e5ihYvSyUw9ZQqZmFU6uaXm1u67vBGFq4i598sV/IlUef4rE+gmtm348havPUiea96E
         1R12QH0yP2TrG7Gmyx5D3wqhPbrEQM7pVm9/02FNux5i1Gt8U1miKRDzLIccmlo2o4Vt
         QTrwFwPayQS7hNhrKmBEGfnB5cS5BjjIstIzmBB1UydMhvzeQg0ZYoW8j44Q7HgMx3rL
         LQU8Qf605n7VVMMWUsUWVc30LjRWneDLS3WUyfQqTwpXOAL2eOphDQL1pNxFuhevMWXj
         aIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702494872; x=1703099672;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58ahTGdMG02plraZ6aCkVEXNKyX3UuTLA6uaOV/z8Io=;
        b=sm56myiiJs8Sr+dShqWEhpFIQiYjdMnBBNpjDNkjscOYCoja+gq0LZd5mvETTNfsNs
         z00acp3hwqYw04aeoFJJd/Wuqc0i7yFdX5FCh8bk+rmbpvJ8+dv788mARRqIlwxIW/RJ
         a3SaHsU91DXJAx9duh6oPQtDDC4lMSZfatpXYNQvgH3zFSZMGlB1KICZs6OI1aH08Dha
         HdCu4ziuNy2AGr1Qdq2Fsyasve4x1Es08fmTatB5Jr/haKdPsnxBtgARmzlf0PCIBl6R
         DnGdg6EqrfzugGRoCQJGh8Q5hXOgsKOWteBt3uPxeyIztSDzLq8XltfFtUia7eF56lUv
         R77g==
X-Gm-Message-State: AOJu0YzbVcnj68VonQDcmWKCeKJUi3TOIDG9KH4Uv6axyzwk5rxltjfl
	75dnKywa9/FJMjlj5FZUt04A+g==
X-Google-Smtp-Source: AGHT+IG/yH6YLIjO2EhrWJqeja17W++oGXtYYURS01EspWuy9c6aatC4jA8CAw5rkcmtlGYVZ6YcTQ==
X-Received: by 2002:a5d:43c9:0:b0:333:3ead:54c9 with SMTP id v9-20020a5d43c9000000b003333ead54c9mr3849022wrr.63.1702494871991;
        Wed, 13 Dec 2023 11:14:31 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id b18-20020adfe652000000b003333f5f5fd7sm14064715wrn.31.2023.12.13.11.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Dec 2023 11:14:31 -0800 (PST)
Message-ID: <631e30a2-bad1-47ba-8daf-4dbb91e2b629@linaro.org>
Date: Wed, 13 Dec 2023 20:14:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/16] watchdog: s3c2410_wdt: Add support for Google
 gs101 SoC
Content-Language: en-US
To: Alim Akhtar <alim.akhtar@samsung.com>,
 'Peter Griffin' <peter.griffin@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
 olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 cw00.choi@samsung.com
List-Id: <soc.lore.kernel.org>
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <CGME20231211162436epcas5p4161dfb5a2b849edc6856662e5b42693d@epcas5p4.samsung.com>
 <20231211162331.435900-13-peter.griffin@linaro.org>
 <017501da2de3$4fad8950$ef089bf0$@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <017501da2de3$4fad8950$ef089bf0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/12/2023 17:42, Alim Akhtar wrote:
>>  static const struct of_device_id s3c2410_wdt_match[] = {
>> +	{ .compatible = "google,gs101-wdt",
>> +	  .data = &drv_data_gs101_cl0 },
>>  	{ .compatible = "samsung,s3c2410-wdt",
>>  	  .data = &drv_data_s3c2410 },
>>  	{ .compatible = "samsung,s3c6410-wdt", @@ -605,9 +640,10 @@
>> s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct
>> s3c2410_wdt *wdt)
>>  	}
>>
>>  #ifdef CONFIG_OF
>> -	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index
>> */
>> +	/* Choose Exynos9 SoC family driver data w.r.t. cluster index */
> Exynos9 introduction is out of context here, so you can leave it as original
> comment, it is not adding anything here.

Dropped that hunk and applied.

Best regards,
Krzysztof

