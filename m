Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF4DC7EE23
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8662BC4339B; Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F532C433D2
	for <soc@kernel.org>; Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685980240;
	bh=nUzZVrbahrl+1wAjGSjiLhwjPOriEisp6dZwgeQwksI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=VTWNwPqXrYD3LRtIG5pzP2Xmoz2aUkJgDevYYsnlKqzsL4F5j8oStuJGoDmDRmbwk
	 83ah8f5MW4200AEEbUyxx38CGK4EtUATiAE9CtlcbWMiUwLsjTOq3Bz0eJf1IxheDA
	 iK/ZMD801m9/j25iTI/1FQ3js1HL0g594oZgNea6AYDJsKTMKzPwT438GtBtVSz4io
	 WSLFtxsCuL3Dx7ihdkz7uwzDi08Up1kpN7eCi2icxxxu0ZN27vV7zmZzglhu6Mbf2n
	 WF6flPkgX403GztZkhwn4gLfQeHWXw6sjcpba+3SFhmx+2MtVXGEqO7IQNRv/HapA+
	 yk31PU+3Wf8cg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4CCA0E4F0A6;
	Mon,  5 Jun 2023 15:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168598024022.10098.13978422200974665950.git-patchwork-summary@kernel.org>
Date: Mon, 05 Jun 2023 15:50:40 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] AT91 fixes for 6.4
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=752157
  Lore link: https://lore.kernel.org/r/20230530105930.11621-1-claudiu.beznea@microchip.com

Patch: ARM: dts: Fix erroneous ADS touchscreen polarities
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=746386
  Lore link: https://lore.kernel.org/r/20230510105156.1134320-1-linus.walleij@linaro.org

Patch: [GIT,PULL] Qualcomm driver fixes for 6.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=753130
  Lore link: https://lore.kernel.org/r/20230601141058.2246039-1-andersson@kernel.org

Patch: [RESEND,GIT,PULL] Qualcomm ARM64 DeviceTree fixes for 6.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=753139
  Lore link: https://lore.kernel.org/r/20230601142659.2246348-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm ARM32 fix for 6.4
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=753124
  Lore link: https://lore.kernel.org/r/20230601140347.2245680-1-andersson@kernel.org


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


