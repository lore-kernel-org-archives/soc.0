Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AF7C04FFE
	for <soc@archiver.kernel.org>; Wed,  8 May 2024 07:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F473C4AF67; Wed,  8 May 2024 07:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69D49C113CC
	for <soc@kernel.org>; Wed,  8 May 2024 07:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715152830;
	bh=vkSnrgALOv5pECwNWWXsM2wjXq9jC9XtXOz9Xd4MzHs=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=r2GtY1a+C+wgmtxwX044RIgOCTaQdanqgqD6xNcEOIlg92zqQKkGVYwozIbwJEUzG
	 r2yu25HVrbZKW+fUe64iND31FCbGeixyB4X4nYpTQICwUPLagAK5i5YWRtiV07ypQB
	 mbLVw9+6Sdo9Ih+MUxVgklU6lBNCk1ibV0qY2XStvQ1NIeXZfuV/yJcsM+DNq7Mxfu
	 Q/+eHAdkUZhE1WjlXNOhWZfFoRdpq6zqEFfEu+BY4dKe3mPh/uRY/RTnpuYynXS42k
	 zdPkAGvxjJS7XU6YvMBbtbucMTn1hKE7E31lbYzOuQPQuHa+EbuteuAgebHia8M4JR
	 h3BYwNMsibDcg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 49447C43617;
	Wed,  8 May 2024 07:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171515283022.32265.17314809100947077808.git-patchwork-summary@kernel.org>
Date: Wed, 08 May 2024 07:20:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] A few more Qualcomm driver updates for v6.10
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=851396
  Lore link: https://lore.kernel.org/r/20240508020900.204413-1-andersson@kernel.org

Patch: [GIT,PULL] A few more Qualcomm Arm64 DeviceTree updates for v6.10
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=851402
  Lore link: https://lore.kernel.org/r/20240508021820.206441-1-andersson@kernel.org

Patch: [GIT,PULL] One more Qualcomm Arm64 defconfig update for v6.10
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=851399
  Lore link: https://lore.kernel.org/r/20240508021312.206121-1-andersson@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


