Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3BD2C6379F
	for <soc@archiver.kernel.org>; Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 895BDC433A0; Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73C7CC433EF
	for <soc@kernel.org>; Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676302229;
	bh=bBm7jvpgIrpNI74dXz8lo8R11r0hfAbgmzWLjxziNIc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ThrsbvvSAS50Gx4wQghbUem7yo/JztkYDFzNnMNIS8N+huXC4Y2y/90U69Kfshy+1
	 6Reu1DEfSq+U0fhJxxirCV8AR+HVGybMAEYU0MXNIuWnpWd6Ovtj8uojD8LJUi/TTJ
	 oAvOD8I8r/igK6xyfh1CMBldFAugIZLEWfqsvnXsMt7IPvo8wIpN5A1uQAHFSsyyKD
	 Ae2v/SHzpq2h560w5roHxXjKkyP384PLo4/shdcFL1U9Y9ONtOZdDoJwLIh7k40U0w
	 6FWTWb+C9LCuzxNgCUuKcmeNHXqqDrsJCJPeoMHSle8jFafUVWsjqtXIB1R0Dh3tO2
	 UYJq8IwE11AHg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 55119E68D2E;
	Mon, 13 Feb 2023 15:30:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167630222926.5266.5201019287481350940.git-patchwork-summary@kernel.org>
Date: Mon, 13 Feb 2023 15:30:29 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] More Qualcomm driver updates for 6.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=720783
  Lore link: https://lore.kernel.org/r/20230210182242.2023901-1-andersson@kernel.org

Patch: [GIT,PULL] More ARM64 defconfig updates for v6.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=720775
  Lore link: https://lore.kernel.org/r/20230210181516.2021902-1-andersson@kernel.org

Patch: [GIT,PULL] ARM: dts: samsung: Late DTS for v6.3
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=720953
  Lore link: https://lore.kernel.org/r/20230211113103.58894-1-krzysztof.kozlowski@linaro.org

Patch: [GIT,PULL] More Qualcomm ARM32 DTS updates for 6.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=720789
  Lore link: https://lore.kernel.org/r/20230210185846.2032601-1-andersson@kernel.org

Patch: [GIT,PULL] More Qualcomm ARM64 DT updates for 6.3
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=720794
  Lore link: https://lore.kernel.org/r/20230210192908.2039976-1-andersson@kernel.org


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


