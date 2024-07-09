Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64DEC3DA45
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9D963C4AF07; Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 87DFEC32786
	for <soc@kernel.org>; Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720560633;
	bh=rdWwqTrT/KX4LwzQgkIeDkC69ds/DQhXqlnA2HfAfZY=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=LNgPJVSQwE3p0Au0m76P/XTNc6ibfUyYT1j7ZQ5D4I5wvgVRowmT06imBC3j/+/o2
	 /PgD1t5qxqubu+8ix4dFp9O9OTHu5gAYBd2DzJ/P6tLZueITM3Usk4JX88MwZO5yd0
	 QIJ5PYyV09viFmu3AWhf2B7fDlmLyfp5DeWluzFN3yYXJ02Ozti1MVaHb/5D0+THNP
	 6mSsTYFbjcFZk4b1grv3nBjH5CZZrNllTtGXLqiisxQ4G6E3i/TOcNR6lekv+Kksn7
	 RDgbsk4yU8rZcxMVEx3uQQEzS3W3XNyzQoUpLyvKJFSNrLYP1E0JHUOiE03nRPoHLd
	 75+62j7qHHuOA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 659B8C43468;
	Tue,  9 Jul 2024 21:30:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172056063335.16885.12579823143905622624.git-patchwork-summary@kernel.org>
Date: Tue, 09 Jul 2024 21:30:33 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] One more Arm32 DeviceTree update for v6.11
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=869831
  Lore link: https://lore.kernel.org/r/20240709191506.3285-1-andersson@kernel.org

Patch: [GIT,PULL] A few more Qualcomm driver updates for v6.11
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=869830
  Lore link: https://lore.kernel.org/r/20240709191246.3053-1-andersson@kernel.org

Patch: [GIT,PULL] A few more Arm64 DeviceTree updates for v6.11
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=869835
  Lore link: https://lore.kernel.org/r/20240709193406.3966-1-andersson@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


