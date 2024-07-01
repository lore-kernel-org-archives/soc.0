Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B801C2BD09
	for <soc@archiver.kernel.org>; Mon,  1 Jul 2024 12:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E7332C4AF0D; Mon,  1 Jul 2024 12:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CACD7C116B1
	for <soc@kernel.org>; Mon,  1 Jul 2024 12:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719838229;
	bh=sZfwut1SO2Xb4POfa6dnExwoa9MdXt0Q5tul8jSh/xA=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=LTIXcaooGNhAYslfBwDPowPcLI5t3nrn3R8VE+Gj/lIMfm94cd60/xUSmNIsL7SUf
	 Es0Z7fRQSesGHgnkL0epseSIL1n09Y6TM+7+FHhS/KbH1aDwBlYjWqiP6bv5X5xloO
	 QEeo1sVYNekAChBKVIgSg5vImyqckE0Xq7ysvy+0q3qqHDPcGVz0zwjvqMbYGL5kx0
	 VEl4yCN5r8F8mkRhXXV/Okb/ACYjoJRAVos7Jfvyg0ih/HV6i3NUKpMFnJ0lC2EdHN
	 3NeuZh2mE+4rnXleemHNKv3UuBd7haOCpN/rhaPFzIkqroNXLSP4hGFI7ZPoM6RZeB
	 doUY/pbHsslzA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BB83FC43446;
	Mon,  1 Jul 2024 12:50:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171983822970.2563.2242915798871332796.git-patchwork-summary@kernel.org>
Date: Mon, 01 Jul 2024 12:50:29 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Rockchip dts fixes for 6.10
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=866320
  Lore link: https://lore.kernel.org/r/10237789.nnTZe4vzsl@diego


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


