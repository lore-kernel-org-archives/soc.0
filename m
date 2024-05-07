Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927FAC10F1A
	for <soc@archiver.kernel.org>; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7EA2FC4AF67; Tue,  7 May 2024 09:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 67F8BC2BBFC
	for <soc@kernel.org>; Tue,  7 May 2024 09:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715074839;
	bh=J4iJTcyjH3nY+LQgggVdENy83JKQNmk9LcIvkFZ1oFg=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=B2x6bYxTF3sN55zS9nJNEaIYnRb5IJ+wXmzN6Km76hSs6mlyTvOujJcqNtasOx3yR
	 mfsA3LaYzKX06/Q6dJv3xgFgcOppOs69MC0aRI5246MllWae9YxK2n3JxEht1BaqRi
	 ffuASI1Uy8pukw8HOsRQ4O8KIwVE8sQSUBPA/IBITcsae2bNMQm1qXMPexE9qkgCq6
	 cNq6JjQkWXgRt1F5yznGbhdVA+mHtRGImveMNuR9CTOtpXy6DAE99ZYOwiWKkSIJJP
	 nc8FjU22FspoiYjKPv0h9ZM9LvV3qHLXhACmRXcWF9sdlfEQACt9YAZb//u1d33WiN
	 4oVLEY1yrnaxQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 593AAC43330;
	Tue,  7 May 2024 09:40:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171507483936.24942.10417056067586051238.git-patchwork-summary@kernel.org>
Date: Tue, 07 May 2024 09:40:39 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: dts: samsung: dts for v6.10, part two
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=850456
  Lore link: https://lore.kernel.org/r/20240504121233.7589-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] Rockchip dts64 changes for 6.10 #2
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=850610
  Lore link: https://lore.kernel.org/r/13810480.dW097sEU6C@diego

Patch: [GIT,PULL] amlogic defconfig update for v6.10
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=850163
  Lore link: https://lore.kernel.org/r/13bf8bc4-1cb7-4b94-8c98-9d1cdae5e1f8@linaro.org

Patch: [GIT,PULL] ARM: mvebu: dt64 for v6.10 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=850614
  Lore link: https://lore.kernel.org/r/87jzk8ndyy.fsf@BLaptop.bootlin.com

Patch: [GIT,PULL] RISC-V SoC drivers for v6.10
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=850290
  Lore link: https://lore.kernel.org/r/20240503-mardi-underling-3d81a9f97329@spud

Patch: [GIT,PULL] One more Qualcomm Arm64 DeviceTree fix for v6.9
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=848512
  Lore link: https://lore.kernel.org/r/20240427153817.1430382-1-andersson@kernel.org

Patch: [GIT,PULL] ARM: aspeed: devicetree changes for 6.10
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=850206
  Lore link: https://lore.kernel.org/r/CACPK8Xd2Qc9MQUJ-8GuRjmyU50oMHpmmHPHLqAh9W_1Gyqi2ug@mail.gmail.com

Patch: [GIT,PULL] ARM: mvebu: arm for v6.10 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=850617
  Lore link: https://lore.kernel.org/r/87h6fcndxj.fsf@BLaptop.bootlin.com

Patch: [GIT,PULL] amlogic ARM64 DT updates for v6.10
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=850162
  Lore link: https://lore.kernel.org/r/6030a450-fb4e-4e27-a5c3-6f4e0f326d9a@linaro.org


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


