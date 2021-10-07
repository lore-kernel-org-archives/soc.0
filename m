Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56A5C433F5
	for <soc@archiver.kernel.org>; Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9312461212; Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7CCD66120D
	for <soc@kernel.org>; Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633640419;
	bh=E8X2YgkQ9VBMP4gtfiqgUjSh1nVhDOoUDUdMMpAn2n0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=fVAXcbHS5rikk0Nhj5iRoWN/OK0MC8Vd552QlSUAYqF5WmN91IPoVhdGKYoah2Dov
	 /D/Agyir9GBRsAreK/HrGapGyNkgd9uL1L+NN09aTxvuG/O7MHE4/fflf9BL/5kLX1
	 XJalg7KYjpdDAzcoiKueGjVsdHNx3Z9ZgHaglioXW972kXXlcPKja6HV5FfZutI6va
	 X2wvwozrW9tdz0sYQmt8rVxA4ptQ4m70XyoDoDEkDvmIjje7DI8lJP70L92ZIM0mt1
	 crqPDZWBikSwgO8gvNxZcMSX/gJB4Wi+s33t6c/HL2PtLIYnL8VBNlDjUahzN51FQC
	 8U2axVwozrGGw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6E68C60971;
	Thu,  7 Oct 2021 21:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163364041938.28878.9911554088843137003.git-patchwork-summary@kernel.org>
Date: Thu, 07 Oct 2021 21:00:19 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v5.15
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=559015
  Lore link: https://lore.kernel.org/r/20211007102822.27886-1-sudeep.holla@arm.com

Patch: [GIT,PULL] Apple SoC fixes for 5.15
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=559299
  Lore link: https://lore.kernel.org/r/a50a9015-0e62-c451-4d0d-668233b35b85@marcan.st

Patch: [GIT,PULL] Fix for omaps for v5.15-rc cycle
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=559099
  Lore link: https://lore.kernel.org/r/pull-1633609552-789682@atomide.com


Total patches: 3

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


