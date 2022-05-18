Return-Path: <SRS0=Wkif=V2=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610BFC4332F
	for <soc@archiver.kernel.org>; Wed, 18 May 2022 12:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2C617C385AA; Wed, 18 May 2022 12:13:09 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F3E6C34119;
	Wed, 18 May 2022 12:13:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F3E6C34119
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f172.google.com ([209.85.128.172]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mg6mG-1nO2XO3EEQ-00hfJ8; Wed, 18 May 2022 14:13:04 +0200
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-2fee9fe48c2so22108697b3.3;
        Wed, 18 May 2022 05:13:04 -0700 (PDT)
X-Gm-Message-State: AOAM533F2aNf0ADkmsC3WCQZIVYhhpuwFHuIgxoo2pUPKyuQvOn06Bef
	fKUq/JR9KlCjBajMyf2ODm63aSuXsoulxI93GJM=
X-Google-Smtp-Source: ABdhPJww4o6KC19Bdx3y+Y9+BEECGSt26A7Urzyyba0OuquV/hIeym4xoshJpgwWoBBDawOH5VaMVVqfZTQGwVugx8c=
X-Received: by 2002:a81:456:0:b0:2fe:dee5:fbbc with SMTP id
 83-20020a810456000000b002fedee5fbbcmr20604776ywe.249.1652875983425; Wed, 18
 May 2022 05:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220516163310.44842-1-nick.hawkins@hpe.com>
In-Reply-To: <20220516163310.44842-1-nick.hawkins@hpe.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 18 May 2022 13:13:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0914=TM9f1CNcg_PXfHvt6nHDPyrvLp=0KO4hZM2GT5w@mail.gmail.com>
Message-ID: <CAK8P3a0914=TM9f1CNcg_PXfHvt6nHDPyrvLp=0KO4hZM2GT5w@mail.gmail.com>
Subject: Re: [PATCH v8 0/8] Introduce HPE GXP Architecture
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: "Verdun, Jean-Marie" <verdun@hpe.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Russell King - ARM Linux <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	SoC Team <soc@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	LINUXWATCHDOG <linux-watchdog@vger.kernel.org>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:mQpgX+79Lbw5nt8Wj7pyreu5l5I3FO523VPSruXOOoo1886G32Q
 56nZlxZVDhQK/FoFDQULgthgy2QXTeeVCns7lEysNz0gf+JwHQ8ADcNss2LsSxTWrOnVkm7
 EVw7OWbsO5SyosLVqxvMJvlQJVJ35QQQSV80iL/1YzfzKrxVF7Dz0t5mwdySK7dQNhARCdh
 uIaUcjAue/gOwULPfrNBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:A4I4mu9W/9M=:mCwyTaNyuZZURFgrly8/Mg
 5tBTfwCZC35gZco0JIJmbB023nWjwY4C3g5Dlux/tb27L7n9pBZFnpX/7Nu81CCftoPwFTBnv
 w+G/WiyRPgl1Udfr0h2A7D0vvae53FRbKZo8OcOiCtRj+mXHbNGb7khW45beML1+54wTzNF20
 FTMyG1ftTcbsCO2rXrFS/dYtZ5+4EC/PLCB9PDCyh8JOr3IW2yVCa9I8+ppRDX1Iw6aIf7NXx
 W8FD6QDHha/CFnWmYi93XqRORQaVX6NzRF5M3MyUBktqsWeJATy1DgJgPGixh8dQ1UWp1zZyq
 qbk4uwMREgbnzuLJdEQLrw3ZJuAuhKpZeKOyv1JK++JbozQ8YesmyKYJUIfGqnhYd7zPU//fe
 ER4DLF9ll+zVyqSNPc/VTBXwPcBCn8Cz4ftKYfkk6ihRdIqjSguFpKcaSSnJxZww5MVFCfVyc
 hv6k3qvbIuTuw0TQqZGc8penllwbLUC35f4BDwWGUZKzDH43om1Bwmq6Qe5cUbAsVGmlTG67b
 g0hFPJseItvLFEq37dDN0DVaFlWvB/IHIqCn9XZloC315uvtqrk3ZiQr8QdcgpHlMnAH+eiCO
 JDifoTMDg6d6c3trhTteyU1imAW+gjrfbPcmKpL/HI/o5JB39vK2CJa3JybpzqykvOQI9yQWi
 BAbsJNePDk5/47A1h9sr8MGnww4CzFgUeiRuY/TEfUm+hepE0zj1kk4nJzlexHWOzmFLdkk2L
 AzD3bmNvFYzbunOVG8e4Pk6zBFEKLkrTnmlGAY7DbNMzBkTEeRQ7+zyZNKJ7M84zIQvJ8dquq
 CD8HC4F7Gi1d8/MxeugqdSIgNGI96afVPgKYJlqs3vUcMSwyWClhL/2jXpqJCVVSmP5X4Lo84
 V0ZuJ9DtHratycmbkXQo5EDWWEmOy50GgR9mhdcyM=

On Mon, May 16, 2022 at 5:33 PM <nick.hawkins@hpe.com> wrote:
>
> From: Nick Hawkins <nick.hawkins@hpe.com>
>
> Changes since v7:
>  *Fixed comment format in watchdog driver
>  *Added the Acked-by tag to the device tree patch.
>  *Resubmitted the dt-bindings patches hpe,gxp and hpe,gxp-timer with
>   Reviewed-by tags from previous patch in descriptions to keep patchset
>   continuity for v8.

Hi Nick,

I have preliminarily applied this version into a the arm/late branch,
but since I'm
travelling at the moment, I cannot actually push that branch out for linux-next
before the coming merge window.

My feeling is that this should just wait until 5.20 now, but if you
and others others
feel strongly about it, I could send it during the second half of the
merge window.

It still needs to pass all the CI build tests, but at least it's
unlikely that there
are any runtime regressions for other platforms.

         Arnd
