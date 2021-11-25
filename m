Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79971C433EF
	for <soc@archiver.kernel.org>; Thu, 25 Nov 2021 15:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3A87E6109D; Thu, 25 Nov 2021 15:30:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2451C60C49
	for <soc@kernel.org>; Thu, 25 Nov 2021 15:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637854209;
	bh=y2HciyK9BjimQXCIRlALYoHpVVkSae6/nKaCD1GVieM=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=S+oPtpVijxvs2INCqQOI64SrR2tllAPa/xhgxoi9kq89Z3JEh7Psx32aDDDqTM6lB
	 7qrakNi5dSPd4d3cvZYEyZ3t3iF/opo7YpILoxg7tP3D6OBzg1f33BicTh+9DQJ/qI
	 nfGCzMfvPhMafykz3e6a+okdFpu/sAWTNeBFpcuErPrU/KfJTLdSWVMYfM3WFiRi1p
	 yCNTJ931i5Pu/DnLxbmjLVhnJF+XimrZg03A1eWhqvFnHwG/yDQskbyyRaXYzU2dkK
	 zVOCWoSEUwJRbV3zL5xxAU/1ZJXN8c2DJDHO2RWSn/9+UIDTew/+Y+hqWrSRhYHMOO
	 mIMHHmbZz148w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1329B60A0A;
	Thu, 25 Nov 2021 15:30:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <163785420902.25928.15668662321255523059.git-patchwork-summary@kernel.org>
Date: Thu, 25 Nov 2021 15:30:09 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: fixes for current v5.16: arm64/dts and drivers
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=585059
  Lore link: https://lore.kernel.org/r/20211124085042.9649-1-krzysztof.kozlowski@canonical.com
    Patches: [1/2] arm64: dts: exynos: drop samsung,ufs-shareability-reg-offset in ExynosAutov9
             [2/2] memory: mtk-smi: Fix a null dereference for the ostd

Patch: MAINTAINERS: Update maintainer entry for keystone platforms
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=584267
  Lore link: https://lore.kernel.org/r/20211123001725.21422-1-nm@ti.com


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


