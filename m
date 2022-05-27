Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A5AAC433F5
	for <soc@archiver.kernel.org>; Fri, 27 May 2022 13:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 25FC1C34114; Fri, 27 May 2022 13:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 106FBC385A9
	for <soc@kernel.org>; Fri, 27 May 2022 13:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1653658095;
	bh=/5fy+Rm7j7Uz5CyjdDKQfT3XYqKTeL92LMMDCYPYen4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ZY+ksvLTn1tCBtaR6Kq7YFre53NxZOdXT4qfHCcdvGlELfX3eM+7KtgzUgYx45scT
	 OlgYD24m5p+dVi6ecVpU5VEd/ROGh1NOFi7+dIzA6FiulgQaT6pxicx7ahyYbj2dLu
	 3MK9C2A/M+mwtv0et7R9793SVZvu5MFmExQV7pur29J66+904KVU71nJ1B6kPUH63Q
	 EfWltq4ZXgDZMn9M9mLG/Z0r8bKszXNIWuoWaR3S/Mu9lXp5KAxcQd2A5Wd7c2Hc18
	 pL/ZJmWJgIJp2J5jSESdKr0Er5YomopWKTwEekbyBYOGD/HJeoM88NahY4vRnot/Pk
	 vb22+/xeP76CQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E42B5EAC081;
	Fri, 27 May 2022 13:28:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165365809485.30025.4142620793529647447.git-patchwork-summary@kernel.org>
Date: Fri, 27 May 2022 13:28:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: ARM: SoC changes for 5.19, part 1
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Linus Torvalds <torvalds@linux-foundation.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=645301
  Lore link: https://lore.kernel.org/r/CAK8P3a1K_t-a4=uKPbZ2kwa13bDhkNC9S8ZiyhF84SSXJYjT2w@mail.gmail.com
    Patches: [GIT,PULL,1/5] ARM: updates for 32-bit SoCs
             [GIT,PULL,2/5] ARM: DT changes for 5.19, part 1
             [GIT,PULL,3/5] ARM: driver changes for 5.19
             [GIT,PULL,4/5] ARM: defconfig updates for 5.19
             [GIT,PULL,5/5] ARM: ARMv4T/v5 multiplatform support for v5.19, part 1


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


