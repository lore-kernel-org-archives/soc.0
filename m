Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A83B83B47D7
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911247; cv=none; b=h1v4GGpjpnqUvLoSMWRKC3+PUOLa3InzL2jzKWbLkhIoWjI3IWPIY6nl7WZPUBxLePHGswLM2kcd/0D8CcNRMLW6yrYIk8Yo7COTygDHLqwDeg7mRKlmXMEoCgWYwXwkURe8ZG8bsH4wgGe5LnkmA6QsQWTF/M+rJ0bSp9hLu3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911247; c=relaxed/simple;
	bh=rpKiSeyqGPWo5iQdDBgHL7DrYR/5+F0CyeokRMj+Sxg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=Nqij4ne7AsoGuWefu+ZH6R1NDZs4zPqXm4GK6Cny/sFf60lXCbD6ajG1jMyOXZdByQJHzyLl/vn7KzvVyOdrrSCyx2H5WmBKQlM0GjOJN/ralAzAWZF5HXU5c3V4dDpSb/B0lgttIsrI4C1pPlpZwboj3sY0byQeHddmxRM4RTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mj3qZB7w; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mj3qZB7w"
Received: by smtp.kernel.org (Postfix)
	id 62E771F00A3A; Fri, 24 Jul 2026 16:40:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D1EB1F000E9
	for <soc@kernel.org>; Fri, 24 Jul 2026 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911246;
	bh=Ez+89vCe7tHsMYcwgSIt7JOSNSVSHZdQImOv5WdecYI=;
	h=Subject:From:Date:To:Cc;
	b=Mj3qZB7wNiLK/O7N2H72XUIH/W3aPQo0FfnZv7eoOobCLAaXE0WKgpBhAN+nttL7V
	 JVSS0TbSZ4jICykl4wmhMdIZRyA0E8zPfxqJ5YyrSIqg159hGtT/5sR1Xn1fskSWU1
	 n/E9B/F4B73qjK5xWuRW96LNfqc1NNwogaLXEZvN+zybjQvQ3mm0NND4av914t5UvJ
	 5oAbHOlOGr7xLc13bOBfcGJlHtySIm/WwZp+cfJ0IBs5CAr1MGNf3E4wWjjcIdqkHJ
	 NSw6l8+njGs0Qy4hZiLpZ8xfRkYwb7js5m5woVE+LzSdmUopnX7D3wrJv9Vgv1EhCY
	 3OGo/rDpHiDkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0B1D39263A5;
	Fri, 24 Jul 2026 16:40:14 +0000 (UTC)
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
 <178491121345.3229915.4755042617195304384.git-patchwork-summary@kernel.org>
Date: Fri, 24 Jul 2026 16:40:13 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 7.2
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1131830
  Lore link: https://lore.kernel.org/r/20260721170851.3581392-1-florian.fainelli@broadcom.com

Patch: [GIT,PULL] IXP4xx ARM changes for v7.3
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1133742
  Lore link: https://lore.kernel.org/r/CAD++jLkXOA=u4UxwEDa3WJbFEyTeMPj_U5BiqYsrahxdoKM+2w@mail.gmail.com

Patch: [GIT,PULL] RISC-V defconfig changes for v7.3
  Submitter: Drew Fustini <fustini@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1131806
  Lore link: https://lore.kernel.org/r/al+cTw/+z7xoJXxp@x1

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v7.3
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1134010
  Lore link: https://lore.kernel.org/r/20260724134651.2930500-1-sudeep.holla@kernel.org

Series: Renesas SoC updates for v7.3
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1128716
  Lore link: https://lore.kernel.org/r/cover.1784194401.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM SoC updates for v7.3
             [GIT,PULL,2/3] Renesas driver updates for v7.3

Patch: [GIT,PULL] RISC-V devicetrees for v7.3 - Early Canaan k230 material
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1125557
  Lore link: https://lore.kernel.org/r/20260710-purge-scarcity-942f27750ce1@spud

Patch: [GIT,PULL] Rockchip driver changes for 7.3 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1133568
  Lore link: https://lore.kernel.org/r/4283932.anssfa2V6d@diego

Patch: ARM: dts: ixp4xx: Drop the reg-offset hack
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1133729
  Lore link: https://lore.kernel.org/r/20260724-ixp4xx-dts-fix-v1-1-09bf7111e94e@kernel.org

Patch: [GIT,PULL] IXP4xx SoC driver updates for v7.3
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1133749
  Lore link: https://lore.kernel.org/r/CAD++jLn3UOROn4oK9D306WaJFx+8TQHehSugtLq7zhO0DwhHzQ@mail.gmail.com


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


