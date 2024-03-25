Return-Path: <SRS0=+0zi=K7=gmail.com=mazziesaccount@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DB84C54E64
	for <soc@archiver.kernel.org>; Mon, 25 Mar 2024 10:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21618C43394; Mon, 25 Mar 2024 10:25:49 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FB6EC433C7;
	Mon, 25 Mar 2024 10:25:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0FB6EC433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d46c2e8dd7so52867961fa.1;
        Mon, 25 Mar 2024 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711362345; x=1711967145; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drVmPrOGlaxlw1Sxi/EBmZ7qToJRNSWwMlS+2I1Eeyo=;
        b=ZnoJ44bErgS1LAeW5+2v8Zdh00QnOqXy09ojegSSwcc3QlOLJCF0s6ezmnPQOzNs+Q
         XRZirNhJtt23rwvRFhHa142QY0aQeFTgrtzSVuo/jZ5w+wZzqFI5UPX3+Ln+zzubRGgm
         xrgGKFWs1yBMLTO9lO+yj85CYHXbKHouvRUNhh/AxPhEb9qMFbRbu/LzUS4RYMmXSGex
         Tx8L0TBw+82HoZNL6+qFB2kCXchB7F+jyJNFJcokyAcKv7vkK6t6ZQL1HdxXJV+M8QJH
         u+gCAxC9BC75OU9coj15HlGBy6X69yTEnIEcbdlLEVz0XmgDHvMiJuf9eJ33Ga7mRn2k
         Y+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711362345; x=1711967145;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drVmPrOGlaxlw1Sxi/EBmZ7qToJRNSWwMlS+2I1Eeyo=;
        b=FNmIYa19dXyUui5JGeh8INx4qnh3YuPbJLenz4oC0szqK9MGdhuNfIKXNUPhA7iSy+
         wUTWwa49ZXD6nS/f9jCFUTGCicyXhirg5Oc3cVMgqQjHJlkjHcSILlOX/8lLA6soUMYO
         M8+SiODwYRFq7Aik3/GBOz43zwmwYaEsiQQj1A9LVTw6V0E4Xp7ae1EJCFtF6r9jLV1m
         C2Mt+CGDSqZD/2k4JENT9+Af184WhkFo6jP1Y3h+GOH6qR13FxgsHuqywhFBUEW9POnt
         vuAiMhkJuuFhEHbpw881sD8VQSWMP+GMq7G6zV+dejpCcsuutlj5X5ZGN3Nd1kwZ9+r3
         geEA==
X-Forwarded-Encrypted: i=1; AJvYcCXYKX1+XFOBdrsRcG4WepXpTbu5uoMmuZ8GibeBfCn6dh0TYKUFV8sN9ju6Gb1zrtPj8z2ldc0dA/KcJsePEe2aXKPUYP3PCLHnfgqGrpnSD5ALES6y1UARtVZgJyo6BA==
X-Gm-Message-State: AOJu0YzerUZFN+8lMe5Pyc67qjbRNyitIoEwZTnySHpNJl9dPIX6nBS+
	Elfw1GTNO0TPkPepCGQbqa5rKVNnm8+T8/Zm29St3r0lc39qmsQDYZ6Sur4Z
X-Google-Smtp-Source: AGHT+IFKZlFLfEQ55bAXRYWBGmfkZZm3v6Q5DiR6ouV4RDQuBICVmuMzwf5Z8ZAxCUvkJxoUM4XW+A==
X-Received: by 2002:a2e:2e04:0:b0:2d2:ba5a:68d0 with SMTP id u4-20020a2e2e04000000b002d2ba5a68d0mr4707247lju.33.1711362345230;
        Mon, 25 Mar 2024 03:25:45 -0700 (PDT)
Received: from ?IPV6:2001:14ba:7426:df00::6? (drtxq0yyyyyyyyyyyyydy-3.rev.dnainternet.fi. [2001:14ba:7426:df00::6])
        by smtp.gmail.com with ESMTPSA id d7-20020a2e8907000000b002d10daeb6dasm1391959lji.126.2024.03.25.03.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 03:25:44 -0700 (PDT)
Message-ID: <cf2c77c4-242a-48a5-bbe8-eab634f300fc@gmail.com>
Date: Mon, 25 Mar 2024 12:25:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/11] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Content-Language: en-US, en-GB
To: =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Gregory CLEMENT <gregory.clement@bootlin.com>, soc@kernel.org,
 arm@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>,
 linux-gpio@vger.kernel.org
