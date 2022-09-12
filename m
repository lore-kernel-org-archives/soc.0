Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C31DC6FA91
	for <soc@archiver.kernel.org>; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3B74FC43142; Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25932C43145;
	Mon, 12 Sep 2022 15:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662996625;
	bh=S5OtpDwazpFpPFyAudvD0pIJiT9I4H3cK0/scJQC4po=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=IBSY3AGItK0dTcDbHCc1KBPqu9AUqI4Hy5TljXfgSN2MUzr8IjDRUrjxfdpS81ZQa
	 MeAjXtjyLcxFF2TNDeHoOQOLFmtd5n5VbW77u41/B9xMXtElkJ3ZkOhGXhh+2TfEQu
	 71DoauSIVCBonYQoDTcdLxuR4cq+qIjxyABXqjSsxSXLBl25lU5V+FTNygMZjkIzxq
	 iH1dHVqllsbPi5hxxGM6S6kstIWubOvPpYLQEGFnkiWfMJQZKpqNqJBYSReaUIcy5/
	 XYSjpp2DaqFixaQzC5jLJom4GWKf76RpxkAe8Yurs7am7d6OoadvUehN6kLzwXeZkp
	 Geahug6mlgN2Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ED281C73FFA;
	Mon, 12 Sep 2022 15:30:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH PULL fixes 1/4] dt-bindings: memory-controllers:
 fsl,imx8m-ddrc: drop Leonard Crestez
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166299662496.5098.1124394949458463107.git-patchwork-notify@kernel.org>
Date: Mon, 12 Sep 2022 15:30:24 +0000
References: <20220909153037.824092-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220909153037.824092-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  9 Sep 2022 17:30:34 +0200 you wrote:
> Emails to Leonard Crestez bounce ("550 5.4.1 Recipient address rejected:
> Access denied:), so change maintainer to Peng Fan from NXP.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Link: https://lore.kernel.org/r/20220817065946.24303-2-krzysztof.kozlowski@linaro.org
> Acked-by: Peng Fan <peng.fan@nxp.com>
> 
> [...]

Here is the summary with links:
  - [PULL,fixes,1/4] dt-bindings: memory-controllers: fsl,imx8m-ddrc: drop Leonard Crestez
    (no matching commit)
  - [GIT,PULL,2/4] memory: drivers for v6.1
    https://git.kernel.org/soc/soc/c/d551bdf349ba
  - [GIT,PULL,3/4] memory: brcm for v6.1
    https://git.kernel.org/soc/soc/c/4da90678a686
  - [GIT,PULL,4/4] memory: mediatek for v6.1
    https://git.kernel.org/soc/soc/c/c457d9a580fb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


