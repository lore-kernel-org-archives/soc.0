Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1C4182
	for <soc@lists.linux.dev>; Thu, 31 Jul 2025 00:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753920592; cv=none; b=ufHFVIb6vUbY2zk4YbAZAmzzHXjB8AB5fdWjGsyPHh/zM/0LjGSHOxXKlCzvXW59E9/XGePaiG4IjWRyfhOYNCW1xER+6lQlSDspQBhHhFkD0PDgD31zw9mD4/81IJsW6Np8nvduAzJThnZPei7pQ46n+iPCW+cgq0VH4b+LJHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753920592; c=relaxed/simple;
	bh=eesE+D/l6zlX4nNiCWHP07DHdaItB31nQE4UMf7Xg6w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=JtTP0mG7mCK3hgzDFKH5X1DyVlrOU7d58kHbZx0iK1DhhVepT7siKqQtVAORlW/fSHiHmLDjWDx3KSl+bWDKD/GiqKQHjTQwJrk7DLTeuX+3JaYvv5YZnsfo0Ds9chriZje5L0g/0geA+6yduyMrSF4e90VaB+KaratFg5M5z7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJJGKIIU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJJGKIIU"
Received: by smtp.kernel.org (Postfix)
	id CAAB2C4CEEB; Thu, 31 Jul 2025 00:09:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B479AC4CEE3
	for <soc@kernel.org>; Thu, 31 Jul 2025 00:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753920591;
	bh=eesE+D/l6zlX4nNiCWHP07DHdaItB31nQE4UMf7Xg6w=;
	h=Subject:From:Date:To:Cc:From;
	b=JJJGKIIU5ZXz7PLvVV2C3GPfNq1BxUr2AzFJUWFmOVLkst08hyZoE6tEDgaOOSHfO
	 HKulesIibJhJCXdA00zRUnhS06eUEfAICHwVsrwZedQnlnEMS1GTN3yXzRMhHayJ9E
	 SG7S9Li2W6NWDucGTpcouUMg4QJY/gV2DXbR9NouyJXA69hPC146foDErDU0xY1/at
	 e0zLM7tYcSl/j1Aw6h2X1GZMSoh7ehpK+Rv5O/gOgaINYM+FhqFA8jLs1Yy4dwWQGF
	 6rFY+aumuhQGn/tPrOX4QNMj2KVKWjwOx/pdCgamgIymAwSarH8f9c47+KG5yEepXf
	 O0du7qK2udv1w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B1651383BF5F;
	Thu, 31 Jul 2025 00:10:08 +0000 (UTC)
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
 <175392060722.2546419.14535510816768856155.git-patchwork-summary@kernel.org>
Date: Thu, 31 Jul 2025 00:10:07 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL,1/1] Broadcom drivers changes for 6.17 part 2
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=987161
  Lore link: https://lore.kernel.org/r/20250730205754.3465896-1-florian.fainelli@broadcom.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