References: <20240323164359.21642-1-kabel@kernel.org>
 <20240323164359.21642-4-kabel@kernel.org>
 <0352287d-cbd0-4ed7-8551-a23191487279@gmail.com>
 <20240325105349.6f6c21c7@dellmb>
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20240325105349.6f6c21c7@dellmb>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/25/24 11:53, Marek Behún wrote:
> On Mon, 25 Mar 2024 11:10:04 +0200
> Matti Vaittinen <mazziesaccount@gmail.com> wrote:
> 
>> Hi Marek,
>>
>> I can't say I did a proper review but browsing through the code without
>> proper understanding of the platform raised one small question :)
>>
>> On 3/23/24 18:43, Marek Behún wrote:
>>> Add support for GPIOs connected to the MCU on the Turris Omnia board.
>>>
>>> This includes:
>>> - front button pin
>>> - enable pins for USB regulators
>>> - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
>>> - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
>>> - on board revisions 32+ also various peripheral resets and another
>>>     voltage regulator enable pin
>>>
>>> Signed-off-by: Marek Behún <kabel@kernel.org>
>>
>> ...
>>
>>> +/**
>>> + * omnia_mask_interleave - Interleaves the bytes from @rising and @falling
>>> + *	@dst: the destination u8 array of interleaved bytes
>>> + *	@rising: rising mask
>>> + *	@falling: falling mask
>>> + *
>>> + * Interleaves the little-endian bytes from @rising and @falling words.
>> This means the 'rising' and 'falling' should always be little-endian?
>> Should the parameter types reflect this? Or should we see some
>> cpu_to_le() calls? (Or, is this code just guaranteed to be always
>> running on a le-machine?).
>>
>>> + * If @rising = (r0, r1, r2, r3) and @falling = (f0, f1, f2, f3), the result is
>>> + * @dst = (r0, f0, r1, f1, r2, f2, r3, f3).
>>> + *
>>> + * The MCU receives interrupt mask and reports pending interrupt bitmap int this
>>> + * interleaved format. The rationale behind it is that the low-indexed bits are
>>> + * more important - in many cases, the user will be interested only in
>>> + * interrupts with indexes 0 to 7, and so the system can stop reading after
>>> + * first 2 bytes (r0, f0), to save time on the slow I2C bus.
>>> + *
>>> + * Feel free to remove this function and its inverse, omnia_mask_deinterleave,
>>> + * and use an appropriate bitmap_* function once such a function exists.
>>> + */
>>> +static void omnia_mask_interleave(u8 *dst, u32 rising, u32 falling)
>>> +{
>>> +	for (int i = 0; i < sizeof(u32); ++i) {
>>> +		dst[2 * i] = rising >> (8 * i);
>>> +		dst[2 * i + 1] = falling >> (8 * i);
>>> +	}
>>> +}
>>> +
>>> +/**
>>> + * omnia_mask_deinterleave - Deinterleaves the bytes into @rising and @falling
>>> + *	@src: the source u8 array containing the interleaved bytes
>>> + *	@rising: pointer where to store the rising mask gathered from @src
>>> + *	@falling: pointer where to store the falling mask gathered from @src
>>> + *
>>> + * This is the inverse function to omnia_mask_interleave.
>>> + */
>>> +static void omnia_mask_deinterleave(const u8 *src, u32 *rising, u32 *falling)
>>> +{
>>> +	*rising = *falling = 0;
>>> +
>>> +	for (int i = 0; i < sizeof(u32); ++i) {
>>> +		*rising |= src[2 * i] << (8 * i);
>>> +		*falling |= src[2 * i + 1] << (8 * i);
>>> +	}
>>
>> Also here I could expect seeing le_to_cpu() unless I am (again :])
>> missing something.
> 
> I don't understand. The rising and falling variables have native
> endiannes, as they should have.

So, it was the last option then :) I was missing something.

> And the src and dst are u8 arrays, which contain two LE32
> unsigned integers, but these integers are interleaved. I am converting
> then to two native unsigned integers byte by byte, so I am basically
> doing what a theoretical le32_interleaved_le32_to_cpu() would have done
> if it did exist. Putting another le*_to_cpu() would only break things.

Thank you for the explanation. I commented way too hastily after a 
glance - missing the point you used shift and not u8 pointer to go 
through the 'rising' and 'falling' in interleave() - and the point that 
the result of deinterleave() was u8s. Very sorry for the noise.

Thanks for the patience!

Yours,
	-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

