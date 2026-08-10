Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA0331714A
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352458; cv=none; b=UHI5H9Nf8+HByAdtnDADJ38C/RkBT9Rt/g/eG/l3UQaI8wiCsGswTYsrEfApioc50v43uj0NiNqCsX794uscuouoxvgRZG9+lNUghO6WMr3l9J0AD4A7/rCfSvXVxJiKL0aRcb+WdomZg+jKpAajBNSiZ4nFVvQTqZ9DyNXUvsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352458; c=relaxed/simple;
	bh=zRiHf3TdUR+9PcEEqG1rqIAlMayWiufmsaNLi74OzEE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=NwaOpsdw0/eTmeqONNAJW/6RltkL46v8Z26dEX/fseJjpEw5d/rOQf0LSXSiMlIzm+WpXztXU9sXux0hdXSfJcKTMD78M5XQVVW9AvCrcmKln1F5zOW3PUkI59ZVt6TM9N3eAxVz2uC/qCdZd2KkDz2f8/42SJLJA+aLHw3w29M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1uYOPLj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1uYOPLj"
Received: by smtp.kernel.org (Postfix)
	id 4E8BA1F00A3A; Mon, 10 Aug 2026 09:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3874B1F000E9
	for <soc@kernel.org>; Mon, 10 Aug 2026 09:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352457;
	bh=KaRXhJRelS2WFXkvH+afa7oGf/TikO6DUMxBnH2x+tg=;
	h=Subject:From:Date:To:Cc;
	b=b1uYOPLjik/bocHLrPZwKmMqENQd2mTU2aXETNDd8FvPZ8b2ktADEm52LNwEbGCO3
	 bJxZlHWtRfltHXCLbcTzshZPwBCDpaCBzR20CO370PiYa5Elzr909b7nBDZTpEHhF4
	 +lzfz8MkeXowIKV9CCfWWUBWP7hH9vtEY0KsrsBaWvlzcvkk9L6IiVxjoefou6J2JK
	 LaiuGmxZcAIJp+wF6b2it0y0DCTyU/M08srTcJHjx+AioD5DKGfbYI0ZPZK2VsVrsQ
	 YbsY35SoIYgzHMWMpFZIPE1cVp3aDztJ2VvbGrvPjVuqwkIDF4PrqGDHnWDyViLdp0
	 88fKcOGn5w/Aw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56CBD3924FC2;
	Mon, 10 Aug 2026 09:00:15 +0000 (UTC)
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
 <178635241389.3658557.16136831509369007254.git-patchwork-summary@kernel.org>
Date: Mon, 10 Aug 2026 09:00:13 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL,v2] arm64: tegra: Device tree fixes for v7.2
  Submitter: Thierry Reding <thierry.reding@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1138959
  Lore link: https://lore.kernel.org/r/20260802163936.1257450-1-thierry.reding@kernel.org

Patch: [GIT,PULL] OP-TEE fix for v7.2
  Submitter: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1141513
  Lore link: https://lore.kernel.org/r/20260806131232.GA673420@rayden

Patch: [GIT,PULL] Apple SoC fixes for v7.2 or v7.3
  Submitter: Sven Peter <sven@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1142337
  Lore link: https://lore.kernel.org/r/20260807161937.6419-1-sven@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


