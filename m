Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3899C6FA8A
	for <soc@archiver.kernel.org>; Thu,  8 Sep 2022 15:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A4D6C433C1; Thu,  8 Sep 2022 15:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 730B6C433D6
	for <soc@kernel.org>; Thu,  8 Sep 2022 15:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662652216;
	bh=atPzkUFCwJxKqsse+aD09vdUFycNO97sgMyRHImHmPc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=NUMWnwRRSZnIfz0cPYQNiuLSpng1DQ3XC48/hbqkGtvD/oD5F1FTOP3PieU4vp6Of
	 wEPEMWqbAJwnEoV0c8pXzXLuhJ1PfIqpaa+9QL/25rsScOdFVH21wsu6IfOoxuZ+av
	 xV2o7/DILGvFqVpN6QnznpmP5xx4LsS9nsiX+WdL0Ld8X91ujk+oaLp4AdN/DAgEvt
	 KsTGwV646q8g6PO2fplsab37fomc9f/5oB+HkQDXF1NS3dehSVfyKQOaIcdM/78q13
	 0zEmCWeGgyt9lWMY0U7OwHj53EaYSGsCmBMJeTOQWSXGUlN/RCK5qnLp7PUvQPpgRD
	 Hpf+kenQC0j9A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5839DC04E59;
	Thu,  8 Sep 2022 15:50:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166265221635.8789.9693351485987338008.git-patchwork-summary@kernel.org>
Date: Thu, 08 Sep 2022 15:50:16 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v6.0
  Submitter: Sudeep Holla <Sudeep.Holla@arm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=672141
  Lore link: https://lore.kernel.org/r/20220829174435.207911-1-sudeep.holla@arm.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


