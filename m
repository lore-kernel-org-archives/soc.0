Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624D5C636CD
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 16:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 30570C4339E; Wed,  1 Feb 2023 16:30:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 118F7C433EF
	for <soc@kernel.org>; Wed,  1 Feb 2023 16:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675269020;
	bh=8dX0YdMO/wxP1gvXFGjPFdxwNny1LSUK/GikXYE1+ZQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=GnMh7iGE87A3Itz5/DIwZcjBdJW4oCX/AX991JaLjDw4mVTZykJtpEvxM6tTEXNuH
	 womGtYEGgBDujo2U25qEunYrS67TE4kfVkABxvrRH5ypWH8uYAbHcY9ZXUjK495za0
	 lUgsqiwvuu9IBJNf5CFuqDECNers7Ws1OMreZ6nPlZpFAchQWRK5BJKicWUnxk58tQ
	 89wSv3fWiLULYFyk75hUgQ5/I7+p1mKEeCpKnfNVGbQGtZWTRsb0fhigwYWLBoP7bE
	 MPprdhqkfMeqILEbmjKBE4fMDh7N77Jmuc2JobfnjNeCIS5kY7swjABm1PmQ8YTnQW
	 ysy1sw4jDcQFw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DF9CBC4314C;
	Wed,  1 Feb 2023 16:30:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167526901980.23236.1881605249119630613.git-patchwork-summary@kernel.org>
Date: Wed, 01 Feb 2023 16:30:19 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: MAINTAINERS: Update entry for MediaTek SoC support
  Submitter: Matthias Brugger <matthias.bgg@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=717752
  Lore link: https://lore.kernel.org/r/20230201152256.19514-1-matthias.bgg@kernel.org

Patch: ARM: dts: wpcm450: Add nuvoton,shm = <&shm> to FIU node
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=717579
  Lore link: https://lore.kernel.org/r/20230201044158.962417-1-joel@jms.id.au


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


