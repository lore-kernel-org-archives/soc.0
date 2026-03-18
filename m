Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C741DEED8
	for <soc@lists.linux.dev>; Wed, 18 Mar 2026 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841811; cv=none; b=gZ5tLnrC6FVC/cNF3f54hUNi8rNGZy+BNb3qok57y6KnBWw3O1C+xUkkQWnOSQIcqr7dEFg5gaFrQcUbKy7VH5OZI/UU9Ok71xA7N5iZ8xdzzkjCDPpw9VdDuK6Byqbt4hegicAa7P/YgxCHtoferFSUeJA2UdpdqlRM7y8h2pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841811; c=relaxed/simple;
	bh=vvGKk/n04ifofrKkE0g617pwSbt5616Tc8y3b2J4EkA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=rgJ8S5v2QJJ0s4AycoEnMGLdgf77quE4YkJpoj6NVqsgLSg4T5iRNGirjkIPVeDflF2zYKRzSV17+hxMPCAC6H4Rrv3qm53mjXmzQyxXPJTSoizk4Biygprp3UFQA7R1OtQtMjxazS+aqVuU4LAOB6jsp8aAqBX2wnNVh/I648Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMXDy4qy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMXDy4qy"
Received: by smtp.kernel.org (Postfix)
	id 7C21FC2BC87; Wed, 18 Mar 2026 13:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6638BC19421
	for <soc@kernel.org>; Wed, 18 Mar 2026 13:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841811;
	bh=vvGKk/n04ifofrKkE0g617pwSbt5616Tc8y3b2J4EkA=;
	h=Subject:From:Date:To:Cc:From;
	b=nMXDy4qyeZQXvQQBfJrxGAuIKPy4GRJk89r0dNnRnxmRsDeBCLzM4NTRoUbCmPung
	 Jf4lEbPTVs/nNvNwVtfvdUMuJ1N0PL6GpCg/c7tc5e2/QVlNnE1tl4N0eEk9SOHmwO
	 yZJMoaGfitLExNsYlPm0dk3igJlRfhJvMoGgGjYG0PlwnPiZZL2YCnnw/ZZUII6lZQ
	 lGtyP2o7s4USKSCHg3Faaymjrvu7bI/FdZy1kLz58w5qjPypuQ1gUjSH4HyynrLSt1
	 QimHSCWnLfnpLdxx6VxF9ubuxbIfYx5/uTu2Hk2lO6hMCVXOwkcGC3YESL0j29ksG7
	 u2nahwC5MowPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FFCF3808200;
	Wed, 18 Mar 2026 13:50:04 +0000 (UTC)
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
 <177384180290.304324.13054232313305910323.git-patchwork-summary@kernel.org>
Date: Wed, 18 Mar 2026 13:50:02 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] firmware: arm_ffa: Fix for v7.0
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1067893
  Lore link: https://lore.kernel.org/r/20260317101115.3873019-1-sudeep.holla@kernel.org

Patch: [GIT,PULL] firmware: arm_scmi: Fixes for v7.0
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1067894
  Lore link: https://lore.kernel.org/r/20260317101155.3873122-1-sudeep.holla@kernel.org


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


