Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DFF225762
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 21:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758949; cv=none; b=L9nernPTIxOJLyACmWNzmK9hnO15Wbf+3us51HiheFsooO30X3HsRYLgzPsUeEHtMeNuW+dW+tHBeJ78bcDHZD9ABhJoWAyrAhqRcHJ8hD3BhJ4yX2pOpYorsdd2LDkIhAv5OuqZA4DLb4bNsfa4Ac8VzRYb+C1fihu0IooJfIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758949; c=relaxed/simple;
	bh=YHCB1hjFrnw8fsklWvm/kSMPZA31mCaYvh8W6MjjoTQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=qz13PosOD+XhfBcp90I0FSai2h3P4R4Ouq2ZT7+HwPytupDY0N/GESYXj0IUWhfhDqyF2gZbDXrprJ/RsBcKDXiJpIbCpTblg91OffL2Sx54Rz0JZg3ZSGrfdfxOqu/WbJgjqy2IZHHCIZ3VFB0y9Mu7zmw5jmL0bosnBrZbRDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2vFAIBW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2vFAIBW"
Received: by smtp.kernel.org (Postfix)
	id 031F3C116C6; Fri, 21 Nov 2025 21:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11D6C4CEF1
	for <soc@kernel.org>; Fri, 21 Nov 2025 21:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758948;
	bh=YHCB1hjFrnw8fsklWvm/kSMPZA31mCaYvh8W6MjjoTQ=;
	h=Subject:From:Date:To:Cc:From;
	b=b2vFAIBWU5X9S3RyRxP5l0NwFCEBXSvsvDW/UR/cq85gS2ycE+jLh0kJt6v9lQLa6
	 39JH7OHzLf0iXYFQiS39pnlEEg+kRDkO+TCw/5TR1Uqx/ha4B1RJ5hZ/wjd6derF26
	 tVWGPvEV41r6GjXfTFoqeJEaliXUuKdQg9RGTczK2Kk0yEbZLzOmeb6XhvARbrBTpZ
	 LQ/CyNSjbcH/ekLMpLCrXfDkEYCczIUcn9SUmVaf0YqpP1JZNbQdP/sgtnpSchNTDL
	 9FWNo12WvyK2vB/d+VMjhmGxwBZn3USQP6sfn+2jv519rsG9NDIZoWjpejZOQXPwna
	 vRIoED7Lzh8Bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE21F3A78A69;
	Fri, 21 Nov 2025 21:01:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375891326.2583629.11718139139661811469.git-patchwork-summary@kernel.org>
Date: Fri, 21 Nov 2025 21:01:53 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] i.MX fixes for 6.18, 2nd round
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1023978
  Lore link: https://lore.kernel.org/r/aRnQK0kiLvQZ9X-f@dragon

Patch: [GIT,PULL] QCOMTEE fixes2 for v6.18
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024179
  Lore link: https://lore.kernel.org/r/20251117094712.GA1518418@rayden

Series: [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1021971
  Lore link: https://lore.kernel.org/r/20251111095542.13958-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19

Patch: ARM: versatile: Fix typo in versatile.c
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1015228
  Lore link: https://lore.kernel.org/r/20251023223258.3181274-1-linus.walleij@linaro.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


