Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01F60C433FE
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 16:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D9C6060EB4; Tue, 26 Oct 2021 16:30:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C276160C40
	for <soc@kernel.org>; Tue, 26 Oct 2021 16:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635265808;
	bh=NB/A42+0/3Q0uV9z5NZfOc096PyqyT+pPddzGNRwEfQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Bjzr9fbD8KUD6qVNQN4+ImFwkCs7nUBuy4/IUFxdSheku/qH+1vY7Lbp2fwXFn5Di
	 SBA0qEMzpJi9Qs/XqWoOo8ihlzWouujL/gFLa67xawOwH+MguEwq1JiZV5uo4Rsua2
	 OviPNrRhrfp3hhn3WMuyGhvTFHoXsq6VwqJbw0MUmeXpVCiuB7LdU6ckzSf1wig/Uv
	 nSFL7JZJZ6I9oC6NlOdgMHFCC34iSLOXH3zZi0SVyN//qosUsXSzWdl9RFZcz1f3gL
	 WZv/xIBWAgavro4jg6rkF0YzvD+yS+UdCEVik2qSNtx+TNK2Z1T2I+yftDjKfIM9WF
	 rQOClhZKlOPpA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AD25760726;
	Tue, 26 Oct 2021 16:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163526580865.16112.11579400459154595054.git-patchwork-summary@kernel.org>
Date: Tue, 26 Oct 2021 16:30:08 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [V2] MAINTAINERS: Add maintainers for DHCOM i.MX6 and DHCOM/DHCOR STM32MP1
  Submitter: Christoph Niedermaier <cniedermaier@dh-electronics.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=569375
  Lore link: https://lore.kernel.org/r/20211025073706.2794-1-cniedermaier@dh-electronics.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


