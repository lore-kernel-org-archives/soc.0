Return-Path: <SRS0=CAhr=V7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E105C433EF
	for <soc@archiver.kernel.org>; Mon, 23 May 2022 15:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FEACC3411B; Mon, 23 May 2022 15:25:02 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A6483C385A9
	for <soc@kernel.org>; Mon, 23 May 2022 15:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A6483C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id h8so17629123ljb.6
        for <soc@kernel.org>; Mon, 23 May 2022 08:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=2w+Ay74cy7OoOg37g3PaLjsP1sHLBt98ivncMEHUTZE=;
        b=orFcSTvpnjF2Ul0w/eFhjws6UEFRdIdVSVYukzC2tF+nVYSnHFaaxmflPfpw8qz8qF
         ik6PDz0cc8Oj7SbKnxObem78aoMCd+xjnQdgKZpY6s9du2FQPRFqXEjMx84zUfHaUSK5
         +5aDtV1uK8iokGkuUohuvW0L7k1LR2OiZl2HdjndCXqss8DzPENH45G9Pn+m8EbPTZWj
         s+yQdMDgWjXD29XD7VpFK84XPEWt40wdVzAc/6a6ogfXkT3SjLENjQgnwyFLEMwVUB+D
         l6dZ/senYVrTWPdoKxCU+dfRc+i8YOVwhR0C5kGIt9sZB5w8tkbzjEogHF6UqQKtnniS
         cVUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=2w+Ay74cy7OoOg37g3PaLjsP1sHLBt98ivncMEHUTZE=;
        b=2dTduONfpg4HDo28SjogU4uzrNnOQ5yooy1TGuUanX041OG52FQMt3nbIdf7VXITu1
         RYtL8CrXz7fp7zQXDsEDBePvCjmj15e3Qo4DthEw7oQayn0a5ZskdWOG4s3JwWbm1J2c
         pZcCZI2qRj3HHDE41Gmps+3pWyIN3aJCLP+gZYbZLcTCmxYvad1lUJBll6+qRTufRd+G
         G5SfEjHu+gG+PiIXLVNDrhJSFPpHdFMYnou+9y3Y0q9K922+YxIkIrmeyUSIa3xbTfiJ
         O8AXxkBSE375ue3BPpBmmiOKPJ30+jFTRAjz4j07SxizxJRDVEMO2sa7XzbIsGMjkfCp
         tpJg==
X-Gm-Message-State: AOAM533nwwjkBfoI2Q0Khb0DqHClaV4zjJIVM40YH6ld2N0KnPup/1fd
	Gjhu0+q6b2hvUeiq9GWzbrwx8g==
X-Google-Smtp-Source: ABdhPJwQ7LooGvEvT4dpWheOhDWqxQVg6IroKOSOYNqnIDRYboL3316+ca6IHfgol4Aq3EeOYOdhag==
X-Received: by 2002:a2e:9c43:0:b0:250:a467:414 with SMTP id t3-20020a2e9c43000000b00250a4670414mr13242328ljj.358.1653319498852;
        Mon, 23 May 2022 08:24:58 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v4-20020a056512096400b0047255d2119bsm2026580lft.202.2022.05.23.08.24.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 08:24:58 -0700 (PDT)
Message-ID: <4a69902f-a545-23a1-1430-e5ece16997e9@linaro.org>
Date: Mon, 23 May 2022 17:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 11/19] dt-bindings: reset: npcm: Add support for
 NPCM8XX
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
List-Id: <soc.lore.kernel.org>
Cc: Tomer Maimon <tmaimon77@gmail.com>, Avi Fishman <avifishman70@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
 Benjamin Fair <benjaminfair@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greg KH <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, Jiri Slaby <jirislaby@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Bj=c3=b6rn_Andersson?=
 <bjorn.andersson@linaro.org>, Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Vinod Koul <vkoul@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Robert Hancock <robert.hancock@calian.com>,
 =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>,
 Lubomir Rintel <lkundrak@v3.sk>, arm-soc <soc@kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Linux Watchdog Mailing List <linux-watchdog@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <20220522155046.260146-1-tmaimon77@gmail.com>
 <20220522155046.260146-12-tmaimon77@gmail.com>
 <86cd6a37-70ad-3a90-bc8a-dcd8b41f1175@linaro.org>
 <CAP6Zq1i2Wj4FCA4-eseVoJyMof5=ocFCUcitVquJqYJ4Z3JTYQ@mail.gmail.com>
 <CAMuHMdVCCrKTpNHng2_kKGViuEXf=O3MsfpjjzMusuUcKE6HiA@mail.gmail.com>
 <62562cdf-93e3-f642-5bbd-48329eff33ea@linaro.org>
 <CAMuHMdVFV02t+vbwzEpNbpkSP4M3sGnJpzFMPBw7RkrJ9YvyKw@mail.gmail.com>
 <b60f5fd2-dc48-9375-da1c-ffcfe8292683@linaro.org>
In-Reply-To: <b60f5fd2-dc48-9375-da1c-ffcfe8292683@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/05/2022 17:22, Krzysztof Kozlowski wrote:
>> I think you are taking a too-extremist standpoint.
>> The two extremes are:
>>   1. Numbers correspond to hardware numbers, and are easy to look up
>>     in the hardware documentation (e.g. GIC SPI interrupt numbers).
>>      => Use the hardcoded numbers in DTS.
> 
> And such numbers (like GIC_SPI interrupt numbers) do not go to bindings.
> They go to DTS only.
> 
>>   2. Numbers do not correspond to hardware numbers, so we had to
>>      invent our own definitions and numbers, usually loosely
>>      based on some table in the hardware documentation.
>>      The driver will have to look up the numbers in a data
>>      structure, to know how to program the hardware.
>>      The numbers become part of the DT ABI, and cannot be changed
>>      (header file is append-only).
>>      => Use the binding definitions in DTS.
> 
> Correct.
> 
> However this patch is some mixture of both approaches.
> 
> The same pointed by Arnd:
> https://lore.kernel.org/linux-devicetree/CAK8P3a0fDJQvGLEtG0fxLkG08Fh9V7LEMPsx4AaS+2Ldo_xWxw@mail.gmail.com/

...and one more from Arnd:
https://lore.kernel.org/linux-devicetree/CAK8P3a1APzs74YTcZ=m43G3zrmwJZKcYSTvV5eDDQX-37UY7Tw@mail.gmail.com/



Best regards,
Krzysztof
