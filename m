Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CADFC43334
	for <soc@archiver.kernel.org>; Mon,  4 Jul 2022 15:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 71A38C341CF; Mon,  4 Jul 2022 15:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58604C341C7
	for <soc@kernel.org>; Mon,  4 Jul 2022 15:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656946814;
	bh=Qs2/739mkGClvfuB7D2+iiGQS8KwvQoxaKYaMsOF8dg=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=qDfmD/Ccdlj0JUHNlgamRhjfaKbri/IbEt7ebGOpIMnMBaJnyrM1P4cjw5AeA8KPA
	 BcZ6pLfiiPxy/RXQY4yIj5E0v6iHkx0YTbO23v6ZCAw5+QKy6v9IIIyioESXT7BMTJ
	 UgFoM7i+7rUQgfJm/TRhl1ngzPduvfRAfZnHraY28sxdJCuq9zh5uQtpQRooK6MPJC
	 rr9ywZKMbxpp2MjsDR/pYI8PxXm+45lLntClDFxJ1p1Ogkvwncy0qV/FoXTGBYPrsi
	 7j5il3dpZr9xdm0e6xjNYfcGAQwBcFcymcDp0d3on+ct4I/2oC+J3IhXrH3I4unJ2I
	 C1HvcwLiM1mLg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 25099E45BDB;
	Mon,  4 Jul 2022 15:00:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <165694681408.26251.16039742901617677474.git-patchwork-summary@kernel.org>
Date: Mon, 04 Jul 2022 15:00:14 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL,-,V2] STM32 DT fixes for v5.19 #2
  Submitter: Alexandre TORGUE <alexandre.torgue@foss.st.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=656228
  Lore link: https://lore.kernel.org/r/1259e082-a3a4-96a5-ec9c-05dbb893a746@foss.st.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


