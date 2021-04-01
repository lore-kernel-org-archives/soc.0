Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1FC4C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 20:15:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 885D0610E7; Thu,  1 Apr 2021 20:15:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DA1C6610D1;
	Thu,  1 Apr 2021 20:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617308150;
	bh=N+8g3oi/DtOR4IYfKa4K/TuQ5ID2Jy9j60SR79CV9e0=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pSpEirbcyT/HIrg21DMCZeyzEyLgqxZAUE8xefTuDXvuKGxgCp514CCIPaeEpgWO8
	 q4Oj6C+3fjzDGFpxG5M+/O1I7Qi2jReXtJzMMeqmo4aZHZLelONALYl62ViH3K0NUs
	 WgGj9oznz3aQXVVPIomeaghLKPEbrgKjSkcpXHgkf5r7hg7N4iWhgr82POo0gnyVzL
	 4sZmQqvTRvIguYVfjpWu/jEB8C/pLNf9Z9p5e1ETRNIj5gzyWO17SeGooFMdUBlaJG
	 LXbUPAW7vLGwhLsBBlwFq7BwHU5gz08uc3s1H+uYAO0LZJZ+SUXhXdv+jfvCwuWhYz
	 7X1zYVsFGl9Gg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Boris Lysov <arzamas-16@mail.ee>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] ARM: dts: mediatek: updates for v5.13
Date: Thu,  1 Apr 2021 22:15:22 +0200
Message-Id: <161730808698.655497.18205720456447891568.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <be262120-6cd9-87a7-ccc3-f5c403cff66b@gmail.com>
References: <be262120-6cd9-87a7-ccc3-f5c403cff66b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 16:01:34 +0200, Matthias Brugger wrote:
> Please take the below patches into account. These are mostly cleanups to make
> the DTB checker happy. Apart from that we now have SMP support for MT6589, it's
> nice to see that someone keeps working on this old platform with which I started
> upstreaming :)
> 
> Regards,
> Matthias

Merged into arm/dt, thanks!

merge commit: 8028548ba16284166987d8969e0c5bec36a0228d

       Arnd
