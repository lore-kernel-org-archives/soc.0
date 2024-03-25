Return-Path: <SRS0=+0zi=K7=gmail.com=mazziesaccount@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CABDC54E64
	for <soc@archiver.kernel.org>; Mon, 25 Mar 2024 09:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 40D74C433F1; Mon, 25 Mar 2024 09:10:10 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E672C433C7;
	Mon, 25 Mar 2024 09:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E672C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-513e14b2bd9so5019845e87.2;
        Mon, 25 Mar 2024 02:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711357807; x=1711962607; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aD1cN8szRSMxO3IVBp2PA+D27BKP1mIpHeo/IVwH7JI=;
        b=JxH8Mq9EfGRNHXCoQ5A0XGt6F43L1ynU6UNIVWzNVZlD/j4v3bIi11WyAkS1Dd1Av+
         V3Da8VSNF0PvG2eSpmUO6vuE0AnffGbvX1vLKLL7R5kOfjB45nT//6t/VtFLTu4EjqKh
         WsQI18OzIUwfS5UnsQ2ru4XNr3QOOWwua7W8jIApCimNeGEKIghVSSl9K+9YRyvFKp39
         Y0RL2yfbj2MH32DNlyrX5XDd7UwK4qZ3zGBuf8KAoH5Yq2j91R4wKXHNlPyD9hKV5RGZ
         iOWwjiteRvNwXLovxYqm8V1gymXZm9EVSW2Vz5r3FysoJN8pL50ANQrp4nnxQHPPoRjU
         q5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711357807; x=1711962607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aD1cN8szRSMxO3IVBp2PA+D27BKP1mIpHeo/IVwH7JI=;
        b=sggMP2gxg91DTeHwRLD8NoNj5G1naHFgYpk6UMxlDC9S+Vk3NhDhWlYky+UHjYsvR6
         955+ntEtenPaALvN2ws3m5UvKBJztdGtqMA1n8ZBU2v5AxSBjE/rz7ctY/l7LhRgTZcv
         Aea/OlGqj/DC68NtvTpntziC7aTn+Jq3B/sGRxpNzCMEbdykHOsds3vbXSTLCut9pq34
         HRh8DsJzoj0XOcALFKboknN4wW5rr2mvmy+y1aBDXpOra+vnPkMpVjOaGVYfz7FTClq6
         m/GXbV5wi97RGz9kHGN7Gq1Y5sTQRxYl1MXRPanjtaOW4A/gEqgf7ysKiZyh5f+Ajl7Z
         vtmw==
X-Forwarded-Encrypted: i=1; AJvYcCW6Lpg41uu9PZqTrk0czHXsRApoXMakOX80gnvvymOc2lcLQX7g5Flkd25d8mmKvOWhuM6HzFofT4Unc/aqNwgiHZjHjBCbPpH7ARjx5tGY5isTNSo1tXovP97gpuRBgQ==
X-Gm-Message-State: AOJu0YzMBlnFltBPAGgJ6vP/JH9+4ehT7HRVNH+ojlnU8QRAwaFI8pKl
	IrkiseaA5chKfW92PQ7jmVjQLmfFTONjMP/q/vYdgc6nn087fvMOLrrC+gVL
X-Google-Smtp-Source: AGHT+IHjCBUOy94j2CvEre/QAbDy1ckEeszdxhgFO9te9Xg1xdWSwRZx6LcsWrpuC1tNkTBe+KhyDg==
X-Received: by 2002:a19:2d0a:0:b0:513:cc88:e1b with SMTP id k10-20020a192d0a000000b00513cc880e1bmr4342156lfj.61.1711357806364;
        Mon, 25 Mar 2024 02:10:06 -0700 (PDT)
Received: from ?IPV6:2001:14ba:7426:df00::6? (drtxq0yyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:7426:df00::6])
        by smtp.gmail.com with ESMTPSA id o7-20020ac24947000000b005132f12ee7asm991001lfi.174.2024.03.25.02.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 02:10:06 -0700 (PDT)
Message-ID: <0352287d-cbd0-4ed7-8551-a23191487279@gmail.com>
Date: Mon, 25 Mar 2024 11:10:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
List-Id: <soc.lore.kernel.org>
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Gregory CLEMENT
 <gregory.clement@bootlin.com>, soc@kernel.org, arm@kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 linux-gpio@vger.kernel.org
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-4-kabel@kernel.org>
Content-Language: en-US, en-GB
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240323164359.21642-4-kabel@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Marek,

I can't say I did a proper review but browsing through the code without 
proper understanding of the platform raised one small question :)

On 3/23/24 18:43, Marek Behún wrote:
> Add support for GPIOs connected to the MCU on the Turris Omnia board.
> 
> This includes:
> - front button pin
> - enable pins for USB regulators
> - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
> - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
> - on board revisions 32+ also various peripheral resets and another
>    voltage regulator enable pin
> 
> Signed-off-by: Marek Behún <kabel@kernel.org>

...

> +/**
> + * omnia_mask_interleave - Interleaves the bytes from @rising and @falling
> + *	@dst: the destination u8 array of interleaved bytes
> + *	@rising: rising mask
> + *	@falling: falling mask
> + *
> + * Interleaves the little-endian bytes from @rising and @falling words.
This means the 'rising' and 'falling' should always be little-endian? 
Should the parameter types reflect this? Or should we see some 
cpu_to_le() calls? (Or, is this code just guaranteed to be always 
running on a le-machine?).

> + * If @rising = (r0, r1, r2, r3) and @falling = (f0, f1, f2, f3), the result is
> + * @dst = (r0, f0, r1, f1, r2, f2, r3, f3).
> + *
> + * The MCU receives interrupt mask and reports pending interrupt bitmap int this
> + * interleaved format. The rationale behind it is that the low-indexed bits are
> + * more important - in many cases, the user will be interested only in
> + * interrupts with indexes 0 to 7, and so the system can stop reading after
> + * first 2 bytes (r0, f0), to save time on the slow I2C bus.
> + *
> + * Feel free to remove this function and its inverse, omnia_mask_deinterleave,
> + * and use an appropriate bitmap_* function once such a function exists.
> + */
> +static void omnia_mask_interleave(u8 *dst, u32 rising, u32 falling)
> +{
> +	for (int i = 0; i < sizeof(u32); ++i) {
> +		dst[2 * i] = rising >> (8 * i);
> +		dst[2 * i + 1] = falling >> (8 * i);
> +	}
> +}
> +
> +/**
> + * omnia_mask_deinterleave - Deinterleaves the bytes into @rising and @falling
> + *	@src: the source u8 array containing the interleaved bytes
> + *	@rising: pointer where to store the rising mask gathered from @src
> + *	@falling: pointer where to store the falling mask gathered from @src
> + *
> + * This is the inverse function to omnia_mask_interleave.
> + */
> +static void omnia_mask_deinterleave(const u8 *src, u32 *rising, u32 *falling)
> +{
> +	*rising = *falling = 0;
> +
> +	for (int i = 0; i < sizeof(u32); ++i) {
> +		*rising |= src[2 * i] << (8 * i);
> +		*falling |= src[2 * i + 1] << (8 * i);
> +	}

Also here I could expect seeing le_to_cpu() unless I am (again :]) 
missing something.

> +}

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

