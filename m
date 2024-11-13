Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D66A70835
	for <soc@lists.linux.dev>; Wed, 13 Nov 2024 17:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731520221; cv=none; b=ARdP/G0OT1kctjVTbw26HfABjLTyBg0m3ngtdrNABl5Qu3tjZcSdHqM/LCx+kTvYHxiPYfDB4PJ/6D5IE9uAOHCt5js9yAbiwbm0/lRzmWeRaVzy4JbyroTbSA8q1YolfRgsfOdynYv7u/jgS5F1tdfn8u6YhjPLhbQm1u0IiSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731520221; c=relaxed/simple;
	bh=AEyQSgOy5VoHmkRee+2ZsALX2J/pSaoxoC77Ue77h0U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=gqS0+kXfZHLDxIn9zwiLg2iyLH6frj3JmPTVzZkQ7fvZ2xzU+SpwTzt61Gze40sC3/zA9OqaNs7sxN0JpR86inWSg4TVbFEA4MTAGtJLXsgSN7IT13aetozk4dHHogeINadsqzOH2F5J9XsBq7BpHttUls7qrMs1PDI+n8H79CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mKqr1uB/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mKqr1uB/"
Received: by smtp.kernel.org (Postfix)
	id D7953C4CECF; Wed, 13 Nov 2024 17:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC49BC4CEC3
	for <soc@kernel.org>; Wed, 13 Nov 2024 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731520220;
	bh=AEyQSgOy5VoHmkRee+2ZsALX2J/pSaoxoC77Ue77h0U=;
	h=Subject:From:Date:To:Cc:From;
	b=mKqr1uB/3eQtFB/RoAeg77B/etL1+XfD59vZj1yeKzStChxcReJLb6iX1d2m2v9H4
	 ElVL0mE32MXDmNqo6SQKapbOEYo/N7YCiYx4+EKE4ntKt9KRryaqntHeBaFb7+CEvL
	 Vm8JbnY1LIDaN+6DoZB/vqyerRbWYbgc2jid5CVUAfshutap0tP0sVPsojjko3MisJ
	 9cTHPFK5r5sfqJkFCY05DYisu0xycVAg1oGc3beZxJjAKFnpjzepxHiypT3zWSObNe
	 M4s1GXp3TKjO84X9xPrTPx86sVwuc/aqGkgijeYPW5zalseyDA5kOgk51D7GraABIr
	 pNBLlU1HGKjAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 38E2D3809A80;
	Wed, 13 Nov 2024 17:50:32 +0000 (UTC)
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
 <173152023069.1302612.7902158135467071880.git-patchwork-summary@kernel.org>
Date: Wed, 13 Nov 2024 17:50:30 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] A few more Qualcomm driver updates for v6.13
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=909117
  Lore link: https://lore.kernel.org/r/20241113032425.356306-1-andersson@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


