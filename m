Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CE12F1FE3
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 20:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758660008; cv=none; b=jgURdpuJ1v40iRfY/JFLmMg3Zssme6yuac+xd13EdDpU4y49vEWy9W5dhtk0V8ZzdiOGXlU+SNCaXJfoDAh9QRSr4IHhW+vQpLaLkn+ONN2p7humih8Beeo8dW4Z3Utdr2+Sh5lnziAzeJBtgBvEMpZhaM7tVr7eQbMoJvS2VjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758660008; c=relaxed/simple;
	bh=SxzWQB0rnKNEMGRRhhKBXbYDh+hZrC1PWTX7xoQZpwI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=ZPnRVi1nYjsSqWlZD9ls4fnBL3cK9mS0lpp+gHNTFqZjG4SLJyWMgItfKZVDqYng+lurwCFIzqmqgkdWDHW/UEtYzQf2MUS2+exAVC1zKa6T2yLycOOK7OEza/TPvBQ6RYrNwmC1dv1PSMXJ2VECKBql4w37LHWu1kkIO8VNoQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EaLn6Fx5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EaLn6Fx5"
Received: by smtp.kernel.org (Postfix)
	id B12FEC4CEF7; Tue, 23 Sep 2025 20:40:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A75CC4CEF5
	for <soc@kernel.org>; Tue, 23 Sep 2025 20:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758660007;
	bh=SxzWQB0rnKNEMGRRhhKBXbYDh+hZrC1PWTX7xoQZpwI=;
	h=Subject:From:Date:To:Cc:From;
	b=EaLn6Fx5y4WcnpilWteoFIVXYYggmssFsZr72hdfxxHQSV1LYOlu3HzzlLonHdQTt
	 YOIzy/4I0kDXec+FYP0YfDGKHlBg8W+lbsoaR2TszPzAjnlRCx32FblUlaQdKLx4xa
	 Vy1lzVGHS/V0dgCFWxXt80TGyRC6fsBEDSuPZS8dQkretgeXp0lXgHX1ddwm2/B483
	 veeQmpnLtcWh38Ak9VxbWYPS3nxNqg4lvxyfvDbnkGmt931B+gjAeenHWfjHzy2eAv
	 U7SlJ/HZKq1AVdAfCFRe4AhwPWbQF2U1u0hIW+eA1GmJbL1vnyKiTmGo4BnwxLOgrE
	 IvSBJFKZf6AHA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B18D939D0C20;
	Tue, 23 Sep 2025 20:40:05 +0000 (UTC)
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
 <175866000431.1916197.7059500820370584662.git-patchwork-summary@kernel.org>
Date: Tue, 23 Sep 2025 20:40:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] firmware: tegra: Fixes for v6.17
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004155
  Lore link: https://lore.kernel.org/r/20250919093034.2747884-1-thierry.reding@gmail.com

Patch: [GIT,PULL] Rockchip dts fixes for 6.17 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1004033
  Lore link: https://lore.kernel.org/r/21709561.0c2gjJ1VT2@diego

Patch: [GIT,PULL] Apple SoC fixes for v6.17
  Submitter: Sven Peter <sven@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1003982
  Lore link: https://lore.kernel.org/r/20250918192241.29374-1-sven@kernel.org

Patch: [GIT,PULL] Allwinner fixes changes for 6.17
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1003477
  Lore link: https://lore.kernel.org/r/aMrsUfkTWx8g3bJ7@wens.tw


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


