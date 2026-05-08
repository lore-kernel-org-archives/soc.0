Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C9D327C09
	for <soc@lists.linux.dev>; Fri,  8 May 2026 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247657; cv=none; b=gDzwSz/bWQCU/ZEpJSwqLUHAZY67TWIxNxE+EsMlA64yWT4BnhbJaQM8jfQHmbHC0S7hWwLCLe+hjQCNPO3BD9bRLr0lXZC9PJNSLBwuV68n1Hxcpsbtp+4IDdX8HTj4/QtwxSd/uFFwXbHtTA4G4sDHUnQwkVZAVp3VAkGVjrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247657; c=relaxed/simple;
	bh=qqixfQRp3NMnTWuu3bSKsXxTMp2qRApLhE1cXnG2BgM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=gibrqR1LEAWmpwBduD9WFeVkY4ML2KKIiBENLZXbFXxdpCOuCejOy8FteE9A7dsgE/VJfW+Q3aCVYXHs7bJ8nD0mlw0+MIr78ZCQ2iH9dKUTWn/lh0TxxnJzxSFICkuTdF26B8WUOtYqzZcTKbDzDLoj2EP5UahX0OrKwXr/HIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQS0VkSF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQS0VkSF"
Received: by smtp.kernel.org (Postfix)
	id 79CBDC2BCC7; Fri,  8 May 2026 13:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64956C2BCB0
	for <soc@kernel.org>; Fri,  8 May 2026 13:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778247657;
	bh=qqixfQRp3NMnTWuu3bSKsXxTMp2qRApLhE1cXnG2BgM=;
	h=Subject:From:Date:To:Cc:From;
	b=TQS0VkSFKQP78LCYjnrnP2qnJvigXvDh63uv93A8aAilt3pPCSCDqPFzl3rbnsJ7U
	 GvkZP5OCAlJ96aOAOFHKIZt+90VhLA1eXTeR0JmiXodLSeL/Og+npxQV83EFS8N0md
	 7p76dByVZs3u2seThnWr37To926z55ZFSsYJP08sGVEf6YUKSyaO+M5HlQDrAVYTS7
	 de5+oELvU+pKSN84UCu8Pi80/+cb4dFlAkzMT0cylYZhPlBF+rlv/WPM7D5HJMBvHp
	 Yn+J3dOz1ehqSYRlyMbvlqKHZojH9VzfoQpJ94VUeopYzkWR9Y1frIlaqk14VnMUHt
	 STQH7dHrLBnzA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FBF8381195E;
	Fri,  8 May 2026 13:40:07 +0000 (UTC)
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
 <177824760588.686902.4804813660495209891.git-patchwork-summary@kernel.org>
Date: Fri, 08 May 2026 13:40:05 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V devicetrees fixes for v7.1-rc3
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1091213
  Lore link: https://lore.kernel.org/r/20260507-blush-secluding-aae99d404f6f@spud


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


