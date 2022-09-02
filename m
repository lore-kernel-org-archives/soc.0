Return-Path: <SRS0=++0e=ZF=gmail.com=mr.bossman075@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2C83C54EE9
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 12:57:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 647B9C433D6; Fri,  2 Sep 2022 12:57:32 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 559DCC433C1;
	Fri,  2 Sep 2022 12:57:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 559DCC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f175.google.com with SMTP id c20so1337776qtw.8;
        Fri, 02 Sep 2022 05:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=GaKGM+dpPVOcKQB0I709BWsCafKACGVR73YUNmM0p9M=;
        b=MzOF0SUMu+LWHqJesHluUKrd/Yms+3BJ4yiX8IZ4kldKwlXIPY6KoRbCzBQ0E9owFd
         FOSw0LJFW7lY6uNW/5x4vetN/h3aNtuJDktsTt3UxTRjcBEIBqnLW+Hkq5QV7OJWSV4K
         0ON6XAsbrJLtCVL/5ZilEYsRB7NT3LyKzCjY1RGXUS9kzZmlwR0ZgGBXWCDeyojdnOVs
         1KUiQMtmLsMbWJ9IE3sCwx6L5p0vlRMSAKSg/Ev1evlOODPx6m+94MdrNxZ8u0qblaQN
         I/lErX1UA2O/VGKoZLA3AYLgVIFYbMTFI72OWZSTAgWWoJGo07vEfaKmwoGTGCDAGXD0
         7oUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=GaKGM+dpPVOcKQB0I709BWsCafKACGVR73YUNmM0p9M=;
        b=LfzoCtsxqZEYej6p3KiVeSzr+Pi73ST5l66x+Avaln8nh4qSpnH7oPHMOkfVd8NBpM
         S7ezzozA8docScCgpFYhX9Pk9q12vMfKcibDn7KdmqPli38L5LWF6v0/fmVtWSmDMofN
         PnBNTRbMjlKTYoU7zcu8FVRv23fZAQ9V8IE9+U/tpy3KkebwM30kSp5B5qkSUppO4r8m
         TkcCQExcmBldAC/k3k45gRHdrQ37zxfZc+mD7H15I5YbddNxtXVZF+0n7Wm8I1wHFAHC
         INiDK/IWzE3riEpVFL0APt8Lv1HlvI11FS3TxUoyn3fDyLQrsDdEXEW0tW7S6MfJ38g9
         gXEg==
X-Gm-Message-State: ACgBeo3PHCz0kiZY627CoJLaJPrLhpGVFi9Gdeuve75/QWexwBUqpOpF
	DRaSJXO7caXGfwo0hY+KMG4=
X-Google-Smtp-Source: AA6agR6ukfEivBRMBVS78MYzMPw2RtR4O1lu1dnKDXXluEBnn1qLr4Sdq/b8RyCi0wQaMU5oUvbymw==
X-Received: by 2002:ac8:5995:0:b0:343:77a0:7c39 with SMTP id e21-20020ac85995000000b0034377a07c39mr28186140qte.663.1662123450255;
        Fri, 02 Sep 2022 05:57:30 -0700 (PDT)
Received: from [10.4.10.38] (146-115-144-188.s4282.c3-0.nwt-cbr1.sbo-nwt.ma.cable.rcncustomer.com. [146.115.144.188])
        by smtp.gmail.com with ESMTPSA id eb2-20020a05620a480200b006b629f86244sm1209868qkb.50.2022.09.02.05.57.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Sep 2022 05:57:28 -0700 (PDT)
Message-ID: <bb4804c0-04d2-6e0c-b9db-1243828ca515@gmail.com>
Date: Fri, 2 Sep 2022 08:56:53 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.2
Subject: Re: [PATCH v6 00/10] Add support for i.MXRT1170-evk
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-imx@nxp.com, robh+dt@kernel.org, mturquette@baylibre.com,
 sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com,
 stefan@agner.ch, daniel.lezcano@linaro.org, tglx@linutronix.de,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, linux@armlinux.org.uk,
 abel.vesa@nxp.com, dev@lynxeye.de, marcel.ziswiler@toradex.com,
 tharvey@gateworks.com, leoyang.li@nxp.com, sebastian.reichel@collabora.com,
 cniedermaier@dh-electronics.com, clin@suse.com,
 giulio.benetti@benettiengineering.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20220901183343.3188903-1-Mr.Bossman075@gmail.com>
 <CACRpkdb25ikL4F499NDCrv1kf2FGvJxqDW2wk9GNQCqrbX9kKQ@mail.gmail.com>
From: Jesse Taube <mr.bossman075@gmail.com>
In-Reply-To: <CACRpkdb25ikL4F499NDCrv1kf2FGvJxqDW2wk9GNQCqrbX9kKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/2/22 04:06, Linus Walleij wrote:
> On Thu, Sep 1, 2022 at 8:33 PM Jesse Taube <mr.bossman075@gmail.com> wrote:
> 
>> This patch contains:
>> - Update to imxrt_defconfig
>> - Devicetree
>> - Clock driver
>> - Pinctrl driver
> 
> No it does not, I already merged that.
> 
> I think you should probably split up your series per-subsystem so the
> clock bindings and changes can be merged separately etc.
> 
> Then the DTS files can be added to the ARM SoC tree as a final step.
> 
> When you send everything in one bundle like this subsystem maintainers
> don't know if they can merge e.g. just the clock patches separately
> and be done with their part (like what I did with pinctrl).
Do you think its possible to add Docs for Device tree compatibles that 
aren't added yet?

Thanks,
Jesse Taube
> 
> Yours.
> Linus Walleij
