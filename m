Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 314E8C4338F
	for <soc@archiver.kernel.org>; Wed, 18 Aug 2021 12:59:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0D4A561058; Wed, 18 Aug 2021 12:59:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EDBF6108F;
	Wed, 18 Aug 2021 12:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629291595;
	bh=1PXTrzypSqjSqKLXCyiUju9MqS/kBI767BCevYdeoKs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DIGQFxC6E2i1ALHhOwzWr+dqcmayer9HCdoXolRewE+RRL5XCJhwuHo5hapb9t7bU
	 fdPcB5JZkLeP6YE+6vvL1vhMW+vFVuEvvY5BTObS60N6O0T8nr+OANRmXXDeRLli71
	 gfSnicjFvKsIzRYH6AV8OuOOH40B+l23ig/NLDdQB6w2FpXlpQI9lUc6MEJerMApzv
	 9NwzvrH4oXe86D74dd9eEuzR4zw2CkxyuushYaDdTsBp31RJnKCbntoh0y7vpCT4Gw
	 bPH2EdFM5cXqdFQPoVy6bjBkJPO5RQMtyYLbFs3ZyM3e1sHy/+tZK77v092egtcwXm
	 RC2FD40S7EO0g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Wei Xu <xuwei5@hisilicon.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Zhangyi ac <zhangyi.ac@huawei.com>,
	"Liguozhu (Kenneth)" <liguozhu@hisilicon.com>,
	John Garry <john.garry@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	huangdaode <huangdaode@huawei.com>,
	Arnd Bergmann <arnd@kernel.org>,
	Salil Mehta <salil.mehta@huawei.com>,
	Olof Johansson <olof@lixom.net>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tangkunshan <tangkunshan@huawei.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	"Zengtao (B)" <prime.zeng@hisilicon.com>
Subject: Re: [GIT PULL] arm64: dts: hisilicon dts updates for v5.15
Date: Wed, 18 Aug 2021 14:59:27 +0200
Message-Id: <162929137204.372162.7039199681946826323.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <611B9BE9.8050904@hisilicon.com>
References: <611B9BE9.8050904@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 17 Aug 2021 19:22:17 +0800, Wei Xu wrote:
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei

Merged into arm/dt, thanks!

merge commit: 911f0faf485817a1e70bcaad8121201ef0f30ae2

       Arnd
