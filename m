Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44414266A8
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688428; cv=none; b=s4gYaI0suRpHHxII/fSUshgU3PAg5xzUINE+Vw4GZlogjfCXEgwpXtPfqqcMcnuXPe5oR/K+JsmLr1fSQvl8+Tf610FP62vu9bJhxoIxlqum4wdrvll5yUH7yTs0U33P+d0JNkuKpWV/PnBscWl1/NULrmVVO0uoUziYqIo92Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688428; c=relaxed/simple;
	bh=nfpJ1UcYa7gn1WQ14Opaasqr4G/a0E79nmMeJbyNp7c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=dNf3kjMZ6QuLUGdwEE5G2VtmBaEpl+PeM6R184feg/sXGvZIyN6hdgKhM9WdyDYHxWsm9mYFGX1WONtAAGHdYX2gZpIlo11SGY/l63AtWMJfVdD4nqu1bI2CYL70hipNkXlVHfBQQ5IasVp1zI6jJSsjd6B2L1iyvEM47XGN6Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3x2xlfR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3x2xlfR"
Received: by smtp.kernel.org (Postfix)
	id 6CF2A1F00A3D; Fri, 10 Jul 2026 13:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56F6E1F00A3A
	for <soc@kernel.org>; Fri, 10 Jul 2026 13:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783688427;
	bh=ouOS8NeCgJACAhxYRfihOemNeEgRpGSaNgpjxcYNOyo=;
	h=Subject:From:Date:To:Cc;
	b=h3x2xlfRUK87s2C2SF6fT06+BaWl3SJkfOq1kKaStZTRjAWXgQSejbUbDaHDJrc8S
	 5mCNDhrWAAEaOxSz5mma3Ht1NjJedbalhL3TA7Oh8OY7z1M6GyhPnl7a4nlm1Whjhm
	 cHHKiB6zkyGK2/Jf7KNxqrPrTdgKIpgErGt5593FOM6gHZ7n5h0+m+TOSWMd/nrhY6
	 AL9CSeE2NcrY/NAo7YQn3m2OLv6r/JZhNn01bUpDtkSwIWY9/D+j+ZTLIotoJg0HHH
	 U/Va8NB1M56aCm/K1FOVHcojt8zjPzCs5q/Yt8l1zORWChU4At37G2Gf29Ke1xwyjO
	 tTciKALGCumlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 6B30D3924F93;
	Fri, 10 Jul 2026 13:00:06 +0000 (UTC)
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
 <178368840520.229479.2508080322501345420.git-patchwork-summary@kernel.org>
Date: Fri, 10 Jul 2026 13:00:05 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: [GIT,PULL,1/3] soc/tegra: pmc: Fixes for v7.2
  Submitter: Thierry Reding <thierry.reding@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1121217
  Lore link: https://lore.kernel.org/r/20260703144042.1190046-1-thierry.reding@kernel.org
    Patches: [GIT,PULL,1/3] soc/tegra: pmc: Fixes for v7.2
             [GIT,PULL,2/3] soc/tegra: Fixes for v7.2
             [GIT,PULL,3/3] arm64: tegra: Device tree fixes for v7.2

Patch: ARM: Don't let ARMv5 platforms select USE_OF
  Submitter: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1121730
  Lore link: https://lore.kernel.org/r/20260705085000.3510576-2-u.kleine-koenig@baylibre.com

Patch: [GIT,PULL] TEE update for v7.2
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1114768
  Lore link: https://lore.kernel.org/r/20260622133513.GA2789405@rayden

Patch: MAINTAINERS: Update SpacemiT SoC git tree repository
  Submitter: Yixun Lan <dlan@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1123056
  Lore link: https://lore.kernel.org/r/20260707-07-spacemit-git-repo-url-v1-1-137697316a4c@kernel.org

Patch: [GIT,PULL] Reset controller fixes for v7.2
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1120582
  Lore link: https://lore.kernel.org/r/20260702154659.1993315-1-p.zabel@pengutronix.de


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


