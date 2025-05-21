Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F262BD581
	for <soc@lists.linux.dev>; Wed, 21 May 2025 21:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747863009; cv=none; b=DDWC1nhUURrG2jbEdAcZ426wUyCBx7CO5y1dSKS4sQwxfc3Ig0E79EXnlOzMg3SEVZf1IUqEXP179Ql4nylIU34uJDRUBMdvvbBJnqbNhcIbIMUQm5IfmEYOGEXH3aJqrIEITxKybsMTHU7CBSlH8ZmL5aGptSmRfD85Fx0By2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747863009; c=relaxed/simple;
	bh=bWX9lK21rvexjLQHJoC8txVT7NtJ5Q6PxnVfaLkONdo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=nVmf/TOA1m1cSavBCwrTQAJLCOzZjkYoIKVL4m0LAjEV6aAnRLBekp4uwYfI56cFjkg8UDz14PpUzIpt/2kjPLJifnpRFtN0diG4ufBmi0aKmLqvW1YHaaBrw8cAz3Xz702JwxffMK7TlS7WrKN+lEUbj7akddZfKeD4B7I0oqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5BX5Uno; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5BX5Uno"
Received: by smtp.kernel.org (Postfix)
	id E6C53C4CEEA; Wed, 21 May 2025 21:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0DE6C4CEE4
	for <soc@kernel.org>; Wed, 21 May 2025 21:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747863008;
	bh=bWX9lK21rvexjLQHJoC8txVT7NtJ5Q6PxnVfaLkONdo=;
	h=Subject:From:Date:To:Cc:From;
	b=g5BX5UnozzgASnQ4uZ7vqFBo3xZv4Btxb6g0CjDJOByf5II1wWrVWcxFSCjddlLo6
	 HLabrSMa8zv6KxMCfpxN1rkC2vs3Rd19xszYOeHLm8+ctQOZ11+rvR1FMSA6nkPp3p
	 IKHtlsYiC3hNuVchNS94VRL9L6qXjET36iVIjFTPpkkeqp8md2CMZKnBvYDlKTIzeX
	 66b6lwMoRhsl7UXJwN1FI4XEo09XJshpJsaJ+4oVbLjDr1V8E1d4uNL1lYyJ50Tphc
	 D+czbYdn4ZHi2toTLGm4Br42rmxdaRZxkg+eQoUX9xvCH4f50BeAomTIy80L63a9Ch
	 YIRgrdyiMfOFg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEA2F380CEEF;
	Wed, 21 May 2025 21:30:45 +0000 (UTC)
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
 <174786304436.2284637.2446083690641268614.git-patchwork-summary@kernel.org>
Date: Wed, 21 May 2025 21:30:44 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] samsung: drivers part two for v6.16
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=963514
  Lore link: https://lore.kernel.org/r/20250516082037.7248-2-krzysztof.kozlowski@linaro.org

Series: [GIT,PULL,1/3] RISC-V config for v6.16
  Submitter: Conor Dooley <conor@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=963568
  Lore link: https://lore.kernel.org/r/20250516-joystick-mortified-385820b1ad0b@spud
    Patches: [GIT,PULL,1/3] RISC-V config for v6.16
             [GIT,PULL,2/3] RISC-V cache drivers for v6.16

Series: soc: aspeed: Minor fixes for v6.16
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=963076
  Lore link: https://lore.kernel.org/r/20250515-aspeed-drivers-6-16-v1-0-eb467f6b7a7c@codeconstruct.com.au
    Patches: [1/3] ARM: aspeed: Don't select SRAM
             [2/3] soc: aspeed: lpc: Fix impossible judgment condition
             [3/3] soc: aspeed: Add NULL check in aspeed_lpc_enable_snoop()

Patch: [GIT,PULL] RISC-V Sophgo SoC for v6.16
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962632
  Lore link: https://lore.kernel.org/r/MA0P287MB2262B041A26A0F5EAD1E296CFE91A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM

Patch: [GIT,PULL] memory: drivers for v6.16, part two
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=963518
  Lore link: https://lore.kernel.org/r/20250516082415.7871-2-krzysztof.kozlowski@linaro.org

Series: [GIT,PULL,1/3] arm64: dts: Cleanup DTS for v6.16
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962386
  Lore link: https://lore.kernel.org/r/20250513104216.25803-4-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] arm64: dts: Cleanup DTS for v6.16
             [GIT,PULL,3/3] drivers: soc for v6.16

Patch: [GIT,PULL] Amlogic drivers updates for v6.16
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962382
  Lore link: https://lore.kernel.org/r/04908842-4c55-44a0-b74c-3aca82a1f204@linaro.org

Patch: [GIT,PULL] Qualcomm driver updates for v6.16
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962576
  Lore link: https://lore.kernel.org/r/20250513215656.44448-1-andersson@kernel.org

Patch: [GIT,PULL] More Qualcomm driver updates for v6.16
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=964393
  Lore link: https://lore.kernel.org/r/20250520024916.39712-1-andersson@kernel.org


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


