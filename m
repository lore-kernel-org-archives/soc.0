Return-Path: <SRS0=d5Nh=X7=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B86F9C43334
	for <soc@archiver.kernel.org>; Tue, 26 Jul 2022 11:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 764BEC341CE; Tue, 26 Jul 2022 11:09:39 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 81AEDC341CD
	for <soc@kernel.org>; Tue, 26 Jul 2022 11:09:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 81AEDC341CD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ej1-f51.google.com ([209.85.218.51]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N3Kc8-1nXZjp1Vxa-010Ld3 for <soc@kernel.org>; Tue, 26 Jul 2022 13:09:35
 +0200
Received: by mail-ej1-f51.google.com with SMTP id b11so25437852eju.10
        for <soc@kernel.org>; Tue, 26 Jul 2022 04:09:35 -0700 (PDT)
X-Gm-Message-State: AJIora+gVygQVFH7r+4KfEvqMjVyPs7fi9ha7XOSXz/Xacgv0+PJsbMX
	v+1u6PCMwyrc1Jh2tXC10HdDcQUpZO3VERk3Ens=
X-Google-Smtp-Source: AGRyM1svEFK3QuJgIG7EovBpgpBPKsCTAANQazaPyhHiWewFu8xsda49KH0hRZs0xgdSZeCGQX2Ke88H3MR7SA186BQ=
X-Received: by 2002:a17:906:98c7:b0:72b:20fe:807d with SMTP id
 zd7-20020a17090698c700b0072b20fe807dmr13918385ejb.75.1658833774982; Tue, 26
 Jul 2022 04:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <1658827473-121156-1-git-send-email-john.garry@huawei.com>
In-Reply-To: <1658827473-121156-1-git-send-email-john.garry@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 26 Jul 2022 13:09:18 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1=W6VisgRcx=Xf65PrG+2pyb3ehOQQ6F32Qr6Agp_9tg@mail.gmail.com>
Message-ID: <CAK8P3a1=W6VisgRcx=Xf65PrG+2pyb3ehOQQ6F32Qr6Agp_9tg@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Sync some configs with savedefconfig
To: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:grKvJpDYbJOE8RjKfVA8PY+xCJ+qjOcCiYfBrNoqZiqoVze5FVM
 58TQ4DJsOMqX9tDDEmakbmvGh0bZkHIymcVwau7/KkC8/2R0t0kQChxqxewwNdaOSyTVdGJ
 GhTUB+SVqjRW8vFI1Gg9K7+16OlMSD3fdYnMStyvJN9J9QawwXvKYaIcMZofgFMT5r5+qL2
 C2MuImOgsX6mlOI/UJPTA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hNQbVisBF3o=:doBbjENLoJR/4O+0PzjLbu
 KprhEc2E+iiYC2zDQ7LYWgJhrP43IGhJMfxTAQ4KWN60AUACoCGAA58Oimx3DwGTexqObyEVU
 Grf5YINdG0P8aWAVmSpkgXyiuEP231lGmUNYojJqeUWUDHE4WSaxl0XtMtG6RE5VCnOr0IOpk
 p9vrdovmriPYdtKiL7RRrpQzv9o9+gzen0ULcLLX4o/JRWHe4R1kkmuwZYIdZa6pgrYlaNdHs
 nCOxQN3auf8VPUsx59trsnfyEPxtBcrz9nrlZS3lQGkBBbBe7AsOVbmQsBPuBII2vG+FkmNnq
 BZzx7YKZZi9i+Rvo4ofXaj28q2CIeTCsb3cuVSlqihT9iGCRsoXtuC9j4Iw+B1YWEipivYU8t
 mh66tqQaDp4fceN69VGsqLjX8VUoFEfbGxRnSfnDzZVGaqmXiHqfv/C8k8Km44/w3EzVMjiou
 7G1kgNN3mp++tAq/KbJh2CEY318M5RBndltULtcbtcyUg+Uyq6KQE1b9KEpGnCI103KXNe5AZ
 nHMskvu6FKh7A1OtokFepEDliuDRcMj0NeJW9gejqwrAFI3FQ0XCkElwc4cQc/v2xwQP/lQt4
 5UzdJtPiflOdaNeOHZPd2dPjpsyucY8Da66R/1iino3pZQUWRJNXulqYzMPz9e1H7YwJ4yOsB
 uBp4Nn/KFLX4koEQqnkf4gw/MsoyRnpezd+ydUFvN6ErSWQbqHtlK1ghr6QbNwNozdsy4f+dA
 gArpHzLMlG8VjZEabH9M2gGdKkEepYf3AV8LFNH2njIjHIiO2nf7SkMm5K+frm/8v4vyR2AqO
 arC7ym8fDSbzVOkWTjIwfPinDAoHltC9JWHx4MM91cJEikD9iKe9coyh+0kZIXjP0v0mM9VGQ
 DGa2PtomVyBppZZ6/Tjw==

On Tue, Jul 26, 2022 at 11:24 AM John Garry <john.garry@huawei.com> wrote:
>
> Some configs can obviously be removed when sync'ing with savedefconfig, as
> follows:
>
> - config ARCH_BCMBCA is selected by config ARCH_BCM4908 from
>   arch/arm64/Kconfig.platforms, and the latter is enabled in the defconfig,
>   so no need to explicitly enable in the defconfig.

I double-checked this one and found that this was just added to the defconfig
as a transitional entry, with the ARCH_BCM4908 being the one that is
the one to go away, as described in 32d3da7d2f44 ("arm64: make
ARCH_BCM4908 select ARCH_BCMBCA"), so I think we should leave this
one out.

> - config SECCOMP was changed to def_bool y in commit 282a181b1a0d ("
>   seccomp: Move config option SECCOMP to arch/Kconfig"), so no need to
>   explicitly enable in the defconfig.
>
> - config MAILBOX is already selected by some drivers enabled in the
>   defconfig, so no need to explicitly enable.
>
> - config QRTR was enabled in the defconfig from commit 1bdf91fd2ae82 ("
>   arm64: defconfig: Enable Qualcomm QRTR"). However until many kernel
>   versions later in commit 231a136fdf46 ("arm64: defconfig: enable ath11k
>   driver"), no driver depended on config QRTR - not for building anyway.
>   In commit 231a136fdf46, config ATH11K_PCI was enabled and this selects
>   config QRTR, so there is no need to explicitly enable in the defconfig.

The rest is fine. If it's ok with you, I'll just apply the other three bits
and drop the ARCH_BCMBCA part from the patch and the description.

Thanks,

       Arnd
