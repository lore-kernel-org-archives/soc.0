Return-Path: <SRS0=WEIr=X6=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358DDC433EF
	for <soc@archiver.kernel.org>; Mon, 25 Jul 2022 12:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E85A9C341C8; Mon, 25 Jul 2022 12:51:20 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DDCBC341C6;
	Mon, 25 Jul 2022 12:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DDCBC341C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ej1-f49.google.com ([209.85.218.49]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mt7st-1nNAyb41iz-00tR3y; Mon, 25 Jul 2022 14:51:17 +0200
Received: by mail-ej1-f49.google.com with SMTP id mf4so20425805ejc.3;
        Mon, 25 Jul 2022 05:51:16 -0700 (PDT)
X-Gm-Message-State: AJIora+5DZjhMDlrJKF9BcR9Xx8oEQeXAlwGxzKeW2ROf5JxJVJiKLTe
	9jmzIcbYvK0GmQlGaPI4/0BS5b+/PFHcc+lawfw=
X-Google-Smtp-Source: AGRyM1ujhhY1O1VjhzWjSGchJVlAUzNSHu3b8hjAjKdb2T2ZkFPQmlV+7/Q8PwmW7bopcRw3+cSD7IXE44152T9smDs=
X-Received: by 2002:a17:907:97cd:b0:72f:2df:274f with SMTP id
 js13-20020a17090797cd00b0072f02df274fmr9717512ejc.766.1658753476486; Mon, 25
 Jul 2022 05:51:16 -0700 (PDT)
MIME-Version: 1.0
References: <1658681004-132191-1-git-send-email-john.garry@huawei.com>
 <CAK8P3a0umWWic6LAzxXJ7BACYVE--m-wbynh7Z8F+pGoUBxGTA@mail.gmail.com> <25237c44-ebc4-fc9a-7c6f-3e990f968038@huawei.com>
In-Reply-To: <25237c44-ebc4-fc9a-7c6f-3e990f968038@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 25 Jul 2022 14:51:00 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2+0EwSJ=fRBL2JCGypJRL-qE4rEiXYnJbqhZ=weethdQ@mail.gmail.com>
Message-ID: <CAK8P3a2+0EwSJ=fRBL2JCGypJRL-qE4rEiXYnJbqhZ=weethdQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64 defconfig: Get faddr2line working
To: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, jpoimboe@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:RGolJ4MDG/ox9Jb7rWNOwqtIlql+9o9vRDGHa2GmToRvkzSJeYP
 HczGkTDZ1JxVHpI65b+jK+HA5rYcLn9oIow1dJ+zcgeDzYOcqHU6E8TdYx1yCZFOrXbzbCN
 n8ZoQy4F5oqNM2MB8luEUDofA4Cvb5qIlZQjz26FfF4AaSZ8h9pQZqSJch4vOT3d8aLymRf
 TDFKsb5067TMDC1L0L1Fg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t5kt8nzZUtU=:m9cGnM9HjLmQU4D1UxonCW
 lV31fPjYDdvtLWBaHop/eIC7t69ymTsJX6fx+X1SzqoS45QdvKAk/uTKnp5U//kNHzeoi5bf0
 YEd5EbS9bivs5waYLPI/+CjemTZFzKV7hX5j+/6zGdCmrgntHorDKRREQgDtqZWSYQEVPzdTm
 8PZGl6O6bvidhx163HNhSWsMXrG7KJZ+1G66w2s050XmbfTk9IpMNSFKGtK81EPLO1WsoPpjf
 CI6eEVxV5w/M8dl83apO7OJNBAVhg9+dWdu89pXLBl9e0IuUfVOB8GvEL+zZQu6Z2NxDEKIOh
 T6MXLOSjZCm2T8yxg2nQU1nvX48/g+iOc55HSLR+X4fdIQrMOhz2RnJPf+zyh+nUnqxQnD+zS
 30QXRZjNnQbFC+oz+sBQ1Qc5en0xYdpaWAfulUoeFVyqEgS5vJUa7HFBOagKlJMKHerFVf92G
 YWwiN2dOiCC3FbcOVJGR9SeHKu2teikTRe6kpPSQrPUb4zQGqgVkmxeoc1kymxHsz9EE741KY
 ZllBaiTMkeF5WATxRVUzdVZ6mmn1n4x1pBvH1vlW2bFDw6clGn96DSTv/zhtN/OXhUmBQKmyd
 d6HKk5PA6EdR2a1iWbRoqCo7iy9XmIsRpdqouivzHTBupjsIyhYuKnzu/aanl0/mldegTLcx7
 t3ZK+bJrsLBGGw8tbwMbjtqk3bSMn7TXw+0V3l5PlHtdzIC54KePUJpiVwG62JAoZbmM1nGOl
 hFVppffO+h5p5ZqubCvDeDNl6x5kxhaqNMd4Rw==

On Mon, Jul 25, 2022 at 1:57 PM John Garry <john.garry@huawei.com> wrote:
>
> On 24/07/2022 21:35, Arnd Bergmann wrote:
>
> Here's a brief'ish summary for why it's ok to delete these mentioned
> configs:
>
> > CONFIG_ARCH_BCMBCA=y
>
> On next-20220722, config ARCH_BCMBCA is selected by config ARCH_BCM4908
> from arch/arm64/Kconfig.platforms and the latter is enabled in the
> defconfig, so no need to explicitly enable in the defconfig.
>
> On arm-soc arm/defconfig, config ARCH_BCMBCA does not exist for arm64
> platforms yet, so this is why we see this config deleted for the sync.
>
> > CONFIG_SECCOMP=y
>
> Since commit 282a181b1a0d, config SECCOMP was changed to def_bool y, so
> no need to explicitly enable in the defconfig.

Ok

> > CONFIG_QRTR=m
>
>  From commit fdf4632aa834, we enable config ATH11K_PCI, which selects
> config QRTR, so no need to explicitly enable in the defconfig.

Something is wrong here, as qrtr is used the same way in both ath10k and
ath11k, but only one of them selects the symbol. My guess is that there is
no actual hard requirement to enable it.

> > CONFIG_PINCTRL_MSM=y
>
>  From commit c807a335d3b1, config PINCTRL_SM8450 is enabled, which
> selects PINCTRL_MSM, so no need to explicitly enable in the defconfig.

This looks like a bug, where the driver should have used 'depends on'
rather than 'select'.

> > CONFIG_SND_SOC_TEGRA210_OPE=m
>
> There is no issue on next-20220722.
>
> On arm-soc arm/defconfig, config SND_SOC_TEGRA210_OPE just does not yet
> exist, so that's why it get removed from the sync of the defconfig.

Ok

> > CONFIG_MAILBOX=y
>
> In commit fc739069aa92, config MAILBOX was enabled in the defconfig but
> it was already being enabled from elsewhere. There was definitely no
> sync of the savedefconfig going on there :)

