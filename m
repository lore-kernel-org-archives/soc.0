Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4425AECAAD5
	for <soc@archiver.kernel.org>; Fri,  2 Sep 2022 11:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0BC5BC433B5; Fri,  2 Sep 2022 11:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E582EC433C1
	for <soc@kernel.org>; Fri,  2 Sep 2022 11:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662116417;
	bh=/VxjqKc9TXlyrBNdIzv6I6jcsZ5zo/j0TPrxaH4Gcx0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=cJu1pscTKdk0rKgv8cjy8KERXkzXC1k8ZCQFjWMXYyeENefzIKC5q9FNrSjG8AOHr
	 03e7kLNzbP3AvPQLQ5M6FXbPuBigJ3EiE86HzkqL1LuZPPtf8g63eBgvqrr7/uKvK9
	 e7uNakzNrinGyRjlxsDNiW3Vt/tlKyC96uZgzZP8/VcHktAbFR8F0Oe1JA4ar9Zkvh
	 RY4pt0WIgRoK6umVy8Q+LSJbyTLnu6/Q08w6SwDl9oqlgKnncsNLdIeRzSb0KMag0/
	 C3/DT3MKy6EJG/MHfmwLmvCq1dE1DHcgRuGo+f+bV/h9YlzGLib4tdoP9U20TL2/pY
	 Ch6eEM3qeKw8A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C1436C4166F;
	Fri,  2 Sep 2022 11:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166211641769.12856.17354462113446880149.git-patchwork-summary@kernel.org>
Date: Fri, 02 Sep 2022 11:00:17 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] arm64: dts: juno: fixes for v6.0-rc1
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=672140
  Lore link: https://lore.kernel.org/r/20220829174420.207880-1-sudeep.holla@arm.com

Patch: [GIT,PULL] Renesas fixes for v6.0
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=673573
  Lore link: https://lore.kernel.org/r/ab2866f12ca18747413ba41409231d44e0c6149b.1662111547.git.geert+renesas@glider.be

Series: [GIT,PULL,1/2] Broadcom devicetree fixes for 6.0
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=672208
  Lore link: https://lore.kernel.org/r/20220829225103.753223-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/2] Broadcom devicetree fixes for 6.0
             [GIT,PULL,2/2] Broadcom drivers fixes for 6.0

Patch: [1/1,RESEND] soc: fsl: select FSL_GUTS driver for DPIO
  Submitter: Mathew McBride <matt@traverse.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=673070
  Lore link: https://lore.kernel.org/r/20220901052149.23873-2-matt@traverse.com.au


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


