Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37A80C433B4
	for <soc@archiver.kernel.org>; Tue, 13 Apr 2021 09:30:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EDF02613BB; Tue, 13 Apr 2021 09:30:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D6C7B61222
	for <soc@kernel.org>; Tue, 13 Apr 2021 09:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1618306210;
	bh=Q6htg66DoUWbMr/5qgZp0ohVNGkq84/4Vd2SmcUcXV0=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=YS4rGp+Tj2hO5a31HZD4wh8/h3rDj5dLdcZe0WV3P+PW2SxV9jUN0+ibrCwZRLa7N
	 T3Ryfv1Nt5z8fABX30QyHyHETAaKGB1IXHE6mvqXx9HDDj5pCiks7huD6IpbjqlxJ3
	 18cIaRcLOoTajfPL/jftFqlx/EAz4IhbchudSybDrCRupbxx7HAyvL9kHgYM1yeJHq
	 FqT1XsiOj9toz3g+ik/WIipuxoJp/Qym4m9xHmxtcYCweog1M/p49Eyx9Vfh5WhGoT
	 lWtAGmdDb8fUKZK0TNK95N3u3XbhDXrW9X8caki/Neat3O5ySWLt9vDSpMWlwWnKBa
	 ualLiX1xBbVXw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C128860BD8;
	Tue, 13 Apr 2021 09:30:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <161830621072.20348.11777260640237852560.git-patchwork-summary@kernel.org>
Date: Tue, 13 Apr 2021 09:30:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] arm64: dts: Zynqmp DT changes for v5.13
  Submitter: Michal Simek <michal.simek@xilinx.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=465389
  Lore link: https://lore.kernel.org/r/e422fa9c-3e58-28b4-f6f0-65aa44254131@xilinx.com
Patch: [GIT,PULL] Rockchip dts32 changes for 5.13
  Submitter: Heiko Stübner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=465051
  Lore link: https://lore.kernel.org/r/4638723.31r3eYUQgx@phil
Patch: [GIT,PULL] Rockchip dts64 changes for 5.13
  Submitter: Heiko Stübner <heiko@sntech.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=465053
  Lore link: https://lore.kernel.org/r/2191862.ElGaqSPkdT@phil
Patch: [GIT,PULL] soc/fsl drivers changes for next(v5.13)
  Submitter: Leo Li <leoyang.li@nxp.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=464707
  Lore link: https://lore.kernel.org/r/20210409205719.27927-1-leoyang.li@nxp.com
Patch: [GIT,PULL] arm64: soc: ZynqMP changes for v5.13
  Submitter: Michal Simek <monstr@monstr.eu>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=465393
  Lore link: https://lore.kernel.org/r/a44f8e9f-cea7-57ef-c3bc-10f5f5e064fc@monstr.eu

Total patches: 5

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


