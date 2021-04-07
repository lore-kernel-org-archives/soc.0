Return-Path: <SRS0=Ip9B=JE=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2B3C433ED
	for <soc@archiver.kernel.org>; Wed,  7 Apr 2021 14:32:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7BD706128D; Wed,  7 Apr 2021 14:32:05 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F59461260;
	Wed,  7 Apr 2021 14:32:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F59461260
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-oi1-f171.google.com ([209.85.167.171]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MYNW8-1l8gBk3TP8-00VMGL; Wed, 07 Apr 2021 16:32:03 +0200
Received: by mail-oi1-f171.google.com with SMTP id m13so18933242oiw.13;
        Wed, 07 Apr 2021 07:32:02 -0700 (PDT)
X-Gm-Message-State: AOAM5338I4dGP368Pbd1w0DiPZFjOjVWQRftisM4QoWrQjIqvh4dGN1Y
	J9llVgF/7iWlFDiL5q15Fj7RrQdfr0i1VX6OvuM=
X-Google-Smtp-Source: ABdhPJz3rOug/myucPiyn2F6CpgsSegz+/pHmK8XszIjmYisNeCOrVVePZdEIr67xXu2+oU6AX0eXAqf1anrPWj7D+o=
X-Received: by 2002:aca:5945:: with SMTP id n66mr2419512oib.11.1617805921378;
 Wed, 07 Apr 2021 07:32:01 -0700 (PDT)
MIME-Version: 1.0
References: <744291cd-a66f-dedb-fe7a-752a9032d6cd@hisilicon.com>
In-Reply-To: <744291cd-a66f-dedb-fe7a-752a9032d6cd@hisilicon.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 7 Apr 2021 16:31:44 +0200
X-Gmail-Original-Message-ID: <CAK8P3a31XFD7smyK0R41uX9fw+P6zPDLEgJoXz99imYS8urENQ@mail.gmail.com>
Message-ID: <CAK8P3a31XFD7smyK0R41uX9fw+P6zPDLEgJoXz99imYS8urENQ@mail.gmail.com>
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v5.13
To: Wei Xu <xuwei5@hisilicon.com>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Olof Johansson <olof@lixom.net>, 
	"Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>, Zhangyi ac <zhangyi.ac@huawei.com>, 
	"Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, Tangkunshan <tangkunshan@huawei.com>, 
	Daode Huang <huangdaode@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	John Garry <john.garry@huawei.com>, 
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, 
	Shiju Jose <shiju.jose@huawei.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ODI+NResd8mtiHNRrkMsG4RiokBGCm5VeAyQeIkGUHmq3ood5J0
 MXVQ55Dq4LArJKEpv32eJ4QcrgBABuaDUKOvXhoXCtmyvcb9nTTYmKAK3XdWu1tizyW59qt
 jwv9bfCKcLDJEzfZF9PDoEjnDky4Hm+JWzVx5s9HzrORFg+q9xJkOeoIV2ZoAJ37OzIZawb
 cXZizE235dolLY9wXX1xQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1lRl5Ab+OhI=:7FWjAYpE4CB+wJChyU7gew
 qQXodrzNrtregJX0YcZz9msPrPMjY8CKn3gt56M6fT/yThUWLzIf05PJw3aT7hqxm3cqEl9Yo
 FVsL0nmVqYybX5HdtiIrnFaUhy+aAnvXO0Hnh/j93dc+rPCj7QH4A5SnYKWv7NOCVR5cONhlN
 pua0yODy4Nhk6k/4xrWP80G/ID7SnUEoNq4QC+6IGN0YT6ng30IuH6yQMz7MkwIw68fBYnfLG
 BCXAbOcIkhzEx/AkxueW0vWhkfs1x2PraqvVk42RVDTqrcODzjfYrnh6eCR1xqkDBu1k7Dmyz
 GWhIo65V0IdzvTlv8mbu1iOXpyE4PxA+bEH4MLbMInYnCiCzemOSbfEqNpffykiUdrhdoPaQ2
 KDMznhkE7k3ZPaXVSsF36dphxPGU0ffYjzK1d94lAE6hnKR3sB/X2ykX7BL0k2QfW19ZL2iXq
 9+YjrP8qAXdG9IJLXUzh+hoPyTS60hA=

On Sat, Apr 3, 2021 at 5:06 PM Wei Xu <xuwei5@hisilicon.com> wrote:
>
> Hi ARM-SoC team,
>
> Please consider to pull the following changes.
> Thanks!

I'd prefer to not break compatibility of old kernels with new dts files
here, as this would prevent installing an old distro with an ebbr
compliant boot loader, for purely cosmetic reasons.  These are used
in the popular 'hikey' boards, which are used in many scenarios,
which makes it fairly likely that someone might want to install
something other than the very latest kernel.

Could you instead keep both the old and the new property in there
for at least a few years?

        Arnd
