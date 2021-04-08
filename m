Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8108C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 10:16:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5072761168
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 10:16:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5072761168
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kVsSpZcVKZ2JjI1XEx/Bz0A3retX7cBGgQyJaiXvW68=; b=Hhfu2bmIJ/ywoyhq3KR2zh2GN
	lc6aQZDedbVLuhRMdjWwmOVNpsy/iJo6sXxT1eW7cEupem+0rtDxeQ7ZgIdXh6yGtgCO/Feqz7Y0A
	hKu8xLxKl7xELrGHQHm8BT18ELRmj3WZ1R4nLvCXnzaDaOpE6ZAOibIT8BMT7jDNPoRk++7FQUUq6
	cio2FbnfKcGy8mz/9PUWJWtPR+wniNVespu5nWgnRWs1ny1aRVfxvjKPkvx8Sw6xutgBpnqX9XAAk
	2mUxW0uc7MG5lpRKxmXeJhCM5jaO/ZY+DuSpCY9OqlccyVsxjBaQNSYeXClWyfng/I31+fN02AF2w
	JE1DQZ8NA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lURhC-007bmu-8L; Thu, 08 Apr 2021 10:15:30 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lURh7-007bm7-Dm
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 10:15:27 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MgNlH-1m4JXQ3wid-00hv0m for <linux-arm-kernel@lists.infradead.org>; Thu, 08
 Apr 2021 12:15:24 +0200
Received: by mail-oo1-f43.google.com with SMTP id
 j20-20020a4ad6d40000b02901b66fe8acd6so376485oot.7
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 08 Apr 2021 03:15:22 -0700 (PDT)
X-Gm-Message-State: AOAM530+YFIMOPRT63t7XgPeTucJLj6ZYdDZWi6LjOx1Ujk9TJbS+3e9
 Y0a0g7YdTyraNC3Hwvqivd8t2UVpe6tKmYEb6Xk=
X-Google-Smtp-Source: ABdhPJz0Swhk/adEKhNiECd444g8lzHIqwV0wMOHQrhyl2H25uFzPA40WDIH+eYVvjun//PBhBzUdDK5JjhhHAIvCy0=
X-Received: by 2002:a4a:304a:: with SMTP id z10mr6937279ooz.26.1617876921751; 
 Thu, 08 Apr 2021 03:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <744291cd-a66f-dedb-fe7a-752a9032d6cd@hisilicon.com>
 <CAK8P3a31XFD7smyK0R41uX9fw+P6zPDLEgJoXz99imYS8urENQ@mail.gmail.com>
 <028b2fd0-854f-a683-22be-36f3af5b5784@huawei.com>
In-Reply-To: <028b2fd0-854f-a683-22be-36f3af5b5784@huawei.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Apr 2021 12:15:05 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0So6USwL0FYtzbFotJeBZw87p2kX86hHDyF+WFPvrD1Q@mail.gmail.com>
Message-ID: <CAK8P3a0So6USwL0FYtzbFotJeBZw87p2kX86hHDyF+WFPvrD1Q@mail.gmail.com>
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v5.13
To: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
List-Id: <soc.lore.kernel.org>
Cc: Wei Xu <xuwei5@hisilicon.com>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Olof Johansson <olof@lixom.net>, Zhangyi ac <zhangyi.ac@huawei.com>,
 "Liguozhu (Kenneth)" <liguozhu@hisilicon.com>, 
 Tangkunshan <tangkunshan@huawei.com>, Daode Huang <huangdaode@hisilicon.com>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 John Garry <john.garry@huawei.com>, 
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
X-Provags-ID: V03:K1:PqXDDptOrnkwKDJvVeHQhVuZBYi6cXLaH8eeBKaVEJOgfifsSM+
 W7nfsHwb/rMOZLLbWgImyZA5HzjQgDZYP8idskVGDjT/wMchhjKk/CGX/Po1C3h1bGXtUgZ
 R9LjsJBSDLGwwPLV2bJqazzJX29OX5Jy2wyljYRHC6Q9vZklQOb+2UzYluqg/nTdc7jCP32
 KF7jbzvqTJcyrnBixJBEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:mLpvOijrT2M=:Vi+1iD03aVdiyxyeMwwSKM
 33Gbm9F9j92mhfCL9YOgNvIaAHW+8DfWW4Kv8dD+kFkkgXsRIp3xjV32TsuYQeNDaskbsutlk
 zLGx72cTCsFhymQARnP8V39rzbLLGkPPHjl1e449WJnESgCkpcFhaKnssPSUm6VcyYYG0Pdhx
 irr+65WNSHKxuLW+QkM30qOphQv6h/4WYnwgJrmjrK6cYyhObfKmYaPT3hrEzOB9QlFK8HuEW
 Ea716+Q058sRGVkYxXlYR9H2ibuXkKokHds9FhlEmCmRnmeKHgIIxUjrn5fH4uJYWJkj4M0E5
 ya0a00br0kNj0HNyqn6DKkS9KtzgPQ813eTleBhQXjzlpZvnaYDmkiJqq1ML40txycPUDIzL2
 n54hrbjbpyoH4IMyOyz0Y/C+1oOlJaOeMXdstvS9/UvpyLgIZ7AmJZkLg5+m5q/qq165jxxvG
 d8R0Ipx8TPvsvcLdXK0g99tySqTdYiA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_111525_613563_E84238DD 
X-CRM114-Status: GOOD (  16.51  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210408101505.vrpFsqsYmMppClnElRPzl0ldCSTS2rcPydKQpqLhE6U@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
