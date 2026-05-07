Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D74C3F20EF
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159211; cv=none; b=G1/599NqN4FgOVv49E92tziGEXpPv87k+3JUUuXuvwO49N2LpKZ0FCQeEGbrN+pKBepXa8pGCJTm9aMPKNsC2e9uewfOgcZEuEMs+/Q/cADOLwOqoZ2m4zvrDwQxiXoCIKmyt5oUKWI3wLqc9UeMsS+AzGpDdoWgFcHVi9SmDVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159211; c=relaxed/simple;
	bh=yCcSo08p6T88kEAtlpc6xe2HZat7sJpZtchN8FUJVfg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=HSlIuKcxadtK0ZO8r/LVFZMEMHhRwvbs6qstAXLryHlpm3ECLOvdcDazq+MUlL/KK2utAqrVeNSE2ILEsbZ+c3lAdyUrI8uMBr3oX1fVkkMlUov3DiWu0kd8QnN2B32nSDONCPfvvksKaKZn/M8UNsnq3nPN+EDuezVHusQlko4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rn2Y95sd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rn2Y95sd"
Received: by smtp.kernel.org (Postfix)
	id AFD77C2BCC7; Thu,  7 May 2026 13:06:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F17C2BCB8
	for <soc@kernel.org>; Thu,  7 May 2026 13:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159210;
	bh=yCcSo08p6T88kEAtlpc6xe2HZat7sJpZtchN8FUJVfg=;
	h=Subject:From:Date:To:Cc:From;
	b=Rn2Y95sdHkT1+xprU38T+QSX+bzodyF49ef8HjdmzIP8VbYtd3gHlkq6+9mAuz0yB
	 RgNPZsGdP2aXhw1q40ORhTrrzYl48nU1jlk+4jB58s7sYp0ltGs3U/wbtieRWQ8p31
	 ZyF0+XNco2aB2jv4arcbLO1+lCSihVQMp4pooRvCbZofB6+GdFMG0wZySPl1B8DIyL
	 iNd+/+YGN41bMpcKeIv/UaSEQZFNreZXXaeK1NhX7NE7mTnG2+BoSZvFRa+r0HZUB+
	 yg3Ts3LMjzfoHGGNW0L0JIiXdNy0Y2E+ROf1Er1J6otCsYEs94orbWlp7yhx1PK5XX
	 ewjhONoNIz+8Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0589C39308FD;
	Thu,  7 May 2026 13:06:01 +0000 (UTC)
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
 <177815915951.3933061.10513930282910385083.git-patchwork-summary@kernel.org>
Date: Thu, 07 May 2026 13:05:59 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: ARM/Realtek: Add maintainers and pinctrl support for RTD1625
  Submitter: Yu-Chun Lin <eleanor.lin@realtek.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1089830
  Lore link: https://lore.kernel.org/r/20260505103955.1010130-1-eleanor.lin@realtek.com
    Patches: [1/3] MAINTAINERS: Add maintainers for ARM/REALTEK ARCHITECTURE
             [3/3] ARM: realtek: MAINTAINERS: Include pin controller drivers

Patch: ARM: integrator: Fix early initialization
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1090092
  Lore link: https://lore.kernel.org/r/20260505-integrator-fixes-v1-1-56ab9aac59db@kernel.org

Patch: [GIT,PULL] firmware: arm_ffa: Fixes for v7.1-rc1(Round 2)
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1090667
  Lore link: https://lore.kernel.org/r/20260506194602.3474096-1-sudeep.holla@kernel.org

Patch: [GIT,PULL] Renesas SoC fixes for v7.1
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1089275
  Lore link: https://lore.kernel.org/r/cover.1777899408.git.geert+renesas@glider.be


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


