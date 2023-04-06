Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C697AC77B6C
	for <soc@archiver.kernel.org>; Thu,  6 Apr 2023 21:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 804B2C4339B; Thu,  6 Apr 2023 21:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AD9EC433D2
	for <soc@kernel.org>; Thu,  6 Apr 2023 21:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680816630;
	bh=kujPqCiIzZwsrHFwsaBSCa0x4JMANoV1zy5FlkEMY80=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=eVMg3g+XZVi9R6LWa2MkZTFgxKE0XPchCRy0wlZV/KH8+WjuzZiklNGHE8+6gGojv
	 t6jhfAbsK1gpk1IRBZU/Icac6yLMZGgy7KQGZEXqoeoAm1ZRbKFkuMB+J2sbZQ0LJP
	 hJHFwrUD9dzkTvx00KnMtlixUUqvFWstlPBG4FmQgRy39ZWGz/ItL6rtDSETbcDZZz
	 ZgM31iqiyMuvZimLkSTK2dlvfyXIKllyzSjzEsewaJfLIMmClq/cPXl39w9jNQgU6d
	 QiOWqQsrlvtuEejN30+aSn2mAPDPC+/qvMgSHLK3GOV30HJqFdW2zG0zYYtL+fiEq0
	 cNa1F6j/IbiqA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 54644C4167B;
	Thu,  6 Apr 2023 21:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168081663027.18696.14302411927139406257.git-patchwork-summary@kernel.org>
Date: Thu, 06 Apr 2023 21:30:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 6.3, 2nd round
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737423
  Lore link: https://lore.kernel.org/r/20230406021602.GP11367@dragon

Patch: [GIT,PULL] RISC-V Devicetree fixes for v6.3-final
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=737730
  Lore link: https://lore.kernel.org/r/20230406-negate-octagon-0fc2e47dbde5@spud


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


