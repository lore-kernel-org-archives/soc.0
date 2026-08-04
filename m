Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FF742A79E
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874846; cv=none; b=aK6DCSLiwBsZ8vvbk/GPA+fCslZFP60PuxENX3fMwiK3lUqW5yMUV5jcbAiV5bXwvx9KzYAJOQFnW/RwzoK2T0NoPN2B5+y5qxZRJ0SbgsOzSac/Cl8pUkO3hI2H2qXDvbfkSPrAkrWG3QeIR7GU08cRElC5z0vwUQPPSqbKFDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874846; c=relaxed/simple;
	bh=duqfprfVl2oww+GKsVsUTH/9a4eTs7+KRjDNn13Zn0U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=r0LsYCC/I+S6fzcnIh2I6Mh9yJDQ6UT+EfuAXm6ZbxS1C+07wds7h4w/pJvvf3ZQV4JS3/shkt8oUrvjzb/gZjgX4tNqdKQ1N0YZXL+npuIoDHytsTB9m8U+A5VE8Bf4gqwln1V/0WEplrW2Px3KSiphVsCOfSRTHhZkSag7IHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0CCuyAz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0CCuyAz"
Received: by smtp.kernel.org (Postfix)
	id CD48D1F00A3A; Tue,  4 Aug 2026 20:20:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B79911F000E9
	for <soc@kernel.org>; Tue,  4 Aug 2026 20:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874844;
	bh=NwnXK8QsjcZqVTvqKJwmNjkAA0twJtHsHojaFJXDaCc=;
	h=Subject:From:Date:To:Cc;
	b=P0CCuyAzUHRljmo/w02k7ThfzLTJrN/vWIbxJobagdNMSR/nQfyVcGOqDrno2COyj
	 YYarwLqxSpG4jYipfTIsJ/AkyO+QnRFW7LYAeBdXEpMqu4ShGhNcxzlF3Ho96qX2Xe
	 xi+SisawJ9SE9bKdbw3zVHNZ+bz1iyjwFfgenHQ5A/npHfosamgaP/tx9KCO6EwXSL
	 shUDK21aqVRD/5ADiSd0qzTzFwHNenyTSupEpe9xfCVmp1vlKl7o7l8VdNNrsSfZJI
	 TDuWmsCrXg3h9ElV16/AtH+dQfRRtoQw68W8DoeWPwANA45Nqh6itElLuzZJsR+FrH
	 9T0sC8gqPU4+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5900039263B9;
	Tue,  4 Aug 2026 20:20:06 +0000 (UTC)
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
 <178587480497.3769923.16757610353510894380.git-patchwork-summary@kernel.org>
Date: Tue, 04 Aug 2026 20:20:04 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] aspeed: Update MAINTAINERS for 7.3
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139844
  Lore link: https://lore.kernel.org/r/cc2b296319ac4b52602c891ab04807bd18a32bd1.camel@codeconstruct.com.au

Patch: [GIT,PULL] nuvoton: First batch of ARM arch fixes for 7.2
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139867
  Lore link: https://lore.kernel.org/r/7e2b04791c00f37d2cda5fb63b10ab41f9e682d2.camel@codeconstruct.com.au

Patch: [GIT,PULL] aspeed: First batch of driver fixes for 7.2
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1139850
  Lore link: https://lore.kernel.org/r/3da63bea367b3490b041c909a4503cc2b5e9c394.camel@codeconstruct.com.au

Patch: [GIT,PULL,v2] Broadcom devicetree fixes for 7.2
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1137737
  Lore link: https://lore.kernel.org/r/20260730232519.2706487-1-florian.fainelli@broadcom.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