I see it's selected by a couple of drivers using mailboxes, and I
agree we shouldn't
need it here. It might be good to just hide the symbol in this case
and select it
consistently from all drivers using it.

> > CONFIG_QCOM_ICC_BWMON=m
>
> Commit 76f11e77f919 enabled config QCOM_ICC_BWMON, but like config
> ARCH_BCMBCA, that config does not exist on arm-soc arm/defconfig branch
>
> On next-20220722, no sync is required

ok

> > CONFIG_SLIMBUS=m
>
> Config 5bd773242f75 added a kconfig "imply" on config SLIMBUS from
> config SOUNDWIRE_QCOM, and this happens to mean that we don't explicitly
> require config SLIMBUS enabled in the defconfig.

That 'imply' looks like it was added to solve a problem using the old 'imply'
semantics that are not what this keyword does today. I suspect it's still
broken when CONFIG=SOUNDWIRE_QCOM=y and CONFIG_SLIBMUS=m,
and the correct fix is to use a dependency like

      depends on SLIMBUS || !SLIMBUS

so the defconfig symbol should stay.

> > CONFIG_INTERCONNECT=y
>
> Since commit 06f079816d4c, config TEGRA_MC added a kconfig select on
> config INTERCONNECT, so no need to explicitly enable from the kconfig

We have one driver using 'depends on INTERCONNECT' and two drivers
using 'select INTERCONNECT', so at least one of them is wrong.

There are also a couple of drivers that use neither and instead rely on the
IS_ENABLED() check in include/linux/interconnect.h, but this is potentially
wrong in the same way as the SLIMBUS dependency above.

This clearly needs some more discussion. I would suggest removing the
#iff check in the header and forcing all users to use 'depends on', leaving
the defconfig symbol.

> > CONFIG_CONFIGFS_FS=y
>
>  From commit cd8bc7d4eb66, config PCI_ENDPOINT_CONFIGFS is enabled in
> the defconfig, and this selects CONFIG_CONFIGFS_FS, so no need to have
> explicit enabling in the defconfig.

Again, half the users of CONFIGFS_FS use 'depends on', the other half use
'select'. We should be consistent here and always use the same method,
probably 'depends on' if we want to keep it as user-visible.

> We still have issues on next-22072022:
> CONFIG_ARM_CPUIDE
> CONFIG_DEBUG_INFO
> CONFIG_DEBUG_INFO_REDUCED
>
> The latter two are not an issue on the arm-soc arm/defconfig.

Ok.

> So let me know if any comments or how to proceed.
>
> And would each config item deletion merit a separate patch?

You send a combined patch for the obvious ones (secccomp
and mailbox AFAICT) or send them separately. For the other ones I think
we should try fixing the Kconfig files first, otherwise we just end up
putting them back afterwards.

        Arnd
