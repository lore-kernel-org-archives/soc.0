Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46508C48BE5
	for <soc@archiver.kernel.org>; Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0FB00613E2; Thu, 17 Jun 2021 01:50:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id ED11F613D5
	for <soc@kernel.org>; Thu, 17 Jun 2021 01:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623894605;
	bh=mmggGy3KNKZTZn0VeCZmMxyrWvIOyFFFYw6Wl5KI27o=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=qUUwWtgaq6Vi42SD+fog+PVE+fv40/iafA0bEIIiZp5N0Ow2YpA6jE7Zbjqkd+0bl
	 sCi1iKjICi46LckomVFEqgu8c+yNBsuKtdivFtTehe68ayGiBd9Qu64kaPruSn+DdS
	 YUobdIX5fBRxop41Iifls4wyxHiFyTlaZ8yd1egenuo9xLH2dZvxy9Gv2a3eTrUYEY
	 2uIYqCdBtSc8S1UZISNl4K1/qadyssnpFtxIwxGseAs1VxhJwsskdRmn0+riQy+Qs9
	 IEJReua3gd5Nb3/upBcS6n9rQhhundgI/6JRmoxlFDPnU4KdS6xc/Qg2JHkb+ztaKq
	 rJ91GZMDk2r4Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D9E9A609E4;
	Thu, 17 Jun 2021 01:50:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162389460483.26973.5433692788971956157.git-patchwork-summary@kernel.org>
Date: Thu, 17 Jun 2021 01:50:04 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL] arm64: dts: amlogic updates for v5.14, part 2
  Submitter: Neil Armstrong <narmstrong@baylibre.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=501273
  Lore link: https://lore.kernel.org/r/c953e97a-f901-a749-1fb6-b1caa75b4748@baylibre.com
Patch: [GIT,PULL] memory: Tegra for v5.14, part two
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=500131
  Lore link: https://lore.kernel.org/r/20210614195200.21657-1-krzysztof.kozlowski@canonical.com
Patch: [GIT,PULL] arm: dts: amlogic updates for v5.14
  Submitter: Neil Armstrong <narmstrong@baylibre.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=501275
  Lore link: https://lore.kernel.org/r/2f19a5a1-3ed9-dd11-02f1-7d535cb1c25c@baylibre.com
Patch: [GIT,PULL] ARM: Visconti: defconfig changes for 5.14
  Submitter: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=501041
  Lore link: https://lore.kernel.org/r/20210615231232.pllzlqoamkmnsqq6@toshiba.co.jp

Total patches: 4

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


