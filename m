Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10BC4C41513
	for <soc@archiver.kernel.org>; Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9200C433CB; Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE59FC433C7
	for <soc@kernel.org>; Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692051635;
	bh=hoSARtFVVVyFYOouL4/UiKwgH2t2WDhowvM/FZy1F0c=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=JxjFoDQCIvggUM7l9mQfZYJBrBWaeGkgrNJKRHqy1yVnZr420b4dlVnDrLE2uWpQz
	 Ck2OaM9zdR/p+OSBshYsw4TKb7vnWpebuZIBJgPXCls9VHLkfp/2aPix7mEidnGfXN
	 0KJX9X0ZPK78VokZTqBW6ALz7aHfbFq4IoXubQPs1DQba5JkwvEojKD5UNuK79l22q
	 js3MQad24sj9an+YOlwc9PQcs/CaYm5JcIEJcF4yncbojg4mGzDpa0xxAhaCvVx/z1
	 ZDQQPMp2ERhmXDuRraSDeQhA4Ul01+tFoSAYIjPVuxlJ/GRQdMyIzJOECN8twteAed
	 MIuLl3tNPpKow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9D150E93B32;
	Mon, 14 Aug 2023 22:20:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169205163559.23017.2741303418377613535.git-patchwork-summary@kernel.org>
Date: Mon, 14 Aug 2023 22:20:35 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4] soc: ti: Driver updates for v6.6
  Submitter: Nishanth Menon <nm@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=776030
  Lore link: https://lore.kernel.org/r/20230814160633.my3xbk5k2pxkvjyi@degrease
    Patches: [GIT,PULL,1/4] soc: ti: Driver updates for v6.6
             [GIT,PULL,3/4] arm64: dts: ti: Updates for v6.6

Patch: [GIT,PULL] arm64: dts: various cleanup for v6.6
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775931
  Lore link: https://lore.kernel.org/r/20230814114154.26017-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] RISC-V Devicetrees for v6.6
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775718
  Lore link: https://lore.kernel.org/r/20230813-naturist-fragment-ac7d10c453ba@spud

Series: [GIT,PULL,1/6] i.MX drivers update for 6.6
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775738
  Lore link: https://lore.kernel.org/r/20230813133354.847010-1-shawnguo@kernel.org
    Patches: [GIT,PULL,1/6] i.MX drivers update for 6.6
             [GIT,PULL,3/6] i.MX dt-bindings update for 6.6
             [GIT,PULL,4/6] i.MX ARM device tree change for 6.6
             [GIT,PULL,5/6] i.MX arm64 device tree chanage for 6.6

Patch: [GIT,PULL] Allwinner device tree changes for 6.6 - part 2
  Submitter: Chen-Yu Tsai <wens@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=775733
  Lore link: https://lore.kernel.org/r/ZNjRV0kJ7v7+DAH5@wens.tw


Total patches: 9

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


