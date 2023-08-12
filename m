Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D253C41513
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1F483C433C7; Sat, 12 Aug 2023 12:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08643C433C9
	for <soc@kernel.org>; Sat, 12 Aug 2023 12:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691844622;
	bh=oLPnY2vH+G6IDtewNqg7LHmmpnIDDbNfN0Ft4N6iffM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=SQxK3shltBiFqQxEkUOzbNV5vEmIR5E8jK8FQRCXg6gvRswXKMRqidJehCmat2p6e
	 ml4YM0x2qC3Ax2ZGMpadPS4Un53vAARZ/9v40LcpO9U0b4hj265ivWWFyk047/IQmc
	 1Mvt3VEMopEan4rHyat7K8TuomjU0nk+8pK9otQksaNf+yZQUQMy1GFQ/2wGYjihbZ
	 cLpAO2n618b13jSu5+NZMh6birIDNxZ1eAu2l4narm8e9jsBLBpsJVoZVyp7rI/B4L
	 a40p0JSxLrmR2mu6HZiq4onQ2I7O/eN4C6Q1engutaCB0ZZLQsYVwsKnTCk+zXNGWH
	 CfBp5sYFy9cbA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C8A60E505D5;
	Sat, 12 Aug 2023 12:50:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169184462171.4542.12588409218174535664.git-patchwork-summary@kernel.org>
Date: Sat, 12 Aug 2023 12:50:21 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [v2,resend] ARM: dts: nuvoton: Fix pca954x i2c-mux node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=766512
  Lore link: https://lore.kernel.org/r/0e5625985cecd70e0f766da8eace6c6f7ae3192e.1689600667.git.geert+renesas@glider.be

Patch: Documentation/process: maintainer-soc: document dtbs_check requirement for Samsung
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=764725
  Lore link: https://lore.kernel.org/r/20230712084131.127982-1-krzysztof.kozlowski@linaro.org

Patch: [v2,resend] ARM: dts: aspeed: Fix pca954x i2c-mux node names
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=766511
  Lore link: https://lore.kernel.org/r/11a017bc452503cd391a17df3f029177f3e8e2d8.1689600517.git.geert+renesas@glider.be

Patch: [GIT,PULL] arm: soc: hisilicon updates for v6.6
  Submitter: Wei Xu <xuwei5@hisilicon.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=772929
  Lore link: https://lore.kernel.org/r/64CC9D9F.6040108@hisilicon.com

Series: [v3,1/3] MAINTAINERS: soc: reference maintainer profile
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=768641
  Lore link: https://lore.kernel.org/r/20230723131924.78190-1-krzysztof.kozlowski@linaro.org
    Patches: [v3,1/3] MAINTAINERS: soc: reference maintainer profile
             [v3,2/3] Documentation/process: maintainer-soc: add clean platforms profile
             [v3,3/3] MAINTAINER: samsung: document dtbs_check requirement for Samsung

Series: [GIT,PULL,1/4] Devicetree binding changes for omaps for v6.6
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=774861
  Lore link: https://lore.kernel.org/r/pull-1691658952-110529@atomide.com
    Patches: [GIT,PULL,1/4] Devicetree binding changes for omaps for v6.6
             [GIT,PULL,2/4] Maintainer file list update for omaps for v6.6


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


