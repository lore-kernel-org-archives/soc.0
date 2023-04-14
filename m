Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C26C77B76
	for <soc@archiver.kernel.org>; Fri, 14 Apr 2023 12:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B3A34C4339C; Fri, 14 Apr 2023 12:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D622C433EF
	for <soc@kernel.org>; Fri, 14 Apr 2023 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681473619;
	bh=xpKQGIT4hhQ7nSzUaIz2YnJOrjHX4bsWi9SPqQN5W24=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ZVNInS7YMyCaFvJNDQx3ZwDWEc7QdHH6CczuaGBpHZaN9Z1FAXFr6OfEQk+poLrDH
	 C+2gt0cj5pCRigEvimOOT3lxW0QXuT1f2E1LgcCobqoQCdyQDg9sLNIjf0EJHNOWuu
	 UdRFNMHTgJX9k1xZEuaJKfnNZqOav82UiTDZJEGU4fzeUJ4UdT98VrXNmThMhtYk26
	 BL96VqAo+rzxUJ1+LwzNnCK9Rh24qlQDWoKQV2eFK4IcfQA4ABAnwh8FJJpbxo9gKb
	 RgV/4u0jEtvcZNX5oXJv4qtP1rwr8vrV/FtleWDGjZBY59XYfsg+c/sBVYy2iqkvM2
	 MiYVCj3RxSLWA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7770FE52446;
	Fri, 14 Apr 2023 12:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168147361943.16823.6365722455414699418.git-patchwork-summary@kernel.org>
Date: Fri, 14 Apr 2023 12:00:19 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] A few more Qualcomm ARM64 DeviceTree fixes for 6.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738469
  Lore link: https://lore.kernel.org/r/20230410153850.4752-1-andersson@kernel.org

Patch: [GIT,PULL] Rockchip dts fixes for 6.3
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=738243
  Lore link: https://lore.kernel.org/r/10559306.CDJkKcVGEf@phil


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


