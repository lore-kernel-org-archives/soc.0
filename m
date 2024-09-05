Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D08CE7A91
	for <soc@archiver.kernel.org>; Thu,  5 Sep 2024 20:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EBCB0C4CEC7; Thu,  5 Sep 2024 20:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D687FC4CEC3
	for <soc@kernel.org>; Thu,  5 Sep 2024 20:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725566435;
	bh=TKJZyWX6QmdjetaH+L1Mkg7yIiN8BmuU8eu6GkFsQyo=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=VTOXXCDtkzh4bEA6nvPmhygLwsqz6dlmxYbNLDAKYSwY3EUz4F1PpSWYyZqPv8Gug
	 Dg2aLpE+UHjkZ69GlFORtEUV6mJL1tYlk88vP8RpyJDE7rpzpUWDvIHb/8mUYvZzFp
	 RKrAt+LYI8jiVA7vXMYRsnOrBYHhDrnNKkTptrbKVsCc93qpif2AZm+tM0tuQD+76W
	 5c4Dcbr545FYLIFdeZOHpzTJQY1CcT+Lr1yPUqnxireka8bBSIGdcImROCjVRK87Ac
	 +A5wQXiJ9bP9DdespyZDSzDw90yuNx8jsytI/5zi+WQRnk5RCTkQdY71HxGWhFgxcY
	 7mUEYIrxWXpww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0673806651;
	Thu,  5 Sep 2024 20:00:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172556643655.1812101.16797300875885322184.git-patchwork-summary@kernel.org>
Date: Thu, 05 Sep 2024 20:00:36 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Allwinner SoC driver changes for 6.12
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=887331
  Lore link: https://lore.kernel.org/r/ZtnYUswjHdLRYq8Y@wens.tw

Patch: [GIT,PULL] Allwinner SoC device tree changes for 6.12
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=887332
  Lore link: https://lore.kernel.org/r/ZtnZRhTwsBeO7Qtb@wens.tw


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


