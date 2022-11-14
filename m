Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD1E2C43219
	for <soc@archiver.kernel.org>; Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F8DEC43140; Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 696B9C433D7
	for <soc@kernel.org>; Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668430816;
	bh=AUeyJ5XnnIq9cy80Z/Ym+dgK6b7mYBrLaCv1DrKpVSM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=XVi6Ik8ZtYryRf8e8ZbCk1TZfl790ARkFNBpDwQIS6FfkMroiQhxAZAVhv9F6asv8
	 N+3+dA5PRWsM5qPpajiFmS97Gd5yBXx/PfafRClTdJVxxQDjaxrak7zdkuDGGXYHhn
	 4jubDIOV8J9xjUkh+Me1blYamsBLDwZLLLaXHzEQlV+01XK6gpmOfTwRB4TZNcbANI
	 ylvZ1oXYwpQeUJ+uXZNYKooNAFzz0OSR6FsSBAqwwEl8tX1B3QJldFXvNMdYS7az3e
	 V/WbbmXraxV35mg+obibatl/GiTLTROhiK3b4WtO1JXGFkbWDecayQUNwK4fLf+2zT
	 i0q4t6olK3bkg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 50B52C395FE;
	Mon, 14 Nov 2022 13:00:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166843081627.22003.16163050290703873808.git-patchwork-summary@kernel.org>
Date: Mon, 14 Nov 2022 13:00:16 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: Route RISC-V SoC drivers/firmware/DT via the soc tree
  Submitter: Conor Dooley <conor@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=693800
  Lore link: https://lore.kernel.org/r/20221109212219.1598355-1-conor@kernel.org
    Patches: [v1,1/4] MAINTAINERS: add entries for misc. RISC-V SoC drivers and devicetrees
             [v1,2/4] MAINTAINERS: generify the Microchip RISC-V entry name
             [v1,3/4] MAINTAINERS: add an entry for StarFive devicetrees
             [v1,4/4] MAINTAINERS: repair Microchip corei2c driver entry

Patch: [GIT,PULL] Qualcomm ARM64 DTS fixes for 6.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=693889
  Lore link: https://lore.kernel.org/r/20221110040635.795921-1-andersson@kernel.org

Patch: [GIT,PULL] AT91 fixes for 6.1
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=694038
  Lore link: https://lore.kernel.org/r/20221110115411.180876-1-claudiu.beznea@microchip.com


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


