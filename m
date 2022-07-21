Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87082C43334
	for <soc@archiver.kernel.org>; Thu, 21 Jul 2022 13:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F460C341C0; Thu, 21 Jul 2022 13:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39A42C3411E
	for <soc@kernel.org>; Thu, 21 Jul 2022 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658409620;
	bh=knqwpYihPAvSc7QEQGowKpi8a+LBpLNUpGi6JoCO4Q4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=N/ZgPghY53X54eJ+fpEqduGmjest/xXczawKRdPNLPdLk33n0Ga20fKOA4Xm+i1n9
	 5BiMmgT936LVrDJ+S92IV1MUHvK5YrD/LWYlkFyGuJ4pFKTflJYLiHQp1WlMQ7vDg9
	 mRSCfUuK6jUhF/8CliKQyzHi/iGCb4hM2ihQP434jfQ6h7OsrrB7x28qrDTDC/EyTG
	 wEOwyJJ/YTiJPuNC/2W8GmLuxx52CZCkkNuzawDFnQ6za+q9f7xrkdNglszKdL8nBJ
	 BFsdZMwsERgLRdCaCtPOU1Ic9qoHFGuqdnsyN31Bqt0oZdJNGmL0yljkxcwDR1aM/4
	 rFT8+B9JPwsYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1D78ED9DDDD;
	Thu, 21 Jul 2022 13:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165840962006.25771.11030531059517658705.git-patchwork-summary@kernel.org>
Date: Thu, 21 Jul 2022 13:20:20 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: ARM: dts: aspeed: centriq2400: drop the board
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=653056
  Lore link: https://lore.kernel.org/r/20220623072428.33697-1-krzysztof.kozlowski@linaro.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


