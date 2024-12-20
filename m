Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062842BD04
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 17:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714617; cv=none; b=oRD5H63tkLYDraKGe+a1RqnYfV2ZfUCO5xfdOOlYJtZ/RpdiRXR8tQebx8lPI1UUdxo7Eoip22vGz6vqNbf2dKyKV0QrRd7RgVUDZWl3nmqHeeAF0HcjXcIN4mlYHZ409tPyz4FCeiR/ck61xepq/d+4gdTVbqCaqpOrFxSvjhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714617; c=relaxed/simple;
	bh=JWQ4qGbcQiMqhyuyhwevZNmaD45TRDWG1n5WdO3tsk8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=LK6ZveeTK/WTGhFE2DFD0eYDYm8fx/kCZ2UtghmKUhRT72vWhI9MK8uRjk4F8yQ+BuI1AcM7aKlb2wFilX54oK4cLkrOoRLz9sBd4VQawvC2rjAA03lzzIM6QADqaWk3opL+D1GNdkJPwIbGyUyQpdEdq6as009EPoW31j7TDyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K1+0S+9m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K1+0S+9m"
Received: by smtp.kernel.org (Postfix)
	id 9ED78C4CED7; Fri, 20 Dec 2024 17:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 889BEC4CECD
	for <soc@kernel.org>; Fri, 20 Dec 2024 17:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714616;
	bh=JWQ4qGbcQiMqhyuyhwevZNmaD45TRDWG1n5WdO3tsk8=;
	h=Subject:From:Date:To:Cc:From;
	b=K1+0S+9mkZSv5bIa8XvdYT7TqF0qgJdrFAw1Ci9z7rXxEhaCXVnNVqb3oK8evS0zr
	 quPRBiViZTAjsUrEASFz9v09mD8erF1I1e5sJVkRQroP0yPkZh5i6iGtao54vgIw+o
	 5AXp/sFNJzN8XfiNfM1DInvQD8JIHYkQv0WqN2QAuBOM7RZTWLWNoUEkkX+iVyO9is
	 cRnMjf6i99N0qasNoCsh2VUicaMla6BKjggvnn3OjNsJfe/UGQbzRN0rQ8a2jzI3Va
	 eFrm3AxwuKoxPQQGw1Q+Njtnapr7XezZag+iNXVNb/OaFz/Q8ODM6PljhxRipwa0dQ
	 DKOqCswmb2KIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 72D2A3806656;
	Fri, 20 Dec 2024 17:10:35 +0000 (UTC)
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
 <173471463392.2963436.9904956720505293271.git-patchwork-summary@kernel.org>
Date: Fri, 20 Dec 2024 17:10:33 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] RISC-V soc driver fixes for v6.13-rc4
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=919195
  Lore link: https://lore.kernel.org/r/20241218-suffrage-unfazed-fa0113072a42@spud

Patch: [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 6.13
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=918799
  Lore link: https://lore.kernel.org/r/20241217190547.868744-1-florian.fainelli@broadcom.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


