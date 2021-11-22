Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD648C433FE
	for <soc@archiver.kernel.org>; Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7C93460FD7; Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6636E60F5B
	for <soc@kernel.org>; Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637579312;
	bh=ySEvbVv+MvDlGav3lSw/tjDA4V8M/1/HRGQreGSZeKY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=WHS6MXMzZJDpkew1qTA9RKNPT3zrWwjKyBqlac+SOKuk12vnVLjP0o7H1s1anM7ga
	 To/b5uHZMjfVo/uB6KD37aVZdvIgJy4ADbVK09y2QA4TghfrBHlOENP9TxPQ98pV7+
	 Gvl4NtCav2VWCIUuGIZfSoen9Gej6hXlcuRkDfu5Z7bsBf2nWrQfYgdWqacjKVl+MW
	 OaiMtXYrZi9wEQci3RxN2hjr3/B0QNzJ7Fx0fAwXbYZpodKO24kMyDAa67/u3XAl1n
	 /F84RcPw3PTqzYtFBtl+88hr8Dasd7jZ8dxpSSYu8tHkGc86aH4+YBbxvWeRuDC0wh
	 cbo2g+sG2FSkA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5677D609B9;
	Mon, 22 Nov 2021 11:08:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163757931229.7615.16071557384795589535.git-patchwork-summary@kernel.org>
Date: Mon, 22 Nov 2021 11:08:32 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] OP-TEE fix for v5.16
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=581643
  Lore link: https://lore.kernel.org/r/20211117125747.GA2896197@jade

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v5.16
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=582305
  Lore link: https://lore.kernel.org/r/20211118121656.4014764-1-sudeep.holla@arm.com

Patch: [GIT,PULL,1/1] Broadcom devicetree fixes for 5.16
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=581205
  Lore link: https://lore.kernel.org/r/20211116201429.2692786-1-f.fainelli@gmail.com

Patch: [GIT,PULL] ARM: socfpga: fix for v5.16
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=583093
  Lore link: https://lore.kernel.org/r/20211119153224.2761257-1-dinguyen@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


