Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599C1C4332F
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 21B65C433B5; Wed, 23 Nov 2022 12:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BF49C433C1
	for <soc@kernel.org>; Wed, 23 Nov 2022 12:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669204818;
	bh=7eFePT54ozl9OeAs3QFIR5hLJ8EDkmKQcqq0R3q3mnw=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=uYknej+holbDNV+hDn8KAFe+iJOycI1urJsTzwN6tKYWrTMRwwp5JQP1aMpagNJAB
	 oHgXrMfH9Gz9vnHdg30uhV93ZbyqrlQ6xOV8LN7typRlNCOcjj5iJPM+AY7oIwJzyK
	 L0MBqYPqVA+RWpawclD+5Bv1GpBcnXwX4EG0ow0kGDHjt5ArgbO5AWP1vV06LxJog1
	 xWoC18TuQz6gjeZK8cPp/PbzcQ4jNzhlKjfpLGA+Nyx0Sv7HH4tSHZZ+d5Bs0bgoTe
	 HKzusEft9ri3EM6m/IUzdxETiM4+7/GNpA71WoSBDUunya6tdCOj6zp1zko7FKwJhi
	 VA5jlMvhXio7w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DBEF7C395ED;
	Wed, 23 Nov 2022 12:00:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920481782.7332.296606974488598046.git-patchwork-summary@kernel.org>
Date: Wed, 23 Nov 2022 12:00:17 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Rockchip dts fixes for 6.1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698379
  Lore link: https://lore.kernel.org/r/6274427.GXAFRqVoOG@phil


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


