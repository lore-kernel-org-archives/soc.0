Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36D0C433EF
	for <soc@archiver.kernel.org>; Thu,  6 Jan 2022 19:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71ADAC36AEF; Thu,  6 Jan 2022 19:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59F46C36AEB
	for <soc@kernel.org>; Thu,  6 Jan 2022 19:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1641498029;
	bh=UuA4DQNvR92+tkCS0nXFEygPBltcWkjoXPv6UhCwY4U=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=HUYzZuCPPeNqHjilLre2WNklortdUN61vkulUDPYOIt2tVFVRXWv+WHFv3xi/8yIC
	 2cdWT5CzSRSz33/hE4jgH1iMKoxcDowcT//c+wj7mQIxGzN+yaLwsCKGKt0fw+tK04
	 7VGa//XVolGlHFMwkGxV6BNgVHDCHUFUbXBWzolWjeNWHGg26yQHPbVBMO3SwxKd02
	 94vq86JLsfb62ScaIG9J7AG1FOK5S7XwtGCvzy+JMll+Kagocmt0WEvgT12t9qyeqV
	 Csuv+2d+mT1dv2jsubOrzv7Qm09xlQw7PjH9kVjoAJK9KFvtNE6iVfMcldkDsqFh5E
	 WlsXeI7zV+Dog==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 31713F79403;
	Thu,  6 Jan 2022 19:40:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164149802909.26637.3419231175859464203.git-patchwork-summary@kernel.org>
Date: Thu, 06 Jan 2022 19:40:29 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] ARM: socfpga: fix for v5.16, part 3
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Olof Johansson <olof@lixom.net>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=601469
  Lore link: https://lore.kernel.org/r/20211227103644.566694-1-dinguyen@kernel.org

Patch: [GIT,PULL] Reset controller fixes for v5.16, part 2
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=602955
  Lore link: https://lore.kernel.org/r/20220105172515.273947-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] ARM: SoC fixes for 5.16, part 4
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=600993
  Lore link: https://lore.kernel.org/r/CAK8P3a34sd5NOxkwZsoE+qeY1MRCS_zO0tmfutmoKGwyvjR7Lw@mail.gmail.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


