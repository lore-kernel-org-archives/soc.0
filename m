Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E68DECAAD5
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 15:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A18AC433B5; Mon, 12 Sep 2022 15:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02F7CC433C1
	for <soc@kernel.org>; Mon, 12 Sep 2022 15:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996617;
	bh=Ge3XApvfRTedNBVYd0otMxCQWD/JFgNpx2crEcVLuOw=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=k9yyQNNSbsCLO+L7/4gLEU4w7XZrs/rgH+68o8oK8WPrLe6rkhH64cMUJIUPy64kn
	 UFqu5kxkdUfExRDPiK5j9Y2vSOWySIoJCjX74m5mPjQygx6iF9FkxiSnm50G7crSJL
	 moV6TnX2COUZFi/jKzJFawK90wNYtvYJwT+HNmVSwC55Nnl/BuNxsWh6HdB0ofuRvK
	 wCODC9m5gYHFTZ5wdKZ00rvsiL5A5/F74woDxYFH0y5JFkoNaA8KmoeRqMoO0ivbAN
	 Z9llZYZMFDJ/oKlJo/4AKlHk2+nYuOEY+3iERp+TLj4WDsa9RNccIWB7T9CcEfD+Om
	 tfATwKemZqLvA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CBFBFC4166F;
	Mon, 12 Sep 2022 15:30:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166299661673.5098.13579617060459119173.git-patchwork-summary@kernel.org>
Date: Mon, 12 Sep 2022 15:30:16 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: [PULL,fixes,1/4] dt-bindings: memory-controllers: fsl,imx8m-ddrc: drop Leonard Crestez
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=675752
  Lore link: https://lore.kernel.org/r/20220909153037.824092-1-krzysztof.kozlowski@linaro.org
    Patches: [PULL,fixes,1/4] dt-bindings: memory-controllers: fsl,imx8m-ddrc: drop Leonard Crestez

Patch: [GIT,PULL] Rockchip dts fixes for 6.0
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=675874
  Lore link: https://lore.kernel.org/r/2645885.mvXUDI8C0e@phil


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


