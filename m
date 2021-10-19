Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59045C433FE
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 19:20:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 31BC96138D; Tue, 19 Oct 2021 19:20:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1B5216137D
	for <soc@kernel.org>; Tue, 19 Oct 2021 19:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634671232;
	bh=t+PSBMv0B6VQqH0X0nm+hAxAfa6DEPcHsHQRLFXLt54=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=DXidicAckXVds+JFkDBiPxB1AGh/YTdCRWZl2k7gzJYx+ZFAxAhyXeR7D6xGhOg8d
	 VmkJYFk9P770c6FWMldPTWAUelGV9z0FEHAdRhqXlySGXOyyI6Ed/mHlG4CHeZ/5Yy
	 we+arQQazSP3sbyB5BTrZ54IkvUBEKDFoVagMGjiBINlaT86M2sYyQzeATShXqaf+G
	 DXmrcuWfD1O2K/Z85NlkPCJPXY9V+/bkORRHAe2cwxL0Oh+VGCsFmcl4jDRy5kp7Bv
	 QoSDVuxBPXuxyWgzgycsPAcKJr1g/NVE05qJYAvOP7wON7DWGjcZ9T1x9/YirgctMT
	 WjqtRrx13A/Lw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 071C3609D7;
	Tue, 19 Oct 2021 19:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163467123197.14172.5308649829054704514.git-patchwork-summary@kernel.org>
Date: Tue, 19 Oct 2021 19:20:31 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] ARM: SoC fixes for 5.15, part 2
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=564521
  Lore link: https://lore.kernel.org/r/CAK8P3a17ccHJKteXL6Q+LxVR8m1BbedvNiVsmn_tQh6vj=bHmg@mail.gmail.com


Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


