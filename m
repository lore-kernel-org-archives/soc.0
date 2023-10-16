Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F12FCCDB482
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3474C43395; Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD6B2C433C9
	for <soc@kernel.org>; Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697469685;
	bh=TAAfIrtpcyRBdNRg+YOPLGbCczzS/NcJWgyTgfwE+o8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=c6T8kTQGcJfzt+Sp/SDuRDD1Pv6yU/iWGELAq7PYb46EwHx8WZ4HMJtf3DeXjDdK+
	 qnJsOQk8gEZnL0OTTfTQeZfylQkHjNp7DFmYIirHPgpYMNUfhXvXaHxR9JZtILnhdr
	 +Uoug0SMzSDCcAtqcNDrMeeN02reXkSlXNhhDV7L+c6R2CGNAL0hPc6OFkDJ5A63C+
	 iC6frNZ6XxlY14kO+/f4h2tQ1XP1AV6CyC7D6+YuEUzkQOZXdmnGM54L2pulg1Wm/o
	 AjPILt4ZWwXd05jXZKRJPx75oRWH1lDmwUfHDDfKGFJ4qDKiigdN9CGnJUk+xGoLHC
	 wkbN7bJr9R8EA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9BC53C41671;
	Mon, 16 Oct 2023 15:21:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169746968558.27582.17739737167806978951.git-patchwork-summary@kernel.org>
Date: Mon, 16 Oct 2023 15:21:25 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Qualcomm ARM64 DeviceTree fixes for v6.6
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793314
  Lore link: https://lore.kernel.org/r/20231015180112.853805-1-andersson@kernel.org

Patch: [GIT,PULL] i.MX fixes for 6.6, round 2
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793279
  Lore link: https://lore.kernel.org/r/20231015090202.GW819755@dragon

Patch: [GIT,PULL] Renesas fixes for v6.6 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=792996
  Lore link: https://lore.kernel.org/r/cover.1697199963.git.geert+renesas@glider.be

Patch: MAINTAINERS: Fix Florian Fainelli's email address
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=788368
  Lore link: https://lore.kernel.org/r/20230928070652.2290946-1-u.kleine-koenig@pengutronix.de


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


