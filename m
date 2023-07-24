Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B85C41513
	for <soc@archiver.kernel.org>; Mon, 24 Jul 2023 14:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99D6AC433CC; Mon, 24 Jul 2023 14:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E7CFC433C7
	for <soc@kernel.org>; Mon, 24 Jul 2023 14:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690207821;
	bh=5LJkLDBK+Epjlh0/gTkhnrdoWPjlRaYCdms/xdu5/sk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=lzl3ntsYTUi2d6hMY2y5eUdNCJRYGnA7rKGsTiizraJTxdfaoYJJ06crdlIHlOBth
	 VcQvit6N4jXEbOIqa2CcVU1g0C3WAfib6MgN9+gfJVrhmbBfiSPnZ0UHbkel7r64by
	 cv2XjBI8lYFjYP3ZioIqTBKvSWTWSyV6FVuQy0i3l+XM7E64yWibDYLIeOAazFE5CS
	 fqTUjbgQbVXyYDyxZFe0MCf4SKdbzPmuFUC7eaA97io7H63XB0xsAX7P1wtr8Hx3CZ
	 ofZUg/1G/j4wYGqsFOeFeNOTmIvksxUG4X8NVDJcnjs4u7WJc3TX/X1Z4kumKhqmMt
	 wo0X2e58/Et3g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 55AF3E1F65A;
	Mon, 24 Jul 2023 14:10:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169020782128.21041.6783732662428614584.git-patchwork-summary@kernel.org>
Date: Mon, 24 Jul 2023 14:10:21 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: dts: juno/vexpress: Fix for v6.5
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=768223
  Lore link: https://lore.kernel.org/r/20230721112359.3369716-1-sudeep.holla@arm.com

Patch: [GIT,PULL] firmware: arm_scmi/smccc: Fixes for v6.5
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=768230
  Lore link: https://lore.kernel.org/r/20230721114052.3371923-1-sudeep.holla@arm.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


