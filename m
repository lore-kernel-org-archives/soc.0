Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A251F1515
	for <soc@lists.linux.dev>; Fri, 23 May 2025 22:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748038311; cv=none; b=JNbdiz3FexehtkuPqvUBcUkAxjM7tbQPJZG1MMiz6pWxeRhZQ/+eZXr9+RTcDFHLBzR7LIfuDki5V6RIBOeuLMXW9fiKtYcfsv0ekIb4CvCy0GoTD1I6HA43AsLuaWb6VHsRdvC60OmI+qqBMKHRGfnveBKNoqwSqoWbhhFTdhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748038311; c=relaxed/simple;
	bh=MzG276KTq82wicmIsy0N30QHN+s2My7nMWT+u+3mF+c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=R54p3erAHSsxZGphYeR35POQfYPZLjutbMcxDY1aytr4jFWKQM0Lllwm85aYhTLvCyEIkCRgnQIsnsGfSBwQhjHyaBlP5rnMnRyJlIt4xegRueMgRZdvOeeELHlzcBwVUpVY+pc0Gv8EbPmpRch+te1hs+KoeLGslb9+LiR7fTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tPTZz4HV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tPTZz4HV"
Received: by smtp.kernel.org (Postfix)
	id 8FB26C4CEEF; Fri, 23 May 2025 22:11:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7974EC4CEE9
	for <soc@kernel.org>; Fri, 23 May 2025 22:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748038310;
	bh=MzG276KTq82wicmIsy0N30QHN+s2My7nMWT+u+3mF+c=;
	h=Subject:From:Date:To:Cc:From;
	b=tPTZz4HVCpSTBfpwCm7N4ri7PrAo9HVlRlBUow33MoNemuDSmcrwYOQekFjfwmWP1
	 qowAdpfATL9Mogvx7sXpqN93PLj8R1c6ObUM/dSdg3VgmuXphxeVKFf7aJtXb1GLxO
	 xUHFNNwz7cUY2dRfm813h9NwcXbJZimsi2GWochO9uI/FGCcmfF0k42G1DI6PXQZ4W
	 A4GxPc7Wb5fGU9OM4vHEPyEA2hTuNMH4hQDCOzEzPMgwLQJUVeAlsD1HZiQfV/A/+Z
	 1d1Px/2jYeMUKPtJ4GyI6KiJCbr1mkYfOFanjRnUJY12cTNp2tE9OrXLDAP5lDII1C
	 A9hZ/G5blrddA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B21B8380DBEB;
	Fri, 23 May 2025 22:12:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174803834534.3742914.13789370827683369616.git-patchwork-summary@kernel.org>
Date: Fri, 23 May 2025 22:12:25 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees for v6.16
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=963982
  Lore link: https://lore.kernel.org/r/MA0P287MB22622FA23ECF9B9216735FA0FE9CA@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


