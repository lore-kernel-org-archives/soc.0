Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3CB9C63798
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 21:17:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B37AE21D93; Thu, 26 Nov 2020 21:17:58 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 05ABD21D1A;
	Thu, 26 Nov 2020 21:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606425478;
	bh=HSfHpyGHosM0zl4GX1qEm9Y1y0EP+ql2Rg6i1IQCpBM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HTZs/3QQQivwOss8s2lWlnqv675t9ViuuIQ42A2GwboFSssbruBT37zocGSkEZYKP
	 8IITcRjfH7vt+C/6VUpvsOyBcxaYWgcf4Fz/4EAdwamRnL55BDGJy+uHwCME3SdHD7
	 3yK3DtiBjSy4MQyiPfTkVO5pvCKeIF3zzKBNZuFc=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "arm@kernel.org" <arm@kernel.org>,
	soc@kernel.org,
	Wei Xu <xuwei5@hisilicon.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Serge Semin <Sergey.Semin@baikalelectronics.ru>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
	Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
	Olof Johansson <olof@lixom.net>,
	huangdaode <huangdaode@hisilicon.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	John Garry <john.garry@huawei.com>,
	"Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
	Tangkunshan <tangkunshan@huawei.com>,
	Zhangyi ac <zhangyi.ac@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>
Subject: Re: [GIT PULL] arm64: dts: hisilicon dts updates for v5.11
Date: Thu, 26 Nov 2020 22:17:50 +0100
Message-Id: <160642546630.1426861.17643860322823735385.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <5FBDC416.5060008@hisilicon.com>
References: <5FBDC416.5060008@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Nov 2020 10:40:22 +0800, Wei Xu wrote:
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei

Merged into arm/dt, thanks!

merge commit: 2df8aa0373489534a14be5ef48a2dc1215ef9270

       Arnd
