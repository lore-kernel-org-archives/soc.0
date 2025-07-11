Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3311295DB3
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 11:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234593; cv=none; b=OR2gs4y49kA3IZVZT/xl3xPKQu+m/RR6XauGnXit7t7/1pkPNDHoIsq/e1D1ZmgO6YuSHCOZ/8rkL+jwiFB0gTJ3xw41M5Zu6907LK3svlmBrRjWJgHKi0VBotlqJqj7sqkyRRImui4qcZNx4wkZ3j0eyqXK4W4akTkU9oeVMm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234593; c=relaxed/simple;
	bh=+rwVNJdt/pNN8JoXFjxD6SkATwBUK6sV4tiRVsFM97k=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=kwFWGHAvapQsRkSHLQty+OOcwzt8Q79sw9N2zxqshaV4l1VWISiIaVLdV27NIvdLpivKHyeuhy7IY2w5unPDIhytmQURKBwckm20xszN0ggh0igXoRC6RO0XXJ1kqLtUSXW1Bda38fIGv9B+tQx+kCBdf4FuUAofypbnhf6+qAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Asu9Y7zR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Asu9Y7zR"
Received: by smtp.kernel.org (Postfix)
	id 630E7C4CEF5; Fri, 11 Jul 2025 11:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D7CBC4CEED
	for <soc@kernel.org>; Fri, 11 Jul 2025 11:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752234593;
	bh=+rwVNJdt/pNN8JoXFjxD6SkATwBUK6sV4tiRVsFM97k=;
	h=Subject:From:Date:To:Cc:From;
	b=Asu9Y7zRyi4YW9Jl9bxNzlDNgP0+/dI5opKww2LqEnhga22LmdAhB7nGcbWPLYuqr
	 0IlQoXuHlyOs3y5mWfCtJvH4285buZWhkM/ejsFLS6vNdO78k+/sqkXLYG75SVQWaU
	 epaDTKkdSMCDpQc93xHQC58vDyYfx5BjunIyZISdjZUk0Rw/UWmejOTk0ExK7mSIrS
	 QvCjMlKJhANkgnj+u85vKzmANCI5K8ggVcJtFvxOxrX40sEtFKYWZeVsKQhbCxdmET
	 eixXp0otXlHBvCK4UJ0E7bOPyhI16stGmJOgXnsCxjmuWXcpUL46Tyl0ZpeTQu9VyJ
	 CdEc+w3xsqePA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70A80383B275;
	Fri, 11 Jul 2025 11:50:16 +0000 (UTC)
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
 <175223461499.2239616.3101164094443761605.git-patchwork-summary@kernel.org>
Date: Fri, 11 Jul 2025 11:50:14 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

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


