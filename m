Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30874C433FE
	for <soc@archiver.kernel.org>; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 164C5C43470; Wed, 23 Nov 2022 12:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 013A5C433C1
	for <soc@kernel.org>; Wed, 23 Nov 2022 12:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669204824;
	bh=oFQJgy6CFNosIB8u1KJdEYZkv3Zi9RG/y8omwB3I97o=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Dg8KQqboQRo/JX/xfgN+ZSvTQY2wsMJCeDQ9yACvp89XrXzfG7oWSee/dZrdjTRk1
	 ufz+jU+cVsUsSp0xvk58O8ZbIQ6Uup/jE1awe3nKJrjVFNgpUb+ETH1ULPq+wi5NDp
	 Jli01ugWyYa8yv6M1As6IbfUiZ3OzXNjCeeFlxWDtdv2jDnbx9M2imzMWqUNLA6mwG
	 JyVNKwBIWNgwKl8TvhI8p0Yr7s1MZPeaFfeq8NHiJywzjinXEusZyaCbzX8xfQvt/T
	 D9NkMZt9l9m3qUdikICSb70n7sgtptP0qWXTEa3ld4oOl/36ieBtXyJmDaMwOX54Nx
	 Lag8bP1NFdBLA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DC3D0C395ED;
	Wed, 23 Nov 2022 12:00:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166920482389.7332.8202329305205673010.git-patchwork-summary@kernel.org>
Date: Wed, 23 Nov 2022 12:00:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/4] ARM: keystone: TI Updates for v6.2
  Submitter: Nishanth Menon <nm@ti.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698202
  Lore link: https://lore.kernel.org/r/20221122185650.nrh7s2g5obndj5vj@dental
    Patches: [GIT,PULL,1/4] ARM: keystone: TI Updates for v6.2
             [GIT,PULL,3/4] arm64: dts: TI K3 updates for v6.2
             [GIT,PULL,4/4] arm64: configs: TI K3 updates for v6.2

Series: [GIT,PULL,v2,1/7] soc/tegra: Changes for v6.2-rc1
  Submitter: Thierry Reding <thierry.reding@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697747
  Lore link: https://lore.kernel.org/r/20221121171239.2041835-1-thierry.reding@gmail.com
    Patches: [GIT,PULL,v2,1/7] soc/tegra: Changes for v6.2-rc1
             [GIT,PULL,v2,6/7] ARM: tegra: Device tree changes for v6.2-rc1

Patch: [GIT,PULL] Rockchip dts fixes for 6.1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698379
  Lore link: https://lore.kernel.org/r/6274427.GXAFRqVoOG@phil

Patch: [GIT,PULL] ARM: nuvoton: devicetree changes for 6.2
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698293
  Lore link: https://lore.kernel.org/r/CACPK8XffL5_L5D_ZGQid0r4h0wfTc+XBGUO1-0QW7ErPPrrvEQ@mail.gmail.com

Patch: [GIT,PULL] defconfig: mediatek updates for v6.2
  Submitter: Matthias Brugger <matthias.bgg@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697792
  Lore link: https://lore.kernel.org/r/610edfca-0a3a-fd41-5208-71978866be4f@gmail.com

Patch: [GIT,PULL] Qualcomm ARM64 defconfig updates for 6.2
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698223
  Lore link: https://lore.kernel.org/r/20221122203129.1854877-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm ARM defconfig updates
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=698227
  Lore link: https://lore.kernel.org/r/20221122203452.1855254-1-andersson@kernel.org

Patch: [GIT,PULL] ARM: aspeed: devicetree changes for 6.2
  Submitter: Joel Stanley <joel@jms.id.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697856
  Lore link: https://lore.kernel.org/r/CACPK8Xfsc8BaL_qAgV+3Rk-AFcQoDVfTpMzHvq_rR-UYqwpNNQ@mail.gmail.com

Patch: ARM: ixp4xx: Remove unused debug iomap
  Submitter: Linus Walleij <linus.walleij@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=697833
  Lore link: https://lore.kernel.org/r/20221121221015.1454948-1-linus.walleij@linaro.org


Total patches: 12

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


