Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017623;
	b=e4td3z9JFuaKdBP0aAqqXp9lG23jjLHWiqU2FxsGWPTBinMRQIY+oLCTn/eIoI+gmXFR
	 0LgDmDj0xP6RhwoglbVcbluWRQxr+2SEoRXjWM5mzBnZUrS/+bANqFX4pxU64Fzd8iQ1A
	 agS6XtHGGf/CSwt1oteVN09ylsooaTYZyhDdzc2/zlCJxAkf9gBkRAHAkRW2d1Qm+uirb
	 5I4JJMNQ7enhBFtauJyGOMTfMEhAlNwgQTgZvujWo53Zeb8bI6YsWOXx2/y3vklFK81D2
	 xcYBvfmUyLCgdXvAd4s18MzkaraLtnErBXJiCst9eCwAy25KtblleA9w2KZxqpz/aDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017623;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 To:Cc;
	bh=nZkBCCVUrt5k/+qkkiW+Qwj3FqtZi0Syty4cOvmmYg8=;
	b=pHdtWSIoJM0DpezznmsxIaZh4xYeCNv2X3Ukwqx9sPHikVvCbdMmpj02DSo9f0ZSS0Gi
	 FjsEZmhJ4VBtV6bFJoFQ4hc9tW5mLPfGRccNxlSxOKx51U2KfmViSdae6qtpe2t82QpQg
	 5kB7LUVHj1iSUrZGIA5zpwGPXpqnxMA8Qdoo7qV8yNHkFNLQaKWE5peK8C2lw5II9daum
	 w9GF66StGkiVoWH36yuOizAqnjnyMCCpd8kbO8okrcb6kv8ggtM3iK5GwVxJGFKDMimCF
	 2zXLR2kxK+Fvg4eLC7uuKhwfSNHqmG8hqcLgsvn5d7vNVd7k2VnehZV+kD0AuNkZvLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jMc093O5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A81606A33D
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jMc093O5
Received: by smtp.kernel.org (Postfix)
	id 5AADE1F000C5; Wed, 18 Nov 2026 16:00:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 444A21F000C4
	for <soc@kernel.org>; Wed, 18 Nov 2026 16:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017623;
	bh=nZkBCCVUrt5k/+qkkiW+Qwj3FqtZi0Syty4cOvmmYg8=;
	h=Subject:From:Date:To:Cc;
	b=jMc093O5ik5IPMd2UclM+ngHlE4a4DDm42gHN/n9tNaid87+9ThzS7ZIcpRUb/mX5
	 30CkY+So4TnnOdX17nOR/g8XYScQkpfQKYKLCeb0FIzoQHcxhR/xB3ZGe6ZhKIS/YK
	 GWkncXCW002xcN7pfhWy6va/gympFFdoePIDyOOJsnXstEvMoWRQWzBs5f0vPw44+A
	 ZYh6d3TQHuIYH7go5A/UhtNgBl/8Gz89E4s8INQKgmAlpENnnOD1KapTBg6RZpOdjp
	 VrEAHOVNh0y6HMXZiQTnKGwOSwyo51HyJYn1giyuFKV2Qg9I0exu5PeXNgqQW8/2gH
	 0aX/AX01rTyjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A3333808210;
	Wed, 18 Nov 2026 16:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501762185.1802028.16940483741987765696.git-patchwork-summary@kernel.org>
Date: Wed, 18 Nov 2026 16:00:21 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Renesas SoC fixes for v7.4
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1204034/
  Lore link: https://lore.kernel.org/r/cover.1793960114.git.geert+renesas@glider.be

Patch: [GIT,PULL,fixes] ARM: dts: samsung: fixes for v7.4
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1210230/
  Lore link: https://lore.kernel.org/r/20261113071751.14775-2-krzk@kernel.org

Patch: [GIT,PULL] firmware: arm: Fixes for v7.4
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1199361/
  Lore link: https://lore.kernel.org/r/20261102175440.1063545-1-sudeep.holla@kernel.org

Patch: [GIT,PULL] iMX fixes for 7.4
  Submitter: Frank Li <Frank.Li@oss.nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1213036/
  Lore link: https://lore.kernel.org/r/20261116174947.2957972-1-Frank.Li@oss.nxp.com

Series: [GIT,PULL,1/2] Broadcom drivers fixes for 7.4
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Patchwork: https://patchwork.kernel.org/series/1211156/
  Lore link: https://lore.kernel.org/r/20261114034550.878760-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/2] Broadcom drivers fixes for 7.4
             [GIT,PULL,2/2] Broadcom maintainers fixes for 7.4

Patch: [GIT,PULL] memory: fixes: driver fixes for v7.4
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1210242/
  Lore link: https://lore.kernel.org/r/20261113073632.34241-2-krzk@kernel.org


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


