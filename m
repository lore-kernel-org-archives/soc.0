Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5680FC433EF
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 21:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1970CC34116; Fri, 13 May 2022 21:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00F95C34100
	for <soc@kernel.org>; Fri, 13 May 2022 21:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652478019;
	bh=TvjHD7v+H6PkR8qyT63GuQ34bP6/i9ySlqKX8R11QyI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ZcWXm9VeFMiI7zgUzKwFKvTh3nxAodOyEVN+hxc35bicEDrso7mSRE1wJcq27RZ6w
	 iVzaZm2YfuNHsVvw/TS7KvydVVSmD7HZj5ZqQXAwP3HGVUVz49lOsQYq8EFM/Z56cF
	 gxFvGPCpXNFdX0G+qwRzh4AZ4atRrBbsC4eAEj3efzRKve0koXklPUccPIzuPEDKp/
	 Ay+cWMxNviX9LTEjeV0IncWbHgTkqPpyy8bqzWKIYn31i/b0UEEv4Xd1d/hBOfCiQU
	 rQUmwNj1+FwOkS/bjrAofTbn0zFwViRKEvQMtC2104IAs3tByQ0mbW46g3V6OoIrbC
	 eYSb6ouSTkNhw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D6445E8DBDA;
	Fri, 13 May 2022 21:40:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165247801886.11200.17278994854964529281.git-patchwork-summary@kernel.org>
Date: Fri, 13 May 2022 21:40:18 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: mvebu: dt for v5.19 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=641403
  Lore link: https://lore.kernel.org/r/87lev5r2rg.fsf@BL-laptop

Patch: [GIT,PULL] ARM: at91: dt for 5.19
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=641485
  Lore link: https://lore.kernel.org/r/20220513162338.87717-1-nicolas.ferre@microchip.com

Patch: [GIT,PULL] ARM: mvebu: dt64 for v5.19 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=641401
  Lore link: https://lore.kernel.org/r/87r14xr2xc.fsf@BL-laptop


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


