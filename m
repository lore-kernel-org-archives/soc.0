Return-Path: <SRS0=LGPB=5S=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C1DDC38142
	for <soc@archiver.kernel.org>; Sat, 21 Jan 2023 20:27:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4FCB2C433D2; Sat, 21 Jan 2023 20:27:58 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C0D71C4339B
	for <soc@kernel.org>; Sat, 21 Jan 2023 20:27:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C0D71C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id g10so6399566wmo.1
        for <soc@kernel.org>; Sat, 21 Jan 2023 12:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2gYor4MITA5uSMYoCpBNwX+bgrx2iZsvrgpEb0qchBs=;
        b=L38lHgm0yzSqIA94fztSf77pU+UWyIqPmMmeYS+7omaI3yKNXTgeliVz9rPHRvMHyL
         iveL1RRXOnAZr7elw2jS5ZpA8j6wqP5zxK8kLzbI19XcTwgorCW/IHc5GzR3d1Mnwfhr
         m1nlUWbnD0QyyYBBIumrmNHzFk+jUir9ZiffBt8kpUkjp5+8cpWRi19u2UGVfGS5Q2Bg
         IwrosQ+z/+pki2591R900Wp+4eHBggrjZtA749vkdUZsGgr87VzLn0QQ9nCNioK57V+n
         TEPyUqwOv5rpjuvtSC81qx4StFWdgh9hhQ40u+obs8nkkoe8eEz0AOR4lEAeLLZK/++0
         6OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2gYor4MITA5uSMYoCpBNwX+bgrx2iZsvrgpEb0qchBs=;
        b=I3qZp5k9ANM3ppUQ1Po9kw2MK3C/hK4pbZybcWLGIWfV8mxOfRDwzjGrwgoWLXJuW/
         e0weIZIO0AVV4VThhHtjfZ2p1aMabIkuqSMnjLntOHnVotZypwqtRulL0KkCSfrouY/L
         jVjUrE2D+PzGii9MN+v7ngbc0rbJd8RvQqEiJGYCPP9XEdlk7H5GEcOeGuA5aPD+e/I4
         a2tOrc6ggJW0aSGQJWNz1rLEHgHPqkpe0VREFSc+66GVlHgpvWYuX7TGCmKX4yy2SMBl
         Z3ce2vV14a2J6FfJP8CgyGpGX0Qf6Bbvb/WCtij+vKynXFnH1t0G7GxhzYI10NE6hdFJ
         ekQA==
X-Gm-Message-State: AFqh2kqtLcarp42eivNHfl4YwXcQUrWOjeTEko7qvzZ76V45ZNvF+THr
	rzyFwuftTeZjBc+mtID0xozYLA==
X-Google-Smtp-Source: AMrXdXtiemP2u4lmD7Dy1eRfHpYZQ84FNIvfGnxxFc7ySjWlCL9N0sMPVS2vqhS1eggWqZrXD1CsqQ==
X-Received: by 2002:a05:600c:3b84:b0:3da:fd7c:98b3 with SMTP id n4-20020a05600c3b8400b003dafd7c98b3mr18322184wms.25.1674332874942;
        Sat, 21 Jan 2023 12:27:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d19-20020a05600c34d300b003a6125562e1sm6201659wmq.46.2023.01.21.12.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jan 2023 12:27:54 -0800 (PST)
Message-ID: <3114bdeb-c8eb-3a3a-0d68-ca3370ce64ec@linaro.org>
Date: Sat, 21 Jan 2023 21:27:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 8/9] ARM: multi_v7_defconfig: Add options to support
 TQMLS102xA series
Content-Language: en-US
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
List-Id: <soc.lore.kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
 Marek Vasut <marex@denx.de>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230119144236.3541751-1-alexander.stein@ew.tq-group.com>
 <20230119144236.3541751-9-alexander.stein@ew.tq-group.com>
 <acab1d7a-ef00-a3be-f73c-6cb9d01687b9@linaro.org>
 <2168770.1BCLMh4Saa@steina-w>
 <e08e6325-4b2b-c1ce-b33a-877de2c0babe@linaro.org>
 <Y8qr8wl8WdJfQ9We@shell.armlinux.org.uk>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y8qr8wl8WdJfQ9We@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/01/2023 15:57, Russell King (Oracle) wrote:
> On Fri, Jan 20, 2023 at 12:35:41PM +0100, Krzysztof Kozlowski wrote:
>> Defconfig=y is only for critical stuff needed to bring initramfs. Time
>> is not needed for initramfs.
> 
> Are I2C drivers "critical stuff"? What about AHCI drivers? What about
> all the USB HCI drivers? USB Storage can certainly be loaded from an
> initramfs, yet it's =y. LED triggers? Loads of RTC drivers that are
> marked as =y? XOR drivers? VIRTIO drivers? Filesystems? I seem to
> remember Red Hat sets even popular filesystems to be a module in their
> kernel.

Almost all your answers above - these should be =m. USB not always,
because it is used for USB Ethernet adapters which is used for network
boot (although even then initramfs comes with actual drivers...)

> 
> Clearly, "defconfig=y is only for critical stuff" is rather false in
> practice, and I suspect is little more than a desire rather than a
> rule. I suspect it's more "defconfig=y is for stuff that makes most
> platforms successfully boot without an initramfs".

Yes, that's true, although there was already pushback against this.
Having an initramfs is not a big deal and nowadays I think all new ARMv8
platforms use it.

Anyway this talk here is about RTC which is not needed at all as built in.

Best regards,
Krzysztof

