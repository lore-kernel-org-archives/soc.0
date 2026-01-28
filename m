Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E122279DC3
	for <soc@lists.linux.dev>; Wed, 28 Jan 2026 18:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624430; cv=none; b=N3D+atsVj3cEa+ij4Dv+GfJBlgr51YMcvxWeVhkgZsntZzW/c69FiYLxFAFNvTWs2yChMMiF086mpoAfIph1VDZQhy698HcC+zML6/6DzzkiNJsDgA03YOCay0pLGZ4k9FWicY3GZs1l8VG1DzWatG5T6OWyQ74DkM14R4dCTyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624430; c=relaxed/simple;
	bh=TmOwT1HV8AFW0uS6Q+mAi3a4t2ZoX5tVJUrLcfyj2nw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=gJDYObPg3BPW/L2FGtv+WV2XOgLlRdDQuwzRqCN1DQ2gKZ/YLGanKelSZCioxUgYto0TIX3UeNNNwpwQ3oGcqdHXmbCQmoIbIAcH3tC9OVbBvDShTrlLbuC753M86YMyi1xpcrFU0nZBDdczQLsfnBWOThZVfl5ACbsvDiD1wZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnRdE9HU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnRdE9HU"
Received: by smtp.kernel.org (Postfix)
	id 2DACFC116C6; Wed, 28 Jan 2026 18:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18136C4CEF1
	for <soc@kernel.org>; Wed, 28 Jan 2026 18:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769624430;
	bh=TmOwT1HV8AFW0uS6Q+mAi3a4t2ZoX5tVJUrLcfyj2nw=;
	h=Subject:From:Date:To:Cc:From;
	b=AnRdE9HUWEmGa5vl9sZTklQBKtUVWrL7d6CB9Gm+gToO20mwt6NCG68k/UYXga9Us
	 mhADmoCy0pxeFbbgjcWJkOR5OBbXuq/CvI8rsikRQd1mOJB2h240dOufKeKXzfluGr
	 2tiDEj69ieAiRmczYI6moL/uG2wGf4bluwqDbrjfnFXUD59HByI8Rk25Rq9xCNONNo
	 zz513eUtV+UrBq9vmkwbJg2GE44fs3NvKETX7/e6W29O8fZYI4k+UemHLn3axvzBAQ
	 QtRyuW5L5NmnXvsaZD0BJxiQnSE7SPe1QRwFmSlGx2DS5cADNzTU7MBArUIM1cqmM2
	 ag0Gxq2GKrOQQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 8E9AC39EF964;
	Wed, 28 Jan 2026 18:20:24 +0000 (UTC)
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
 <176962442313.2180130.9704092888641744595.git-patchwork-summary@kernel.org>
Date: Wed, 28 Jan 2026 18:20:23 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V SpacemiT Devicetrees for v6.20
  Submitter: Yixun Lan <dlan@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1045696
  Lore link: https://lore.kernel.org/r/20260122220523-GYD3596979@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


