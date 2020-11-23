Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39670C63798
	for <soc@archiver.kernel.org>; Mon, 23 Nov 2020 16:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id F0DCE221F8; Mon, 23 Nov 2020 16:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606150206;
	bh=7p5E9JBiPOn6iJIqMZcxE5SA7CjrBrzOYD+g3VS15N8=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=EfjzcSbPqkHWScQ8sXpRqYc55y70d+6TYuzwJZP8p4yp85OQDw7ye6pwtuqT0zCIo
	 4H13SDpQUPic1zKMAkEUSfU/7JQCynX3cujtkahrc0tHPV1kZc+LlsCNYeHwUKVtHb
	 Eh8wYNKuppGL/wAxC5u7bQilEgl9TJEP3Heu+1Vg=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <160615020673.10952.1540320711970133965.git-patchwork-summary@kernel.org>
Date: Mon, 23 Nov 2020 16:50:06 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [GIT,PULL] Rockchip dts fixes for 5.10
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=389097
  Lore link: https://lore.kernel.org/r/11641389.O9o76ZdvQC@phil

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


