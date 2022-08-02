Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C27C00140
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5BF73C43140; Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4020AC433D6
	for <soc@kernel.org>; Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659450031;
	bh=ysn5tD31vJp3PE8qVYG2PzLMdNd3huRR0YCITjZFa2M=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=gcZOcoSaOypDgMwEXF7heQug/yFQleiPNjjpim4aifv+U/SYtynQ+nzVYw0JCfoK+
	 Mz7J14ZqcVgx5Zmqdxa/jemJYdIm6wGb0jbMzF11VUBYg/iorUSeTB7faRyTuAYZYF
	 LFoIzQg8WoUUCVkAWlm32XDRCz4UynFGK/9tFtQDdx1JB4gClt7oqDf2rM2RSM/8Rw
	 Vj99SiTGmCjvP5JB4q/seuC7Yp0ldYPYoi+ey7R94E2lut712V1Q8J17z6KRisl8yS
	 WKzswDD46by72PEXn2K4ScbZe6ct+0lWoRV04oMgaO9xX/n0BboIXkWei/z32pfaAs
	 cHZgmapaQRXDg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 13055C43142;
	Tue,  2 Aug 2022 14:20:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165945003099.4474.15206268327206663293.git-patchwork-summary@kernel.org>
Date: Tue, 02 Aug 2022 14:20:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: dts: socfpga: dts updates for v5.20, part 2
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=663901
  Lore link: https://lore.kernel.org/r/20220728223237.3184243-1-dinguyen@kernel.org

Patch: [GIT,PULL] Apple SoC DT updates for 5.20
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=664283
  Lore link: https://lore.kernel.org/r/6de8649c-9795-54a1-fa45-8dd50355061f@marcan.st

Patch: [GIT,PULL] Reset controller updates for v5.20
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=664083
  Lore link: https://lore.kernel.org/r/20220729133620.488379-1-p.zabel@pengutronix.de


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


