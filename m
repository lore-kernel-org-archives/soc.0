Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506A6E7F12E
	for <soc@archiver.kernel.org>; Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2AA2CC07618; Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 155DCC4166B
	for <soc@kernel.org>; Tue, 26 Sep 2023 21:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695763280;
	bh=Xe+TxkLckcQqkx4yGeYZInsB9xWlSIN5hRBk745nyI4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Ov7WMwN7KuiZD9YfjcnogM/Zzj+tbC+9rQgdxOgN76dEVO5ssQl3M09ET9fmtl69E
	 I9MZfFV8PGitl402hSxvl/hJYyOCVKgmk12kjY4NxrxR1ew4/C0qBIYmo6H876C1NQ
	 UN1rx9dlyfWBJUREWi1Ve5rrDsroJyXqq86PJT2eGKEwTe95fYjGmor9MBY0ALA7o+
	 WZoseHrXAtz12n4AOpAA2zP5sSM4obn/AIzeiPeuxNMqdMrZFAHFSTHdfivteJjTFK
	 nHhAYTyUWjgIfQvmpHJMSQtZqCp3nmxd+1v6BjWM4G7LwefY77Mt/pPoIjGjwUpQNt
	 2ZLUWf+EE3KGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E2B45E29AFF;
	Tue, 26 Sep 2023 21:21:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169576327986.24546.16909228802728081856.git-patchwork-summary@kernel.org>
Date: Tue, 26 Sep 2023 21:21:19 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] TEE fix for v6.6
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=783692
  Lore link: https://lore.kernel.org/r/20230913083909.GA473533@rayden

Patch: [GIT,PULL] ARM: SoC/genpd driver updates for v6.6
  Submitter: Ulf Hansson <ulf.hansson@linaro.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=780340
  Lore link: https://lore.kernel.org/r/20230829213441.310655-1-ulf.hansson@linaro.org

Patch: [GIT,PULL] i.MX fixes for 6.6
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=787651
  Lore link: https://lore.kernel.org/r/20230926123710.GT7231@dragon

Patch: [GIT,PULL] RISC-V Devicetree fixes for v6.6-rc3
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=784924
  Lore link: https://lore.kernel.org/r/20230916-previous-oversold-9d30891ac6cf@spud

Patch: [GIT,PULL] aspeed: Maintainers updates for v6.6
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=787631
  Lore link: https://lore.kernel.org/r/CACPK8Xc+D=YBc2Dhk-6-gOuvKN0xGgZYNop6oJVa=VNgaEYOHw@mail.gmail.com

Patch: [GIT,PULL] Fixes for omaps and ti-sysc
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=787553
  Lore link: https://lore.kernel.org/r/pull-1695715881-95183@atomide.com


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


