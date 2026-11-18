Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019409;
	b=fCMe+DVq3A0xx0qzBSxxnvPzbnm7ZknkrSUHhRmfRAOZGH7S4f72uLC8PXpigieUa5Zr
	 6F0DJTZtqBIAAUS+eI3P+mkWxjVllbdpPER8pN4YYNl3PUkYc/Svd/UiTVcw6DWANO7x4
	 wDoX+iH6D4M31Y7OlveeHCvLXGkzY0m2MNiOnojtGqjoAyr8yW3GVeonCRovKEQfFq8P6
	 qReC2W/Fmkjdf/iVwBQprFYvXqLesJsaFNXVkk4tJAvvFBoZU74K6TosEns/Bs80U/y2E
	 vBGNluwc8qjb292Ggmhfp55hIFSOEpTvyWoNsj9JiM3OrEYcYKBfvBXWCxMN5lFC6aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019409;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 To:Cc;
	bh=OfaKMrzteR2p4TVYRWBes4iQPgC/MhAe/ESw2MwSR6Y=;
	b=MkFLiwieIT/KWfR3XQYe4Kb9tkjlrJ9Yi+MRxE/9lUAzLQ2FGvEoZt/ZyZgaYdwWJ0kx
	 +lEdyE//lCR4hznCMwHjgZkn3rEUtPvhIvYC9dOWw7DcPgFzk2uKFhWlVrtGR9nd2Diej
	 nfb8JDv2I7ZXjTcskWT5iizB8CfeiqZqXYvo/nd7aFpesiDtq1EGSz5AWhLKbgzSKSsqq
	 BMcnP1m+xW5/yzgWVdY24QOcMscldbDzZSl5P3xY1isZwD0Z4wGXATaHpiT+YcyueKhfH
	 GgZ85hXWdiDVqUK7wT97n/WegbEmUArbOy/aq0D12HVRtfAjNk+yn+fKWc+NOkew73w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iN6EOC16;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA4060A2616
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iN6EOC16
Received: by smtp.kernel.org (Postfix)
	id 5A2E91F00939; Wed, 18 Nov 2026 16:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 441381F0092A
	for <soc@kernel.org>; Wed, 18 Nov 2026 16:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795019409;
	bh=OfaKMrzteR2p4TVYRWBes4iQPgC/MhAe/ESw2MwSR6Y=;
	h=Subject:From:Date:To:Cc;
	b=iN6EOC16aDJnSy1gkx0fwO1LkZ3kj7AaJfSq+q0eu9du/wOcGGh6y2SXQDxFRKm9d
	 SI1rmO/TeZivg7IRS7xXJ/rDbWGbqZGYkdythv1Eif/lAZT5fhaGxP4OrC4/8/umFN
	 u9FgMDO1nNgduxCoJy7zVeoFVBZBXz5bvArYYzdiFygHZDNG0eAAxM+NIKqa3+926B
	 bHjjLdx+d7Iq0CGianRmTqMcgp7gLUDtwn5lYutlNS11ofgP0IDZookcAIfvGuPEJ5
	 2QjhVrmxie54/6pQ/ou5nxqaSQiAQ46dEJYScPUTVAzyGNsgbJubDEuGfMiXS/5/T9
	 P5FE5w1EB/zUw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2E33808210;
	Wed, 18 Nov 2026 16:30:09 +0000 (UTC)
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
 <179501940816.1837438.17706199356154590746.git-patchwork-summary@kernel.org>
Date: Wed, 18 Nov 2026 16:30:08 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/2] Broadcom drivers fixes for 7.4
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1211156/
  Lore link: https://lore.kernel.org/r/20261114034550.878760-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/2] Broadcom drivers fixes for 7.4

Patch: [v2] arm64: defconfig: drop four symbols that no longer exist
  Submitter: TAKANO Mitsuhiro <takano32@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1208818/
  Lore link: https://lore.kernel.org/r/20261111220718.2586239-1-takano32@gmail.com

Patch: [GIT,PULL] configs: TEO cpuidle governor defconfig for ARM32 multi_v5/7
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1205393/
  Lore link: https://lore.kernel.org/r/CAD++jL=Ap8G6E0pzBEuufRstvSCZ=Owo=n50pnHHODb3swLqOw@mail.gmail.com

Patch: [GIT,PULL] U8500 defconfig changes
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1213141/
  Lore link: https://lore.kernel.org/r/CAD++jL=FzG1EMuZUZ3_14VqV-1U9=c06gCUJYaTZpAkdB9+5Cg@mail.gmail.com

Patch: [GIT,PULL] configs: TEO cpuidle governor defconfig for ARM64
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1205395/
  Lore link: https://lore.kernel.org/r/CAD++jL=Jiy8tRd9KjMQHAd==HkfdofeU5NPoRRejvWQgexKdAw@mail.gmail.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


