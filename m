Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672D3C10B9
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 20:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781037008; cv=none; b=B5pHKAx3B81K+pPTRmJokwBE7hN30WNuHepJfuj01nmEpHbxIMwQdlRo8iMUhH/LNWih3pgKwTWA7UGMv6qjYNRXH0DRhjAm6Rp5SmbA4LxO2WdzB0xl1gpBpuRsMk29u+qO2fioZYeojp0B7e3UBRzXDUmKRXxZM3iqZjCbdJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781037008; c=relaxed/simple;
	bh=OGpZMrcCwbPJUu45H9zimyOps2zAIcdPpGUVGolAKpc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=Oe+Ckm4mrE7kWnjOSKtSk5svJdOMOR/gOVBQKBV64AbXTOoj9aMzBh/m/SKauzCz259V6VlfB7KR0dZzLHeotxKnbkus08PW/H0SWA1KA3QTZA8hFXuhRZTfLetNeuuk13rvuu7wXe03hvboj78LRKOPr7NP0YEm0XPut50GQHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Suhcof/D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Suhcof/D"
Received: by smtp.kernel.org (Postfix)
	id 8423B1F00898; Tue,  9 Jun 2026 20:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E911F00893
	for <soc@kernel.org>; Tue,  9 Jun 2026 20:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781037006;
	bh=TeLRYYnzNXCSLhJAeqWDLCDvqcI7v2RQZzB+QSFm8G0=;
	h=Subject:From:Date:To:Cc;
	b=Suhcof/Dkey+TPcoC2vMDa6nI7k/nUxck5azwj7ULBW1/zcYj0/Fcso5z4SAtywxX
	 fAEbyeFEMpCbhfKlJuk9e6v/Fp+D1j/srWIgaX5NqbOsvPruxruB0Ar7gPblPPBrgH
	 w/1ehUqmqqPZcIoRcilR4i/blSY1T+Ba93PpcGDfgmkqkqtOlX4tkDHbbeEHOu7vge
	 Stk5Ry2IE+39Ptb12GJPHXLLn5hRILqrxW1OcLd7jHIBzj9cJBPvlGNwwwRRarL3Fp
	 gxkc9yX+xS8LGqoP6+caWvyR0ggVJLvjSIFIijX5/mGRoIOeDdRj2Ig2IWcpNKBuUP
	 MAcHN1JiJd4/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D30213930A09;
	Tue,  9 Jun 2026 20:30:05 +0000 (UTC)
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
 <178103700450.2631762.1089884805030997039.git-patchwork-summary@kernel.org>
Date: Tue, 09 Jun 2026 20:30:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Microchip ARM64 device tree updates for v7.2
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1108347
  Lore link: https://lore.kernel.org/r/20260609074103.814073-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] ARM: dts: OMAP updates for v7.2
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1107967
  Lore link: https://lore.kernel.org/r/7hqzmhm54g.fsf@baylibre.com

Patch: [GIT,PULL] Microchip AT91 device tree updates for v7.2
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1108346
  Lore link: https://lore.kernel.org/r/20260609073939.813573-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] ARM: mvebu: arm for v7.2 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1106710
  Lore link: https://lore.kernel.org/r/87zf19atxc.fsf@BLaptop.bootlin.com

Series: Introduce ASPEED AST27xx BMC SoC
  Submitter: Ryan Chen <ryan_chen@aspeedtech.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1108231
  Lore link: https://lore.kernel.org/r/20260609-upstream_ast2700-v9-0-f631752f0cb1@aspeedtech.com
    Patches: [v9,1/4] dt-bindings: arm: aspeed: Add AST2700 board compatible
             [v9,4/4] arm64: configs: Update defconfig for AST2700 platform support


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


