Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FC71C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 21:08:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0EB01610F8; Thu,  1 Apr 2021 21:08:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8C827610C7;
	Thu,  1 Apr 2021 21:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617311325;
	bh=5eoCbOT03yYdZ3SzNI2XZ+AWzU6pejyoMe7AYWXziec=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NfRarbvQZ1F9pm8NP8ZGJob4XCbo2SbHOe3eR0wf+PSKSeXaTV2uucvCbAPvhgdwB
	 dvcJXoiv6p+/9MQHRAz5aOQeUAfNl2NA7y7lOXrt5sEW+dzA3N42fq1MQDb140IQOX
	 1r/Pyqzshl0hnwOXMbuF6twr0687hLCTv3pAa8nAwvu22l5r4ik+aYEoLETuvDjObq
	 Y5pYRuNoNZirIyZP9EgXcfpR2EzaFu57FBsfDPh+5B7GVnSD4jyelEdC3EJsCSuFSB
	 zB0CmM3MI9B+N592HMYWy7wohyL5y50XBA1MYma0hWGFxgbOiZOY9/FJ/On2v5BtYI
	 a/5ayeXjMbFIA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	CK HU <ck.hu@mediatek.com>,
	Wei Yongjun <weiyongjun1@huawei.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [GIT PULL] soc: mediatek: changes for v5.13
Date: Thu,  1 Apr 2021 23:08:36 +0200
Message-Id: <161731130321.663335.9439061446866872029.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <c47d4bdd-9e05-c0de-bacb-3a262fed936d@gmail.com>
References: <c47d4bdd-9e05-c0de-bacb-3a262fed936d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 16:19:45 +0200, Matthias Brugger wrote:
> Below you can find the changes for the SoC drivers. After we fixed in the last
> round the power management domain driver. This time it is the MMSYS driver. Up
> to now it held one big table with routing information for all SoCs. But that's
> not practical over time, so that was splitten up to add only per SoC structures.
> That should make it easier in the future to add support for new SoCs. At least
> one series didn't hit mainline this time, but should be ready for the next round.
> 
> Please take the patches into account for your pull request.
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 3e7f2f2980e82eb20ce73691d65d696c6994ad4c

       Arnd
