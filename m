Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA41BC433EF
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 07:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8FB38C341CD; Fri,  8 Jul 2022 07:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76C6DC341CA
	for <soc@kernel.org>; Fri,  8 Jul 2022 07:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657266613;
	bh=RjfbGrODXwnAFEJdMZuQvCyUN5iGKrSmuvBDgvd73jU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=SkMcJ/WJbu7gEEcqwzcGPA2yfc+eDUrpWJfiq3XcUtEEzfj/4LwymJ8OPLeF11XwM
	 zWdoVTplR7iqP3heB0dkmXnSK5wq9qwP3UZvTUJFOzm5UK1MBgsmzvX8K8nxodh1Uf
	 seiggPsT9cyEA+684LsknmTYhPRe7nNKjNUV0uQGWWYAWKWZ4DX8h2IGY8O9E3f5QU
	 1bISDljKfJCttURw2O47zKgOGlrbVoxOs0N65dxoF27nCg/O1686yItFxZTkoAv+/a
	 7BcYZ+tQhTJoqjf3nURu15aAM8R59DIxe+vG4d4XVnjphE5Xcab05YWodR3cd1RLAZ
	 I37Fk+d64gvOg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4AA44E45BDA;
	Fri,  8 Jul 2022 07:50:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165726661324.10888.16748062846121412723.git-patchwork-summary@kernel.org>
Date: Fri, 08 Jul 2022 07:50:13 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [RESEND#2,v4] MAINTAINERS: add polarfire rng, pci and clock drivers
  Submitter: Conor Dooley <conor.dooley@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=657451
  Lore link: https://lore.kernel.org/r/20220707142041.4096246-1-conor.dooley@microchip.com

Patch: [GIT,PULL] Reset controller fixes for v5.19
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=657354
  Lore link: https://lore.kernel.org/r/20220707101344.3329314-1-p.zabel@pengutronix.de


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


