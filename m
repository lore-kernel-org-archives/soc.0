Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA592C21CD
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162636; cv=none; b=c60KIO807ItY6+eEzL74eRMeyQ0yoOv9VFByKOmKssWUmJqinl+ezduiIMY3JWyzkzDcqBhvz+1wJs4ZgA+nTqS0Qow3sUNejh8vV2Yty4/d7/tIh8/ahlVq4g9Gf5Okn7vJoYczGHZeUiNi2PAaQjcqnNwZMykKrJ9uqxM3Cxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162636; c=relaxed/simple;
	bh=boZ4uQHGRKqckAKQWJPPMsyA2giDLDSGOb/2URlIL4U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=CDNZe2ic5u0cBByMzrb/9G1FaTLgmKb53F2oapwGReP7FbBbrBFKtw3+o2Mn83yXNk7E1XqYgRGcEvrEviRwyTYTjWHfkQ/oyXjS+yVPzV7mlOrz/3UDcU99FLgPZqjrx0br3dgQosMO8GUXtL3wNwT9xcnxHk013T4PWlRuF/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TO25BNTS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TO25BNTS"
Received: by smtp.kernel.org (Postfix)
	id 6B863C16AAE; Fri, 14 Nov 2025 23:23:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5607FC4CEF5
	for <soc@kernel.org>; Fri, 14 Nov 2025 23:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162636;
	bh=boZ4uQHGRKqckAKQWJPPMsyA2giDLDSGOb/2URlIL4U=;
	h=Subject:From:Date:To:Cc:From;
	b=TO25BNTS07DEmseSmlpsCu9bRFXu2p10PrrvjfPmrzljeSJxmrxrWqtc+/l/X2Guj
	 sHNbi/Y31G3WE7MqyILT2Mprr2FAftAKEocm2j/OOO1GMqvoKOtJJ/AXoCt8NtFHIe
	 xzU9dSkU7BsFtGZ9bl8yhQzD20GdoIXvqst99ofORkHxBlJJHCs8g3hOyuC6xZB4Iu
	 A0hs0nxQWzYc5uKzq1F1xBV9iLpPzPiMiHJEyqqug6Wt3ayIh+NYoLnaHBzd7oCrPF
	 BgIFcXShRfOJS5pkes+dgSqa0OL7asVB+U0dQcwany0FJL0Cd2EpeJsB3LRJC6I+Wk
	 SKwJJHH0kipaw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD473A78A5F;
	Fri, 14 Nov 2025 23:23:25 +0000 (UTC)
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
 <176316260442.1867843.13967734614283925585.git-patchwork-summary@kernel.org>
Date: Fri, 14 Nov 2025 23:23:24 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Broadcom devicetree-arm64 fixes for 6.18 (part 2)
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1020039
  Lore link: https://lore.kernel.org/r/20251105183126.3923882-1-florian.fainelli@broadcom.com

Patch: [GIT,PULL] i.MX fixes for 6.18
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1018580
  Lore link: https://lore.kernel.org/r/aQawyJZbMn52EKk_@dragon

Patch: [GIT,PULL] aspeed: First batch of fixes for 6.18
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1017936
  Lore link: https://lore.kernel.org/r/d79a0c80cdd9e2c45e6a82fd8c78219b6d53f206.camel@codeconstruct.com.au

Series: [GIT,PULL,1/2] Broadcom defconfig-arm64 fixes for 6.18
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1019643
  Lore link: https://lore.kernel.org/r/20251104222811.3874608-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/2] Broadcom defconfig-arm64 fixes for 6.18
             [GIT,PULL,2/2] Broadcom devicetree fixes for 6.18

Patch: [GIT,PULL] TEE fix for v6.18
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1023359
  Lore link: https://lore.kernel.org/r/20251114073627.GA1362600@rayden

Patch: [GIT,PULL] Reset controller fixes for v6.18
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1020018
  Lore link: https://lore.kernel.org/r/20251105171619.3649345-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] memory: fixes: dirvers for v6.18
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1018239
  Lore link: https://lore.kernel.org/r/20251031134910.78436-2-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] arm64: tegra: Device tree fixes for v6.18
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1017876
  Lore link: https://lore.kernel.org/r/20251030192007.682116-1-thierry.reding@gmail.com


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


