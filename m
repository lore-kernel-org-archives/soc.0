Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B309136351
	for <soc@lists.linux.dev>; Wed, 21 May 2025 22:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866663; cv=none; b=oNGZ+8nGjKrGjckMgb8SUxzlBTPWEKr0w1TF6kaiLoIwMG4ZYFkmN8+0c/lDam0fwm4ejE1rTnsXCLAMjuKlfUyG2YvmWpwxNL0h82bfAwgfU5JBH5HaECP6CmhN2y2nJf/LIH4Y3JThW4px4H44bTgogZHYR3H/ohUk4O7BZXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866663; c=relaxed/simple;
	bh=zs4TGgWFRUTovhFkWqOofV1uukvjUdwOQNskexCgAVU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=PVzlYosfd9JMefIRRI0PanhMMhxAe/pc1F2B3N1ruDiXluotgTUp4IYdCcxmD/q0saq3YSJVFIvxIr7rD6Ma5xF9zP8OO77BqslOjKUo6A7Zw0n8KKalzSqP5QiHGXLedCLdP/GwbYjp0TcpibHcrAFRfMOz/DA5228ETpuAEPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UxFWcQwt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UxFWcQwt"
Received: by smtp.kernel.org (Postfix)
	id 4ED8BC4CEEB; Wed, 21 May 2025 22:31:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38753C4CEE4
	for <soc@kernel.org>; Wed, 21 May 2025 22:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866663;
	bh=zs4TGgWFRUTovhFkWqOofV1uukvjUdwOQNskexCgAVU=;
	h=Subject:From:Date:To:Cc:From;
	b=UxFWcQwt0KzTBXZTn8dTY1NlFW6cypf3DoO/YSMWqP03l/QyTVuBcfTZ1uBn354a6
	 +N7/c0oTdKUGFoDu7eY3ywKxDcZCLz0fpjAekgJ/XvphJ0srotbzIDjHDAc5V4+ZuU
	 2p8QCFEHxhb8F64rtm5HZGa08yuyhPX8F8BUzDgNFxNXRyVnUQY6NaPuSjSqWRaeOp
	 /cSZCfUEXGNdoO0cTJnuYb83fuvy3RHQuh/oLnGTfLrW+WrLGDNCWh0ldkzSsbrZUx
	 F/XJ6nuPLQqEKB7xmtJfu2p+h9OADbT4tk7nsqruhLBG0ulPXlV7ALH1hdxU9gHMWM
	 2N1bO6/SwGWhg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EFC12380CEEF;
	Wed, 21 May 2025 22:31:39 +0000 (UTC)
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
 <174786669855.2299459.10627911205981770512.git-patchwork-summary@kernel.org>
Date: Wed, 21 May 2025 22:31:38 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] More Arm32 DeviceTree updates for v6.16
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=964386
  Lore link: https://lore.kernel.org/r/20250520024716.39418-1-andersson@kernel.org

Patch: [GIT,PULL] Microchip ARM64 DT updates for v6.16
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=963476
  Lore link: https://lore.kernel.org/r/20250516055607.11248-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.16
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962571
  Lore link: https://lore.kernel.org/r/20250513214111.43401-1-andersson@kernel.org

Patch: [GIT,PULL] More Qualcomm Arm64 DeviceTree updates for v6.16
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=964382
  Lore link: https://lore.kernel.org/r/20250520024248.38904-1-andersson@kernel.org

Series: [GIT,PULL,1/3] arm64: dts: Cleanup DTS for v6.16
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962386
  Lore link: https://lore.kernel.org/r/20250513104216.25803-4-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] arm64: dts: Cleanup DTS for v6.16
             [GIT,PULL,2/3] ARM: dts: VT8500 for v6.16

Series: [GIT,PULL,1/2] Additional MediaTek ARM64 DTS updates for v6.16
  Submitter: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=964560
  Lore link: https://lore.kernel.org/r/20250520114356.1194450-1-angelogioacchino.delregno@collabora.com
    Patches: [GIT,PULL,1/2] Additional MediaTek ARM64 DTS updates for v6.16

Patch: [GIT,PULL] ARM: nuvoton: soc changes for 6.14
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=963993
  Lore link: https://lore.kernel.org/r/CACPK8Xe=f_hNNWUGL670x4-OeKgDB+2P+mxp5BaTLW==T5jE_A@mail.gmail.com

Patch: [GIT,PULL] RISC-V SpacemiT Devicetrees for v6.16
  Submitter: Yixun Lan <dlan@gentoo.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962643
  Lore link: https://lore.kernel.org/r/20250514044841-GYA524674@gentoo

Patch: None
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=963577
  Lore link: https://lore.kernel.org/r/20250516-gap-exploring-f8f516ab4e1c@spud

Patch: [GIT,PULL] Allwinner device tree changes for 6.16
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=963441
  Lore link: https://lore.kernel.org/r/aCaeZJ2t4S_xhgjp@wens.tw

Patch: [GIT,PULL] Microchip AT91 DT updates for v6.16
  Submitter: Claudiu <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=963475
  Lore link: https://lore.kernel.org/r/20250516055330.10852-1-claudiu.beznea@tuxon.dev

Patch: arm64: dts: nuvoton: Add pinctrl
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=963080
  Lore link: https://lore.kernel.org/r/20250515-nuvoton-arm64-dt-v1-1-25769b8c1509@codeconstruct.com.au


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


