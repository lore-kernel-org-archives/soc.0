Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43513315D53
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 22:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081425; cv=none; b=s7sjOXJwAu/yOzDhM/E0Q2yT8pTNBLJPeT7lckVbn3/Men17YDKcXP4J+6vpS8Dp+/0vSTgC1OWUefZ/YtyFpiXc5aeCSWD7eX+IQwyLMi4HdehGNUbsSXVpRdsUW3KOhN+dMvVmPRTiXe20ibwpBXaQthRClrgk5etNd32hxT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081425; c=relaxed/simple;
	bh=KV1NR3gVmXtNxvLnmxz96u1USMR3ArBbNmCBON38ZLE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=MtsR0UENauishWZsgA3jqvtY91+KIZORc/8lhwJe+acU6WIhyPER7qmcNNNOaQvuXyI1JU3bzLwT2u+k5FrT9Rhnt0ay0FS5ZmZG4ZcRHKKlu+98uqKFZpSw0sDuPrKMpKRoAZb9yK5arK/vl1IggCh2Sxnr3MoCFE/+1/P4Diw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s1uzh4nj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s1uzh4nj"
Received: by smtp.kernel.org (Postfix)
	id E0D9EC2BC9E; Wed,  1 Apr 2026 22:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB342C4CEF7
	for <soc@kernel.org>; Wed,  1 Apr 2026 22:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775081424;
	bh=KV1NR3gVmXtNxvLnmxz96u1USMR3ArBbNmCBON38ZLE=;
	h=Subject:From:Date:To:Cc:From;
	b=s1uzh4njRxEW1QMx4JIV8M3zcdb1Jp72yHhYJU8CL9fVQDQAbefm0Zn3unbs9ckr5
	 aqcL7AzAjwgyDrhZFbQwqcgyME+JLYDFaxNFgfmVEGjSPf1/DMC4hdHsTBCjs7ZM/e
	 jOk5Ukb/yb1/X3XLMNhgKvBXQ4olwwi/jx44ntSZ4QkWeTjgq0T1+0y+oGKHVlp4Z1
	 QgjNuD2bB5C7TGu/GYSZ5J+6rdTJlv2UOh5+iJN6if+ryq8aVdHb0K5RcIplVVCFZ7
	 UX464i8g9PQPWeqMObgxXotl45XaOCXTGTuPjzrtWegqdne8S2/GF0Bj/UWOAGw76u
	 Ef8pYMDiaprHw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BC9773808203;
	Wed,  1 Apr 2026 22:10:08 +0000 (UTC)
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
 <177508140732.3882930.3492108029950223302.git-patchwork-summary@kernel.org>
Date: Wed, 01 Apr 2026 22:10:07 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4] samsung: drivers for v7.1
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1071664
  Lore link: https://lore.kernel.org/r/20260324125821.59728-5-krzk@kernel.org
    Patches: [GIT,PULL,1/4] samsung: drivers for v7.1
             [GIT,PULL,4/4] ARM: samsung: mach code for v7.1

Patch: [GIT,PULL] OP-TEE update for 7.1
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1073575
  Lore link: https://lore.kernel.org/r/20260327131909.GA3249645@rayden

Patch: [GIT,PULL] STM32 Bus firewall for v7.1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1072815
  Lore link: https://lore.kernel.org/r/c1de351b-6272-4903-8231-d92e5190a60c@foss.st.com

Series: Renesas SoC updates for v7.1 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1073951
  Lore link: https://lore.kernel.org/r/cover.1774606536.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM SoC updates for v7.1
             [GIT,PULL,2/3] Renesas driver updates for v7.1 (take two)

Patch: [GIT,PULL] TEE update for 7.1
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1073573
  Lore link: https://lore.kernel.org/r/20260327131407.GA3248701@rayden

Patch: [GIT,PULL] firmware: arm_scmi: Updates for v7.1
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1072415
  Lore link: https://lore.kernel.org/r/20260325160104.4115956-1-sudeep.holla@kernel.org

Patch: [GIT,PULL] memory: drivers for v7.1
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1071677
  Lore link: https://lore.kernel.org/r/20260324132028.65350-2-krzk@kernel.org

Series: [GIT,PULL,1/4] i.MX arm64 dts changes for v7.1
  Submitter: Frank Li <Frank.Li@nxp.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1074637
  Lore link: https://lore.kernel.org/r/20260330141444.3789193-1-Frank.Li@nxp.com
    Patches: [GIT,PULL,3/4] i.MX dt binding changes for v7.1
             [GIT,PULL,4/4] i.MX drivers/soc changes for v7.1

Patch: [GIT,PULL] hisilicon: driver updates for v7.1
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1073355
  Lore link: https://lore.kernel.org/r/69C62EBA.6000608@hisilicon.com

Patch: clk: spear: fix resource leak in clk_register_vco_pll()
  Submitter: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1072075
  Lore link: https://lore.kernel.org/r/20260325062204.169648-1-lihaoxiang@isrc.iscas.ac.cn


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


