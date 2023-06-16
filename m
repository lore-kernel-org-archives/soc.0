Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43A3EEB64DA
	for <soc@archiver.kernel.org>; Fri, 16 Jun 2023 21:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 11DFEC433CA; Fri, 16 Jun 2023 21:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB6D5C433C9
	for <soc@kernel.org>; Fri, 16 Jun 2023 21:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686950470;
	bh=mxLeFKV0kAlCkRPs3uRL6yHNgypXgv7vd5ZV5j8D7hU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=E18Yke6SFJhXs3iYormcVAoDUMZG36dtDFOeohvtd+qxN7HjC3pQDwdkKccahQesP
	 fHBtwAcb2rmMyItVutV6n/1ztu7lm3oLkzOcn7K2OQHikkWjqq0yI5Yw4CsN95x7mB
	 DSJ1C4wUNeK9AIOKDDCVUpi0U/efDmBvHpbeREB0hHoaF5fejypdeB9MSFk8lMR+iR
	 Guec07NiVIuNxrcagesRv9qprAhfBSh9MejS5dJAcYpic9pqrVGNVMvRn+iBfhafuq
	 Jqo80VA6WuoUcKvYBWtDyB9oDqFjrunn9+vYG3jo7rF/7d+THkV9zJr8YIuZJzHBg4
	 FdOAwEwlUtZRw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B8931C395E0;
	Fri, 16 Jun 2023 21:21:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168695046969.18495.11473476951797877588.git-patchwork-summary@kernel.org>
Date: Fri, 16 Jun 2023 21:21:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Rockchip dts fixes for 6.4
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=756099
  Lore link: https://lore.kernel.org/r/2885657.e9J7NaK4W3@phil


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


