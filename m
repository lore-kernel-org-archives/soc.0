Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1348C678D8
	for <soc@archiver.kernel.org>; Mon, 16 Jan 2023 10:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BFD43C43392; Mon, 16 Jan 2023 10:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5B87C433EF
	for <soc@kernel.org>; Mon, 16 Jan 2023 10:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673864419;
	bh=mQoPt3kyNQ3RPZe41fJVnkxkY3ZX+9b6Sr/os6oIP5w=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=qWFmzDDMSq6xvYmQqAEfnPP6IydvxfB7Q8xgtFSCfRCH+wL7LW3SvQPsYAhj83RDM
	 lSIAheNGCzYZL4TrQFF+as0hOE/oSlZQZ9zxDKyl9u9Fl6sYyGzGJN4HQE/L1W0IAK
	 BcePkSVrra+SIq96xNJ1Nc+uMXRWtrU86vbm53vskqka8PYbGko4cdZhrnAQMvcM/o
	 48ErfmQ6GrbDhbc8lNETX4iBbwZtLluQ1+oC+IPHSSDoP5/dhB+p9554eo5CU7f43a
	 P55w9pkNSX+5/oerT0N57rts5ArbYfnQrDNb99oRAA9o/TfFPuVCoZqjDVSpnOIpbT
	 sfoE9QNvJCF3w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8B480E54D27;
	Mon, 16 Jan 2023 10:20:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167386441956.5760.2955696902554960856.git-patchwork-summary@kernel.org>
Date: Mon, 16 Jan 2023 10:20:19 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V DT for v6.2-rc4
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=711125
  Lore link: https://lore.kernel.org/r/Y78rn+0fVNOxHLKt@spud

Patch: [GIT,PULL] ARM: mvebu: fixes for v6.2 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=711730
  Lore link: https://lore.kernel.org/r/87mt6mg08k.fsf@BL-laptop


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


