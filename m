Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB1A3218B3
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080239; cv=none; b=QENBGnouJn8UdIkAHK/psZO02r/XRgr4ZIAOJ+kxQxD0AYMX+knnBVBIYh4IjfCwsf0P+9vJ8kMPvysSefKHrVme5688oln62ZvqwfiBWMUN0YloWyuD+PPHsgEknYON0fbbo767J9w3X37yUvTtGaJktAulU688yaRwZvEdF7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080239; c=relaxed/simple;
	bh=2LXipi5/EceZ0e4FycIx6xxXAKMhojWrlWjf4vr5ToY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=MmCDZTK5CBzMZ6s2oadzvs6pW7l1oeW18u8Na9SD0Ec4YSNy2Rh2rPfc24aistsfaQ/xsITOyBcp+2gPDlp6iv6NXbpCrVnoM9AO40rxLufo79bjRXVG4ZAkCnqcf7T7wCn2axY1G5UssF+iuFjNj2NINdXhHaOy1y2Oi97KN0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oe8CG4Ie; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oe8CG4Ie"
Received: by smtp.kernel.org (Postfix)
	id C72B0C2BC9E; Wed,  1 Apr 2026 21:50:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B15A0C4CEF7
	for <soc@kernel.org>; Wed,  1 Apr 2026 21:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080238;
	bh=2LXipi5/EceZ0e4FycIx6xxXAKMhojWrlWjf4vr5ToY=;
	h=Subject:From:Date:To:Cc:From;
	b=Oe8CG4IeYEy9IAciF9XmoGBWJyCH0P+fqs2CNRH2VmZStq6RKFS58O1IoNAtawW86
	 SimHEGWYMjOGQUqRnHnRCaPsXwG75rm5Kmn7iIv5bv/vfIJBh8Oe5G3y8rIq2JQOr8
	 vook9SsTs3R4oNAeSvmuGVqHNsEcF2R4zrnmDzkgiycviy2F184xgaTEVk9rCIacDQ
	 n/KBDp2R1Vvv0LFyPwA7VHaf/ig56ooYMXL4p/2ltw58QUKMqNWcy1G049mc2Jqfhy
	 25bEuOowvqTsYyqRNn/FsNC6wQBBXy+o8alpZ+pSt+9rddlsYSWyVz3OJQYgo+ki1A
	 hfc5qsN2AzO/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9F543808203;
	Wed,  1 Apr 2026 21:50:22 +0000 (UTC)
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
 <177508022127.3876275.1827677405605908055.git-patchwork-summary@kernel.org>
Date: Wed, 01 Apr 2026 21:50:21 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Renesas SoC fixes for v7.0 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1073950
  Lore link: https://lore.kernel.org/r/cover.1774606482.git.geert+renesas@glider.be

Patch: [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v7.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1075433
  Lore link: https://lore.kernel.org/r/20260331211602.959960-1-andersson@kernel.org

Patch: [GIT,PULL] arm64: dts: socfpga: updates for v7.1, version 2
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1074915
  Lore link: https://lore.kernel.org/r/20260331023618.258887-1-dinguyen@kernel.org

Series: [GIT,PULL,1/4] samsung: drivers for v7.1
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1071664
  Lore link: https://lore.kernel.org/r/20260324125821.59728-5-krzk@kernel.org
    Patches: [GIT,PULL,1/4] samsung: drivers for v7.1
             [GIT,PULL,2/4] arm64: dts: samsung: dts for v7.1
             [GIT,PULL,3/4] ARM: dts: samsung: dts for v7.1

Patch: [GIT,PULL] STM32 DT changes for v7.1#1
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1072820
  Lore link: https://lore.kernel.org/r/6af7bfa8-dd73-4d12-9c3a-b2d62a8e3a38@foss.st.com

Patch: [GIT,PULL] CIX dts changes for v7.1-rc1
  Submitter: Peter Chen <peter.chen@cixtech.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1074421
  Lore link: https://lore.kernel.org/r/acoy5sx8l17P9jaI@nchen-desktop

Series: [GIT,PULL,1/2] Broadcom devicetree changes for 7.1
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1071153
  Lore link: https://lore.kernel.org/r/20260323190239.1890505-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/2] Broadcom devicetree changes for 7.1
             [GIT,PULL,2/2] Broadcom devicetree-arm64 changes for 7.1

Series: Renesas SoC updates for v7.1 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1073951
  Lore link: https://lore.kernel.org/r/cover.1774606536.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM SoC updates for v7.1
             [GIT,PULL,3/3] Renesas DTS updates for v7.1 (take two)

Patch: [GIT,PULL] More Qualcomm Arm64 DeviceTree fixes for v7.0
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1075419
  Lore link: https://lore.kernel.org/r/20260331205318.952913-1-andersson@kernel.org

Patch: [GIT,PULL] arm64: dts: hisilicon dts updates for v7.1
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1075147
  Lore link: https://lore.kernel.org/r/69CBAE1A.4050509@hisilicon.com

Patch: [GIT,PULL] RISC-V T-HEAD Devicetrees for v7.1, part 2
  Submitter: Drew Fustini <fustini@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1074267
  Lore link: https://lore.kernel.org/r/acly+68IaK1lWE2p@x1

Patch: [GIT,PULL] Allwinner Device Tree Changes for 7.1 - Part 1
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1074203
  Lore link: https://lore.kernel.org/r/acktk8WGYYRGjTow@home.wens.tw

Patch: [GIT,PULL] Allwinner Fixes for 7.0
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1074201
  Lore link: https://lore.kernel.org/r/acktHkKlWDUbsE_a@home.wens.tw


Total patches: 17

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


