Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8A1324B19
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 14:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946608; cv=none; b=K1WXzuZ6qtq+8NpK8J3bAXROu6brH/NLSdY1DtRfsg0EpfvF7jFsX6gJObKjb1h2kReUBKNCwqyyiCkgdSi8O1NRUt9V6MH+0dleyoJx0FnNY/4ScdIy9Xgx8KW1mZH5SenPGciYROcO93XWxMJuyMwvtFvNWY9W0dAKfuzb7sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946608; c=relaxed/simple;
	bh=HVO80nYkqnI+A9EC4IvXtZ8PCgkG9oDt8ArXROjqgf0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=ZMh4QF7y32aBMS9Ma0OO0gx3oKXEwzc3Tcd6pzNCGA9Mf0nQSpU/jRqCA3tu9u8dI3V3Ip1mp/Lh4Ey2dbI9977g/o5dhXsB6Ev3EjPV+bm5pCFddpgMJ32SPJS/B3Kju+ibxDG0GphR9XUZwatNiTzHjj4sKJaW7ctQQpK5Rt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcCLhreh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcCLhreh"
Received: by smtp.kernel.org (Postfix)
	id 3B67AC4CEF9; Mon, 15 Sep 2025 14:30:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25BFFC4CEF5
	for <soc@kernel.org>; Mon, 15 Sep 2025 14:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946608;
	bh=HVO80nYkqnI+A9EC4IvXtZ8PCgkG9oDt8ArXROjqgf0=;
	h=Subject:From:Date:To:Cc:From;
	b=tcCLhrehb1MnGY46UNrzkOq4bsFz7tPZP4njvlqz2BgZAtplNrf7ennjlvJ5/qa5n
	 Hw2bHnFHJHyHl65GnwcnYaftJirFx7aS5pJ0K/BuUPGQh2tQA70K7IgODR+mtn++mQ
	 AXG8iGW25IqRMcV7LitcLaaQi1iSn4+XVgRFvScuj1tW+DuugHvpmp8SE2llf254lu
	 OAFVVkkUn9kIGkNXX22Y8Bzn6b4t7GTN/l4kj3sgUOKy1lpQVYiY4+pbI+kJCnL7jt
	 0KEwMbgiH5CZR0MVbgyW/xWUa5uyeRpoF8jQURFRwXEuBei5ZOPnBoDAJB/Twu/l3d
	 TSkfw/NoMVXyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1C0039D0C18;
	Mon, 15 Sep 2025 14:30:10 +0000 (UTC)
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
 <175794660935.4799.16187376283506304767.git-patchwork-summary@kernel.org>
Date: Mon, 15 Sep 2025 14:30:09 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v6.18
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1002410
  Lore link: https://lore.kernel.org/r/20250915101341.2987516-1-sudeep.holla@arm.com

Patch: [GIT,PULL] TEE use SHA-1 library for v6.18
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001676
  Lore link: https://lore.kernel.org/r/20250912091611.GA1442659@rayden

Patch: [GIT,PULL] Qualcomm driver updates for v6.18
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001521
  Lore link: https://lore.kernel.org/r/20250911215017.3020481-1-andersson@kernel.org

Series: [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 6.18
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001054
  Lore link: https://lore.kernel.org/r/20250910171910.666401-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/4] Broadcom defconfig-arm64 changes for 6.18
             [GIT,PULL,4/4] Broadcom drivers changes for 6.18

Patch: [GIT,PULL] ARM: microchip: SoC updates for 6.18 #1
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1002469
  Lore link: https://lore.kernel.org/r/20250915123548.13722-1-nicolas.ferre@microchip.com

Patch: [GIT,PULL] TEE improve sysfs for 6.18
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001672
  Lore link: https://lore.kernel.org/r/20250912091000.GA1441709@rayden

Patch: [GIT,PULL] Reset controller updates for v6.18
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=998939
  Lore link: https://lore.kernel.org/r/20250904154135.2385905-1-p.zabel@pengutronix.de

Series: [GIT,PULL,1/4] dt-bindings: Changes for v6.18-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1002132
  Lore link: https://lore.kernel.org/r/20250914063927.89981-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/4] dt-bindings: Changes for v6.18-rc1
             [GIT,PULL,2/4] soc/tegra: Changes for v6.18-rc1

Series: Renesas SoC updates for v6.18 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001732
  Lore link: https://lore.kernel.org/r/cover.1757669912.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas driver updates for v6.18 (take two)

Patch: [GIT,PULL] TEE protected DMA-bufs for v6.18
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001713
  Lore link: https://lore.kernel.org/r/20250912101752.GA1453408@rayden

Patch: [GIT,PULL] samsung: drivers for v6.18
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001810
  Lore link: https://lore.kernel.org/r/20250912135448.203678-2-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] hisilicon: driver updates for v6.18
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001560
  Lore link: https://lore.kernel.org/r/68C376C4.2030808@hisilicon.com


Total patches: 14

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


