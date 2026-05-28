Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A9635E1CB
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006219; cv=none; b=pCRunnx3QMoNSojw2AmPnZMQx9TLLCWZcN1pJlGghmeJ9WDPJPXYq0B3iwIKoIIiGvV8oOZtQidfIrHy6O/Ttaajf6Uzzie+fkJ2vW5bB8nbLxbpakrhbhyvyp5d0oJxEty9M5LytwF8C4ci1OsOf/oYHRURHmihczOBvRJvSnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006219; c=relaxed/simple;
	bh=LdrWjOwoflYXUeLIHS7XVbHt0hRmS/VsNai2rgfO2Yc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=DQHRo7QHV6xem9EQMQQ6f/qCudjQ7YziGL7DBnMV3ePaGGWRM8mkGJa8jNrNTeRGAq034t0uVwnwUZt6P47+1NlqGUx9Fe+Kc4qr1OpHIqWmQ61ZPyU5ogdB845eJyg1J+Rfw7wWpk83vK9Hu5cjemVmGrW8DVQyMaYQeVgCohQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f6TifQtg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f6TifQtg"
Received: by smtp.kernel.org (Postfix)
	id 3E0ED1F00A3D; Thu, 28 May 2026 22:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DC31F00A3C
	for <soc@kernel.org>; Thu, 28 May 2026 22:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006218;
	bh=g+MU6p5EraRpm5qS4UZxwFGs6jYuHK1l3sFnTk3cmek=;
	h=Subject:From:Date:To:Cc;
	b=f6TifQtgIz1XSOfQNpalCotvHTV3pHuDHOA4WzrgSa+JV70txEHWIaKpJFFwjLgZv
	 Yv0zSTpPv4R52ranRFG3gHup18M3OP9MRHKafT9h89mmskRk9LW3rgbqm/Is0lxZQt
	 yFSd7zV7oV5erenLimQakVt5SGrzFju7elk+Ku68NKBYTNVDDXU/LLpULMq9rmC9UO
	 Kpk9sAavtnfrJd5Eh1m3TdueXysnPl/7BptLHKPybexHFDwEofksyjPplYPwhnVOht
	 jim5ZBOrjAC7EM0kprEiV5HlS9rJl6P5+UkLABSg7/C7UfEkM1kZ9ZaNgO8lBmDoi8
	 m4mlKLIdUoMrQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93A213811977;
	Thu, 28 May 2026 22:10:23 +0000 (UTC)
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
 <178000622207.1533055.255887635556492764.git-patchwork-summary@kernel.org>
Date: Thu, 28 May 2026 22:10:22 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] OP-TEE fix for v7.1
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1098826
  Lore link: https://lore.kernel.org/r/20260521141410.GA1708231@rayden

Patch: [GIT,PULL] Qualcomm Arm64 DeviceTree fixes for v7.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1101051
  Lore link: https://lore.kernel.org/r/20260526145326.3243-1-andersson@kernel.org

Patch: [GIT,PULL] TEE fixes for v7.1
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1098811
  Lore link: https://lore.kernel.org/r/20260521140219.GA1707515@rayden

Patch: [GIT,PULL] i.MX Soc fixes for v7.1
  Submitter: None <Frank.Li@oss.nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1102431
  Lore link: https://lore.kernel.org/r/20260528190555.3779280-1-Frank.Li@oss.nxp.com

Patch: [GIT,PULL] QCOMTEE fix for v7.1
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1098827
  Lore link: https://lore.kernel.org/r/20260521141522.GB1708231@rayden

Patch: [GIT,PULL] Qualcomm driver fixes for v7.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1101043
  Lore link: https://lore.kernel.org/r/20260526144748.2776-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm Arm64 defconfig fixes for v7.1
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1101060
  Lore link: https://lore.kernel.org/r/20260526145839.3800-1-andersson@kernel.org


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


