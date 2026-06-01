Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC2C35AC0C
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 20:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780345802; cv=none; b=Q0vy+92HQH3JpGXg4SL9EHeTMZEsTSBmB/LG71blCJ1EBiSj0xsnDoajo6HoxjZIBSDPcl/ulTZUGd390a7xCW+5blNHIq5FdonJ9QGVRE4l96LcgnjNsPKklig3Gcm1o8r8zNQ9N4JAbQKuXs6VyDitCuUG6k/fH/POzXB9U+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780345802; c=relaxed/simple;
	bh=DTcyR881UIUgAAn8OjwCmCV5/AZ6Mn5+4q6nNdj97nE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=pxuVv6TONSYLVniso2Kdlt0eF1d4pGUmVKlbwoFloBY2ATECGBLOE0WZFa/ii2ivEQ9OtNdQBzTtSM47WWFB2JKEQmfHB2pDOUv2UhgsJeam8DuDH2Nohh5JErFmkRMANCbPHd+lUaqZJsQw1gWFmGVTaIHMxzoyOiohig2H6ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKRY2Bn+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKRY2Bn+"
Received: by smtp.kernel.org (Postfix)
	id F16F31F00898; Mon,  1 Jun 2026 20:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBC001F00893
	for <soc@kernel.org>; Mon,  1 Jun 2026 20:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780345800;
	bh=A+Wr5rpvLxERjInLUh7j3GGI2jypAc66F9B/Ay1Bvxc=;
	h=Subject:From:Date:To:Cc;
	b=kKRY2Bn+C1v3TbudwUKLfhD8cmeN1xqYZkJtB0w+OY6FcOk73K4yD4jjDGlubC7Xw
	 sP7CH7xtcEHBQNcowZ3fR6ZdbVM74TqAnKibyyE6pVWeaozRRwOSc6TX6OaUoTzWL7
	 qFIdh0yDB62iQRymLrJEFHmlxJigm6wIYEcwUZorS5oV2iPcwDS1UuXheT0UKTDeCr
	 recRW+H/kgWfQEvM4mE+pYJDAARmlJll7VSHJU2mZCr2gPYv2ohAOWfdHDW7+X7+AX
	 lCY6RI0z6g0fYfOD1Kb0NQlH8ZicuOiRfKiLFtySK3qH9Jgfoq/ngSHQA82gWMoD7d
	 zwc9O4BxR2rOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 591E138119F4;
	Mon,  1 Jun 2026 20:30:04 +0000 (UTC)
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
 <178034580303.84967.12259607737788272428.git-patchwork-summary@kernel.org>
Date: Mon, 01 Jun 2026 20:30:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Microchip AT91 fixes for v7.1
  Submitter: Claudiu Beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1103986
  Lore link: https://lore.kernel.org/r/20260601114010.2652407-1-claudiu.beznea@tuxon.dev

Patch: [GIT,PULL] arm: dts: socfpga: fix for v7.1
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1103394
  Lore link: https://lore.kernel.org/r/20260530193213.158229-1-dinguyen@kernel.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


