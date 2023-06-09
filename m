Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76C6C7EE29
	for <soc@archiver.kernel.org>; Fri,  9 Jun 2023 13:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AFC64C433A0; Fri,  9 Jun 2023 13:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AEB3C4339C
	for <soc@kernel.org>; Fri,  9 Jun 2023 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686316820;
	bh=NRH6tmnHiHqEeVkZBCsx/K29ytFDvoj9iKHIjW8Q8QM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=h2a/LRQQK57Z7l5ibA3LYBH+v4mhyoLONGoszBEZaD+T2hwS9BjBImGJHDp9t4rEn
	 31QED6BGVXYCH68NOQbyjnsCTvbKmIt7td1FTRoOfbZJmI9P1H78iyv6wXkWX5y1SG
	 kADnohFzkHlXehGeI7q++YNCFCFDk8uKyGcAZoBQ7GWGn26R1260D4UxRTlhYHx3Al
	 wGy20+Pg/N4tlgQv1BrhuwSc2lT+UtMzIzMFAjOGqerx1eAGJ/7hFo5zCr75CJJ7ZF
	 vKHAzU3ZRlRC00BWeh5/F5OLgTaMeESkDbeAqQr+/EyGa8G3FIxzkveomcpygS94sN
	 7nwTJDuLtLjnw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 70BB4C43143;
	Fri,  9 Jun 2023 13:20:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168631682040.6872.13040988949132655903.git-patchwork-summary@kernel.org>
Date: Fri, 09 Jun 2023 13:20:20 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/3] samsung: drivers for v6.5
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=753442
  Lore link: https://lore.kernel.org/r/20230602091501.15178-1-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/3] samsung: drivers for v6.5
             [GIT,PULL,3/3] ARM: samsung: soc for v6.5


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


