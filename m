Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFF9CC433EF
	for <soc@archiver.kernel.org>; Wed, 27 Oct 2021 13:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D4A2760EB4; Wed, 27 Oct 2021 13:50:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BDE4860D43
	for <soc@kernel.org>; Wed, 27 Oct 2021 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635342607;
	bh=i6cCiBOBOvGwZlGeo9NA+KJD6+73+VP63hld94cSy84=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=HclTa462XpkkvKW/9ULuLa3Uz9z7HUKQ02szM5UNhfffl+gOEBB6pk6Y8u3Z7VNal
	 nESCZAEJh5M3DYmByFY3EgVrO7UoxDMljvGOB+f+HUhcTfTphYFoRYfc2OmNQw4qCu
	 rxns2o31W5OBz9JAFe0ymtp1/fRzh+WDwB7a7h8ug+V2PzbaM0vuL8QarupTwc28C9
	 p21rXQmIrMW1A9UUWyKx92ZGrBRMB/dKjNp8GSCuVSI5GjT2aLZJtDF/GQcdY31CWI
	 cjKoElOj8pFCJjnSEygnqmdm+w27dP+qf0frTef4iwQ0EvPG1tFliJ+JexVWmhxrZb
	 hJRUAIOxeZbLg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AD115609CD;
	Wed, 27 Oct 2021 13:50:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163534260765.9048.14098479518329733932.git-patchwork-summary@kernel.org>
Date: Wed, 27 Oct 2021 13:50:07 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] Apple SoC DT updates for 5.16 (v2)
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=571145
  Lore link: https://lore.kernel.org/r/6d41b29c-dafa-9b0e-d9ff-fe01eb6dce82@marcan.st

Patch: [GIT,PULL] Apple SoC MAINTAINERS updates for 5.16 (v2)
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=571143
  Lore link: https://lore.kernel.org/r/f62bfa4a-3cc8-c568-be78-c5fd6919bc74@marcan.st


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


