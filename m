Return-Path: <SRS0=Y+K8=HQ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FECEC4167B
	for <soc@archiver.kernel.org>; Tue,  5 Dec 2023 07:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3C67DC433C9; Tue,  5 Dec 2023 07:19:54 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 871D3C433C8
	for <soc@kernel.org>; Tue,  5 Dec 2023 07:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 871D3C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ca04b1cc37so16175681fa.1
        for <soc@kernel.org>; Mon, 04 Dec 2023 23:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701760790; x=1702365590; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oHIQ/2mNSoBOsXK9FvHpf2z+uBxTtLumASk1JH/x2+U=;
        b=bbHo+K/IKczjZIrdmXqenGmUB+KHjq0ZWcIo4P6rJhMO68LZBa5lkGTCjp1JFWLYw/
         PnBNpqlETJx8Xw3XKn+dDUPqSMmicYMfnhuQyM2vt2GeVNSWzhkykbaS1QMy2fdCDv6a
         fYCm7sxZ2o/6G99Zl/9o5RpPwzAdWHvgTUVvlL7FHlsckaBZ0HqbP9ZpIb3oy2vKwFAd
         SXKMO3JXmmZP8WlqKNg5xLpHCQqwnciiqZLjHWJPOTk7n8h93ssUpl0r7H11LeH0o+Hw
         B5wfgVMUNTACKRqobyPCXTsr11WP/lBFGf9K3mmU09nHe2VBPuLJMSZWO725wIaj4052
         jHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701760790; x=1702365590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oHIQ/2mNSoBOsXK9FvHpf2z+uBxTtLumASk1JH/x2+U=;
        b=fA9s8z6sT91w1vL/3BH//x6hsCngUSn8zTVejS2Q2NWquGlwq442Zj51XnvcgR+Mn8
         HqRbgsYu53rPog42N4gluWDqEf78ZqgavXekFqDXqQZnefWYq/4NBtwEUg3rCU0Dusxr
         5uIZEp5Z+BMYAhenVf/fFnnFi3lwSuxgHASzyrzIHa70I+ygRsiGapHOktFvGdilodzp
         GFzB5Lg57a4oD4rHWqlzag/5t/e3ixOgioHSYF3xuW3yyS9DdPI3BSnyChG34QCOiw4Y
         SqY5Cxd9EijFNsF3KSZbqbWGiMKZtycitUi7ONEWNqM+NhhABFlA/qbuUgg33LPgF0OV
         GWyQ==
X-Gm-Message-State: AOJu0Yxz+YzvQxuKDiAaUFVg0kf0+MYrsnDcjiITwMzBViEzbD+fAIbL
	DzvkufP8P3FEABYWkYVctcnr7g==
X-Google-Smtp-Source: AGHT+IE5LA2wlitbhPoifagKjEobb8bCR0W7Af/M36xPI/329IBqelvJogRwHAPUjGDWPeEbfPj0bA==
X-Received: by 2002:a2e:8097:0:b0:2c9:e81e:81ac with SMTP id i23-20020a2e8097000000b002c9e81e81acmr599857ljg.11.1701760790005;
        Mon, 04 Dec 2023 23:19:50 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id s30-20020a05651c201e00b002ca033a919dsm578949ljo.20.2023.12.04.23.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 23:19:49 -0800 (PST)
Message-ID: <8596c2a7-b3f6-4f8c-9529-91c1d6fc5716@linaro.org>
Date: Tue, 5 Dec 2023 08:19:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/20] arm64: dts: exynos: google: Add initial Google
 gs101 SoC support
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>, krzysztof.kozlowski+dt@linaro.org
List-Id: <soc.lore.kernel.org>
Cc: robh+dt@kernel.org, mturquette@baylibre.com, conor+dt@kernel.org,
 sboyd@kernel.org, tomasz.figa@gmail.com, s.nawrocki@samsung.com,
 linus.walleij@linaro.org, wim@linux-watchdog.org, linux@roeck-us.net,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, olof@lixom.net,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, cw00.choi@samsung.com,
 alim.akhtar@samsung.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
 kernel-team@android.com, linux-serial@vger.kernel.org
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-19-peter.griffin@linaro.org>
 <CAPLW+4ki_GUAnor4sTanXFLzKrAB9JpxK98PED1fUY-MLCzUdA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAPLW+4ki_GUAnor4sTanXFLzKrAB9JpxK98PED1fUY-MLCzUdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/12/2023 02:54, Sam Protsenko wrote:
> On Fri, Dec 1, 2023 at 10:11 AM Peter Griffin <peter.griffin@linaro.org> wrote:
>>
>> Google gs101 SoC is ARMv8 mobile SoC found in the Pixel 6,
>> (oriole) Pixel 6a (bluejay) and Pixel 6 pro (raven) mobile
>> phones. It features:
>> * 4xA55 little cluster
>> * 2xA76 Mid cluster
>> * 2xX1 Big cluster
>>
>> This commit adds the basic device tree for gs101 (SoC).
>> Further platform support will be added over time.
>>
>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>> ---

...

>> +
>> +               watchdog_cl0: watchdog@10060000 {
>> +                       compatible = "google,gs101-wdt";
>> +                       reg = <0x10060000 0x100>;
>> +                       interrupts = <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH 0>;
>> +                       clocks =
>> +                         <&cmu_misc CLK_GOUT_MISC_WDT_CLUSTER0_IPCLKPORT_PCLK>,
>> +                         <&ext_24_5m>;
>> +                       clock-names = "watchdog", "watchdog_src";
>> +                       samsung,syscon-phandle = <&pmu_system_controller>;
>> +                       samsung,cluster-index = <0>;
>> +                       status = "disabled";
>> +               };
> 
> Krzysztof, can you please advice which scheme is preferred right now:
> sorting by name or by address? I saw your patch for dts style doc, but
> just want to know the current state of affairs.

Use coding style, so sorting by unit address in DTSI and by
label/phandle of overrides in DTS.

Coding style was not yet applied, but I don't see any objections to it
so it is just a matter of days.

Best regards,
Krzysztof

