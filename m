Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BE422A4D5
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 16:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757693414; cv=none; b=cwkxab9G+Bf5hVTLy+XWSxL80L2SPiA2Hai0KsRifCflFnkCaSotlyeN2TGsVMVmZjjqzOI0P+Ru9VhsswwdeVW+6X1Rn+JyHJOif70MhiTE8KEWKX2lxlKM8zxmdpR28Za3+jROBimy7MsFAO29MfaTDBSs1GJmn7/PxB9D2w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757693414; c=relaxed/simple;
	bh=w080j8TrfWrpxh+YltHHNF7LnDJ7nA1ZK0dY8myaPVg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=l9nHI5ol4UxTIMVsRUK+4y6DwdBr3E+BHItlK9hngmXSHBdscmXmq4E2IxmSUK4poO/RcJ5zgAzSkZtUcyTj3ijZzM0AO9DQR9Y1Z9zsycGkLv9o/YffvgJg989Zo/xC4xsXrKYu3l3P4YIflnZCijvtVdDhlQkEmoVOWHswdHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQaUffbR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQaUffbR"
Received: by smtp.kernel.org (Postfix)
	id A8769C4CEF4; Fri, 12 Sep 2025 16:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931B3C4CEF1
	for <soc@kernel.org>; Fri, 12 Sep 2025 16:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757693413;
	bh=w080j8TrfWrpxh+YltHHNF7LnDJ7nA1ZK0dY8myaPVg=;
	h=Subject:From:Date:To:Cc:From;
	b=TQaUffbRIYRt+5DX+BLpCwYWmVO84UubJdGUSIug44k4RvzHPUg8CijOkBeXmY4cy
	 zLcP+XAwj+BAbx7jvsMikts5GB6QVNpySDfax/XH0Yso4BuH7k7tKbPa2u7HEzZx0U
	 mYkj8KwXKjWwbT5ELtNyIpBwQjjsiQZlxDyRc8PvZ8dT+o17TQrvNNv6dZL+ITg7F3
	 QyssuBbXb0iWrIQF/HiqvxdldxzYgG+eG1NbyuQZASa/dyTcfnZnjlJvaSNYgiSMRj
	 U7nnngmaWp3kk+LAxkvSigODOidMmi2zzl+eru9Q12n/kEGd6nyiAri8k1GmNIThWM
	 1Cmb6h4sYeNdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33BB1383BF4E;
	Fri, 12 Sep 2025 16:10:17 +0000 (UTC)
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
 <175769341590.2998972.6279091559727859707.git-patchwork-summary@kernel.org>
Date: Fri, 12 Sep 2025 16:10:15 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] ARM: at91: fixes for 6.17
  Submitter: Nicolas Ferre <nicolas.ferre@microchip.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=998524
  Lore link: https://lore.kernel.org/r/20250903173403.113604-1-nicolas.ferre@microchip.com

Patch: [GIT,PULL] Reset controller fixes for v6.17
  Submitter: Philipp Zabel <p.zabel@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=998936
  Lore link: https://lore.kernel.org/r/20250904153345.2374313-1-p.zabel@pengutronix.de

Patch: [GIT,PULL] arm: dts: socfpga: fix for v6.17
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=999747
  Lore link: https://lore.kernel.org/r/20250907123058.175447-1-dinguyen@kernel.org

Patch: [GIT,PULL] i.MX fixes for 6.17, round 2
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001836
  Lore link: https://lore.kernel.org/r/aMQs2zr4fYl2DYVr@dragon

Patch: [GIT,PULL] ARM: mvebu: fixes for v6.17 (#1)
  Submitter: Gregory CLEMENT <gregory.clement@bootlin.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1001862
  Lore link: https://lore.kernel.org/r/87ikhnn1pl.fsf@BLaptop.bootlin.com


Total patches: 5

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


