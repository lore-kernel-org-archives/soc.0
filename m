Return-Path: <SRS0=+Qs5=F6=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562AACDB465
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 07:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E340C433CA; Mon, 16 Oct 2023 07:52:25 +0000 (UTC)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40625C433C8;
	Mon, 16 Oct 2023 07:52:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40625C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-53ebf429b4fso1323485a12.1;
        Mon, 16 Oct 2023 00:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697442742; x=1698047542; darn=kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E6sUQ9HeUtkm8U7QMJPcmPOqu8YSUP5yniOXjO00fOY=;
        b=iAjinRFL831LGMVspBPp+wvK6pGfWxP8iKjLM0OxlJ9XEmQH4uaG+1q+/pQ7kyD+jV
         bMOVtctztEwrtft0aNTxdt5U3uh82QIlhYL/nUyJp1EiBYqAZyqdKkBIWmV0Pib1HJKD
         ScPwmGs2EI9a+VBIEc6ZTtx/NGZ6s+Jt5Qk4DLFSyap0gHCKpHaeKL1zSvEU0prGd4SZ
         K7Z9wrc4P2+F6MgmGgaEvdZqVRR6YujYEEVY3FiLyXZCRvxM6y0PfKjlBZAZFLoXILws
         hLyrU+C/890fBHc+K3th29elZLdHPZCmbgF2WJPq7wGHMspW5X40J6ofPdMPnlGk7dX2
         RZLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697442742; x=1698047542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E6sUQ9HeUtkm8U7QMJPcmPOqu8YSUP5yniOXjO00fOY=;
        b=ENjVBC3mSwhqoVDSdH8yhu/FIE6M/c6oTMJkkXjcUDW4Kmm6bwD0zqLmeEXnzsUQER
         IUQwO0GNUigJ0QldU+FuN7kwAzy4tm19S3FyCLxDlrbknsCJEdAJ6FTgUxWLflylpLdL
         ehF+srlJsTJqz4dq1s0/eRtXos+8+FLVoiIJvGHJ16h08PDq+IWS/sXDihp8dsXkWuLt
         Ieg8V4yy3WgXMrkGB5bImLfZni8v65XSbjyL6xbMQmm6W/Veo+113+BeSJLAnV1FRiC/
         iSHXjJ9vxrNAmh+seHSYZkoNg3Qg0V2Sx+X830+Fd+LfwU2PB4jhzDKDEkrI9EzlqThh
         i5Xw==
X-Gm-Message-State: AOJu0Yy8HqxBso8hSVR4jpj9CgFFtpqhTsw17b3YTZEHpXaOXMt6OQe1
	PKSw9iRldwpVBwvi/4fwluQ=
X-Google-Smtp-Source: AGHT+IEm+bxaBQIEFyLS/d0ZUBEXUwJyKtxxlSX6R7XwmzI5F/uElm7oSRV2OszGt6IlAMoKoA0CTA==
X-Received: by 2002:a05:6402:11cf:b0:53d:a4e5:67d0 with SMTP id j15-20020a05640211cf00b0053da4e567d0mr14930124edw.13.1697442742171;
        Mon, 16 Oct 2023 00:52:22 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.161.188])
        by smtp.gmail.com with ESMTPSA id cb5-20020a0564020b6500b0053ddbfa71ddsm6886588edb.47.2023.10.16.00.52.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 00:52:20 -0700 (PDT)
Message-ID: <aca26ff7-801c-65ad-0cc2-fef8a4f74e27@gmail.com>
Date: Mon, 16 Oct 2023 09:52:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [GIT PULL] arm64: dts: mediatek: Updates for v6.7
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>,
 SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Chen-Yu Tsai <wens@csie.org>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <7a877ad9-481f-bad8-5cad-5d013c6cd70d@gmail.com>
 <ae62c7e0-3e72-403c-abb4-569573037980@app.fastmail.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <ae62c7e0-3e72-403c-abb4-569573037980@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd,

On 13/10/2023 22:40, Arnd Bergmann wrote:
> On Mon, Oct 9, 2023, at 12:34, Matthias Brugger wrote:
>> Hi Arnd and Olof,
>>
>> Please find below a few patches for the 64 bit DTS files targeted for v6.7.
>>
>> The patches were picked up with the help from Angelo.
>> With these changes we have now support for the Genio 1200 EVK board for IoT
>> applications. Also the MT8365 from the same business line has much more support
>> of peripherals.
>> Also support for the new 4th revision of the Acer Chromebook 514 was added. The
>> difference with older board is the audio codec used.
>> On the Mobile phone side of things, support for the Helio X10, which is used by
>> the Sony Xperia M5 got support for the display.
> 
> Hi Matthias,
> 
> The contents all look good and I'm happy to merge them, but I noticed that
> the branch is based on -rc4, while my soc/dt branch is based on -rc3.
> 
> Pulling it in would slightly mess up the git history and the 'git request-pull'
> output because of the backmerge of the mainline contents. Do you
> have a hard dependency on something that went into rc4, or can you
> rebase the branch to -rc3 or earlier?
> 
> I usually recommend using -rc1 as a base unless there is an important
> dependency on something that was merged later.
> 

AFAIK ther is no dependency on -rc4. I'll send a new pull request based on the 
correct -rc3

Sorry for that.

Regards,
Matthias
