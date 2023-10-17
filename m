Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6216CDB482
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CCA98C433CC; Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6F02C433C7
	for <soc@kernel.org>; Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697580027;
	bh=RcrvvYwo5LImvPYypw96xMesg6vXfa+iU6QNsCvCupY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=i6UWulyezTBn9j66lqvuyk1oelI2FZQ+vc725WlXAEv3FV1acj60z7LpklzFanPpZ
	 zt3xCWATsQeUALrRIWLAwc8oGFVb4bbUVfKSDPWhX15+TGWhGTwpXftpqat4R9hB+V
	 IrUKR7iPLnlMDB+lOUtoBFinnWbip3xBsJTymjY3NBMbiVUkm1DgRrUwNqNdGgh+ll
	 fsd2hfQCaKWrtYBjDC2qUPnyQOuZy8epX5fVTLE88yiEmAOFhK6ayrkXgPehsmdQBe
	 otIaqxsjOWK8uT1Q9O30RlFfR/TdrQoaqyYSg/aFn4o+JKFSnvGLFGDiZb70tK34V6
	 MRdeNXy4ZmKKg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A3845E4E9DD;
	Tue, 17 Oct 2023 22:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169758002766.24805.3640080467868153608.git-patchwork-summary@kernel.org>
Date: Tue, 17 Oct 2023 22:00:27 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Renesas SoC updates for v6.7 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793000
  Lore link: https://lore.kernel.org/r/cover.1697200117.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.7 (take two)

Patch: [GIT,PULL] ARM: aspeed: defconfig changes for 6.7
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793352
  Lore link: https://lore.kernel.org/r/CACPK8XezpL-4bx0S-9t999_qde5Hik9BnuUZHcnmDHTd0KWBLA@mail.gmail.com

Series: [GIT,PULL,1/4] i.MX dt-bindings changes for 6.7
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793287
  Lore link: https://lore.kernel.org/r/20231015132300.2268016-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/4] i.MX dt-bindings changes for 6.7
             [GIT,PULL,4/4] i.MX defconfig changes for 6.7

Patch: [GIT,PULL] amlogic defconfig update for v6.7
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793449
  Lore link: https://lore.kernel.org/r/2e08bd06-09e0-4352-8207-bc3b5d26fba4@linaro.org

Patch: [GIT,PULL] Rockchip dts fixes for 6.6
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793714
  Lore link: https://lore.kernel.org/r/1965242.usQuhbGJ8B@phil

Patch: [GIT,PULL] Qualcomm ARM64 defconfig updates for v6.7
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793327
  Lore link: https://lore.kernel.org/r/20231015201812.855218-1-andersson@kernel.org

Series: Renesas SoC updates for v6.7
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=788761
  Lore link: https://lore.kernel.org/r/cover.1695985418.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/5] Renesas ARM defconfig updates for v6.7

Series: [GIT,PULL,1/2] ARM: defconfig: pull for v6.7
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793422
  Lore link: https://lore.kernel.org/r/20231016072911.27148-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/2] ARM: defconfig: pull for v6.7


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


