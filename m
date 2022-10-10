Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10CDC433F5
	for <soc@archiver.kernel.org>; Mon, 10 Oct 2022 08:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B1787C4347C; Mon, 10 Oct 2022 08:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 995DAC433C1
	for <soc@kernel.org>; Mon, 10 Oct 2022 08:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665391814;
	bh=xo5f+lMYeQBnhgbkCm/FxsGs8siKS5jriWc6PftjlBg=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=G71mLcs2OtlxW7SEMWiaV9Q4uMf8hVAGFPqgOF0d9OVsIo7nOuqB/cnZ34iAXDj7V
	 xbLrJpAF2I+lUHj4t+6+aPU6z8fDm41ERBov+yUicG2JbSdCoRFZZMgjkEwPA/Q3ts
	 qnNcF09oL2kKnSI/5iYpvGQsaylj1zMNjh7DM9IlExkhly7DmMwijny3XC8fn9bPem
	 +t221zlt+P8+0A2bgR1AuGt9gKpUAm+ZNrBYdUWOsFAjpebOEm99r92ORohyK5GVf+
	 skR3sR2FTkVuUy8sWyAEqzbCh2UtS0+S0YQVN6AnkY0kDLhWEo9taaWx2lETBnNtRV
	 jZPCIG9g88Fpg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6C063E21ED6;
	Mon, 10 Oct 2022 08:50:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166539181439.8542.3042501410836507360.git-patchwork-summary@kernel.org>
Date: Mon, 10 Oct 2022 08:50:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: ARM: spear6xx: Staticize few definitions
  Submitter: Viresh Kumar <viresh.kumar@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=684111
  Lore link: https://lore.kernel.org/r/bd3872ce5125477ea80b1131ad9a34c98aa1a796.1665375018.git.viresh.kumar@linaro.org

Patch: clk: spear: Move prototype to accessible header
  Submitter: Viresh Kumar <viresh.kumar@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=684114
  Lore link: https://lore.kernel.org/r/f334e8bcc22fde795de9c8067898d4c0522d44ae.1665375739.git.viresh.kumar@linaro.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


