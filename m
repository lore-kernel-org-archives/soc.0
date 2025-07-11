Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACE2291142
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234585; cv=none; b=dXTR4lMMOQ68Agym0Tzx5M68AXNzyj7xYOS/luXcwS4SDOXc+VsNa/TSl3FTnBnDUjfOU14afoKGsW8gagEBpZ/RC7itPvv7pS/n5Z8zX6lrK4SOYEGynW7ODUI2O7bRJPvQPekOHHMpLPloJaA1onh3eD6Ei1KzW3KN19lImxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234585; c=relaxed/simple;
	bh=D+MIfsjmTWh7wiJweG1k/mm6cRmDTvCOkJLfmv9V2kE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=oY3UTmNbxb5qhUG3IBc+G3SvtzdfCqJucH65y1poiQQajRFnByw+i7vsGXF6QP34jEMws7YZo20BCdSFrM19Kv2LGZSc3vsUzYQfvL6QsfIp13k8/NlhbZNcjoOwz/Lj4nCyGXEP1qCTxqprV/S1vLPxGoLXKp3TTosn/owa7WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odQ5bqNa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odQ5bqNa"
Received: by smtp.kernel.org (Postfix)
	id C496EC4CEF5; Fri, 11 Jul 2025 11:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3D0C4CEF0
	for <soc@kernel.org>; Fri, 11 Jul 2025 11:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752234584;
	bh=D+MIfsjmTWh7wiJweG1k/mm6cRmDTvCOkJLfmv9V2kE=;
	h=Subject:From:Date:To:Cc:From;
	b=odQ5bqNalG8WKtyvSl4c/w6fX5LKYD47/SvmJb9OVq4o8rNYJNyLvWQoMXFdVJT3c
	 F3yjYJ9uNMruYBaqCP7EQl4xA0Zy1czRwavpNxm85KkcLIhbKc3kCj9Ci7mBfydbKr
	 qEqtkqZMNQc5Qt4afuzLNDbYDnAOTjF7HTjlw48uUQqZWI1BmZNx9U/ykOlgt3uDx0
	 0hRH+INJOkVbX5nHCLVPpm5y/KOtjSbM4DsEai5WyuRhGCQGRkC7o3jgJ6sZw/nxLJ
	 AvdiMyY6+25hSKdgYRtQGU+vrXIfSQU2HnqQRuhQX/Qo/BvoCY8SnDU5L4oHx0NuJz
	 nX4cai61q/aCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C9118383B275;
	Fri, 11 Jul 2025 11:50:07 +0000 (UTC)
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
 <175223460655.2239616.12180090394159722109.git-patchwork-summary@kernel.org>
Date: Fri, 11 Jul 2025 11:50:06 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] aspeed: drivers: changes for 6.16-rc6
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=980812
  Lore link: https://lore.kernel.org/r/d119a7b44b25a1e55a710adec7fce3e9a9fc898e.camel@codeconstruct.com.au

Patch: [GIT,PULL] Qualcomm DeviceTree fixes for v6.16
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=981184
  Lore link: https://lore.kernel.org/r/20250710175434.6201-1-andersson@kernel.org

Patch: [GIT,PULL] Qualcomm Arm64 defconfig fixes for v6.16
  Submitter: Bjorn Andersson <andersson@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=981189
  Lore link: https://lore.kernel.org/r/20250710175815.6504-1-andersson@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


