Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16761C4167B
	for <soc@archiver.kernel.org>; Fri,  9 Dec 2022 15:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CC329C433F0; Fri,  9 Dec 2022 15:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B52CCC433EF
	for <soc@kernel.org>; Fri,  9 Dec 2022 15:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670599215;
	bh=iohfPUdEfZ5lh5DHTC8E2FKMuc+eVKeYGUmo4u0eV/g=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Z/XSU/3iWRv9jGVa5GjJ9YfzAGllUJ1m5SYFjKS1i1QknnY9ECNOU1zeFwXwYLZKU
	 goy7qajcW9G1IDWTCTS2xFKcXgPDH1IlQ23rtq+8jPCvt2VYuue3BKR7p8J3HZq09r
	 MuWw1X3kJXTBivIw4mEf68j7j3kllOQ/zmv0MQRiiJkorcpnCXCELLDxlo4eIdZ/Gv
	 /VOTM2SlBiECzq/QabHYhQAIBKTG/MtScpjWQ430eR55Bs4tG+UI14Z6srZMxQjUp6
	 RnOQvDc+BZ0RgFOwnRbhR9qRQhw8rwQawhoLscz5nqTXuqPyfC1i9VeSkK0aw7WYvN
	 gXUFLqB4d2+7Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 91F71C433D7;
	Fri,  9 Dec 2022 15:20:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167059921552.15517.1589566917579675919.git-patchwork-summary@kernel.org>
Date: Fri, 09 Dec 2022 15:20:15 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Apple SoC DT updates for 6.2 (v3)
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=703036
  Lore link: https://lore.kernel.org/r/488ad4e9-04dc-1774-3bbe-d313ef30f14d@marcan.st


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


