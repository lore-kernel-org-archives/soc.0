Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940ABC4332F
	for <soc@archiver.kernel.org>; Thu, 16 Dec 2021 14:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5E857C36AE8; Thu, 16 Dec 2021 14:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 475F8C36AE5
	for <soc@kernel.org>; Thu, 16 Dec 2021 14:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639664410;
	bh=rPC+dtrG4v61PxP+zO+218IZVOqqUWmJlRBMMnwlgPA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=IH8/gaprYtlec3Xw9NKkIVrZLeoiJXcCfHk6wD+1tq4WSYbB83KNezjSbsodqKoyp
	 f/78BDZP9BE2ViqWvWH8zM2GbPYiPI6lmk+9RFLq96/LHQxGJ5GEUel0Ya3pEYkJAz
	 /4gQ5VMI4JIJVKNMKFxnBcJZkSaoG/SUbPf5jbkBJK2kYTfckLo40Gvuqdo3EDATIV
	 UBEG8wK2UBdMz4snVC2cdDLq/IbQnmowvoy2MZjyAB5SkNQ/rEBWsXRmDj/KrObZio
	 upULIFggPaWjcSSxM5lbthSQyg01eAcM6RsjtoKg+ZMwp5XZvKFGU/Ssu7lxhuqX1P
	 WwuzzkNC0OAVw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 36FAA609FE;
	Thu, 16 Dec 2021 14:20:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163966441022.28413.17413932118044697532.git-patchwork-summary@kernel.org>
Date: Thu, 16 Dec 2021 14:20:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: dts: socfpga: dts updates for v5.17
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=596103
  Lore link: https://lore.kernel.org/r/20211215164545.300273-1-dinguyen@kernel.org

Patch: [GIT,PULL] Devicetree changes for omaps for v5.17
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=596653
  Lore link: https://lore.kernel.org/r/pull-1639659798-679261@atomide.com

Patch: [GIT,PULL] soc/tegra: Fixes for v5.16-rc6
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=596091
  Lore link: https://lore.kernel.org/r/20211215162618.3568474-1-thierry.reding@gmail.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


