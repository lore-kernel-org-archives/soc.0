Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAF6254B1D
	for <soc@lists.linux.dev>; Mon, 12 May 2025 08:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747040390; cv=none; b=jY6tbktlu6xlCApBp/1oCvQvLMZB6+EXZT/TQ/zV824tKoonaz+RKJ9hqVDkMj85iTEhI+6IwkwbCoG8Qs/ysviWobGMvpj6Klv+AfwiXNXk8GM7vZFVIMkuX6WDDiha06ULihhlsindvDkCQ3+ChW1OcIRjqD/S3P5Rr9yvK80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747040390; c=relaxed/simple;
	bh=JpEdwuwvKn6ItDExoeSyi3hMlt0D92mg5XIfPqF5w0E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=eluDsdYOLR8+wtTYo4h87urnKyj4gtE6gHpofOVScq0JlJi2FwHx+RUCE5MyH0xJUpuBYqvMM0sCEyJEO+86u30ASl+4D/8Yi97g3932xHT8qaaW8Fysn9tYabZS/MiEpOBOuc7IgqSyH9C9ye5ZPQV6ryTAb0eSLFRoSoBZuqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UqV15fUw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UqV15fUw"
Received: by smtp.kernel.org (Postfix)
	id 9033CC4CEED; Mon, 12 May 2025 08:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763D7C4CEE7
	for <soc@kernel.org>; Mon, 12 May 2025 08:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747040389;
	bh=JpEdwuwvKn6ItDExoeSyi3hMlt0D92mg5XIfPqF5w0E=;
	h=Subject:From:Date:To:Cc:From;
	b=UqV15fUwsoy1xvTHiKdakzMEO6F0ZtvusHKmXdU3eUBmlm1lpH4K06tfBb99Q0JUU
	 k3BsHaM1g/lHvCtsJe4eNfPdc6ZG9FRDzQAFPzq2XdLFRB5LZIbsIk+b1Xv4HyrCMJ
	 MnYmCPW33NTUQAO14EIQUfr5owF3MR93krCPyXUYpog/kL7xwMgzE9v3zkwVEoUXH1
	 wY4K2On785Qh/FP9sPyYlNlEewsfZqrM62O+Cr+STFzXJb6bYbyYwHbC7SO30D/eGB
	 D+sZCPORDBhNYfKGTVfOg9+cOlEgo/liTK66hyOfzs7sw3N2SFLuWcmEXUIwo2cXeL
	 bUnHFx8+mhVJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7406739D6548;
	Mon, 12 May 2025 09:00:28 +0000 (UTC)
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
 <174704042697.517485.11897584790862091907.git-patchwork-summary@kernel.org>
Date: Mon, 12 May 2025 09:00:26 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] OMAP SoC updates for v6.16
  Submitter: Kevin Hilman <khilman@baylibre.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=961757
  Lore link: https://lore.kernel.org/r/7ha57jrtkl.fsf@baylibre.com


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


