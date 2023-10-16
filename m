Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AE8CDB465
	for <soc@archiver.kernel.org>; Mon, 16 Oct 2023 21:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E12A0C433C7; Mon, 16 Oct 2023 21:20:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2424C433C8
	for <soc@kernel.org>; Mon, 16 Oct 2023 21:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697491223;
	bh=JhfJw0C+aG5CFjn/uy9EmYPIYqaf1vOIda0uPKlBCBU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Ux97mrfnR0nwfqIDWTyu7bCgvnY43lH1WpG+Lx1UU5SLYX/OVkwAKYh1F2FycDZ5w
	 jBuLWYjPaQFeYCdvP65WNqQ4XwC9fYYHTWAHPS9fIMzl6wKAU2BWKfQByLZeRLb9ay
	 t/w+x65we+O0jqJfXBjK+u2vRrXgXWKEUAT3f7mttBPHwhRO2T6mink5iY8nflQ2aN
	 omOnFs++U9fVXjhA4zP0inLwVZtVVpy+WDodgCoBNJDpyFhJK7gFmBIxS7+J7yYMiV
	 5w5sf7dH+fBF8YCsHVRgkMTE6+Bpg1hzDIQk3BsoSysz5mYTNUAws2XeMsSUYUCMVF
	 FbC+vd/FPKuUQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9CF7CC41671;
	Mon, 16 Oct 2023 21:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169749122354.16729.16447250486995384514.git-patchwork-summary@kernel.org>
Date: Mon, 16 Oct 2023 21:20:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] RISC-V Devicetrees for v6.6-final
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793283
  Lore link: https://lore.kernel.org/r/20231015-outmatch-tragedy-228f91d396b5@spud


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


