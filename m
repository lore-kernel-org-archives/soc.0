Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5421C761A6
	for <soc@archiver.kernel.org>; Mon,  3 Apr 2023 16:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0194C433A0; Mon,  3 Apr 2023 16:01:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A7A8C433D2
	for <soc@kernel.org>; Mon,  3 Apr 2023 16:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680537684;
	bh=CC5K0a8+O+cWBVk+GeUdkOOIjNr7/C0VMxHmrdfkX1E=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=gvnIz2+aP01Y7Nc3vBpy84c6VqRpNNi3DThEyqeFqj/Mx5FASdGxHqVWcfS+SVSZ2
	 gQPBQw2h7+eQhm72w2XnBtm8ZJes0jhogxDhflrEsCLrw3fkEcfJeCOccK5ZMt9Pst
	 lUWB3hp5e5ZBjyGCdWb/bWb4VHmy+pKFGohCA99H/uyn/mOlvXQk/Vq7tseyzhrLN/
	 XntQELm5Bwb+1CKDALfzAOt8ldqKS57xmKxzlQdmX+QpdKHKScT8ZBpgb37fwYRuV5
	 zp5OAlAO0+7M2pPOAobE+U0ifeKGYIwVLmUATf7WVw9B5pO4s5+vxeKqcsJO096Rhj
	 EwBn3U9rARedA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 57A07C41670;
	Mon,  3 Apr 2023 16:01:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <168053768427.32283.2980761407416652868.git-patchwork-summary@kernel.org>
Date: Mon, 03 Apr 2023 16:01:24 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Fix spell error in OP-TEE driver for v6.3
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=730050
  Lore link: https://lore.kernel.org/r/20230314184441.GA2936721@rayden

Patch: [GIT,PULL] amlogic fixes for v6.3-rc
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=734973
  Lore link: https://lore.kernel.org/r/db5fcdb4-60e8-95e6-06b5-1ac474ecabe3@linaro.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


