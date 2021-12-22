Return-Path: <SRS0=9vwi=RH=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026A5C433F5
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 16:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B4EC7C36AE8; Wed, 22 Dec 2021 16:04:28 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7A574C36AEA
	for <soc@kernel.org>; Wed, 22 Dec 2021 16:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7A574C36AEA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C52033F207
	for <soc@kernel.org>; Wed, 22 Dec 2021 16:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1640189064;
	bh=Kr3xTjPFLs3f5u3ZNr8gHHIoOOxa7BGdyP1ViBacnAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=pt0Anlc2/7qoUHCsJTrlKbik6cqye47VVZjE+ltPftC3hbEfckWkk+HJamBgGR4kH
	 WL80dgDc86Un/hSMFSJTzvoDTQF2MRUwy/beLSs6aYe+ifbDua10PflW7Puk25dMwu
	 7pMr07iY2yzJ9UUJgVQcINSqNKRhjQMnGd3+SKDVVh+i7b9a/FKDbSI+8Ou9eVsqFT
	 dpnetZb1Hhdobw63XIpSQFp1kzROmhAUB8ZZzCkAXuaeYc7uUcgaDD0wxwcRgHAPp0
	 HI05F5iVvFmOj0ZXFDywdz/BOXhk/aGqRqavbOWdB9rBofDyf+YvdFjNfNL98ArsFh
	 sMNvvqvduMX0g==
Received: by mail-lj1-f198.google.com with SMTP id i123-20020a2e2281000000b0021cfde1fa8eso370121lji.7
        for <soc@kernel.org>; Wed, 22 Dec 2021 08:04:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Kr3xTjPFLs3f5u3ZNr8gHHIoOOxa7BGdyP1ViBacnAk=;
        b=b+vSqt5UYwQJ/0TcMfH5DzLcHiuqvXNYYjdh8/eZEWdz9ex42Rk1+Na6pg43WhXMr3
         Hq++g7VYn/ZjK/UuLfzkEf+rzKlgRc3xe3JNJ9BoZaKarJPfb4IEIZGy8wre9Dhnn0t+
         Npj9T9TYRjm6iSqayHxqGUONi8QDBzjIITfmDggwvWIdERTmvPRXOXAatl+42B9F9oeV
         Ccq/Ki6ODCl4SlVoh+SwP2EpLbDV8IF/NYsMn5+ObTcPVZwvIz/fJ5JCY2t3GrPfxLSe
         Zk6KtJ2F7EGdRi1YLqv3tduV0SMi8OC4aiR0YC7mVRrrz3664uaXGTtDVkNwmhK9vfuS
         q1Wg==
X-Gm-Message-State: AOAM531nGyldfYOKkW6TTkMXcp4MYBRTwi5yo6xrmWrF9cNibmbbWkq3
	MuNpreY1XRTUiD1HC57eo+huF5a02MlOq+sL6kq2D5jgD4JzTcIddLGasZN/m2MxGFp5u7r1cna
	bZpz5sO1v2RJkaEPQh/mR4Vw=
X-Received: by 2002:ac2:52b1:: with SMTP id r17mr2723880lfm.425.1640189064235;
        Wed, 22 Dec 2021 08:04:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKuE+x1iebdt+L6NZyNYw3PBMf+KKJ29B2EKyahlgDCye9BxTDu8Gjce4PBEUfZkB4jNHiew==
X-Received: by 2002:ac2:52b1:: with SMTP id r17mr2723859lfm.425.1640189063803;
        Wed, 22 Dec 2021 08:04:23 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id k5sm251866lfj.112.2021.12.22.08.04.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Dec 2021 08:04:22 -0800 (PST)
Message-ID: <789fb6d3-f017-a263-209c-35e0ee82f4a1@canonical.com>
Date: Wed, 22 Dec 2021 17:04:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RESEND PATCH 6/6] arm64: exynos: Enable Exynos Multi-Core Timer
 driver
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
 Olof Johansson <olof@lixom.net>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20211220165004.17005-1-krzysztof.kozlowski@canonical.com>
 <20211220165004.17005-2-krzysztof.kozlowski@canonical.com>
 <CAK8P3a0AAMh4FhRbZ_iZCoMP8F7+Fn4+naB-PZWTV9RSMO4bwQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAK8P3a0AAMh4FhRbZ_iZCoMP8F7+Fn4+naB-PZWTV9RSMO4bwQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/12/2021 13:30, Arnd Bergmann wrote:
> On Mon, Dec 20, 2021 at 5:50 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>> From: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
>> index 1aa8b7073218..91f5e9568122 100644
>> --- a/arch/arm64/Kconfig.platforms
>> +++ b/arch/arm64/Kconfig.platforms
>> @@ -89,6 +89,7 @@ config ARCH_BRCMSTB
>>  config ARCH_EXYNOS
>>         bool "ARMv8 based Samsung Exynos SoC family"
>>         select COMMON_CLK_SAMSUNG
>> +       select CLKSRC_EXYNOS_MCT
>>         select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
>>         select EXYNOS_PMU
>>         select PINCTRL
> 
> 
> I applied this, but I don't think this is the best way to do it. As
> you describe, the
> driver is optional, and we probably shouldn't force-enable it here just because
> we build a kernel that may run on a platform that may want to use this.

All older ARMv8 designs actually require this because Architected timer
is sharing block with MCT. The newer designs (not supported yet) could
indeed skip it and rely on Architected entirely.

> 
> I understand the clocksource maintainers prefer the 'select' method, but I think
> this one shows why that doesn't always work well. This is probably even an
> example of a clocksource driver that could be a loadable module if someone
> did the work to make this possible.

I understand. Maybe it is the time to make the timer user-visible option
with default value. Probably several other timers could be converted to
such approach as well.

Best regards,
Krzysztof
