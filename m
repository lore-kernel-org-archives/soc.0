Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D486035E943
	for <soc@lists.linux.dev>; Fri, 18 Sep 2026 13:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789738877; cv=none; b=Pv8R78apihrk8hOR3VkFVI8VXEju8xD7buQxif2waoq1OvBhYlJ4Ly8YJNY4jO41bwSuzlNTzPkg2aWfuxz9si6UI3GpIZnL699Xr0U5hzTWRG55m0t1FqOT6EqqTMR8BFyJXIxCJIOXoi3NIagK0q/AuuWJFRB4p9MMNwaoh24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789738877; c=relaxed/simple;
	bh=58z1THyzOucT+4TWK/s2dIgCbVLG86OxnOST8fVBVuc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=oi1zokUT2FgwHGYo8gZBkiYfGy0O63klKH/5ofbGqu15hymnde3Yj5xt8nfew5imbQNOw62MntdowupE1sDZSMeNcFh2a7KVLbSRxjnysS97trhCkGfIsIh1BdXFtb20a40sozu2zqxov2QmjaopABwu9QRRv+4Gcy2SCBLjCSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R2zdMoQz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R2zdMoQz"
Received: by smtp.kernel.org (Postfix)
	id 6400D1F00898; Fri, 18 Sep 2026 13:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E8401F000FF
	for <soc@kernel.org>; Fri, 18 Sep 2026 13:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789738875;
	bh=oybvBo4b4dEtZgSxZXDCGhX3xlsVDqyT9xNu9hr9dEM=;
	h=Subject:From:Date:To:Cc;
	b=R2zdMoQzI1rm4Q8DppO7lAl2zzYMzy9QRYTRu2jmfkOcEQGugSGoCOK1RWb5NLNAO
	 Ol51qilUu/tAnil6geIcwoAyRWU8+IM2694X6mn8IxfMGLkBmicvGMMyZL1CqwmYXY
	 q6dCtg9p5bBcmKVraAaKtFNCJ2zWTkXxKvPDkVQEUmBUa9pk6UabLZKLNBrBBmzcls
	 vKD5wzcIH4S3jccjIHH9PX85xAhBh6Ug1GMw+VXMDn0RP9RIY70m6P6dTPyD0JxvlF
	 krn0Hlr+74IEySrQocpd9IyvOsJt+aUcX7En85vqkUbwbs6XiRDqs8Zk8opNmhcQ9U
	 cjTeas8XzHeDA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 963FC380CEE2;
	Fri, 18 Sep 2026 13:40:09 +0000 (UTC)
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
 <178973880815.506446.12049243134993928002.git-patchwork-summary@kernel.org>
Date: Fri, 18 Sep 2026 13:40:08 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Renesas SoC fixes for v7.3 (take two)
  Submitter: Geert Uytterhoeven <geert@linux-m68k.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1168461/
  Lore link: https://lore.kernel.org/r/cover.1789722755.git.geert@linux-m68k.org

Patch: [fixes] soc: samsung: exynos-pmu: fix use-after-free of interrupt generator node
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1167207/
  Lore link: https://lore.kernel.org/r/20260917081641.72291-2-krzk@kernel.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


