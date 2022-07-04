Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AEFC433EF
	for <soc@archiver.kernel.org>; Mon,  4 Jul 2022 15:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D6AE5C341D2; Mon,  4 Jul 2022 15:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BEAE4C3411E
	for <soc@kernel.org>; Mon,  4 Jul 2022 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656946815;
	bh=A4Zj6rqdQvgqSoRcjSjz4NJnQe7MFKyHrFDyDg/llT4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=FZvRgaxu5WeMGm/6IC97ShjHBRB+D/9Efwm1oCLzySoOxcDGiIz28lLsjYanEAkBw
	 Xq0DolepaP+sonlf2SY2BRAZxOVWtLoJN+pU6tLRUCv6Ehal2GyGyJ/IRYJgm8CB4w
	 nWtQEZ5SpOAX2REjgj9JZo6jYGzuktDWpDORztfid5dw7YvJbGww2jLZEuzgxQXsCK
	 Syi5QqqfVB0dt3n/BQfcIKySyMXQ/23HRv73CC3MgilKbDDCW2IyNU+LM6kRpikPa2
	 7bi165TA+3pBijG3uj4OjYTizS4lUWcpItrgv09g14ruLTNwWIleigncLd4QmJBpi4
	 1fhsbWtFpSK6g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A2909E45BDB;
	Mon,  4 Jul 2022 15:00:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165694681566.26251.9266275048735192385.git-patchwork-summary@kernel.org>
Date: Mon, 04 Jul 2022 15:00:15 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL,-,V2] STM32 DT fixes for v5.19 #2
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=656228
  Lore link: https://lore.kernel.org/r/1259e082-a3a4-96a5-ec9c-05dbb893a746@foss.st.com

Patch: [GIT,PULL] Soc changes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=656209
  Lore link: https://lore.kernel.org/r/pull-1656918583-2801@atomide.com

Patch: [GIT,PULL] Devicetree changes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=656213
  Lore link: https://lore.kernel.org/r/pull-1656918942-515224@atomide.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


