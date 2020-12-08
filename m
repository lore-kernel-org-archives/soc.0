Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B67ADC4361B
	for <soc@archiver.kernel.org>; Tue,  8 Dec 2020 16:08:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8A1B923AC8; Tue,  8 Dec 2020 16:08:58 +0000 (UTC)
From: Arnd Bergmann <arnd@kernel.org>
Authentication-Results:mail.kernel.org; dkim=permerror (bad message/signature format)
List-Id: <soc.lore.kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	arm-soc <arm@kernel.org>,
	SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nicolas Boichat <drinkcat@chromium.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	Neal Liu <neal.liu@mediatek.com>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [GIT PULL] soc: mediatek: changes for v5.11
Date: Tue,  8 Dec 2020 17:08:42 +0100
Message-Id: <160675365634.2641537.7384101128991830443.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <b03fe343-e183-c6f3-f2dc-4c58aae3146b@gmail.com>
References: <b03fe343-e183-c6f3-f2dc-4c58aae3146b@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 29 Nov 2020 22:22:22 +0100, Matthias Brugger wrote:
> Please find below the commit for the MediaTek SoC drivers. The most important
> changes are the inclusion of two new drivers. Devapc is an TrustZone interface
> found on the mobile phone chips to identify malicious accesses from bus
> controllers. Apart from that you can find a new power domain driver. We have the
> old scpsys driver for quite some time around, But it has some limitations, that
> we could only overcome with a brand new driver with a new binding. Right now
> these new driver supports mt8192 and mt8183 but the plan is, to move all SoCs to
> the new driver model and later on retire the old driver.
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: bbecede458d042a5b71d6f10eedd471615d9ee6c

       Arnd
