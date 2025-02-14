Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B72266579
	for <soc@lists.linux.dev>; Fri, 14 Feb 2025 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739545797; cv=none; b=pwpeDAdx1NXVEvILuSg1/X4gz+yyrdGlxA7TNt+aRgsXfpJRmJ15Z2VRWXr7WVFrGW8XMFr9unv3SRU1Dr/boBoBnb7Mz1jaipAkpf7N0a6cruqw6cZ59u8ealMW0L308kR+OVZ7WJ22yJ7IQWyJR0MXxRQoxBZN/Dgw0PafBkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739545797; c=relaxed/simple;
	bh=HuubIa8DqiT3FsNnx52xeYzcqmd/hrFFXw9P5lqu4mc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=m+ddHCuvggsFqRPUI8WN+5XL87SDPgiEQp77x2u/5Gcvbr8tDJpLRqGMJYvtk+wsxljMjjKFT4eOAMH/ku5YZID7jnOiE6N2/2Za6gTMV8WZWo6xigzBNjjFjXYkuD8+aaVaC4fk6bAEZ12HJjWuJrwdRMPh8FRj0WX5zktfR2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lhb2ulyu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lhb2ulyu"
Received: by smtp.kernel.org (Postfix)
	id 48DF6C4CEDF; Fri, 14 Feb 2025 15:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33746C4CED1
	for <soc@kernel.org>; Fri, 14 Feb 2025 15:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739545797;
	bh=HuubIa8DqiT3FsNnx52xeYzcqmd/hrFFXw9P5lqu4mc=;
	h=Subject:From:Date:To:Cc:From;
	b=Lhb2ulyuwgFUZ1a9lOA6mRpAvsrhI7V0WURO8iPLgJ1hHtqBeWAnDNSQ1RZ078X1b
	 wpz2Lro+x11zxyKWXAhgidS8OH/1L6BtYA0zPkro62Rc/e3obEWGp7WDBBYsVIuJzj
	 DGl4/kImQZxbXFPU7VsJk8HD7nuPabaAZMravgof6JvJYVSwjoQWChi8yorQ2lhTzg
	 s/bL0l1s90YHynd4wJ7JwwDjWx2V4J7GrkqMHTnZjmohOMt7bqb3q37fi0vB1SWkjv
	 /IIgy+th3j5RxaPaLJIeXT7k9GKdqKluLYMmvSADIPZ11+U9WmE/0c4ZFp90l+roun
	 tIb9SUIfMCH+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B4A1D380CEE8;
	Fri, 14 Feb 2025 15:10:27 +0000 (UTC)
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
 <173954582625.1980112.14976756870409295187.git-patchwork-summary@kernel.org>
Date: Fri, 14 Feb 2025 15:10:26 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: MAINTAINERS: arm: apple: Add myself as maintainer
  Submitter: Janne Grunau <j@jannau.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=931867
  Lore link: https://lore.kernel.org/r/20250208-maint-soc-apple-v1-1-a7f7337baec0@jannau.net

Patch: [resend] firmware: imx: IMX_SCMI_MISC_DRV should depend on ARCH_MXC
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=930852
  Lore link: https://lore.kernel.org/r/9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be

Patch: [GIT,PULL] arm64: defconfig: Fixes for TI K3 platforms for v6.14-rc1
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=933194
  Lore link: https://lore.kernel.org/r/20250212112857.pm6ptaqbx545qnv7@eternity

Patch: MAINTAINERS: Mark Andrew as M: for ASPEED MACHINE SUPPORT
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=929866
  Lore link: https://lore.kernel.org/r/20250203-aspeed-maintainer-v1-1-60bc3a5f0a7c@codeconstruct.com.au

Patch: MAINTAINERS: Remove myself
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=931306
  Lore link: https://lore.kernel.org/r/20250207-rm-maint-v1-1-10f069a24f3d@marcan.st


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


