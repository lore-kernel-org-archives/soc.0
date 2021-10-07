Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7030CC433EF
	for <soc@archiver.kernel.org>; Thu,  7 Oct 2021 13:20:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 47167611C1; Thu,  7 Oct 2021 13:20:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 30F9860F9D
	for <soc@kernel.org>; Thu,  7 Oct 2021 13:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633612807;
	bh=Yx6HKz13on6u/IxE8cZS4g+4/MRar9GhBURKgwPTMZY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=j5JYfDhP7vSFJjGcxOR6ws1rOgPlg/BLzpDCXkk6X9HN3WOpEZIm2HnhuGcuwNkcx
	 6anwiWaHuUXPUefyeh2elMDWpveEfuxejEZXWDTKE5t1YMRsyO8KJy3u/FyXHZ46fe
	 Est4i0ODSlLY16+35hVTumYTnIYUBuO3cFI6w3fZdQQhy5xzZVZIH4oT6ivrkmhhC2
	 7pft+J0Y+Yf00BGHzyheKaapvxwXhI7RvLZ9OGOsOX7jFhQgmPlJsBcB9hivdxaTSZ
	 16HhQe3ca8T/ghI/vVDEoRbEZrtpMXRc7vCEMN2+8TUiMgziJKop//fNXycXVsYhqt
	 6cZve7m0zo/AQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 25913609DA;
	Thu,  7 Oct 2021 13:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163361280709.8016.9600894243676147636.git-patchwork-summary@kernel.org>
Date: Thu, 07 Oct 2021 13:20:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 5.15, round 2
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=558537
  Lore link: https://lore.kernel.org/r/20211006125734.GA10197@dragon


Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


