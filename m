Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F58C433EF
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 22:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7B3D7C340F5; Mon,  7 Mar 2022 22:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61201C340EF
	for <soc@kernel.org>; Mon,  7 Mar 2022 22:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646693410;
	bh=ZbvwBIqNs6xaq9b7H0fTgA6u8BG9tac/iTeKeTUrk8k=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=KMHN1fX2EfizqSfgh3KcEel/Jp0JD8qSgomOWLhKU1AkXHKqKd+ZPgYYxBy4GDhcP
	 5M64JxFp2YXsqkRPsNxXwgO/T3CBN0t00mPFPUHpM82PywpjWll5AMeHNjUbTsjqEK
	 HjQ0IkCSoe4Id+83YnfiG8AB13w8uvsHNKOpI5pJ3BCeXRDLHW3JN9bVYZG29jz3tJ
	 /wB4Dog8zAlJtCJnX7ObeVk55dzTiKZQTxEjTqvk9+APmAcgVBUvgJNHbX0nV6yFg6
	 S/hznm4jKd5NMjgCQGjyXsTyoVH5RkMx5lmIiivtAhaACx8uhwN3JHgVaJFcCS7Aq/
	 6y2wcXHzs4uXg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3273CEAC081;
	Mon,  7 Mar 2022 22:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164669341015.30729.17338485457380476230.git-patchwork-summary@kernel.org>
Date: Mon, 07 Mar 2022 22:50:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] arm64: tegra: Device tree fixes for v5.17
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=621133
  Lore link: https://lore.kernel.org/r/20220307182120.2169598-1-thierry.reding@gmail.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


