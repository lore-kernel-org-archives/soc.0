Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12436C433F5
	for <soc@archiver.kernel.org>; Fri, 15 Oct 2021 20:10:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B336D60F48; Fri, 15 Oct 2021 20:10:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9B2ED60EE2
	for <soc@kernel.org>; Fri, 15 Oct 2021 20:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634328606;
	bh=igK2eKgsty0K147kVf++iv//+sllMht2RbELHN+i+GA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=uNxzZGlbtDhOlTztpe613ICyqG7deUW2A/QovI0zONu+4wNZOMReuKzU75pEkWI2o
	 Xg9a1/aT2/vsfSGFS1ygT+bsw3Ygd7Y1gVe+WH21av8Y95iMXhKmTgsvV6GnY+gx1f
	 N62fQUOtP21fzqN+HRJ4582Ot79yV9g7T0Q/D8HPeIBJnmwC5dP6HpHds4SweJFVQ+
	 iXrIQynWlqcytzBSBcJpJz6V0CHqPrOpOrjrfwiMlGHlhwSEj+TSkPajwd2zCKPrG5
	 vbW45dVhbXke6vvNpQ2wxlJWU1J7fKq8HDb1ni+ZeLrFKhAPsFCHr/GJKDLCdX8/EP
	 uvANba5mETgmw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7A7B360A44;
	Fri, 15 Oct 2021 20:10:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163432860644.16882.15379073449352674890.git-patchwork-summary@kernel.org>
Date: Fri, 15 Oct 2021 20:10:06 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 5.15, round 3
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=563941
  Lore link: https://lore.kernel.org/r/20211015070017.GI22881@dragon


Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


