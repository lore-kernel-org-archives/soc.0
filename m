Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96136C54E5D
	for <soc@archiver.kernel.org>; Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7BE54C433A6; Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65AC3C433C7
	for <soc@kernel.org>; Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709708430;
	bh=fxcnPfbkE+fK+FCdcMzIW0S3i2ZjzrZYokr9ilj719c=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=FRHN24EK3UwVvQcD3kZQ6fcnvVukRbYV8snEP+e9/RdwfXQP5qX8zVLbHXwnMUOax
	 CenuhRxP99Wtq9ZayT1cY1Nu/+uzQjW8Gre5lQ0B6LX63LvFnl6zIn+8T38T1NOO/O
	 A9xXZcIQmnFwKLVF84CdQq5G6MsAB9YjN+zIEuZRppbYOLjcpcAqT97yg7RS5wippJ
	 ZcWPNlozakep+v4WZPwyVkM08uX0l5H3Gkk/XLmyqtKveoUFaXeHLb+O2bsM/G0gRg
	 CCq3aarBcOsarJunyMWTMqMBRWJDFvU6Ey4RLPT9mCkcw+zF1Hm4RpyikjSnJmPMlF
	 kC8K647iPbhRQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 48B0AD84BDB;
	Wed,  6 Mar 2024 07:00:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170970843029.7525.14438701907859660174.git-patchwork-summary@kernel.org>
Date: Wed, 06 Mar 2024 07:00:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] A few more Qualcomm Arm64 DeviceTree fixes for v6.8
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=832796
  Lore link: https://lore.kernel.org/r/20240306031208.4218-1-andersson@kernel.org

Patch: [GIT,PULL] RISC-V Devicetrees for v6.9
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=832687
  Lore link: https://lore.kernel.org/r/20240305-iodine-moneywise-53797ae9bf6e@spud

Patch: [GIT,PULL] A few Qualcomm Arm64 DeviceTree fixes for v6.9
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=832797
  Lore link: https://lore.kernel.org/r/20240306031451.4545-1-andersson@kernel.org

Patch: [GIT,PULL] A few Qualcomm driver fixes for v6.9
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=832802
  Lore link: https://lore.kernel.org/r/20240306032120.5036-1-andersson@kernel.org

Patch: [GIT,PULL] RISC-V firmware drivers for v6.9
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=832694
  Lore link: https://lore.kernel.org/r/20240305-vicinity-dumpling-8943ef26f004@spud


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


