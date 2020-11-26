Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CA22C63798
	for <soc@archiver.kernel.org>; Thu, 26 Nov 2020 21:18:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 449F2221E9; Thu, 26 Nov 2020 21:18:02 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 14E70221F7;
	Thu, 26 Nov 2020 21:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606425482;
	bh=BMGFCM9Rj5zeyt57Oiu4DCwCB26U4lTp003oqrGFbLg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i+fbwxZpjqkVw/txIC6NtkKYEXaws24ufgDu75TY7BVuFDaJMet8helPKRbArrUFJ
	 lpIbE8Y2K/r+gQChmnciHXIDir53yVdAD0UnUi0QiTvxe/OGJ769QTp0/Q5SjQIhYs
	 G//17Qh+9o8vcAfghWDn3YVHXe63rfmrHbjJ8qps=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "arm@kernel.org" <arm@kernel.org>,
	soc@kernel.org,
	Wei Xu <xuwei5@hisilicon.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>,
	Olof Johansson <olof@lixom.net>,
	huangdaode <huangdaode@hisilicon.com>,
	John Garry <john.garry@huawei.com>,
	"Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
	Tangkunshan <tangkunshan@huawei.com>,
	Zhangyi ac <zhangyi.ac@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>
Subject: Re: [GIT PULL] arm: dts: hisilicon dts updates for v5.11
Date: Thu, 26 Nov 2020 22:17:51 +0100
Message-Id: <160642546617.1426861.9109722588377522115.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <5FBDC347.4050102@hisilicon.com>
References: <5FBDC347.4050102@hisilicon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Nov 2020 10:36:55 +0800, Wei Xu wrote:
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei

Merged into arm/dt, thanks!

merge commit: 3319f1489ef8516981a153ca4c96c442b356dc2c

       Arnd
