Return-Path: <SRS0=iYx7=TL=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E7CC433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 14:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2514C340F5; Mon, 28 Feb 2022 14:42:05 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 326D2C340E7;
	Mon, 28 Feb 2022 14:42:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 326D2C340E7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f51.google.com ([209.85.128.51]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MQusJ-1nbWk10HXL-00O0kZ; Mon, 28 Feb 2022 15:42:02 +0100
Received: by mail-wm1-f51.google.com with SMTP id p184-20020a1c29c1000000b0037f76d8b484so6165008wmp.5;
        Mon, 28 Feb 2022 06:42:01 -0800 (PST)
X-Gm-Message-State: AOAM533s0WnXu6Xw0lRkEa23iGvBDz7SZPtdOJvLPiDJY/tsyut8iZPd
	Tj8uRTDRGTV9fUFUddzt8793cHW7HbQLykIG01w=
X-Google-Smtp-Source: ABdhPJwk5L+QJI8Ubt5qFj7ABYks38P424wjdir/FSthOlrgADQbn1sfQhvydVSPUW/DGwF6B2NNpmzTkRAyHlnnUZ4=
X-Received: by 2002:a05:600c:154b:b0:381:8148:64d with SMTP id
 f11-20020a05600c154b00b003818148064dmr362035wmg.98.1646059321645; Mon, 28 Feb
 2022 06:42:01 -0800 (PST)
MIME-Version: 1.0
References: <20220228120704.346bn5c56e53qylb@finless>
In-Reply-To: <20220228120704.346bn5c56e53qylb@finless>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 28 Feb 2022 15:41:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1PW8afbjvsUNe2UHXBcQHxGXXPodYiK9AgfW-3tTQR0w@mail.gmail.com>
Message-ID: <CAK8P3a1PW8afbjvsUNe2UHXBcQHxGXXPodYiK9AgfW-3tTQR0w@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] TI K3 defconfig updates for v5.18
To: Nishanth Menon <nm@ti.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Tero Kristo <kristo@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UnnIC44vgw/dGyFwx1HK9b7UQisnZX+uVgTXrq2FEU8uNZ/OMDY
 TyMMcqBrXLSJSUCEt0bIVyry4PDnTP5toNSZMHjKsGePlVL0l2Qrs59BmjBR/qUP4HeyNw2
 zg6wo7ZGCS5Udj6LkPkyDeBdnz4cKwRj76FqtXZWrUdmMAC8HIvz0I37Ec2TAYSsVhm1iNW
 RJKQHqKu0xDrdaYwipAlA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8zwPSKjInKQ=:Ks31hNlDNSpQ9m19u9Bx39
 Ql3VHxYrUdzkETTHilbw0q9EnU2Ws7HMyve+GNcZVZa76inveshIwXH3OPKovhbbyG6NmG+Nm
 OSvHA8/eJ02K7id1bPboforOtzSc34nOG0ni7HyAkXHjjh1IyF3AtJi8nC2ZhenJpyizENguh
 6YGD2nSzKtZGBXPkjbcWh8vRL9S+WkjD9DZkhEHsETGyYUGhbU3PdNPk3U6JjQ6Ami3V3FeTV
 VGFyrB/PyvGtRDn+jYuOlGekVVWjXSV0gN3KaqsNlIjL88AoNIA4zQ4WoIfqvOOI1dJXc++c1
 TdkVEImu5q9vLZM/Q6ehMSEQ+Ivw8vEHf5W+smWhxKBDDbG1gCyIINDHir1NGQvA40huhFRaI
 aW6dvINAl8JYk8MvEaMK3NB25uYGg3Kv09uZWeW9FEJPkw+wqnj9WyvmWtep71X0g9l1sPrN4
 3n2j+GTEy4pEOV/MffDZdB4OSIXZq4HzofmxQrJCe70Pk67YCcJGgzuuJECMG727ps7gPvwYQ
 ox1C39t57B3zwingEJtjBVxaliFg6fE3V4yPU2vo7tUCb/+xL0E9UBJdzpM5TXbQ7A4hhY2V3
 mWXLAndbqkGZwdO6HyF28KrPz4EVwjsJr6PLuU6bmUBG9x5gxut8bWjZhUfSMMr4c+L3zfMmR
 qMpiPCfRtXI32JUCg+Y2Cn8AovnL/Tu5sXMJy7YWNLNGv2V41Q2YnS1AIsXpufri/09Q=

On Mon, Feb 28, 2022 at 1:07 PM Nishanth Menon <nm@ti.com> wrote:
>
> Hi ARM SoC maintainers,
>
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:
>
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-k3-config-for-v5.18
>
> for you to fetch changes up to 3bc04fba357a269f4b7ff824b146d82ad1ebf9de:
>
>   arm64: defconfig: Enable USB controller drivers for TI K3 SoC (2022-01-24 13:40:42 -0600)
>
> ----------------------------------------------------------------
> TI K3 defconfig updates for v5.18
>
> * Enable USB modules

It looks like I had this one applied already from the 5.17 submissions. My plan
was to drop it all, but it looks like I made a minor mistake here. As
the contents
are identical, I'll just keep the old version.

        Arnd
