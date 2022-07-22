Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF9C7C43334
	for <soc@archiver.kernel.org>; Fri, 22 Jul 2022 20:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A1F84C341CE; Fri, 22 Jul 2022 20:50:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85AABC341C7
	for <soc@kernel.org>; Fri, 22 Jul 2022 20:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658523055;
	bh=aLkVtlz9RfZOnnSM/mHJmzWNg2j9h2HFxN60G7p4f4s=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=NGK2nuSBGhHQKHud1cWMyHX/Xrn1H+ndW7breS5u7vPM95IMjBxWhuymDaRO1xVxx
	 7wxcl8tZD3iyhyEkbCcF4fVWJXa3Joc4wa67dOHAMcCA734NJWnEwnA6VAdW98QV8Q
	 WQInDrVloTz65cZdGQg3Sm2+bMyH1G2VmObFiuu1zdizmPlAdj6FAc45vl2Qc2RBb8
	 WaUhwB9Lt0bT8g9Zmrsic0rFLhUvneMoRNoC7KLb6uC5+uiuVNDmuCc2enkAHZoKbS
	 arr+50UgRuJbU2H6n2FXSLsPcEc6dZsQAtYJO9qgBKjIL82N4cseQ9xKbeiE9szsfK
	 PS+j3Fj9AFKdQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5E180E451B3;
	Fri, 22 Jul 2022 20:50:55 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165852305532.6683.13129947881248433452.git-patchwork-summary@kernel.org>
Date: Fri, 22 Jul 2022 20:50:55 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: ARM: pxa2xx: Fix GPIO descriptor tables
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=662221
  Lore link: https://lore.kernel.org/r/20220722114611.1517414-1-linus.walleij@linaro.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


