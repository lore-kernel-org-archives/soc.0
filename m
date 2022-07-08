Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43F34CCA482
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 24FE4C341D0; Fri,  8 Jul 2022 21:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F306C341CB
	for <soc@kernel.org>; Fri,  8 Jul 2022 21:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657314615;
	bh=nqibjT1/2x6dyzrOmNASzA1KNVPPGufr98tdi/EReO4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=p5wI5k8UAhlFJFdupRv2HhCENDusUQl25uP+NQ/UFc7k8xZGV+glXV0THaU9lEJqX
	 OUYVU1GszFSYVNTNUKEwQc5JVu/bbsBtU4xWYphHcRDzLilxT3/ijdasS2nRK9moPv
	 anmEg1yFRCZhr6hsisD/yN4ZxItxspyj5qKqH9hQtQurbwQDq758cwEEfpVPneUZZw
	 vYT+HD76e1ZbTdChrvJ28ylauQsiKdQUFX1/rgmESPMkdOfo84aKVmYfAjiWYhFmjX
	 rjSa7LAEntwSKs53RQ9AkEPmXvoX2Hac4qjZ9PaiFVIjzRu1TjlOxwoxLY3nd8inz4
	 ML6MzLkLT1NpQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E83D9E45BDA;
	Fri,  8 Jul 2022 21:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165731461494.21745.15343157801425647392.git-patchwork-summary@kernel.org>
Date: Fri, 08 Jul 2022 21:10:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] AT91 fixes for v5.19 #2
  Submitter: Claudiu Beznea <claudiu.beznea@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=657903
  Lore link: https://lore.kernel.org/r/20220708151621.860339-1-claudiu.beznea@microchip.com

Patch: [GIT,PULL] TEE Fixes for v5.19
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=657878
  Lore link: https://lore.kernel.org/r/20220708134607.GA901814@jade


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


