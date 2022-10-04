Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6343C433F5
	for <soc@archiver.kernel.org>; Tue,  4 Oct 2022 20:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 98418C433D7; Tue,  4 Oct 2022 20:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80948C433D6
	for <soc@kernel.org>; Tue,  4 Oct 2022 20:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664916615;
	bh=IWaK72bGe4X6xMQwsMa9eGZV5HQQZfNgD2OPBXYR/6M=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=PEkcs1y718zK9n/pGMLJ0GpICnfFt2WOSZpmFKUWu5ikmUoKDhiZCI6sgv+viCaBa
	 lWePsQfOO11ZB4Od5oVGYCdR38Y+m5BE+9HkDtM83inZ2PSrUhVpYZmufPTgLfw/jQ
	 t2wyXzCx5WVWfkW7l/Js0Z0sm+imwkZ+mpsdgyU1plMyaOO0CCgmLLgIzIT5VaZ0G6
	 +RmXQfU9wePsMinaM1fQzkD5VIWGuPuxbe29vfk/8YtiW6jfWn1oVo79Mi6QUekbAQ
	 2NmnyoiiLD7Yax0l8+4bLI513ekLjLAKH/hU5mraMDdBuiPWM4J/fBYFv/Z57Adixb
	 ba4+VrddAWJKw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6C63DE21EC2;
	Tue,  4 Oct 2022 20:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166491661539.26031.14665175727362339548.git-patchwork-summary@kernel.org>
Date: Tue, 04 Oct 2022 20:50:15 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM/arm64: dts: samsung: Late round for v6.1
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=682699
  Lore link: https://lore.kernel.org/r/20221003073916.12588-1-krzysztof.kozlowski@linaro.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


