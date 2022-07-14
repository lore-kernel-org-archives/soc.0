Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61A1C433EF
	for <soc@archiver.kernel.org>; Thu, 14 Jul 2022 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 82187C341C8; Thu, 14 Jul 2022 16:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6133EC3411C
	for <soc@kernel.org>; Thu, 14 Jul 2022 16:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657815030;
	bh=WZUZ1w3P4w3N1A/ofXb3aICiXLvzXs6Li7qVc07FDtQ=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=JhZHuBXA+x0z68A/BY9Hzd9hNsfC43M2Z2qFAW8a/Ro0k4C8MOhVybrC13IvRAe8U
	 tNVACXmFgcxK4WHHBgz7+6IBOOOY9IoT2HOwqOrCnhUVy1/3ITVqV8uUl3mZ/5sftI
	 1N7ySEAIfQucHijeJCI9x9JnYE76llmevDxO5c9w518IHEGIwufjOGF5Hh0O4bwJBw
	 HwdF/oPl/gEAx+paMATxNzZKJ2f+1rF1uNRl9h5Ktz2GVIZum19a2TiHRGYz6WVbEQ
	 lABKiJLu4vwZnAy0RdjQ1EbsiSF5SGS3pfulqXJzbrRqf7Rv0zwTFsVJhaxqsw7pUP
	 NbA08zDzzp3Ow==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 36587E45224;
	Thu, 14 Jul 2022 16:10:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165781503009.2313.6485884764989071172.git-patchwork-summary@kernel.org>
Date: Thu, 14 Jul 2022 16:10:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Broadcom SoC updates for 5.20
  Submitter: Florian Fainelli <f.fainelli@gmail.com>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=658639
  Lore link: https://lore.kernel.org/r/20220711164451.3542127-1-f.fainelli@gmail.com
    Patches: [GIT,PULL,1/7] Broadcom defconfig changes for 5.20
             [GIT,PULL,4/7] Broadcom devicetree-arm64 changes for 5.20


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


