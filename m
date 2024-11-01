Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BA63EA98
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 15:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730473390; cv=none; b=XDY05Bf4QQaqoPfm99RLSdgjjrMcg5SZmhQeJHrGFWYfzUfhcrCv1g1v44i6ohg7sS3TOiCAfb+OtJwz8P2GQfUqUZcM6heq/etTBoniSsAhrFjIOyOhnqQnUkLrJ9fMS+Uu5zMcoEmOUd8HghEZtBSE1YopH0VIopGzBWYQ6IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730473390; c=relaxed/simple;
	bh=bjg50Sf3Ma0S/R5hyYYCL3RIENdagt1hsllJ8K7HCkM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=IFH+2YXIjIVa+w221UaI7vvFGos3YI79WOMbCRsLRqp6fG10oG6smm5uhFG290JnUeg2gZzM8Baxs1sxU3G/MSoJtRhkwTh7vhkDVl0smePTNDGtsq+bJ7mlQ9cBOH9b93sk7oUoiDQkOMu+p9SsEY20LCwvBTFhlNe13BjBbRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9DkKnvC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9DkKnvC"
Received: by smtp.kernel.org (Postfix)
	id BDB86C4CED2; Fri,  1 Nov 2024 15:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8567C4CECD
	for <soc@kernel.org>; Fri,  1 Nov 2024 15:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730473389;
	bh=bjg50Sf3Ma0S/R5hyYYCL3RIENdagt1hsllJ8K7HCkM=;
	h=Subject:From:Date:To:Cc:From;
	b=M9DkKnvCASX1i8OKyy5W+morry5/wP8oiTS94pGRTeZyIREOPIj8effGc9l8ishjT
	 rOE5Dnm0ZiMFN+jUZO8k287YvL8h1rgp6Lk7WAJ/mfne3mBX45udNOiadQENqhI9mR
	 4rH1+R7ghZdFMaYwKNC5nKgqDIT/bKZQpCpIDGr0/7XkY3IYiqcVXUwDySOtFzceDZ
	 CH7y9SKfYplJe2n1YaTiAbzfNhHlrIWgneuaP6ld8SHdpZJCBWLjrwe0hGtNWNaRfY
	 nrQ4gmQ4fNtNe1Tu+83C2ycFYLZK10F6KDoP5+TWxKYtU+mFE7kRgunJ59hncRvhjW
	 zMdXd7xc5/Fvg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id E47663AA7F3B;
	Fri,  1 Nov 2024 15:03:18 +0000 (UTC)
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
 <173047339746.2666840.9046460991327541644.git-patchwork-summary@kernel.org>
Date: Fri, 01 Nov 2024 15:03:17 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] RISC-V soc fixes for v6.12-rc6
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=905013
  Lore link: https://lore.kernel.org/r/20241031-colossal-cassette-617817c9bec3@spud

Patch: [GIT,PULL] RISC-V Sophgo Devicetrees fixes for v6.12-rc1
  Submitter: Chen Wang <unicorn_wang@outlook.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=903351
  Lore link: https://lore.kernel.org/r/MA0P287MB2822A17623C51A558DB948FCFE482@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


