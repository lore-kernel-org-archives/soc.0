Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5B922258C
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162557; cv=none; b=Mw1hejRgtOx/bn19IvK6YibA9wys400TybvjMdpvc3NyS9FncuWtNdlLJa9kmNEMkp5SPnpbSYKuDWTYyAVLSVc67tY/h+/oozGKgyrix/wUmnyraOenXuuXRYBYWdwdfTadRWO2hpChURsUhAEW6/m1pd7BWXKk1gLaX7JgNKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162557; c=relaxed/simple;
	bh=jgvFFbaVt0mPB1WGX7v++8PpohufeE6r2wYeX0rMta0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=iDNiISJzA2iqiPzK2/BXkJcxrZ97fSkoTcuuvwdY32f+7DutQ0sG2a4FRqbcJuqXhHjUV/RaI3ASnICjw13ARupIMcl+Mj4cwiJJBOzywlsl2KdLwporwGqqNlxdyUiILZTgJdOQp+1I4z6UOltGs7y6UTDMuFB8r85/mTcB7Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A9fad8UP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A9fad8UP"
Received: by smtp.kernel.org (Postfix)
	id 54492C19422; Fri, 14 Nov 2025 23:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D2C6C4CEF5
	for <soc@kernel.org>; Fri, 14 Nov 2025 23:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162557;
	bh=jgvFFbaVt0mPB1WGX7v++8PpohufeE6r2wYeX0rMta0=;
	h=Subject:From:Date:To:Cc:From;
	b=A9fad8UPwaZYcGdENRznf7+ik8HeDCzQ+rYaTlrBirHjICl3e9FBG+moQ0V+NUr1g
	 bqf6jcxf3kqOch6EnOtxQ/2/BLyToRzcewQYFa+lhUS7ocHC9LGHBzAEFClHQZorJ0
	 NrigoR9VN1jx0LHfui1vOW13FRgrPBbwYyQveRr8s3AVpsm5cfU9LBDlWPl/BxD+4k
	 OPnQnnFmuNmiSzO59vW+X9bJAkIOKRtv0h8lLs5i4mW4fLHn4wVBfVQeApBx0yd5p1
	 iQKHhE2tsET+MVd8Ubyb3hlt8yYarhm1HvY6VIvrUvLr4G017a4dH5Wl4FTF20Qhwj
	 Jkhr1d7HmFT+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B227F3A78A5F;
	Fri, 14 Nov 2025 23:22:06 +0000 (UTC)
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
 <176316252515.1867843.7322222895571296215.git-patchwork-summary@kernel.org>
Date: Fri, 14 Nov 2025 23:22:05 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [fixes] MAINTAINERS: Update Krzysztof Kozlowski's email
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1018240
  Lore link: https://lore.kernel.org/r/20251031135041.78789-2-krzysztof.kozlowski@linaro.org

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

Patch: [GIT,PULL] aspeed: First batch of fixes for 6.18
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1017936
  Lore link: https://lore.kernel.org/r/d79a0c80cdd9e2c45e6a82fd8c78219b6d53f206.camel@codeconstruct.com.au

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


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


