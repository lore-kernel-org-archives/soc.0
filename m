Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EECCCA47F
	for <soc@archiver.kernel.org>; Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A7B4DC385A2; Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 91E5DC341D3
	for <soc@kernel.org>; Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658239815;
	bh=Dzi6wvkLrv5EcBlylW7DiwHBZs9kfDepokd339f84YI=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=S3Rf/rtwn6JOwmn6u9Fscsggm498ToHnc7SVkXDBsatwFYcJsubWmY4NKtqh6wShf
	 0p4C97Fxc57OpUpJVinyf59515c8YsePLs3x+4edwhrZI8b1mx7InE63WCUAn53DXN
	 JE5/QqZMu63oxQXizFNo17qqKhmHDU+2Qs5P2YuCPudGVY5Po4TmWc7++/ey/x+PKa
	 QpYXAcIsJlRgdexWb/jHNtmi133c0juqajbjZT8CVwLA6rVW8PfbcBXALzjCNOKt4M
	 9yV+Kn7QUR77v4+Vmu532xCRQLZW8gDcZrNH/9+ZOjxi5bLm7d8LeJVV0CfwCSWvjk
	 NqX6HoKDjwviA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6102AE451B0;
	Tue, 19 Jul 2022 14:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165823981534.7750.5285660171710921346.git-patchwork-summary@kernel.org>
Date: Tue, 19 Jul 2022 14:10:15 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: mvebu: dt64 for v5.20 (#1) (replacing previous one)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=661089
  Lore link: https://lore.kernel.org/r/87cze1qlg3.fsf@BL-laptop

Patch: [GIT,PULL] ARM: mvebu: arm for v5.20 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=661067
  Lore link: https://lore.kernel.org/r/87ilntqn0v.fsf@BL-laptop

Patch: soc: fujitsu: Add A64FX diagnostic interrupt driver
  Submitter: hasegawa-hitomi@fujitsu.com <hasegawa-hitomi@fujitsu.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=643486
  Lore link: https://lore.kernel.org/r/20220520074119.3574753-1-hasegawa-hitomi@fujitsu.com

Patch: [GIT,PULL] ARM: mvebu: dt for v5.20 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=661066
  Lore link: https://lore.kernel.org/r/87lespqn28.fsf@BL-laptop


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


