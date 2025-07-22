Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF2C27EFFA
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 21:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753218601; cv=none; b=UjaG+3V3uQC4TSkt7JmOb0QxjeLnDvoLMU7/QxF2aMcmjLHuQ16TWNCfLSwleDSuytLgHacHu0PsetgWNn8vtQgZpKkKmQ4VVIBHQ4fWB1euUJ/BYt99AhHw5jcTdYKLCL0FO0Sjc/OUWGc2NHHVi/wIexw9UE+zN4eqvtbJjBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753218601; c=relaxed/simple;
	bh=R8TAaTO5RpWk3XrMzMp+P4xWqS0K085fCNZJEel07QM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=IrnH8gIjDIqkm6J3Xa/p1wDGKU/ahEn7mJBy3UiSJgYeZ9gSa2amb1kU11RN/YRjuHrXgYJfogCd+sa8EQ2K1SI3lnhLCieywN2EpCwu1NbbaYUQ911rh1Fgb1l5weFm55+Ajn+Zj/OPX6aBjhZ19JmGTjXuRtW1hYxIWew7BE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BFXBwuAd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BFXBwuAd"
Received: by smtp.kernel.org (Postfix)
	id 9365CC4CEF4; Tue, 22 Jul 2025 21:09:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A37AC4CEF7
	for <soc@kernel.org>; Tue, 22 Jul 2025 21:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753218599;
	bh=R8TAaTO5RpWk3XrMzMp+P4xWqS0K085fCNZJEel07QM=;
	h=Subject:From:Date:To:Cc:From;
	b=BFXBwuAdNi1J7aD+Ea8hoqWoPFB/Lkc+qZUJxIvE5SqJhf7MA9TIIaiRQGL0Uv7xo
	 sXxh1ONqKkPFg6jXjZUh72hcnTL7qBPPC8rVgAz9jZWFSKGCOf7STbl7ez1Fo3JPD+
	 wPOlrDbhXkGoQKaktBvFMx1hf6Be6+MWf0Vy7OLXymq2+ss/b4UeW1hXgyKVABW86/
	 9memGwKHiNEa6B6SX+mtWlT4KSbDvfH98+/ZW3yuzkcUHYj36jT+EMeN2RNlThomcB
	 c3QBLLPsZYH0rLL3IwbJsWsDGE0SbPaDO4HQy7eWsKzN1dT9ooMTxlZyVsDVCZYqvo
	 pbxcD40iMepng==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0AEA6383BF5D;
	Tue, 22 Jul 2025 21:10:19 +0000 (UTC)
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
 <175321861782.955963.130388556839384579.git-patchwork-summary@kernel.org>
Date: Tue, 22 Jul 2025 21:10:17 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.17
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=984052
  Lore link: https://lore.kernel.org/r/20250720031134.286063-1-andersson@kernel.org

Patch: [GIT,PULL] Microchip AT91 defconfig updates for v6.17
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=984270
  Lore link: https://lore.kernel.org/r/20250721100904.568575-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] More Qualcomm driver updates for v6.17
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=984047
  Lore link: https://lore.kernel.org/r/20250720030743.285440-1-andersson@kernel.org

Patch: ARM: dts: st: spear: Use generic "ethernet" as node name
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=983388
  Lore link: https://lore.kernel.org/r/20250717142245.92492-2-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] hisilicon: driver updates for v6.17
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=983650
  Lore link: https://lore.kernel.org/r/6879FFED.1050002@hisilicon.com

Patch: [GIT,PULL] Microchip AT91 DT updates for v6.17
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=984271
  Lore link: https://lore.kernel.org/r/20250721100904.568575-2-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] memory: drivers for v6.17
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=982454
  Lore link: https://lore.kernel.org/r/20250715095315.59299-2-krzysztof.kozlowski@linaro.org


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


