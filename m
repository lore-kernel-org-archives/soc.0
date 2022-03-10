Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C2B6C4332F
	for <soc@archiver.kernel.org>; Thu, 10 Mar 2022 13:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 275C8C340F6; Thu, 10 Mar 2022 13:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B84DC340E8
	for <soc@kernel.org>; Thu, 10 Mar 2022 13:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646919011;
	bh=S6l8inRJtsLqPuxkvld+UlI8RJZrN6YwpBoopu8pXLM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=kweII7C97WUBxgQmel8qVP0Cahb0oJywGf68D9s5jVXGjaxnxkRRQoqAWPZArNTyD
	 E5x1jyoiMoHnVA6e142EpZt3dh5DikGuLjZZ2iFQfpTdr5ncsBFXHd4P7387K/bds4
	 19BT4de7OPZeC9gsmZcWjn1YhxFwsvMq1VDRQfnqz1WIBDWZEMiYOLVGrz8DRUDCuV
	 tan46OO7q0lbNkDcqNK+Y9a30W8fn9XP3rvYLPmqGZg5lDMWsJQQVAB24ZfxKbw5By
	 wvWj5x0PByU00OWjgoq0X3wOyM0lPpVfH8MQu7cb9B4KJ7Qn22/ktBNxuwK1vbJY4H
	 k2M+QRJp+Lvpg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D6407E6D3DE;
	Thu, 10 Mar 2022 13:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164691901081.15792.11432945597730158905.git-patchwork-summary@kernel.org>
Date: Thu, 10 Mar 2022 13:30:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Rockchip dts32 changes for 5.18 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=622087
  Lore link: https://lore.kernel.org/r/3788968.RB9BLzCXGK@phil

Patch: [GIT,PULL] Rockchip dts64 changes for 5.18 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=622086
  Lore link: https://lore.kernel.org/r/13959624.7hp8jFWaoN@phil


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


