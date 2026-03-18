Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13F63CBE97
	for <soc@lists.linux.dev>; Wed, 18 Mar 2026 13:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839411; cv=none; b=o0DTvPyoWdmJzGwTsqMp7O1OH6mp5FOfBv+RL6wGr1mofLwVy0NQBu0iJyICDKJGxr54K7FsaQ7CPqQOFHzRLRgAbOM92akniDSapI8yW7sqYTfKJAH2jY/9/8Dc+WbFbfCLTpdcLCmJfZ0q9EaJTlb+vKzpFeAUxY31jXcqhk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839411; c=relaxed/simple;
	bh=nc0ZRVvZ8QnKWWHDXmr/SR2aI6JCzoLRyfMeOoQTOTM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=GSRV4DdPyvx5fYrncf1w015LBnyUbzMc0UkhFHuV/gmAxRecaw8an6kuDB1y+FclvX9wbsjEo/e1diRyFfhZ3VSgYBkSrp8HRvdQVRythFqvu+1yN1xWONI8TY9vkperz/ubF36cahyvCcs5OZmcoQkPw90Q6AXr+YOQXgE+1Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8IwI+/p; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8IwI+/p"
Received: by smtp.kernel.org (Postfix)
	id 96DDAC19424; Wed, 18 Mar 2026 13:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BE7C19421
	for <soc@kernel.org>; Wed, 18 Mar 2026 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773839411;
	bh=nc0ZRVvZ8QnKWWHDXmr/SR2aI6JCzoLRyfMeOoQTOTM=;
	h=Subject:From:Date:To:Cc:From;
	b=g8IwI+/pqSmB3qlm5diHSIv5sh3TXJwRCzVHCz0A4CM0bdOp+wrHvBXWdTxy2oOfY
	 uRXtq8wnOaDbrDN5hEqq5EoJR6ikqWNh8QJj4kCO439OESozP2SMB8tzXP+mypXPoO
	 gdQiOaPlpGRBbwFadXDQ3FWXIuJr1sSrcexQlKoaBVN8ibVCpOUtFjYQPlrbu2No5B
	 GF66fbg9PMGWGNykn5HBi7s8Xp3aH7ccKhZojdmnHCn+k1siP6O35KsdipmyoX1VYT
	 K4IZ0YtdA/yT4BoZLqe3V2mp5AhHog6F2Lw/JahaWKgH/HlrbmYlBoIIVbzfbDoHhP
	 1Ixg71VoIyJpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 429C23808200;
	Wed, 18 Mar 2026 13:10:04 +0000 (UTC)
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
 <177383940270.290957.7864263315250897770.git-patchwork-summary@kernel.org>
Date: Wed, 18 Mar 2026 13:10:02 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] TEE shared memory fix for 7.0
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1067169
  Lore link: https://lore.kernel.org/r/20260316074150.GA2474723@rayden


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


