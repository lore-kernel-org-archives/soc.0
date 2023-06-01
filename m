Return-Path: <SRS0=6RqZ=BV=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62097C7EE23
	for <soc@archiver.kernel.org>; Thu,  1 Jun 2023 17:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 29137C433D2; Thu,  1 Jun 2023 17:40:25 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 30D3EC433EF;
	Thu,  1 Jun 2023 17:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 30D3EC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-3f6b9ad956cso8527481cf.1;
        Thu, 01 Jun 2023 10:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685641223; x=1688233223;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=13OtiVNDk7Qnhrn0b5bUKmlN5jJ6hIbpEhAOIHlDDmE=;
        b=HEdo07YPpe45yznR/Peu97wwu9mt06mz7RY7ywsbD3e6FPcnkvFnLJVhVVTMaZ2O/U
         9D26+YOj8dcBWdGNKy1+Vf+maLnQNK+p2l1m2y8QjDDcERPrqZSFv8N35AfnMZHFzhEG
         om0v8ecAwsEwNFsUmnw50nVcIW/qmsm3cav4LPgKfwxZXuG/zfK2lXiNTrgx/YXRTgLS
         2ZgE4G/Xk+O1r+2euIEbp2An6KsgFeBrCp9ihYanVrowKPpjsaEhKM3Kwcftvnbk9GmJ
         TBGEynm6vfEX/K6KWOi7LBmpY3onaPGEw0HMR4shDe3smz2+mWBnZG7T0npAn6y8I1v0
         Epgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685641223; x=1688233223;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=13OtiVNDk7Qnhrn0b5bUKmlN5jJ6hIbpEhAOIHlDDmE=;
        b=SfRA82WdYO9Gxc0dAWHdRJVJIwFQ/RSBO0b5cbfxzn0Xw4013S6oeJUMOxKO3oVflT
         tCR+DIIBUuOCb8aLo3Mzbt+sRBkF0OyBNmROz2LFNDOBA0UM+/wnG5bEhbk1fn5gPoXf
         5BUpMULhNVl+rCBa3leu9FSv3zeEytglN/E8Hyu2NgCnQYKQLc63CbWxbr0u9wvtnIWZ
         mylEzMQOH9lgjpgVgUBejDZewXW7xE849FR+hc3I8fbSTJeXGIS20t0pFO8bshmTkbPk
         09sSXdhATlrsJHpyyGVTpDfkNRFfEwW+oeC4WoAW1QTTNkAqGjSK6AiLg8/J6nWxqiqw
         Q7sQ==
X-Gm-Message-State: AC+VfDxUV/lpy6QrXIhkDZK7vi9M9r9inN8uSi6GTVuVucYs2iI6QMSE
	YMKtuTD1AWS5oeLeQnzw530=
X-Google-Smtp-Source: ACHHUZ40EkCbcoq3YvjbjiQWgnYXEIvqE8x4wuUqAgp8yqiBLmpyEGCyTBaO8dexhya9WlWfemqUdQ==
X-Received: by 2002:ac8:5e4d:0:b0:3f6:ac1b:47a3 with SMTP id i13-20020ac85e4d000000b003f6ac1b47a3mr9675721qtx.26.1685641222840;
        Thu, 01 Jun 2023 10:40:22 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id e13-20020ac8490d000000b003f7369c7302sm7957235qtq.89.2023.06.01.10.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Jun 2023 10:40:21 -0700 (PDT)
Message-ID: <ee304442-b8bf-ef9e-e10e-64ec4daf8ba1@gmail.com>
Date: Thu, 1 Jun 2023 10:40:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/2] arm*/dts: Enable symbols for rpi device trees
Content-Language: en-US
From: Florian Fainelli <f.fainelli@gmail.com>
To: Conor Dooley <conor.dooley@microchip.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
References: <20230530175624.2360218-1-u.kleine-koenig@pengutronix.de>
 <20230601140214.i4yvya763sotyjz7@pengutronix.de>
 <20230601-rake-calamari-eda0c88bd9bf@wendy>
 <d47958c6-eec6-badd-8924-62807461546f@gmail.com>
In-Reply-To: <d47958c6-eec6-badd-8924-62807461546f@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/1/23 08:37, Florian Fainelli wrote:
> 
> 
> On 6/1/2023 7:13 AM, Conor Dooley wrote:
>> On Thu, Jun 01, 2023 at 04:02:14PM +0200, Uwe Kleine-König wrote:
>>> Hello,
>>>
>>> On Tue, May 30, 2023 at 07:56:22PM +0200, Uwe Kleine-König wrote:
>>>> based on an earlier submission by Aurelien Jarno, I rebased and 
>>>> slightly
>>>> simplified the patches.
>>>>
>>>> There was some related irc conversion in #armlinux. Quoting the 
>>>> relevant
>>>> parts:
>>>>
>>>> 1685078851< ukleinek> arnd, [florian]: Who would pick up 
>>>> https://lore.kernel.org/linux-arm-kernel/20220410225940.135744-1-aurelien@aurel32.net ?
>>>> 1685078920< ukleinek> arnd, [florian]: If there is an agreement in 
>>>> general that this is a good idea, I can coordinate with Aurelien 
>>>> that for arm64 there is a v2 with the simpler approach I pointed out.
>>>> 1685083481< arnd> ukleinek: I have no objections to this, if 
>>>> [florian] wants to pick it up and send me for 6.5.
>>>> 1685083809< arnd> robher: any comments on this one?
>>>> 1685466520 < [florian]> ukleinek: I was hoping we would get an Ack 
>>>> for robher before picking it up in the brcm soc tree, don't want to 
>>>> ruffle any feathers unnecessarily
>>>>
>>>> So it seems to start a beneficial chain reaction, only Rob's Ack is
>>>> needed.
>>>
>>> Not sure this might help, but as Rob seems to be away for mail, I'll
>>> try: arch/arm64/boot/dts/nvidia/Makefile and
>>> arch/arm64/boot/dts/ti/Makefile also make use of -@. So this patch at
>>> least isn't a completely new thing and maybe Florian might dare to take
>>> this patch even without Rob's explicit consent?!
>>
>> FWIW you can have mine, unless it is explicitly Rob's you want Florian.
>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> OK, I will take yours and queue those up!

Applied both with Conor's ack. Uwe, please copy 
bcm-kernel-feedback-list@broadcom.com next time, so the patches show up 
in our patchwork and make my life a tad easier ;)

Thanks everyone.
-- 
Florian

