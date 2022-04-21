Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1863C433F5
	for <soc@archiver.kernel.org>; Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4C62C385AB; Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CC89C385A8
	for <soc@kernel.org>; Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650555026;
	bh=mpxdZbW6j306rKwYjBAUib6vsFOsXFYWsXUCbKYSjtM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=nX6qjOdCAFucZquFkQM0xSUREwcV+piS0Ikw/tq9pEw7etO4Buflv2h0QnSSX33uN
	 eOHcIW+ZyFzZl4MFGH8043mEkdWADPLsyMWl4TR76PjrMtABsIe20T2AmMfvSz3M20
	 IKqOOdyD2Zy0yrj3oaSZxAhE+EhEm/o/7y1hy2yIWpu1xQGBNbaq5f/t5XA+KiCGfr
	 OK/Mh5IbTxI+z6mm1H/EaEe9Z1aStKQumqbhkcVM0NXlzTG3Fs9kgx6J2wMjzcVSSF
	 i2MA89+5eq1CEZDU93rZ1LyM6kaMJHaaw9WKgqDqQKgdyBdzOy+0f1Pqk+YA9+0iG5
	 6k/zv0jeDL+bg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 628F5E85D90;
	Thu, 21 Apr 2022 15:30:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165055502632.23603.3695826957071813620.git-patchwork-summary@kernel.org>
Date: Thu, 21 Apr 2022 15:30:26 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Fixes for omaps
  Submitter: Tony Lindgren <tony@atomide.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=634143
  Lore link: https://lore.kernel.org/r/pull-1650543308-836725@atomide.com

Patch: MAINTAINERS: add Bug entry for Samsung and memory controller drivers
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=633736
  Lore link: https://lore.kernel.org/r/20220420104708.106738-1-krzysztof.kozlowski@linaro.org

Patch: [drivers/memory/fixes] memory: renesas-rpc-if: Fix HF/OSPI data transfer in Manual Mode
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=633645
  Lore link: https://lore.kernel.org/r/20220420070526.9367-1-krzysztof.kozlowski@linaro.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


