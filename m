Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 437C2C433FE
	for <soc@archiver.kernel.org>; Mon, 11 Oct 2021 10:20:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1D9A560F92; Mon, 11 Oct 2021 10:20:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 073DB60F43
	for <soc@kernel.org>; Mon, 11 Oct 2021 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633947655;
	bh=8wOSkSU44n447QkF2OVPfjZsFPP3C3WGrilc3O9GJZc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=qi0mu1WT9yofF0VR8MuMghkeYBRINpYMbUrY3i+02I54yvqbEMkDr+r6tYj0LU8cr
	 Un+ndTbb8NPca4d2lFpjg3yCJqou1P+5mSLGd7cjC9OidaJp07b+2nVckMXD4uVzfy
	 5iUnacjoapMXyn9wC19KKkyh7PSJJDCz0zSLJ3H2MXNgqjqBS9kqLd7saM2qzepGdx
	 qhPOTbyFRUvxR5TK0Z8Z3M7dFemk7Xo0gJS9G+1d9kvD9Ra5FCMuxOdtRSy3em1n6F
	 tNl+W9RaKcif/b80wYWUo0j4mgWJJNH0p9PT3Gmbvq0jgMzvtkLRbgIV5eX/a0QllY
	 j9Aw+s+7M1wtw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F096A600DF;
	Mon, 11 Oct 2021 10:20:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163394765493.9012.13425371563811196103.git-patchwork-summary@kernel.org>
Date: Mon, 11 Oct 2021 10:20:54 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] firmware: arm_ffa: Fixes for v5.15
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=558587
  Lore link: https://lore.kernel.org/r/20211006153231.4061789-1-sudeep.holla@arm.com


Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


