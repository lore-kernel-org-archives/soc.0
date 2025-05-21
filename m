Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20338221732
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747848024; cv=none; b=I50w1eOEI55IYjtABxW4Qfr+PxsdtYdtEb3Ij5xj5zbbNxeF4ZArxho6GJS/fR7xH/0+xlwaw551ATlCOaRY9ZaYMAd/nRJ5xDj7op297xa0hk6OYGUhQZojmjOzp6hbDYfFAEP7ak5Bs3gMNzdaztDp3N22P1HQA9Sh9hPwpUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747848024; c=relaxed/simple;
	bh=C2zxrU+Fe2JtpBjLi+CvmRszwMUEv/W9XRvJ5dZuKs4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=dIKuGE/K5WWlBt2rK9jFpf8JZw29Ll9x0LMFWxjXMuK+H83r1FlXssGNRXkaGJCCljVzbZmxM5eO1POKGLs8lG9C4a3hgMDVldttOURCarpkevmKn4FI+avy4F2NR53zs3/GUP6JMqjs46dtopZBdq5ixCI+tJNQjEFbQD9qeVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h3uJ3u8n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h3uJ3u8n"
Received: by smtp.kernel.org (Postfix)
	id AB9DFC4CEE7; Wed, 21 May 2025 17:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9596BC4CEE4
	for <soc@kernel.org>; Wed, 21 May 2025 17:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747848023;
	bh=C2zxrU+Fe2JtpBjLi+CvmRszwMUEv/W9XRvJ5dZuKs4=;
	h=Subject:From:Date:To:Cc:From;
	b=h3uJ3u8nmfkI9wPqON6oFQJojMzNBeXnh7QDr20jQlzWIToGaIFn0ZV3Aw226uzhc
	 k4dCdMk318TCavvlU2prUtTSROSc+cVqDBfwNS+UX3Y+HEMcNIrVHjV4CfKLjLhqV7
	 9NZpY07H4J9pcCQPD8kTcToOKpLA7+3s+NL0pzpAVI5rUh+LtAVW+N44CKtbxgkd72
	 Dz0TcWctiuNBZ/z3ChjUVJBg98Gji+Gkr9tX/2+iQLh1fgMIzijYQzkTlw4YBhlLSJ
	 vmOQ82o8zi2Ajm6sqncsttP/2d7MM5haIVsV89/a/zyTHMVd2ZT+NLTilLKWYjll1m
	 MbCUCkPkbV7xw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C7C380CEEF;
	Wed, 21 May 2025 17:21:00 +0000 (UTC)
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
 <174784805901.2163178.12262992180379834294.git-patchwork-summary@kernel.org>
Date: Wed, 21 May 2025 17:20:59 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4,fixes] samsung: drivers: fixes for v6.15
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962366
  Lore link: https://lore.kernel.org/r/20250513101023.21552-5-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/4,fixes] samsung: drivers: fixes for v6.15
             [GIT,PULL,2/4] arm64: dts: samsung: DTS for v6.16
             [PULL,3/4] ARM: dts: samsung: sp5v210-aries: Align wifi node name with bindings
             [PULL,4/4] ARM: s3c: stop including gpio.h

Patch: [1/1] arm64: dts: blaize-blzp1600: Enable GPIO support
  Submitter: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962053
  Lore link: https://lore.kernel.org/r/20250512133302.151621-1-nikolaos.pasaloukos@blaize.com

Patch: [GIT,PULL] Reset controller updates for v6.16
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962339
  Lore link: https://lore.kernel.org/r/20250513092516.3331585-1-p.zabel@pengutronix.de

Series: [GIT,PULL,1/3] soc: ti: Driver updates for v6.16
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962092
  Lore link: https://lore.kernel.org/r/20250512144719.mpkyw2jbyzslb5hy@yearly
    Patches: [GIT,PULL,1/3] soc: ti: Driver updates for v6.16
             [GIT,PULL,2/3] arm64: defconfig: Updates for TI K3 platforms for v6.16
             [GIT,PULL,3/3] arm64: dts: ti: K3 devicetree updates for v6.16

Series: [GIT,PULL,1/3] arm64: dts: Cleanup DTS for v6.16
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962386
  Lore link: https://lore.kernel.org/r/20250513104216.25803-4-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] arm64: dts: Cleanup DTS for v6.16

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.16
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962377
  Lore link: https://lore.kernel.org/r/5f7d3fa4-2d9d-450b-b384-abdd903284dc@linaro.org

Series: [GIT,PULL,1/4] samsung: drivers for v6.15
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=942022
  Lore link: https://lore.kernel.org/r/20250309185601.10616-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/4] samsung: drivers for v6.15
             [GIT,PULL,4/4] arm64: defconfig: enable ACPM protocol and Exynos mailbox

Patch: None
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962376
  Lore link: https://lore.kernel.org/r/20250513101754.23158-2-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] amlogic ARM DT updates for v6.16
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962367
  Lore link: https://lore.kernel.org/r/838c5305-5c5b-4232-b7fe-86598dc50ace@linaro.org


Total patches: 15

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


