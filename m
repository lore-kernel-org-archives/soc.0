Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BEBC433F5
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 20:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BE101C34100; Fri, 27 May 2022 20:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8166C385A9
	for <soc@kernel.org>; Fri, 27 May 2022 20:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653684012;
	bh=RmKmLsdmGivt0C6F7Iai1OsLTWkvKBi/m3XZumELlC4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=PaXPPnJz6/0FHvcj0uzj2No9wnHtMOJv4gHg8Ulq79dlYpSe/0ukt8+JsVgKj3tqr
	 4xakXWTggMYvymobLeIw3JYaNX4oJ0sLyKyM58/hQYq0cQTeSnnJ81RqTOYdBFeFJO
	 NjRaUeohxQRpbbI423zp4F+WwMYTuzJ6k/9PlkAx5vq9f1p7XNumTrJXuA8AbFJH6P
	 wJe7vNy0Gi0uSiU/x2eY3dEbVTiT2DUyjJpVQDa/3hnU145NV8QFQLOXBlW8vDc1Zv
	 7U5tEcB9dtcB8i7+kcJ99DbCBwMoxk2raWcm9uUoFXncMbHbRul4rz+xZjGp0yOIOx
	 NVla/rZUMBcEA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7F453E8DBDA;
	Fri, 27 May 2022 20:40:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165368401245.3222.7196741543108719735.git-patchwork-summary@kernel.org>
Date: Fri, 27 May 2022 20:40:12 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL,v2] Rockchip driver changes for 5.19 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645662
  Lore link: https://lore.kernel.org/r/4541398.Icojqenx9y@phil

Patch: [GIT,PULL,v2] Rockchip dts32 changes for 5.19 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645663
  Lore link: https://lore.kernel.org/r/4798587.jE0xQCEvom@phil

Patch: [GIT,PULL,v2] Rockchip dts64 changes for 5.19 #2
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645664
  Lore link: https://lore.kernel.org/r/7695907.Sb9uPGUboI@phil


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


