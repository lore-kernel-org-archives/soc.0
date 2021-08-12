Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8532BC4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:20:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6016F6109F; Thu, 12 Aug 2021 21:20:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 487D060FED
	for <soc@kernel.org>; Thu, 12 Aug 2021 21:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628803223;
	bh=qC9oyJUAmY2rZayVTHo5AAHrP2CBIiV/mU7fisM+mek=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=JrVh8UkapjgCFQFANYzsILcV1HeVAOcBezfxrRlUtmd2QI1VXnAtWdjJFMlRhkQR5
	 74+KokeOjKay/IZqbRZFTpOaGUOj9QVte7OPBZslCdGNgF6CxmggAskW2E72iLyMOM
	 QzJNvVAFteJ0HV4GXE6yAj+UQWzOMVKIt17deU+dCCVgECvFG8MLbXsNxxiDIQzEN0
	 C4ciFRxcFPxQlm6BQsHLKLc9SAIE9ahniHlUxrUwszY/IK/LwC04ooNXRp5KRuHpJr
	 of+VRr4dqRhhHAYq0CmnSjUHOclSSSf+63C4mGAXVrB7fg72lp/KFBdZTONW7XLaoh
	 z0ttVA3zT1F/Q==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 422F16096E;
	Thu, 12 Aug 2021 21:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162880322326.12191.14850656268482080213.git-patchwork-summary@kernel.org>
Date: Thu, 12 Aug 2021 21:20:23 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/for-next):

Patch: [GIT,PULL,v2] ARM: at91: defconfig for 5.15
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=528531
  Lore link: https://lore.kernel.org/r/20210809134521.10155-1-nicolas.ferre@microchip.com

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


