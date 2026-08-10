Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ECD3A6B6D
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352473; cv=none; b=bt2RKeyJrqzMVJbH/FJlRLJg1tFZkwWRt8XvoiaOkA0vOAzmQJyJRhiC143U/zj8siifKZXDgt+fKIUQvOZ0aFPFWG+jXUIhI3nC2QLlwfXcvIO8xeC3BjHQ/AyCCq5bDEnf1u6Dj83qOcfAHUTZ/t+fAhluU/R4xH9xzf5Sljc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352473; c=relaxed/simple;
	bh=yBBj8PDE6wYlx0DP97d9PVUVUOrWOF2pJEX9SjXZl94=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=gNerdxvAvqLyRvdUs1ISufgw/U0z1dT/Ti9WKW7I/JKTt7S0G1/6kcMyfPshvdBRgrE4j+C9YKqsP6c3InWPLOpaPC2fFw85LCRvw+e+fH5zNkM5P3TK5e+n0c9riNMUsToNW6jmyU2oGzkzX1hbL/oFburPkO7NmObI/31RJPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hsziRDtQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hsziRDtQ"
Received: by smtp.kernel.org (Postfix)
	id 4C1461F00A3A; Mon, 10 Aug 2026 09:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 367101F000E9
	for <soc@kernel.org>; Mon, 10 Aug 2026 09:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352472;
	bh=t6eb1FO4evLqmrqtjwUFuqV8OjDnKGH46RWvYw7J8B0=;
	h=Subject:From:Date:To:Cc;
	b=hsziRDtQgRtfu4Zx74uqVhFD5LFEx3Jsfu4+O7FMaaAH9UQbRCT0IgGNyeb6r/2+8
	 DhXfuq13xzlUWiVkg7q8zNuA0a92s/LuKIH3uODacz+7LxfeQ+QCT6Se3CQ2dRiZtN
	 gNWbgJISb8xrzfGiqrTBqG8DqJqzB97+oaMFkNWTKyvmY7oNOdBJPUIEHAiv/Hq7i7
	 SrJxm3vluVdI8D0qTmWuWOca+cMs4WWwqnE/mM42eEm5HVPJ2bn8IKUWBaCIWTRBNV
	 rJLBYl6q0sE7juzCrfWdwABHPScS22YoCBiIqV4dO+y4hnx7oHGEgWFQ2KFlLRD70x
	 dh0DQTyAyzJIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 578C23924FC2;
	Mon, 10 Aug 2026 09:00:30 +0000 (UTC)
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
 <178635242891.3658557.7287552126315290736.git-patchwork-summary@kernel.org>
Date: Mon, 10 Aug 2026 09:00:28 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL,v2] arm64: tegra: Device tree fixes for v7.2
  Submitter: Thierry Reding <thierry.reding@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1138959
  Lore link: https://lore.kernel.org/r/20260802163936.1257450-1-thierry.reding@kernel.org

Patch: [GIT,PULL] QCOMTEE update for v7.3
  Submitter: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1141521
  Lore link: https://lore.kernel.org/r/20260806132114.GB673420@rayden

Patch: [GIT,PULL] soc: OMAP2 updates for v7.3
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139520
  Lore link: https://lore.kernel.org/r/7h5x1rjj6u.fsf@baylibre.com

Patch: [GIT,PULL] Apple SoC driver changes for v7.3
  Submitter: Sven Peter <sven@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1142335
  Lore link: https://lore.kernel.org/r/20260807161840.6011-1-sven@kernel.org

Patch: [GIT,PULL] SOC FSL for 7.3
  Submitter: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1143097
  Lore link: https://lore.kernel.org/r/b0e98427-f0d3-47a3-a0b2-de386a5e641c@kernel.org

Series: [GIT,PULL,1/2] arm64: dts: ti: k3: DT updates for v7.3
  Submitter: Vignesh Raghavendra <vigneshr@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1141625
  Lore link: https://lore.kernel.org/r/42ae17e3-f40d-4825-a45c-5f046ef3159f@ti.com
    Patches: [GIT,PULL,1/2] arm64: dts: ti: k3: DT updates for v7.3
             [GIT,PULL,2/2] arm64: defconfig: TI K3 defconfig updates for v7.3

Patch: [GIT,PULL] More Qualcomm driver updates for v7.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1142300
  Lore link: https://lore.kernel.org/r/20260807154149.603041-1-andersson@kernel.org

Patch: [GIT,PULL] Apple SoC fixes for v7.2 or v7.3
  Submitter: Sven Peter <sven@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1142337
  Lore link: https://lore.kernel.org/r/20260807161937.6419-1-sven@kernel.org

Patch: [GIT,PULL] arm64: AMD/Xilinx SOC changes for v7.3
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1143167
  Lore link: https://lore.kernel.org/r/CAHTX3dKTNZJjcCVeAKA4KX-JcoJct72S1t2XuycDhcuSvOMhgA@mail.gmail.com

Patch: [GIT,PULL] soc: ti: Driver updates for v7.3
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1140856
  Lore link: https://lore.kernel.org/r/20260805143716.gbr73pwvengxycr2@cabbage

Patch: [GIT,PULL] OP-TEE fix for v7.2
  Submitter: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1141513
  Lore link: https://lore.kernel.org/r/20260806131232.GA673420@rayden


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


