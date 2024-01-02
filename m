Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E26BC46CD2
	for <soc@archiver.kernel.org>; Tue,  2 Jan 2024 10:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB89FC433C8; Tue,  2 Jan 2024 10:11:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C650AC433C9
	for <soc@kernel.org>; Tue,  2 Jan 2024 10:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704190267;
	bh=X5FcVdv9GjfCK9cDQmloIH4+cT043bCXYXEZS7gPzAw=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=FY1IvR74AbbGmz5rT3b2CrxzUYbqtpdBLWfx85ljnW+DBf6llcQ4DWaWIAV+y/yhu
	 cYr7PJ6gU6ehMlzfInPnL+GGCLmA1d2tktjwbki7l7wvHrmQbckuHLZnOHqTLNZ7sw
	 02ZnzxhpW+TAtyv9LVKlVTu0dQsIfsXuOKjTsV+h5xX1EVxJFf4/6z/fEQHVYBMpxT
	 0ooB+ACsYDz+micmI/qiiPe/8uUykJABuR8xWd4Me0KPOcMfY4YsuAuLt0uBv3Nhbh
	 kSZyl1l4uAPSfrXFE+9MKCO2tjMR9SzuM/vP/XpdwDbNqRfjEAjrGumrwrG8p8Kzr8
	 sY3JMAlmpx79g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9C9E1DCB6CE;
	Tue,  2 Jan 2024 10:11:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170419026756.6407.17974029387461841669.git-patchwork-summary@kernel.org>
Date: Tue, 02 Jan 2024 10:11:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: [V2,1/2] ARM: sun9i: smp: Fix array-index-out-of-bounds read in sunxi_mc_smp_init
  Submitter: Stefan Wahren <wahrenst@gmx.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=813268
  Lore link: https://lore.kernel.org/r/20231228193903.9078-1-wahrenst@gmx.net
    Patches: [V2,1/2] ARM: sun9i: smp: Fix array-index-out-of-bounds read in sunxi_mc_smp_init


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


