Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94EA43CE73
	for <soc@lists.linux.dev>; Mon, 12 Oct 2026 08:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794406; cv=none; b=jp5CQO3nZwRK8eeXKy+I/tax0DjGOcLN48XIxnlY6qdfCH/cVQ3nLCe8FWjrWwdXwCZnGygknnm99AX86/ckztmwaNS6uPMeEFN2OB1rNEPuYkq8a35Rm/ss675Do9Zc5KagiWRF+7EVggE07jpGaARTHiq1UGe2JusJ3wPJH0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794406; c=relaxed/simple;
	bh=9KN4ZkfSEbP4Mw+zEhq2dhy83by152+HnYL1NB2DQGg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=caHB2OJwl67IQpotqxPc/mtrCs5WoySNUPfdstzcAh20+ycL+BqXR8D+UwB2czbg4YER4o2+ZuCi/3dHPfnxdrp2Y8DaWHnp1KzagMHycMCOTU6vftkhu4FdTnoexQDMCQ62h8Cx1jGqDuMe3wX7KSqPtOXiuwY9iNDsDWKOjDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Py/5rMwE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Py/5rMwE"
Received: by smtp.kernel.org (Postfix)
	id 602421F0089D; Mon, 12 Oct 2026 08:40:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A4DD1F0089C
	for <soc@kernel.org>; Mon, 12 Oct 2026 08:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791794405;
	bh=vZ1Fm8L6X+3FHOuFPWok4/VcebxAmT1u9KfPBqPAMPI=;
	h=Subject:From:Date:To:Cc;
	b=Py/5rMwE9EtKey3sZUEjMe6UgVC79F1wTHZqALhIKZ047ZCA9SBb4jB8bexcPsC8n
	 q1ot9EnJsepMi35nrolRgYUc9B98qj5HcGV4j795rbdZxpqTgL5Mc/5LlHj8DAQN/W
	 WvxGfwbTn9o2lHRtHY50wT9wSd/mw/btlEEPMIEZzYF96kl6VAaGBHTyz8JQ3bdTUk
	 s0oLwplo24BCBMJQ6T+myFv2BWs18bs+5e8vO2s5FOsTumy4HpdA4OiZdwqZgVNsE6
	 dAHHVQJvXufXITy5eYAz3Q6LQrgeZJo2LrDyV9KQ3IwVKaYPSbdrNjIkWdWsyKgj/i
	 wLDLIDfQ+A4CA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 21E943811A4C;
	Mon, 12 Oct 2026 08:40:05 +0000 (UTC)
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
 <179179440377.3278488.4231275694205187761.git-patchwork-summary@kernel.org>
Date: Mon, 12 Oct 2026 08:40:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] ARM: dts: OMAP fixes for v7.3-rc
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1175469/
  Lore link: https://lore.kernel.org/r/7hecedb7mv.fsf@baylibre.com

Patch: [GIT,PULL] Microchip AT91 fixes for v7.3
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1182111/
  Lore link: https://lore.kernel.org/r/20261009061034.29475-1-claudiu.beznea@tuxon.dev

Series: [GIT,PULL,1/2] soc/tegra: Fixes for v7.3
  Submitter: Thierry Reding <thierry.reding@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1178808/
  Lore link: https://lore.kernel.org/r/20261003095505.1369507-1-thierry.reding@kernel.org
    Patches: [GIT,PULL,1/2] soc/tegra: Fixes for v7.3
             [GIT,PULL,2/2] arm64: tegra: Device tree fixes for v7.3


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


