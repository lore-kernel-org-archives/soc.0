Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E64AC05027
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38777C4339B; Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23155C433D2
	for <soc@kernel.org>; Fri, 10 Feb 2023 10:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676025618;
	bh=BY8AVGuBcchordqbxIljQ6Ysk9elcO+xKP9Qzl3am/k=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=pKxT/RI1pNGQP42oep8oZhCrSW/YQ2/z6A6M7/xAfhYnCJVwm/DttewKC0baBuVmd
	 +61RmV9i+Kc+DpgHYI5JNbIy/KUw2cyPaOYQ+temv5UG+wr2geHEWzjRNc0kXYZVfH
	 D6p172RvDujDQ1rp3C0FXUamAsq8rSRZGWB1TcB1v9nPGNTK7QXyvU47PEXqXH2g44
	 aUmgEDlEz6fVUXvUYR4VhvD1O6Jj84stcpurFjYQgxm9s5iO3jLkNxVbUcVtD5TnG8
	 faiGMQDC1pUEB/27Z381Sk+z0JVFfKPby+akKRGoKg4A282VQNMI+CTrQbmv6TM+Wa
	 d8IDqo9tAKzpA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 01067E55EFD;
	Fri, 10 Feb 2023 10:40:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <167602561793.9597.11814301694205143951.git-patchwork-summary@kernel.org>
Date: Fri, 10 Feb 2023 10:40:17 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] amlogic fixes for v6.2-rc, take2
  Submitter: Neil Armstrong <neil.armstrong@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=720576
  Lore link: https://lore.kernel.org/r/761c2ebc-7c93-8504-35ae-3e84ad216bcf@linaro.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


