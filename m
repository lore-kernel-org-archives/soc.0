Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8A9334363
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 15:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757948415; cv=none; b=VgV+YLTWOWN0UMWsJNgaNeZ1EBveZ8tJPxsu1Udv+cwN/4mJJ19jl8681nyunnfODBU2H8TLWTjhx3Q0KNLQMkJvq0+g3mDq8T3gDH9+UA0LUVrWB3hxhVgIhfKQVdLcJ8kJbSFBCVZe8X9zqx/kPGCFyGDNaef/PjpFJ3t7rSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757948415; c=relaxed/simple;
	bh=KlzUIKMGuvi/AgryQVtBDj0rLfhuZ5sKDMvCG5sg57I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=lLmxbf9uyCeRkc62VoB8aG08vLSnjxAos5UnqqlSiXmoABSJXU4wJ3pbmjEzONqq0ODqnp5LmdZCruX/pHSFV6NQOfuaCroWdfL511dLdpbyhW/I39ytpbRa7/mwZVBvzEaWwCxJecQ+pDdM1SPMxZPtQKYYaK9yIDYS86N3lRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OKKsZ+sH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OKKsZ+sH"
Received: by smtp.kernel.org (Postfix)
	id E27B7C4CEF9; Mon, 15 Sep 2025 15:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCED9C4CEF1
	for <soc@kernel.org>; Mon, 15 Sep 2025 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757948414;
	bh=KlzUIKMGuvi/AgryQVtBDj0rLfhuZ5sKDMvCG5sg57I=;
	h=Subject:From:Date:To:Cc:From;
	b=OKKsZ+sHv49z0dxivt20SMqgmWMvdof29TsAlaJm2aYOB+Kz07h8dSk+zhERbbdXK
	 hkSXIUdneEnmtEmnGh6OA+sOsBEHBAu6NZTDrj9j9uYNMFvaPEj+DvtzrOVZsK3zHj
	 zfrW0DwHPnfmkuXmzrEaJc2wNs6ymTtTLZcy4WWLEhqWXU/TSowXrrd588iOGeEdvg
	 gybWlfasj4nQS7HZgWcNck+KxBSOBhXgQZ2FuMhKqGPrKRRfxsX3cDW/KOkiASxgYJ
	 z4dlx3KTMgZJwN94DcmPeVXYfetveF82n8vufQkB3lIFz3dUlRfG+A/v5d+gbIv8sp
	 AyIth6n8vewBw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 746D339D0C18;
	Mon, 15 Sep 2025 15:00:17 +0000 (UTC)
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
 <175794841594.17822.15387102499853669214.git-patchwork-summary@kernel.org>
Date: Mon, 15 Sep 2025 15:00:15 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4] i.MX DT bindings changes for 6.18
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1002503
  Lore link: https://lore.kernel.org/r/20250915132535.253859-1-shawnguo2@yeah.net
    Patches: [GIT,PULL,1/4] i.MX DT bindings changes for 6.18
             [GIT,PULL,2/4] i.MX ARM device tree changes for 6.18
             [GIT,PULL,3/4] i.MX arm64 device tree changes for 6.18
             [GIT,PULL,4/4] i.MX defconfig change for 6.18

Patch: [GIT,PULL] MediaTek soc driver updates for v6.18
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001018
  Lore link: https://lore.kernel.org/r/87c8f50b-90a5-47ed-af60-99a4e075a266@gmail.com

Series: [GIT,PULL,1/2] arm/arm64: defconfig for v6.18
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1000654
  Lore link: https://lore.kernel.org/r/20250909180127.99783-3-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] arm/arm64: defconfig for v6.18

Patch: ARM: dts: socionext: Drop "linux,spdif-dit" port node unit-address
  Submitter: Rob Herring (Arm) <robh@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001149
  Lore link: https://lore.kernel.org/r/20250910233740.777077-2-robh@kernel.org


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


