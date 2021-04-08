Return-Path: <SRS0=hr/K=JF=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E406C433ED
	for <soc@archiver.kernel.org>; Thu,  8 Apr 2021 10:15:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 46BD461178; Thu,  8 Apr 2021 10:15:26 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3743B61168;
	Thu,  8 Apr 2021 10:15:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3743B61168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-oo1-f42.google.com ([209.85.161.42]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MEFnR-1lKqly0zg5-00ABQ5; Thu, 08 Apr 2021 12:15:23 +0200
Received: by mail-oo1-f42.google.com with SMTP id s1-20020a4ac1010000b02901cfd9170ce2so373357oop.12;
        Thu, 08 Apr 2021 03:15:22 -0700 (PDT)
X-Gm-Message-State: AOAM530JjyAx0yGq+98sBWSl2GNKsOhnv0aeYDvFVS5y9KKGldvbhg+s
	R0FDgYnGvLsxf/rQTpRHQRyJ+DwMeJF8LruBulw=
X-Google-Smtp-Source: ABdhPJz0Swhk/adEKhNiECd444g8lzHIqwV0wMOHQrhyl2H25uFzPA40WDIH+eYVvjun//PBhBzUdDK5JjhhHAIvCy0=
X-Received: by 2002:a4a:304a:: with SMTP id z10mr6937279ooz.26.1617876921751;
 Thu, 08 Apr 2021 03:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <744291cd-a66f-dedb-fe7a-752a9032d6cd@hisilicon.com>
 <CAK8P3a31XFD7smyK0R41uX9fw+P6zPDLEgJoXz99imYS8urENQ@mail.gmail.com> <028b2fd0-854f-a683-22be-36f3af5b5784@huawei.com>
In-Reply-To: <028b2fd0-854f-a683-22be-36f3af5b5784@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 12:15:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0So6USwL0FYtzbFotJeBZw87p2kX86hHDyF+WFPvrD1Q@mail.gmail.com>
Message-ID: <CAK8P3a0So6USwL0FYtzbFotJeBZw87p2kX86hHDyF+WFPvrD1Q@mail.gmail.com>
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v5.13
To: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Wei Xu <xuwei5@hisilicon.com>, SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, 
	Zhangyi ac <zhangyi.ac@huawei.com>, "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, 
	Tangkunshan <tangkunshan@huawei.com>, Daode Huang <huangdaode@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, John Garry <john.garry@huawei.com>, 
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, 
	Shiju Jose <shiju.jose@huawei.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Nv81eFK9heR5kD9Wcz9UPMXJ7v/MR04ip4vTx1F25Cm97Tv+Rxe
 gBDRFGzipvj2/ENDfjDYCMRvjZZWYi/kz9QD0naq1sb6Ucx0ev5K2flDrf30FDkdLEHLt2C
 vq8sGLS5LS92V8X5XG9nh38V8j2dkt/rV5BBO9sqDcNdEFbLVeUTiMCVE9AKYJxFmrgKnv+
 2u6rI9lg11E25Zw+48f1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ooRgWNbHHQU=:hqDD3Pe7R1RxFUZszzjP18
 JAjrC+cXD/W2h7eeYNDnIX++XrCjP5P2CMUjX6DvlFdQF1rlwppKDNyUIpuAV1/TSWObPfmmX
 hfoOld00gRm+oGpgiaydpzqEffvl+KCPUYYCDAxa2QDgkiEjKFU7UQPYQG//qXn1DHFbbhNPD
 kIBYmy+sAzgWuF2irCQJLwKErRYAJ6ZESJi6B3IZXIIZFL1xHawNPLFsOTmfMIJmdT8weatPH
 Lzwg50cdkaoVwIeGvLqSi7OQTwoquGopXcGNjnfAoW4EeItkxkEtC3JBHFUPV6K50t3gwqz2X
 Y722mG1el8dswXS9yKFJWIMX16aWa7y5988RnYHLKBbcLlQYkpK5qqt3cNnvqD6NVZsfFlJwo
 pQgkOqwXy/fAYKOjqOXwcSKGjBTWZK+N5IZ4gmGewGgK7Jt5X63No5TT9LEAwU6LJYWIvIR0z
 Z+zdyVOv2tYjfHWDyWBlkRkvjQ2c00s=

On Thu, Apr 8, 2021 at 11:53 AM Leizhen (ThunderTown)
<thunder.leizhen@huawei.com> wrote:
> On 2021/4/7 22:31, Arnd Bergmann wrote:
> > On Sat, Apr 3, 2021 at 5:06 PM Wei Xu <xuwei5@hisilicon.com> wrote:
> >>
> >> Hi ARM-SoC team,
> >>
> >> Please consider to pull the following changes.
> >> Thanks!
> >
> > I'd prefer to not break compatibility of old kernels with new dts files
> > here, as this would prevent installing an old distro with an ebbr
> > compliant boot loader, for purely cosmetic reasons.  These are used
>
> However, it seems unlikely that users only upgrade dts without upgrading the driver.

The typical scenario is that you upgrade the OS by installing a new
kernel first, and then updating the DT. However, you might want to
still boot into an older kernel, e.g. for testing purposes when something
breaks, or to have multiple operating systems installed in parallel,
picking the rootfs through grub2.

           Arnd
