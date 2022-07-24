Return-Path: <SRS0=Q9oe=X5=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85D8C433EF
	for <soc@archiver.kernel.org>; Sun, 24 Jul 2022 20:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8037DC341C7; Sun, 24 Jul 2022 20:36:15 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A8366C3411E;
	Sun, 24 Jul 2022 20:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A8366C3411E
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-oa1-f53.google.com ([209.85.160.53]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mwwhv-1nIXCK1Tcx-00ySUa; Sun, 24 Jul 2022 22:36:11 +0200
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-10d6e8990b9so12502477fac.7;
        Sun, 24 Jul 2022 13:36:10 -0700 (PDT)
X-Gm-Message-State: AJIora/1QAoojCMT3HwwjRyMfhxh9Gf/pU3llKong/N1ifuQLEkJVBox
	u8APzoCbR4Sxk3h0nqDhXJhB6oPsHKc+HTvhaU4=
X-Google-Smtp-Source: AGRyM1tnVuoxBPd70oeqOmGfhtFKVZUyeBTN+CqYz+FbOrB3rGMUkpEDV43Dv/RGnkLnCN8S2/MMawjNcUf3ekkgaU8=
X-Received: by 2002:a05:6870:6195:b0:100:ee8a:ce6d with SMTP id
 a21-20020a056870619500b00100ee8ace6dmr4688274oah.155.1658694969838; Sun, 24
 Jul 2022 13:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <1658681004-132191-1-git-send-email-john.garry@huawei.com>
In-Reply-To: <1658681004-132191-1-git-send-email-john.garry@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 24 Jul 2022 22:35:53 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0umWWic6LAzxXJ7BACYVE--m-wbynh7Z8F+pGoUBxGTA@mail.gmail.com>
Message-ID: <CAK8P3a0umWWic6LAzxXJ7BACYVE--m-wbynh7Z8F+pGoUBxGTA@mail.gmail.com>
Subject: Re: [PATCH 0/2] arm64 defconfig: Get faddr2line working
To: John Garry <john.garry@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, jpoimboe@kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:a3W+nLtx5BUc+HCO/3GpZYppwFep+pHbOxVfTjCVjMdEZpOPU9m
 Oayfw66xKsAToBlJCsLIz6K7PfD83B52IeUeh5pO6ZV4rLQRDCQ1EXyS1graE1oCe7/V6Lm
 /GFHhnJQmODyG4XbbFi/pgcWxgY/A9KtPfR8uojYFdz29lU10pLNFLM8V0bvfjvMKPLITH3
 nP+SHqtfw/UFr/2GtMWfw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8foB9NikOso=:0GJ3wndh9f0KyObfun2Akq
 e01zAXDEMXvNSVISU7rH1XNkS4VK7G0b3rz6URxkc86NSPXuA6Y2cDxhGXo3CPR7l5rXmoXHn
 XaF6PcJM0hIaSSRxCG0QtvNF7OiuXvIvzhpvfMpicnAYQwNrpZLy1wqyFM3RcodnbNWGoIoCc
 OMkH4wpsEJOTVvUZhoNSYv0OHzpxklvfeKTX6UoVDvySBfKzzR3gSVh0ichweKzlxA8Vk1nbA
 aucwkXqat2wydbZ0CiOgBa/ELWh0EWLHei/dolRuBulNlD+C3HXxouohqaVWw91xxdncu1hx/
 PDdjomKM+KjNpzbmAU9Uiei4TduP608JdvrL6a2pjokvni3MZayrLAGgFio0yleaRlZjsYdro
 MMTCXcfiA4x4UmaOwXbDIMkAAKWLkqAkZ/9G/2a9j5KjEii7OodvmRrKvZRP1tiH1MXlt4XSI
 fQ6OWiNY/gl9YIPpnxqDpKP+GDImhZMi383YpcOB/AMtZJSbHKu/AZaQEboSE/7PDfrQJP+Et
 L2cMxdpevLKoVQJIiGBVPKX1+o+Vd+BWZ1KAhVCjZ5fWm1hdvkFwi49LshnoS1jMV0UyNOR7g
 vXzocbRFOe2uBcP2v2nocolnUqqtbbMxTDBGleSb7IaUg+KUwGaInM7i0q7r2obGoooKXLIoX
 ETqmyTWD1Z5ZhARLlKWd9v8dYfk+SYNPvgvB9rgm/wMfEmD6JOufFtuLi9bd7bXMgrBS662+a
 LJkUn7FATrCEh/Mjlt+/tA2piBBArEGmK5reLQ==

On Sun, Jul 24, 2022 at 6:43 PM John Garry <john.garry@huawei.com> wrote:
>
> scripts/faddr2line has not worked by default for arm64 since 5.17
>
> Firstly, since commit f9b3cd245784 ("Kconfig.debug: make DEBUG_INFO
> selectable from a choice"), CONFIG_DEBUG_INFO was not getting enabled by
> default (and this is required for faddr2line to work).

I just noticed this the other day and applied a patch for it in the
arm/defconfig
branch.

> Secondly, commit dcea997beed6 ("faddr2line: Fix overlapping text section
> failures, the sequel") caused a breakage for arm64, as reported at the
> following:
> https://lore.kernel.org/lkml/3bd9817d-1959-c081-e5d0-8b0e70b3f41e@huawei.com/
>
> Josh has sent fixes/improvements for faddr2line at the following:
> https://lore.kernel.org/lkml/cover.1658426357.git.jpoimboe@kernel.org/
>
> In this series I enable CONFIG_DEBUG_INFO by enabling
> CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT, which seems the sensible
> option.
>
> As for merging this, I am not sure who would pick it up - any takers
> welcome.
>
> Note: this is based on next-20220722 and it may be wiser to sync the
> defconfig manually (instead of using 1/2). Indeed I am not sure what is
> the policy is of sync'ing this anyway.

I only synchronized the 32-bit defconfig files in my tree, not the 64-bit
one. However, I can't really apply your patch 2/2 because you appear
to  mix refreshing the order of the options with changes that remove
options that are gone after a 'savedefconfig', risking that we miss
other bugs as well, as seen from your diffstat:

 1 file changed, 36 insertions(+), 48 deletions(-)

I have refreshed this one as well now, which on my tree gives me

 1 file changed, 31 insertions(+), 31 deletions(-)

for a nonfunction change. I have left the other ones untouched
for the moment:

CONFIG_ARCH_BCMBCA=y
CONFIG_SECCOMP=y
CONFIG_QRTR=m
CONFIG_PINCTRL_MSM=y
CONFIG_SND_SOC_TEGRA210_OPE=m
CONFIG_MAILBOX=y
CONFIG_QCOM_ICC_BWMON=m
CONFIG_SLIMBUS=m
CONFIG_INTERCONNECT=y
CONFIG_CONFIGFS_FS=y

These should be checked manually to find out why savedefconfig
no longer shows them, it could be either a bug (a new dependency,
renamed option, a driver randomly selects another subsystem, etc)
that we need to fix, or a harmless change (driver was removed,
option is now intended to be default-enabled, ...)

If you want to help more, can you check some or all of the above
and send patches to either re-enable the options or remove them
individually with explanations about why they are no longer
part of the savedefconfig output?

          Arnd
