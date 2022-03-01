Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB75C433F5
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 12:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2AEC5C340F5; Tue,  1 Mar 2022 12:40:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15297C340EE
	for <soc@kernel.org>; Tue,  1 Mar 2022 12:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646138439;
	bh=2sfFQ3wnCre4olPZ+Lhjkw6BG2B90bIJuI2aYPbbi28=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=hzxCEC+nls85xP0mhRDQ8TeKw3zk3XCCVgbECFNBEexv4Q6jlJ2pQaM7H05uqu4bd
	 yDzy7qN3cjd7HDb3LOE6RCdRhjnYn0B8U+9bsdTFFZH73Z5Prid4LEoYCLwgcOz/72
	 l+73OzvXTar6VqOnZYheKLzdv8R6rZT88+xSoNxrGWB486kWfi4Cm0P4g3agv5n+2/
	 uessWi4ClhW0+slZhl0Zt0SCABa2PeYjr1GGqcMelM68pA1tRfynjnc6gtImQIsR20
	 9OZhEboNn/BvC1k+aXt/XOOXIvAUfwZExQKsg/X9qOPa/yKfzIuV544FYldgW5B+cL
	 paiiHYoNRvPRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E3CC1E6D4BB;
	Tue,  1 Mar 2022 12:40:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164613843887.23712.15805711292402254283.git-patchwork-summary@kernel.org>
Date: Tue, 01 Mar 2022 12:40:38 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL,1/1,RESEND] Broadcom devicetree fixes for 5.17
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=618803
  Lore link: https://lore.kernel.org/r/20220228165537.1950863-1-f.fainelli@gmail.com

Patch: ARM: mstar: Select HAVE_ARM_ARCH_TIMER
  Submitter: Daniel Palmer <daniel@0x0f.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=619149
  Lore link: https://lore.kernel.org/r/20220301104349.3040422-1-daniel@0x0f.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


