Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A1D9C41513
	for <soc@archiver.kernel.org>; Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6AFAC433CD; Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C16EFC433C7
	for <soc@kernel.org>; Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692276625;
	bh=lvy6+27gXtPOP8ir8QXdTY7pSpxcTM89XRAJeUfR7kU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=N6vDH2m2AG1ZBGjqFLXyZmMEvNKlzjV+CgoSX7z0UgQOvlP0aTLOPCGRm3EhY9jBX
	 GhjhoHnB11NA3jNikIXlihvpaTHheWy0dQZD4J66JD8xG0SznKbp250aHoWjOtEKyE
	 qBJuR4uXolLi6oRbrgHxZnm3Kzu64ADrhhn/ZrbjfERn23ERc3Y92emOyT9oPMUHpq
	 oWnVRmHSb//fmq2SddA0avAFtVCYrxcmhy6wQgb+Hjvm8svIX5BgqD8TKCjykfL7hV
	 YgishrlIpVjZaC7ciRS09g4e5DuR6X1OH40j1TTM1MYZfoO91rqiJ/SMJ7RUE9sab2
	 MbQO5beiQVnqg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9B2EFC395C5;
	Thu, 17 Aug 2023 12:50:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169227662557.28155.14483006863579221173.git-patchwork-summary@kernel.org>
Date: Thu, 17 Aug 2023 12:50:25 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Qualcomm ARM64 fixes for v6.5
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776302
  Lore link: https://lore.kernel.org/r/20230815142042.2459048-1-andersson@kernel.org

Patch: [GIT,PULL] Rockchip dts fixes for 6.5
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776794
  Lore link: https://lore.kernel.org/r/4519945.8hzESeGDPO@phil

Patch: [GIT,PULL] Fixes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776484
  Lore link: https://lore.kernel.org/r/pull-1692158536-457318@atomide.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


