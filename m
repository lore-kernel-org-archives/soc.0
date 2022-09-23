Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18280ECAAD8
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 16:10:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EEE7FC433D6; Fri, 23 Sep 2022 16:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5BAEC433C1
	for <soc@kernel.org>; Fri, 23 Sep 2022 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663949414;
	bh=QO0UB6Y9/3tVrFR+nntGYQKssSuPm0L3nN4eapHC43s=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ToJAZQBM5TQ8nBCpDuT6FvrxYDf9lux9OtBWJWD9zdW26BI88pVmVA9QV2lirUtR5
	 bdZS0uBrcZ+LMS8w+JLdvcguZBVFLJ3diy0YgBoQsdu5bwwgvT0VrDq9fR617koJao
	 JDF+neqnh6h8bburdH/d0eEhPLJDR6fWOGfljWEmIHzd7630jGWVfA1OW7mqxawUJM
	 ojgDyM7lwd7zqvsGawkr5wRDGIurj//kiZk4bBIR3uhFSDidrut40AV2cEGLEXj7kW
	 FEps7hY+tRIK0qU2mJCSQIo+qq+WBWXajKilMMv2MGwPopdO4Jmmo51fCTbAMBm0wN
	 vuWyjWexiImqw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B6B8AE4D03A;
	Fri, 23 Sep 2022 16:10:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166394941470.29766.6836340892655401291.git-patchwork-summary@kernel.org>
Date: Fri, 23 Sep 2022 16:10:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Reset controller fixes for v6.0
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=679904
  Lore link: https://lore.kernel.org/r/20220923143519.41735-1-p.zabel@pengutronix.de


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


