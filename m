Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2146233EC
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 15:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764085847; cv=none; b=KpvUNFGGhOus2R9yXQhZZsm8QSIJ+gZJEyig03OX27QsSRZPjDPCCsgCchU2nKkG34X8wXP8Wmeweo/wj3TTQv2wgdhUPMr+VzA3o2Gq7+7GViz/ETcHjzoAulKzpRz4j/BjzbPOzDDB4noYeRMtwnLHpwgSvTLOZRoTXrkphzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764085847; c=relaxed/simple;
	bh=pHdGck+UyQ6Bm0ZW8ncR0L2MIrQWs3vpAzgV80oT5K4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=jWFOfWawMXdwCBykI8I9Bj9xbNiO4T1c42YOCWJlRVXgLP+YJ5dbzI10QdGodcxgIKOUxrWXQHoPTgEbBMt/s0tPK5a/VM/iZ3zU8RuDDeJEorXbKus679irdo27pxCJZ/I0tcp2MN6q4FaKcCEvz3zYLxFXglLv0IunoB5DTjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1NOTc+M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1NOTc+M"
Received: by smtp.kernel.org (Postfix)
	id CF1E9C116B1; Tue, 25 Nov 2025 15:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C96C4CEF1
	for <soc@kernel.org>; Tue, 25 Nov 2025 15:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764085845;
	bh=pHdGck+UyQ6Bm0ZW8ncR0L2MIrQWs3vpAzgV80oT5K4=;
	h=Subject:From:Date:To:Cc:From;
	b=k1NOTc+MSSJcGjnsUZU91W/mtTFgKMivsvSR3xvzYrRbaSujagor45mXLg+3nCrsa
	 u25MkyoMm3GBqRX8Upw56J9NVAis0DXAvJ5/07zVwpG4JoOD2/REosfROPHsX5zDzQ
	 PaQo4xThmM0ONUl7SK3Ssb7ByoQQM9Ps99hlGIeosBfVDNcdELIY+Y5RWPvDCi6tXk
	 K8hLitJzoP3DZ1RSQ51K1j2y6pYDjzYhPevDD+PSmoT1W+enjJwM6gj7+sOeDzJDTY
	 AuLm3YZH1jZkyOZly8IlBKrC6peNNh8SOAfyABkDaQLuLlzve5MORshQMY7s/50jsN
	 0h8rXe1D1jZOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C8B380A944;
	Tue, 25 Nov 2025 15:50:09 +0000 (UTC)
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
 <176408580795.815192.13784353884087807296.git-patchwork-summary@kernel.org>
Date: Tue, 25 Nov 2025 15:50:07 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Allwinner fixes for 6.18
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1027380
  Lore link: https://lore.kernel.org/r/aSW6QyCvqM_DChbG@wens.tw

Series: [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1021971
  Lore link: https://lore.kernel.org/r/20251111095542.13958-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/5] MediaTek ARM32 mach updates for v6.19
             [GIT,PULL,4/5] MediaTek driver updates for v6.19


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


