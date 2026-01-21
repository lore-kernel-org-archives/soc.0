Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B3D347BDD
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011214; cv=none; b=psRSrTuXN/xhVIA8RsBs+s5thykKaRL2hvXuomy+Kul9ig9/Fg6X9w1oFXGLajozXUqKAX2dXtWl1POwjHwJ9DqGx39gFUFSnaYumpRwh2EzM7lcLjf/Mb9hyQNB6ksYJKK8H1qfnCR5xwe81ozheRjkyH2YssHL3zw0cgFWSJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011214; c=relaxed/simple;
	bh=hBy2HVgTQvQ05hcnMQ2HLYcsUj8uIaduThpijHqFGmE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=ZLbpp4+crFUbR4El4GY5Gdb9UjmtEPFHgC9PKTfYw+BmF98pwIck6OVIawyGBN6E5hyXEoboVlDNSvnuOU3cKFa+w6D6XEzW1cf4Tg3n7teumG21dQ1tF/agfSqRKx7gM1N+QMTTru/EWlLfiSvIIrqatMpal0rBZsIldDTYpO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CHY4Lcb1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CHY4Lcb1"
Received: by smtp.kernel.org (Postfix)
	id 63DDBC19421; Wed, 21 Jan 2026 16:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DBAEC4CEF1
	for <soc@kernel.org>; Wed, 21 Jan 2026 16:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011214;
	bh=hBy2HVgTQvQ05hcnMQ2HLYcsUj8uIaduThpijHqFGmE=;
	h=Subject:From:Date:To:Cc:From;
	b=CHY4Lcb1MkygWtsORgpWSJbCeFr9GKSzYvvWzDCaBi81/zX2BmW3rM0Uj598DjDB8
	 O80+AoIoNiemqM7N79M/qIRtdeHExQxJZ8bMmVVnqSgmmcF9fCmFub9hLRukl7VqSI
	 3b80a14+uaqAGIOtTmASQqbZn9CfdNLOoxYt/1+A8FyMUK2HeweiW1vf4sDQ1cq+5p
	 uzo45zkgkFAiiTLxPxhgIqpz7UZ89A2BwvihHczhiQBhF3gAz/AKMTbxMdFHuXE2xx
	 O9pOLviersWX2BUpoyS53bcaj7UdU9ZMb6MO6waG3X3Px0fTNSxwZpydYa1GoQVjk0
	 4b6nTr51flW5Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8E6463808200;
	Wed, 21 Jan 2026 16:00:12 +0000 (UTC)
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
 <176901121110.951664.3918913049249092298.git-patchwork-summary@kernel.org>
Date: Wed, 21 Jan 2026 16:00:11 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v6.20/v7.0
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1041162
  Lore link: https://lore.kernel.org/r/20260112115021.2551442-3-sudeep.holla@arm.com

Patch: [GIT,PULL] Qualcomm driver updates for v6.20
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1044247
  Lore link: https://lore.kernel.org/r/20260119162201.842771-1-andersson@kernel.org

Patch: [GIT,PULL] OP-TEE update for 6.20
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043646
  Lore link: https://lore.kernel.org/r/20260117120401.GB255115@rayden

Patch: [GIT,PULL] arm64: AMD/Xilinx SOC changes for v6.20
  Submitter: Michal Simek <monstr@monstr.eu>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043989
  Lore link: https://lore.kernel.org/r/CAHTX3dJOkqMPogu=HeBtQuVCK3_-73QPVNPco4dxh3AaOOXUhg@mail.gmail.com

Series: Renesas SoC updates for v6.20 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043268
  Lore link: https://lore.kernel.org/r/cover.1768559762.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas driver updates for v6.20 (take two)

Patch: [GIT,PULL] TEE sysfs for 6.20
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043653
  Lore link: https://lore.kernel.org/r/20260117124413.GA262260@rayden

Series: [GIT,PULL,1/3] soc: ti: Driver updates for v6.20
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1045145
  Lore link: https://lore.kernel.org/r/20260121121353.5yip2gf4bxljosjr@thrill
    Patches: [GIT,PULL,1/3] soc: ti: Driver updates for v6.20

Patch: [GIT,PULL] TEE bus callbacks for 6.20
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043651
  Lore link: https://lore.kernel.org/r/20260117123008.GC255115@rayden

Series: [GIT,PULL,1/4] dt-bindings: Changes for v6.20-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043743
  Lore link: https://lore.kernel.org/r/20260118080304.2646387-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,1/4] dt-bindings: Changes for v6.20-rc1
             [GIT,PULL,2/4] soc/tegra: Changes for v6.20-rc1

Series: Renesas SoC updates for v6.20
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1038602
  Lore link: https://lore.kernel.org/r/cover.1767628163.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.20
             [GIT,PULL,2/3] Renesas driver updates for v6.20

Patch: [GIT,PULL] firmware: arm_ffa: Updates for v6.20/v7.0
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1041160
  Lore link: https://lore.kernel.org/r/20260112115021.2551442-1-sudeep.holla@arm.com

Series: [GIT,PULL,1/5] i.MX drivers changes for 6.20
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1044391
  Lore link: https://lore.kernel.org/r/20260120011221.4387-1-shawnguo2@yeah.net
    Patches: [GIT,PULL,1/5] i.MX drivers changes for 6.20

Patch: [GIT,PULL] QCOMTEE fixes for 6.20
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043644
  Lore link: https://lore.kernel.org/r/20260117115312.GA255115@rayden

Series: [GIT,PULL,1/3] samsung: drivers pull for v6.20/v7.0
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043686
  Lore link: https://lore.kernel.org/r/20260117180406.9361-4-krzk@kernel.org
    Patches: [GIT,PULL,1/3] samsung: drivers pull for v6.20/v7.0

Patch: [GIT,PULL] AMDTEE update for 6.20
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1043652
  Lore link: https://lore.kernel.org/r/20260117123522.GD255115@rayden


Total patches: 17

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


