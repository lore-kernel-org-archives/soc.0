Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15D9241CB7
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 21:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758897; cv=none; b=Q5Q5Kd98dygRGzgS9jTrS7S+1C3R33u3C3+vaJ+HhXLShHyDV7xZZO1n+/7Qiwr8Gwc7v9+CO/8N2SF8WrB/wjoonybM3VLn4Z10JVwX/+5Dc1zEcC7uhpOhmArNmUi/eqQvU70BPrkJ7iI/WROKR4BgmYktOr+0n5o/BmlCedE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758897; c=relaxed/simple;
	bh=oXqm7j4NqUPK1lp1QCT1fNOPnCKdBRtPWUBcXQEFsZ8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=ccYzUl4Fzc309KYfdw7ryeliIyy79cQ0hXGE7YABK4jEdAeH1973Je1LFSHsA1mIYn/qh+EsdHkNmTc81pgHDDz9y31GNY6Q6txBX3NeURb3X7NouxAJGrjU5GIyG1MkGYQB2PS7nPLoNRve7CgthcTBlUy+qCk84HfHYwymvPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=neW/SNxB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="neW/SNxB"
Received: by smtp.kernel.org (Postfix)
	id 71D38C116C6; Fri, 21 Nov 2025 21:01:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F06C4CEF1
	for <soc@kernel.org>; Fri, 21 Nov 2025 21:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758897;
	bh=oXqm7j4NqUPK1lp1QCT1fNOPnCKdBRtPWUBcXQEFsZ8=;
	h=Subject:From:Date:To:Cc:From;
	b=neW/SNxB5TeXnCWqvVkMUTFSlVamWnunF87xsn36TsJyZkYs+Yw0ReG2B8glFmMwb
	 9IYCCPHqcDEvcD4kJBOza8QCmwYtxWJADSI4pwKRV5wO2SX9EFXx6gaHgimnYxu0nS
	 7vodZSbAIUjXg4Os7hNKOzu5x5yGrcEkHJpx4OE177gUe8U7TEOsHXT6kstr9uGUNP
	 fbA0yn4gMgllgsuZLmJQGGkhoaZDd3DNIN+pDi/EWpnM9qElNpmFQxmvBWv7y4IpaU
	 gvpe6Z/TfD+UKvzoJwiGLxqDl6rNd++p3n6EP3h8+uqmCXtBKVdZPo3QIeBr5juHqx
	 nG+h2TKp0dd+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EEA2B3A78A69;
	Fri, 21 Nov 2025 21:01:02 +0000 (UTC)
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
 <176375886152.2583629.1456641887473145911.git-patchwork-summary@kernel.org>
Date: Fri, 21 Nov 2025 21:01:01 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] i.MX fixes for 6.18, 2nd round
  Submitter: Shawn Guo <shawnguo2@yeah.net>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1023978
  Lore link: https://lore.kernel.org/r/aRnQK0kiLvQZ9X-f@dragon

Patch: [GIT,PULL] QCOMTEE fixes2 for v6.18
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1024179
  Lore link: https://lore.kernel.org/r/20251117094712.GA1518418@rayden


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


