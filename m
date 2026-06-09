Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA32378838
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 12:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781007007; cv=none; b=DdjAYLfyMF7cNi8g6eFKVy3J3N3qWi/8N3Afz92HWYhsMtzNc3+3PxK81zveP7IVov/NsG0uggKVmKTq65nKGRJatgA/99pn+VCm+AXfNdmWUYUUW4Pf8DCLItOqmCgLTqxfOxPXREUcOQXx/LGilGsICA2b3qeZwQDrrt7lmEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781007007; c=relaxed/simple;
	bh=Hn0hEDe+9T+nZg29gC77JtOSZlPyzRgeaPHp3at3ZYU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=bCoftXWmEbR1ohxa+LXhxaKnyCfzK3r6qoYzoNcnPGlUhziXf5sO4fI3b+k0aFjgki5pbBEEl0IDPVVc+6czlgaFDXNrHMJKokjZKH6uDGUN3ACmy1zHkY4moDzisra+VJTKf0Pkk/pSjMB/aAGVSYIaOFDEr6ZJgmcYoERaApc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yt9N0FQ0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yt9N0FQ0"
Received: by smtp.kernel.org (Postfix)
	id 900301F00898; Tue,  9 Jun 2026 12:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79F2A1F00893
	for <soc@kernel.org>; Tue,  9 Jun 2026 12:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781007006;
	bh=oPT8map2kAtL9DqDJz41jJ1Hsi13K3oMt+L/QreT/bQ=;
	h=Subject:From:Date:To:Cc;
	b=Yt9N0FQ0kX3bnPKy3RFjQHx6WRJDtxzRUOWNNhNiMuwRhV3LkF7CLysEvq4Ttqiat
	 QnuFNNXYSTC8ZhmtxxdY8Sqh4nLQH+BQI/Zi/DVq9XgWq5Hke1hF1apDTKU+IQxvfC
	 MyfcYyt1mzo21q/1vsDIL/pQfX48/04t+vO39xzxC8L6s45ZQtZpYzY83pwV9seE4e
	 19mlRy6QVSDu8CGEcK1rqKipx8R/Y/59sJfieG+5/TlJEojTF0Wq5tBnvW7Lvmigu3
	 wB0bUc5Vxp3rjFhDty3w/53MTLZQyvJbS1yFg/fVi6XA9FHgxF6BwdbemTEmYxQNEW
	 tnItNSwsWVKXw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C11639308CA;
	Tue,  9 Jun 2026 12:10:06 +0000 (UTC)
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
 <178100700467.1991839.9251342943836304208.git-patchwork-summary@kernel.org>
Date: Tue, 09 Jun 2026 12:10:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] i.MX arm64 defconfig change for v7.2
  Submitter: Frank Li <Frank.Li@oss.nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1107980
  Lore link: https://lore.kernel.org/r/20260608153615.2274186-1-Frank.Li@oss.nxp.com

Patch: [GIT,PULL] Microchip AT91 defconfig updates for v7.2
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1108345
  Lore link: https://lore.kernel.org/r/20260609073904.813405-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] ARM: soc: updates for v7.2
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1107968
  Lore link: https://lore.kernel.org/r/7hldcpm526.fsf@baylibre.com

Patch: [GIT,PULL] i.MX SoC driver updates for v7.2
  Submitter: Frank Li <Frank.Li@oss.nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1106107
  Lore link: https://lore.kernel.org/r/20260604164526.1612520-1-Frank.Li@oss.nxp.com

Patch: ARM: configs: Drop duplicated CONFIG_EXT4_FS
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1105116
  Lore link: https://lore.kernel.org/r/20260603072726.19404-2-krzysztof.kozlowski@oss.qualcomm.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


