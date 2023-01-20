Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8EFC25B50
	for <soc@archiver.kernel.org>; Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C2AC6C4339E; Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACE5CC433EF
	for <soc@kernel.org>; Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674209417;
	bh=yrd4ubM+9NXwcCO1aT4gOevadaIOjg91ucMnneAIyx8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=LduRKOgLJAL77qS03cB/okn728zDTeE0Y9RMw/szQMy3NXncQvIw5I3WscF63UUww
	 S7tki7FVK+cUeRV3jt5rWcRygDHcqHbg4roWUBAHk3w7W2FnsUVJTuWzREe4ilsOPM
	 RCAlkRdr/ouIqA336VtklM7ia7+wxGo54/hypzaCYZPTh/KhhdhQcqnnGIWTAmtHrZ
	 CLnPh6ybE/MyZXpi8kuy79gyUneouAMos6h8OxaTfbiLDJ3wyLVnqMkRwLVolFtiz4
	 0E17E5hh7Daw+ln1jq6NXy8s0uGWud6gyu0KDgB83LPYvVcXhEf12oJ+ZVKsdjV++m
	 PqmpV0aXXVxuw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8F70FC04E31;
	Fri, 20 Jan 2023 10:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167420941750.17943.12388999575670271399.git-patchwork-summary@kernel.org>
Date: Fri, 20 Jan 2023 10:10:17 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] STM32 DT fixes for v6.2 #1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=712796
  Lore link: https://lore.kernel.org/r/3fe26bf9-297b-5c78-682b-37fa6d8b6190@foss.st.com

Patch: firmware: zynqmp: fix declarations for gcc-13
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=712827
  Lore link: https://lore.kernel.org/r/20230117164133.1245749-1-arnd@kernel.org

Patch: [GIT,PULL] AT91 fixes for 6.2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=713616
  Lore link: https://lore.kernel.org/r/20230119112101.42045-1-claudiu.beznea@microchip.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


