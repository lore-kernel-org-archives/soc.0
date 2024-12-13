Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C59175AB
	for <soc@lists.linux.dev>; Fri, 13 Dec 2024 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734109215; cv=none; b=bymlhRz6rwspa85TxBGmp60nHC7MKW3THsDCwb4UBXx1vx3s2NizOEI8j0j9wPVhQkIrTTBjLN5lAi7XtSUtMWZi2v3Chqi9X7u+NLAZknjdbKnXLiyCsTlLvXAdHT6DylPmb7rV/lPw8LiXfKVe7Wb/J3UesfHayY8j464a4vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734109215; c=relaxed/simple;
	bh=LZm80fD+oQCrDRYKotes26M1cudusT86HTv0t+eORy0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=XOBeKRVC9gOr0+ZGM7gromI6XO+jIeWNFUVr1AC84j+KjEQ5KnkzYopOoGeFafD99vBlqtz6pvbcTeKrB49PKoblnwb5H2nTgiKbZ1sz8yVIYrUtcmZpmmXhtyf2kWM+fxHrCg5Rz6Yd2/J4tGU9IHGjduMwddl5LhL2xAkOccM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkZHDyTn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkZHDyTn"
Received: by smtp.kernel.org (Postfix)
	id B201AC4CED6; Fri, 13 Dec 2024 17:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2B7C4CED0
	for <soc@kernel.org>; Fri, 13 Dec 2024 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734109214;
	bh=LZm80fD+oQCrDRYKotes26M1cudusT86HTv0t+eORy0=;
	h=Subject:From:Date:To:Cc:From;
	b=GkZHDyTnkGrbDp4b2JDMIuibJqWoHETHxtI7ylJ7bKcWOvN2W6ANMuuWbnbGGZYry
	 lLuwH7e2Mz/U4fSwoXKDdRw3O3LQtVgEcSuH66x+JAC2kJw8xtNvjEqUxBUu/rd5Mv
	 G7xxBqwyiSftDAC5ObPbFPG+8YUuJKIkt57om0+pwj5HFt0ConvWINlJ+O3DK8mCYu
	 KF/m0R9HNmjYhufSyoBz3fTO7kQ25LZVegYOo6O4WM/PDV8U6m6LT0ztzHurv56T6o
	 iyFqKWYQCOJ5KhSC9pCXmEBcEsCMVjbIF3mA/y8zGk6jFMqME8iWLD/R3PhCdMTMVC
	 HX8vEqd6AHciw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 36A25380A959;
	Fri, 13 Dec 2024 17:00:32 +0000 (UTC)
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
 <173410923097.3098520.4905387470084215560.git-patchwork-summary@kernel.org>
Date: Fri, 13 Dec 2024 17:00:30 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Add support for Blaize BLZP1600 SoC
  Submitter: Nikolaos Pasaloukos via B4 Relay <devnull+nikolaos.pasaloukos.blaize.com@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=914636
  Lore link: https://lore.kernel.org/r/20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com
    Patches: [v5,1/6] dt-bindings: Add Blaize vendor prefix
             [v5,2/6] dt-bindings: arm: blaize: Add Blaize BLZP1600 SoC
             [v5,3/6] arm64: Add Blaize BLZP1600 SoC family
             [v5,4/6] arm64: dts: Add initial support for Blaize BLZP1600 CB2
             [v5,5/6] arm64: defconfig: Enable Blaize BLZP1600 platform
             [v5,6/6] MAINTAINER: Add entry for Blaize SoC

Patch: arm64: defconfig: Enable Amazon Elastic Network Adaptor
  Submitter: Mark Brown <broonie@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=917351
  Lore link: https://lore.kernel.org/r/20241212-arm64-defconfig-graviton-v1-1-86830c3d572b@kernel.org

Patch: ARM: dts: nuvoton: Fix at24 EEPROM node names
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=908603
  Lore link: https://lore.kernel.org/r/20241112002557.26284-1-andrew@codeconstruct.com.au


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


