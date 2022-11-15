Return-Path: <SRS0=A2Es=3P=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212A2C4332F
	for <soc@archiver.kernel.org>; Tue, 15 Nov 2022 10:03:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E1F96C4347C; Tue, 15 Nov 2022 10:03:28 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CDB80C433C1
	for <soc@kernel.org>; Tue, 15 Nov 2022 10:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org CDB80C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id a15so16821418ljb.7
        for <soc@kernel.org>; Tue, 15 Nov 2022 02:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jVHAqVOFOIO3tvRqDcBAu+xC9tXo1pnoVyzEBNhSiIc=;
        b=jUkX3LGnWXLFPccugErlLKf68JDx/jZoWcVO6kWP1HwVvtz1fOTZp4SZBX59SPNvWY
         MsKc08pZYciDJ36dBdwLpTQ4P2q2590OJgQmv7luTOOv9NZKUVFzE6QUclW1Yey2upSN
         BsK/DZlasP5usE3/L/gIVHHAv5OrcWstZr1LRkiSUZe9CRWLU/aXfzylvTbH9pqyXeeH
         yLTmgDoU+4Wnp+bd0Wmw1Xb2sUn0EUel4SNk2Ut0vw5d8AUtyC/G9W/8SWWtv2Kl0BN2
         2UlOYTLAH3Hp2grtskfOej31t9iZ929WwRZ5QFkmiqrvu8MYSBp/1p5jZ8Iprd93Ld5t
         8p4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVHAqVOFOIO3tvRqDcBAu+xC9tXo1pnoVyzEBNhSiIc=;
        b=KgX4jtnbF13QJOC96auo1VAw02kO60J+zLjDqf9OBOtesfIQNhDWyJoMhMj35Z3o4o
         HRJPflW00O8OEJZiYQJIfNajYljJRPpbzj3RuRzls47OfOPYIzpnemsGziTVX+Qpz9HL
         ho6taLGcpXrDf7pS5OKyhH3ROIQwhW6hbs77SSp6sPmtK1NiJODeEJ2mIXS5+on9tC0h
         kshC2kSoGeesLg7fyheuoAZNNPlt8n0+e3kt8yCXo3ZBSsuJMinqj60ryjpul7zV4ZZm
         swEr8D1NxdHZBT6xwX0A21MMHrrO4JqcPIFyU+LPWHuDvmADEB/Il1M7Db39Sv3D4B5I
         0nDQ==
X-Gm-Message-State: ANoB5pm0nu9UKouXxgIVIjCL1I0ZEITIAL07zzA/3AgdYHTeRAfAV03S
	jTjwJajqm+Drhe3qcW82IhQSWg==
X-Google-Smtp-Source: AA0mqf4ZBOY+NbRidImWf6BOalvJHq++fwVTExCvgKtrjTOUuDgujwmoiIXE80tURsxs7CC5ZKhoJw==
X-Received: by 2002:a2e:a815:0:b0:277:1d7e:9f6b with SMTP id l21-20020a2ea815000000b002771d7e9f6bmr5078984ljq.421.1668506605985;
        Tue, 15 Nov 2022 02:03:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b10-20020a056512070a00b004948378080csm2151660lfs.290.2022.11.15.02.03.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 02:03:25 -0800 (PST)
Message-ID: <52920a00-8e29-f7f4-0cbd-ceb638ded970@linaro.org>
Date: Tue, 15 Nov 2022 11:03:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 03/11] phy: sun4i-usb: add support for the USB PHY on
 F1C100s SoC
Content-Language: en-US
To: =?UTF-8?Q?Jernej_=c5=a0krabec?= <jernej.skrabec@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Vinod Koul <vkoul@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Icenowy Zheng <uwu@icenowy.me>, soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
References: <20221106154826.6687-1-andre.przywara@arm.com>
 <20221106154826.6687-4-andre.przywara@arm.com> <Y2ypy0CM8rJGu2g4@matsya>
 <4438485.LvFx2qVVIh@jernej-laptop>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4438485.LvFx2qVVIh@jernej-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15/11/2022 07:01, Jernej Škrabec wrote:
> Dne četrtek, 10. november 2022 ob 08:35:39 CET je Vinod Koul napisal(a):
>> On 06-11-22, 15:48, Andre Przywara wrote:
>>> From: Icenowy Zheng <uwu@icenowy.me>
>>>
>>> The F1C100s SoC has one USB OTG port connected to a MUSB controller.
>>>
>>> Add support for its USB PHY.
>>
>> This does not apply for me, please rebase and resend
>>
>> Also, consider splitting phy patches from this. I dont think there is
>> any dependency
> 
> DT patches in this series depend on functionality added here.
> 

DTS always goes separately from driver changes because it is a hardware
description. Depending on driver means you have potential ABI break, so
it is already a warning sign.

Best regards,
Krzysztof

