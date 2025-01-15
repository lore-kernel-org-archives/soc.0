Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B27112B169
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961066; cv=none; b=SiigFuwtfuZm0gvUURJKof+E/n0ZoeMoBzevwgh+gw0Hi33RNLUJkelTRix8cD2BUdku6lsTpuhdHD+OQcXemUZzRjBoms44JlNojP84cNwA/73GZDnFCTr9dmE4Akd2IKRky1lccH+BQeeJIwrFyJEzqgH17ZU7OyolYVJj9mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961066; c=relaxed/simple;
	bh=ii3cXPowH+npIizZThmIl0nJlGKZBuRE5BN5NZX/koU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=jrRII1YmwtuZFruyNcRz//80793nJ9lBusSZ3tIQXRXGQBCGtab/covoS8DvhaHxpiOa9korHqxWXXwVcMI2CloopkKcweWX2naG1T5rcLERrqjI+8bE+8JK1sYyIWSUBWeOhCVOV+EnnVexXuvricrnU43l6hUrkK0jSd5j/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9DjtXCT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9DjtXCT"
Received: by smtp.kernel.org (Postfix)
	id DE393C4CEE5; Wed, 15 Jan 2025 17:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8899C4CEDF
	for <soc@kernel.org>; Wed, 15 Jan 2025 17:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961065;
	bh=ii3cXPowH+npIizZThmIl0nJlGKZBuRE5BN5NZX/koU=;
	h=Subject:From:Date:To:Cc:From;
	b=t9DjtXCTW8Dribsba7B5AgI9PdKgceM3Gq7C86ex/BkC0Ihq1LgpuIHU9R52JM4ep
	 2agl+chNxkMCZBqaPRHPx3y1d5YC9iLaSLRGl7vOd7JkRmQSuNriNiQG3ZnuuSHN/u
	 yVuJdd/tBXpFI/2jVJeFXF2aDCE5YxCIUO2/tD1kIXRfli7K6LbuyBMi2NMHCgDDNF
	 i5Fty+yXVBCnDyS0MNDqqPAFLH8mTShTS29UDROWqaNQ2FgYEQpdHrqGmt/VarPLtv
	 buw/oWp0pKgBr/fRZeuethDf55P4ZmzRku13a6V34baDTqVgxWOq/3+VfJoJ+4X9Ys
	 l561WKu5TQaaA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7A8DE380AA5F;
	Wed, 15 Jan 2025 17:11:29 +0000 (UTC)
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
 <173696108787.809051.15278679746276167858.git-patchwork-summary@kernel.org>
Date: Wed, 15 Jan 2025 17:11:27 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: [GIT,PULL,1/4] soc: ti: Driver updates for v6.14
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=924390
  Lore link: https://lore.kernel.org/r/20250110210753.exsx5yxmxpcdn64y@amicably
    Patches: [GIT,PULL,1/4] soc: ti: Driver updates for v6.14

Patch: [GIT,PULL] Reset controller fixes for v6.13
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=925782
  Lore link: https://lore.kernel.org/r/20250115165404.1269500-1-p.zabel@pengutronix.de


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


