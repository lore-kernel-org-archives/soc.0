Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26EA7C433FE
	for <soc@archiver.kernel.org>; Tue, 22 Nov 2022 22:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E840CC43470; Tue, 22 Nov 2022 22:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF97BC433D7
	for <soc@kernel.org>; Tue, 22 Nov 2022 22:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669155625;
	bh=d5sACBdSWXfe3Hq7UDO7elNm9H7trTMgztOLYuk3yic=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=YXDSDKSjuuPMZJBYXjct6L1ki9INzABo9+rM6dqiGyd3S1rshgJgEXy+zuPdkvt8H
	 QGqAUAppq8r4cbPud87DnsRc45y9f/d9YTO2cjaFWDGtQOkiGNgnmSh8Ry1RM8EY4j
	 gcrA284C3uMYoLTv/LsB5OAXUEAIH5cg9fectKuGPHoUnZc7xjdqvKvmI1XR7vUwnK
	 EBbhk9rAz+Rv1nPYGVPMpRydllTy74ragJ90pbrhaOwEAqD+/g0Q+i7bg77DgnCwZ/
	 6Sjl5yVdwB12dEImSbEE13mndhCMvA5XYwCjD+BnPr86SfA5OgagJUHb8LcpoI5OSh
	 xnrvodaTeH9nQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BAFFCE270CF;
	Tue, 22 Nov 2022 22:20:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166915562576.11152.10470186940728325086.git-patchwork-summary@kernel.org>
Date: Tue, 22 Nov 2022 22:20:25 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] soc: mediatek: updates for v6.2
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697785
  Lore link: https://lore.kernel.org/r/cc756001-a942-90b0-b79d-62c1fc189828@gmail.com

Patch: [GIT,PULL] amlogic Drivers updates for v6.2
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698142
  Lore link: https://lore.kernel.org/r/7d1ca7f4-b3ae-46df-5b9a-7cba8ac3e512@linaro.org

Series: [GIT,PULL,v2,1/7] soc/tegra: Changes for v6.2-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697747
  Lore link: https://lore.kernel.org/r/20221121171239.2041835-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,v2,1/7] soc/tegra: Changes for v6.2-rc1
             [GIT,PULL,v2,2/7] firmware: tegra: Changes for v6.2-rc1
             [GIT,PULL,v2,3/7] clk: tegra: Changes for v6.2-rc1
             [GIT,PULL,v2,4/7] dt-bindings: Changes for v6.2-rc1
             [GIT,PULL,v2,5/7] memory: tegra: Changes for v6.2-rc1
             [GIT,PULL,v2,7/7] arm64: tegra: Device tree changes for v6.2-rc1

Patch: [GIT,PULL] Qualcomm driver updates for 6.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698222
  Lore link: https://lore.kernel.org/r/20221122202748.1854487-1-andersson@kernel.org

Patch: [GIT,PULL] memory: drivers for v6.2, part two
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=695862
  Lore link: https://lore.kernel.org/r/20221116093509.19657-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] arm: dts: socfpga: dts updates for v6.2
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697734
  Lore link: https://lore.kernel.org/r/20221121163259.341974-1-dinguyen@kernel.org

Patch: [GIT,PULL] arm64: dts: mediatek updates for v6.2
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697791
  Lore link: https://lore.kernel.org/r/8933d687-71f0-e9ad-a7c6-2e5a8993463d@gmail.com

Patch: MAINTAINERS: Add DHCOR to the DH electronic i.MX6 board support
  Submitter: Christoph Niedermaier <cniedermaier@dh-electronics.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=696397
  Lore link: https://lore.kernel.org/r/20221117105131.7059-1-cniedermaier@dh-electronics.com


Total patches: 13

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


