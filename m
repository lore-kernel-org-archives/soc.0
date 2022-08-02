Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12793C19F2C
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 14:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C8008C43470; Tue,  2 Aug 2022 14:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2BEEC433D6
	for <soc@kernel.org>; Tue,  2 Aug 2022 14:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659448829;
	bh=0MBBp33Br7Ge8v4EOtV4wdtmZnPSwJlzHHOyOXtLwRg=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=DWTui3frPidfJ0HOSW5Jd7zQZhJ92V4Fl43qzhg/NDO9DLIanKpTnMvObpivJEpuw
	 vyHfWDZVCFQark4qeLVnko21PxVQyryPYz19XrXmaoIdixlfyEcBvn8FxC54J0HFuH
	 kZz8LR8THHAhQKIjot8sMOuM5wxGtVSOwTs3jgW79Ilm2aZRmbMwCUh6pIPDWhWbRf
	 zRztsPf1nzT/N7GfMhxjm6aVxEU9f8hkYuJV2WrqvANXGWaPU9QefNshxVJFiBL6Qe
	 vELKC/HHNaT3kN7si9B/qZ5p+UjfkvReD5XUTZZKVzylnre4W9lndE3KswTsjjxxSt
	 tkTkrYuqZDPwQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8F153C43140;
	Tue,  2 Aug 2022 14:00:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165944882951.23404.14338021131471436879.git-patchwork-summary@kernel.org>
Date: Tue, 02 Aug 2022 14:00:29 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] ARM: SoC fixes for 5.19, part 4
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=663466
  Lore link: https://lore.kernel.org/r/CAK8P3a3PK8+V7N2rNiD2VvygUwtJmY1rs1JCAGiUeDsQB6=f1A@mail.gmail.com

Patch: [GIT,PULL] Apple SoC MAINTAINERS updates for 5.20
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=664284
  Lore link: https://lore.kernel.org/r/308defdf-8873-63ed-dc9c-a88cd7a3cc2f@marcan.st


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


