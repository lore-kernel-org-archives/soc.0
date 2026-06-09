Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815D029B77E
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781023229; cv=none; b=A/so6NkQ/mwhXhEKoeberm08mSh81xrVyVhjJBvb0V3mGiRH8oBQ4nUM9koy6taoFoRI7NwZc9rdXg+2qdmAGV1HcQKfVT7+gtUdyKNncecgI1nJOF9NC2CsZIZNp1MabkY964ZGMTuebAo+5cENs5cIQjR4fq/HnrLNjnoM6D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781023229; c=relaxed/simple;
	bh=DC5caVyg/d5EqK+jFb8oRePJJWvldItamjtJtuq+Dac=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=XrbkAtvRjiUdVEvqU0FgMMCEQTX18pwku1qswgKs7fIjdI2tfPJNLoqsyXaqNCdjM2xAa7So7AueqBytio99YPN6Wkf0gYsSuMVgM7xshysT+jqizZ22d6mdglWFlZa+UQWHCrNUbMAgQVLq0SSn/WOfI30GME9NM9JVFRM8iFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TT+EJMO8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TT+EJMO8"
Received: by smtp.kernel.org (Postfix)
	id 2E9E91F00898; Tue,  9 Jun 2026 16:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191841F00893
	for <soc@kernel.org>; Tue,  9 Jun 2026 16:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781023228;
	bh=v7ITytnRbIa74o+n97V0Lr/oVyl6wiOwoEbTF97GJRI=;
	h=Subject:From:Date:To:Cc;
	b=TT+EJMO88++iAFaFDLOm9L2l5sXesg5fWquJbCYUT0pNY4gWfslWPLuWw8SB55YYw
	 NEUPj2KUw1KD/SkGroqfZ7Pw2CFy2mu+OuK2r2SG0zSLIM3O4MLGssTkot2CbjnzoC
	 MjYY7mr+qjwjrLyeH/PJ9IQZqKzMiHi2pnkYsrtZ88WjY1K6BOrauOCuumD2y936h0
	 tVgV5/a35cohhin2q30aTjWIp+JWcpMsNedYXxm3pwHszA1XhGvYga95wUSxTzDAYV
	 anvR/74ukXlxEA8GuHgWVTJBxP6R1TFEeHCdCSScXcrzXWpD+lrUllu2jT169kwUcs
	 EyVg0EWy23iFA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 963DE3930989;
	Tue,  9 Jun 2026 16:40:27 +0000 (UTC)
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
 <178102322608.2135346.11695697619559781273.git-patchwork-summary@kernel.org>
Date: Tue, 09 Jun 2026 16:40:26 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Introduce ASPEED AST27xx BMC SoC
  Submitter: Ryan Chen <ryan_chen@aspeedtech.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1108231
  Lore link: https://lore.kernel.org/r/20260609-upstream_ast2700-v9-0-f631752f0cb1@aspeedtech.com
    Patches: [v9,1/4] dt-bindings: arm: aspeed: Add AST2700 board compatible
             [v9,2/4] arm64: Kconfig: Add ASPEED SoC family Kconfig support
             [v9,3/4] arm64: dts: aspeed: Add initial AST27xx SoC device tree

Series: [GIT,PULL,1/2] soc: ti: Driver updates for v7.2
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1105424
  Lore link: https://lore.kernel.org/r/20260603154029.sozfqrlkptyvslbn@stinger
    Patches: [GIT,PULL,1/2] soc: ti: Driver updates for v7.2
             [GIT,PULL,2/2] arm64: dts: ti: K3 updates for v7.2

Series: [GIT,PULL,1/6] dt-bindings: Changes for v7.2-rc1
  Submitter: Thierry Reding <thierry.reding@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1103497
  Lore link: https://lore.kernel.org/r/20260531060825.1855391-1-thierry.reding@kernel.org
    Patches: [GIT,PULL,1/6] dt-bindings: Changes for v7.2-rc1
             [GIT,PULL,2/6] soc/tegra: Changes for v7.2-rc1
             [GIT,PULL,3/6] soc/tegra: pmc: Changes for v7.2-rc1
             [GIT,PULL,4/6] firmware: tegra: Changes for v7.2-rc1
             [GIT,PULL,6/6] arm64: tegra: Changes for v7.2-rc1

Patch: [GIT,PULL] Rockchip dts64 changes for 7.2 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1106865
  Lore link: https://lore.kernel.org/r/21578066.fAMKPKieAE@phil

Patch: [GIT,PULL] memory: drivers for v7.2
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1103566
  Lore link: https://lore.kernel.org/r/20260531121914.22421-2-krzk@kernel.org

Series: [GIT,PULL,1/2] Broadcom devicetree changes for 7.2
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1104225
  Lore link: https://lore.kernel.org/r/20260601202945.1195228-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/2] Broadcom devicetree changes for 7.2
             [GIT,PULL,2/2] Broadcom drivers changes for 7.2

Patch: [GIT,PULL] standalone cache drivers for v7.2
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1107767
  Lore link: https://lore.kernel.org/r/20260608-retool-automatic-2e55911639f9@spud

Patch: [GIT,PULL] Microchip RISC-V devicetrees for v7.2
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1107741
  Lore link: https://lore.kernel.org/r/20260608-grumbling-gigantic-b0bb128634f2@spud

Patch: [GIT,PULL] samsung: drivers firmware for v7.2 (also for thermal)
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1103558
  Lore link: https://lore.kernel.org/r/20260531115713.19388-2-krzk@kernel.org

Patch: [GIT,PULL] Microchip RISC-V soc drivers for v7.2
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1107779
  Lore link: https://lore.kernel.org/r/20260608-vacant-slit-9499ba5eb8f2@spud

Patch: [GIT,PULL] Apple SoC DT changes for v7.2
  Submitter: Sven Peter <sven@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1105872
  Lore link: https://lore.kernel.org/r/20260604102600.3790-1-sven@kernel.org

Patch: [GIT,PULL] arm64: dts: hisilicon dts updates for v7.2
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1106435
  Lore link: https://lore.kernel.org/r/6A228A6F.7010502@hisilicon.com

Patch: [GIT,PULL] i.MX ARM device tree changes for v7.2
  Submitter: Frank Li <Frank.Li@oss.nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1106118
  Lore link: https://lore.kernel.org/r/20260604170234.1660270-1-Frank.Li@oss.nxp.com


Total patches: 21

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


