Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F04C4338F
	for <soc@archiver.kernel.org>; Thu, 19 Aug 2021 15:30:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2DBC36115C; Thu, 19 Aug 2021 15:30:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1679A61158
	for <soc@kernel.org>; Thu, 19 Aug 2021 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629387005;
	bh=kDPB2Agsw0FA1cxpmDDsDaEM6g9BJTOuyURJUYWkpbk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=QqdB8BS+rTpGr0u49wIMn5GL1wGA95nZj5QXwmCF2bRpnpdi3NOOSJbNgpU4d9yDs
	 /Tp951HGmXxxGdN2N2DHSYdt59VTST0g/z6mp1/qClTy3KSCbn+Cuj1maAhL47DI7J
	 Y1c8LCE6O4VjcD9YhOzsX+n0VXKshIy2xrwC9c1hNUo/49BdSf2Gk3DRyoeMVzkn8Z
	 +Oj9SxCcn/FUld7UIrGNi3SI3R0sIGkUtU+NQ23XCNchsCAGjDdGu7HrOS0sfnRj53
	 kI187NVCmF3CCVggjP0fq30wPvQPzi+XxLDCqIkV0r+UqJIfUhSOtBvn89L3my34vh
	 xAVR3Q0EgnCtQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id F1AC060A2E;
	Thu, 19 Aug 2021 15:30:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162938700493.11207.14612661860992294484.git-patchwork-summary@kernel.org>
Date: Thu, 19 Aug 2021 15:30:04 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [PULL/direct] ARM: s3c: delete unneed local variable "delay"
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=533689
  Lore link: https://lore.kernel.org/r/20210818204422.17919-1-krzysztof.kozlowski@canonical.com
Patch: [GIT,PULL] Fix for omap gpt12 timer error handling
  Submitter: Tony Lindgren <tony@atomide.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=533915
  Lore link: https://lore.kernel.org/r/pull-1629354796-830948@atomide.com

Total patches: 2

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


