Return-Path: <SRS0=kYrm=I5=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5DBDC433B4
	for <soc@archiver.kernel.org>; Wed, 31 Mar 2021 20:18:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9428D61042; Wed, 31 Mar 2021 20:18:40 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73DD460C3D;
	Wed, 31 Mar 2021 20:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73DD460C3D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-ot1-f46.google.com ([209.85.210.46]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N7QM9-1lg4sy2MBB-017jz9; Wed, 31 Mar 2021 22:18:37 +0200
Received: by mail-ot1-f46.google.com with SMTP id h6-20020a0568300346b02901b71a850ab4so33216ote.6;
        Wed, 31 Mar 2021 13:18:37 -0700 (PDT)
X-Gm-Message-State: AOAM530QfY0m5kZISAWwtvABXrQNdnMHm0BvuwtmGtdq1A74GzXyQqjR
	Q6+IBT/4ELcT3Nb162d0c/BNqrg4XPsRIuulaA4=
X-Google-Smtp-Source: ABdhPJxsRxjHsGwWskqjS7tzLIlp3wnwgZmfEa2JmwdgPjoYnabwcBS4iIlqtbA+/XRCvJrTVW95ZXyg5/XzYNShilc=
X-Received: by 2002:a9d:316:: with SMTP id 22mr3936070otv.210.1617221916064;
 Wed, 31 Mar 2021 13:18:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210331014603.2496983-1-danielwa@cisco.com> <CAK8P3a1rbGPxjRiUTy3AKh4S9jqxk=SHoa9s0Z-3nhgQb3xJUw@mail.gmail.com>
 <20210331175709.GE2469518@zorba>
In-Reply-To: <20210331175709.GE2469518@zorba>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 31 Mar 2021 22:18:22 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2ANBD5q-J+Mr0up+wFBdWJG3Z2ceUP=aB29G7WMq1Z3Q@mail.gmail.com>
Message-ID: <CAK8P3a2ANBD5q-J+Mr0up+wFBdWJG3Z2ceUP=aB29G7WMq1Z3Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: Add support for cisco craw64 ARMv8 SoCs
To: Daniel Walker <danielwa@cisco.com>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Ofer Licht <olicht@cisco.com>, xe-linux-external@cisco.com, 
	DTML <devicetree@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fqfD2ofOC4MUQ4GnoB6YyLWbvpn0LiNwmmDAxMw6z2/bOyKWUZI
 9i1fZCEujJp3iJLv5YNDN7+Atk97sSsMJQ+UYo/wFbeD2cm6CI25WAkGRkke7zRxb1FPXQW
 Gqk3BIoJHn9WLIZ4g8CmOB1nzDsn0jLfU01yPGc88EOpCN+js4+JjO+u2xDooItEuZTDV2e
 tEfJ5qe/0uToclwcfG3/Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S1caZlleYpU=:tJQ/W7kDjbEtPGKhr7Xryh
 Hgj1TX8JW1jhQ70+iXsrBWsEeTW/IxqntAJl01Dd80uwjmdgttXJHMQsfce54ZucD8xXJULOH
 eb8MIZblBPjXUd03/A5V11AJyLMyAvdhbESox8kRq2i57oNX4UU127Q9/I8vzc4P00paOdrC5
 VNvdeJTUJixeRxm0DohRoTGh+cgEckr8RvPpZjVDsiDwvGkwNWnlRe+R2YL9JwwUyqbnXpPGi
 CosKLMr/DJgMD4HB0u+SXmB3UGdl/OtcFYNB/kwPZajz+UmrzjZR3Te/WfCumgopqQtiKiHUt
 Rc7o21aE7WLmQoPKcrFt6XZFsqAGExNAhMBWvM1u+EX69Y4cVEOkCZVGHNB7bLq8vYlKxRcYm
 r0ZEdYg4TXGRkqg2mALOAcIdNiFvfvOdR7Jw4UmvsTqKuF5xUHSisQiQmz4AUDAcVVTKMqPfl
 yfEn6EMeSDfnaXb+j7+LZXKP2ATEiPo=

On Wed, Mar 31, 2021 at 7:57 PM Daniel Walker <danielwa@cisco.com> wrote:
>
> On Wed, Mar 31, 2021 at 09:04:15AM +0200, Arnd Bergmann wrote:
> > On Wed, Mar 31, 2021 at 3:46 AM Daniel Walker <danielwa@cisco.com> wrote:
> > > From: Ofer Licht <olicht@cisco.com>
> >
> > Thanks for the submission, it's always nice to see a new platform
>
>
> > > Define craw64 config, dts and Makefile for Cisco
> > > SoCs known as Craw.
> >
> > I'd like some more information about the platform, e.g. the target
> > market and maybe a link to the product information.
>
> Our SoC is produced as an internal product. So SoC specifications aren't
> widely available.
>
> Here is an example of a Cisco product which uses this SoC,
>
> https://www.cisco.com/c/en/us/products/collateral/switches/catalyst-9200-series-switches/nb-06-cat9200-ser-data-sheet-cte-en.html
>
> I suspect that's not really what your looking for tho.

No, that's pretty much exactly what I was looking for. Just put this one
sentence and the link into the patch description and it will be fine.

> >
> > The memory size is usually filled by the boot loader, just put an
> > empty node into the .dtsi file
>
> Arnd, I must regretfully inform you that Cisco has a deep dark addiction to
> bootloaders which, are, um, how do I say this diplomatically, um , brain dead.
>
> You have some other comments below related to moving things into the bootloader,
> and I can look into it, but bootloader inflexibility is wide spread inside
> Cisco.

Ok, no worries. If the bootloader can do it right, you should do it, but
this part is not essential.

        Arnd
