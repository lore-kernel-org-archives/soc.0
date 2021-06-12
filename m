Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1664C48BCF
	for <soc@archiver.kernel.org>; Sat, 12 Jun 2021 16:10:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8849B613AD; Sat, 12 Jun 2021 16:10:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 70E20611CD
	for <soc@kernel.org>; Sat, 12 Jun 2021 16:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623514207;
	bh=cuhA6NyjddnR+HH3wxRGU2RUVXLFFEzjjz3gArAexvk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=X2k4T61qthH+vWw9oEoZ51vrp2x9MBqgrV9xzvbOjLosIybD2GNhKjdmd6f2pONc7
	 mkOpNWEY2DS2F2on7tMzlVB7VFml/OIIQPmVq1yXD2M+4vsAtIY2cEPuryCJH55evC
	 9Wkt3M30JhtNMuF3M9VwGg+4QLGwNBSOP2OMZ9TbRNObyYpG7kGUDU00J5s5JuJM2X
	 DJX7DR7erfUKUAhdwLQ2+HjYSgdzlHsyqjPT4+hFNbezEyf2eOYdOf1Ie6DB3tSDOT
	 BTMNjkpeSsvbtQAoPIq27vjgF2xZ/OpuelOuh0VjmecNGIALEFVuDipkYm+4zhnslO
	 hsm1Twb8lXlFg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5E2CB60A6C;
	Sat, 12 Jun 2021 16:10:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162351420732.27448.12590691938276431087.git-patchwork-summary@kernel.org>
Date: Sat, 12 Jun 2021 16:10:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [GIT,PULL] Rockchip dts fixes for 5.13
  Submitter: Heiko Stübner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=499185
  Lore link: https://lore.kernel.org/r/3405741.0S5aU1g85B@diego
Patch: [GIT,PULL] Allwinner Fixes for 5.13
  Submitter: Maxime Ripard <mripard@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=498971
  Lore link: https://lore.kernel.org/r/ad7ba352-315c-4201-b922-4bf914a00d98.lettre@localhost

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


