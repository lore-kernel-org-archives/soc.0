Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D1BC54E5D
	for <soc@archiver.kernel.org>; Mon, 11 Mar 2024 19:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5ACF0C433B1; Mon, 11 Mar 2024 19:50:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 451A4C43394
	for <soc@kernel.org>; Mon, 11 Mar 2024 19:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710186632;
	bh=BobxleiBXF1IScHSQRUxmAtOtrmlOvO7kf8pyYdu1M4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=CkoRSF7tSkKM1goEPNWE80sZmgCiBbW+IhE8xFgGubemmWj/N7jAZ5bsgGBVt8Ld3
	 hlykT2XaxaDb1g/m0lh0wGR/vU4NQHad4KB9vAH0qZFXl+5b3SDJe96F4hWNKc/9N+
	 Ir9/KaiWeCWbiuBnGR/zv1BcPmOxZCyS/3RU1PWge+RgN5OW38G22mgMsfWRxEg31V
	 r16A0klhr31JtlzJBE6QLNkHCfkliN5XE7k5wZg9XSDbLRxvpt3KBcDpaRMjhGyi1/
	 etiTJz3YDqnRChW6j7CSIlXtuBV5FLA377w9FnHdUgR2cNQaltvsFalMxjQSw48P4f
	 KPal/3hLlSsTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 24C9CD95055;
	Mon, 11 Mar 2024 19:50:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171018663205.32255.2005088902189422726.git-patchwork-summary@kernel.org>
Date: Mon, 11 Mar 2024 19:50:32 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/3] Broadcom devicetree-arm64 changes for 6.9
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=833567
  Lore link: https://lore.kernel.org/r/20240307200441.2151734-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/3] Broadcom devicetree-arm64 changes for 6.9
             [GIT,PULL,2/3] Broadcom drivers changes for 6.9
             [GIT,PULL,3/3] Broadcom soc changes for 6.9

Patch: [GIT,PULL] RISC-V Devicetree fixes for v6.8-final
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=833074
  Lore link: https://lore.kernel.org/r/20240306-waltz-facial-9e4e1b792053@spud


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


