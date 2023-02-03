Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14888C636D6
	for <soc@archiver.kernel.org>; Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB80DC433A1; Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2EFDC433D2
	for <soc@kernel.org>; Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675434644;
	bh=VhKy0kPccqAgQXIZX6KCl0oi0yLX605IZOTjQXMuYdE=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=FhrHpCgAMIjWjkTB9Hw8UiIDf+QsE1Fo8xwshtARmvrcD7Vf78on1CZx1zoZlW9XX
	 cNjozllwpnzhyLOX9vOSRIUPK5v+vNw7et3kpy/dV2tLwqpNx1gl62AWOKMTwESl0g
	 yv9sQOrg+1dB0YIgYswCe7BHvyuUvZkCPdH4I50KKiJdjyfC75Xe5rVxszsS/S2qWz
	 gU+o33I1X/sFqUTZfxVhaA1Av2Pp/6sX3TCsq9KAXirEUHoKsDDCcVvl8MXMCaFJp8
	 mmxby6fhYW6XdZQPEf7oR/fKKwu9AWKLy4hkFOVz8xvfXR7F+x6VXF3FKEUBBA1IBX
	 uktUCV7++0bPw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97E43E270C4;
	Fri,  3 Feb 2023 14:30:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167543464453.16250.11921894033009642538.git-patchwork-summary@kernel.org>
Date: Fri, 03 Feb 2023 14:30:44 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: dts: mediatek updates for v6.3
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=717842
  Lore link: https://lore.kernel.org/r/2eefe6d4-6ca3-dc5f-6a04-f4f3c49692dd@gmail.com

Patch: ARM: configs: multi_v7: enable NVMEM driver for STM32
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=718145
  Lore link: https://lore.kernel.org/r/20230202130040.25233-1-alexandre.torgue@foss.st.com

Patch: [GIT,PULL] ARM: mvebu: dt64 for v6.3 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=718222
  Lore link: https://lore.kernel.org/r/87zg9w9j6l.fsf@BL-laptop

Patch: [GIT,PULL] soc: mediatek: updates for v6.3
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=717846
  Lore link: https://lore.kernel.org/r/396d51fc-81f3-4a2b-d7a7-b966bfe3002a@gmail.com

Patch: [GIT,PULL] Rockchip dts32 changes for 6.3 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=717920
  Lore link: https://lore.kernel.org/r/5651506.31r3eYUQgx@phil

Patch: [GIT,PULL] ARM: dts: mediatek changes for v6.3
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=717835
  Lore link: https://lore.kernel.org/r/17aee808-1f3f-fe75-68d4-adb71915e5cb@gmail.com

Patch: [GIT,PULL] defconfig: mediatek updates for v6.3
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=717832
  Lore link: https://lore.kernel.org/r/2330b914-8a8e-8bf3-e98e-88d713c5224d@gmail.com

Patch: [GIT,PULL] ARM: mvebu: dt for v6.3 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=718221
  Lore link: https://lore.kernel.org/r/87357oaxs0.fsf@BL-laptop

Patch: [GIT,PULL] Rockchip dts64 changes for 6.3 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=717919
  Lore link: https://lore.kernel.org/r/6491956.DvuYhMxLoT@phil

Patch: [GIT,PULL] STM32 DT changes for v6.3 #1
  Submitter: Alexandre Torgue <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=718141
  Lore link: https://lore.kernel.org/r/3e815504-e85e-cbd3-6e6d-4e5a7aa7469a@foss.st.com


Total patches: 10

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


