Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C023FC433EF
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A28C8C340F3; Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8992EC340EE
	for <soc@kernel.org>; Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646148613;
	bh=Y1mWBACbHfkq3vKqMF+Jar7U5kkThw0iUDksRJYYERg=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=OcUZ8SuwkPT+EbUVgOhY+ME3d5pl0pTI3AqiErQlKTcI+r8f7ZUhr6a6qWcpN0XVy
	 /wHmmMziuU257ORREmC9CVuV208SqRgNsL45U/4yPO7M2h9ZR7Knwpj17R4o83wtv2
	 rknwM8Ve3pYqfjEo8S5qL3QZSf8qAcpe2EFqMiRZNqokc/Gc792f4FR1YF1vNQ/OwZ
	 sz1YuhVrpLTFXQe3JLEjoysKNdqM5ejkf0x1kMxNeVXIXtWZOBrUvpGWe78oS76rFR
	 O0TJhl41FFZoLfTBYfiaz2J+ANTLNRrktN/r4fwQh9ylRgK06gBSTi0qxa0PvtDZFQ
	 LYqax96LW0Jpg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6401EE6D44B;
	Tue,  1 Mar 2022 15:30:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164614861336.22804.12200975800796193331.git-patchwork-summary@kernel.org>
Date: Tue, 01 Mar 2022 15:30:13 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: mvebu: dt for v5.18 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=619225
  Lore link: https://lore.kernel.org/r/87pmn5zrd0.fsf@BL-laptop

Patch: [GIT,PULL] ARM: mvebu: arm for v5.18 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=619224
  Lore link: https://lore.kernel.org/r/87sfs1zrfn.fsf@BL-laptop

Patch: [GIT,PULL] ARM: mvebu: dt64 for v5.18 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=619221
  Lore link: https://lore.kernel.org/r/87v8wxzrlo.fsf@BL-laptop


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


