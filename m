Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53E4148FF5
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 15:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741275683; cv=none; b=FUsTIpz9YQtZvOEX7GW/QuDv/83eAo7jFlPxepRK9st2O74m3dY9n7yo95QKgQski6I16DglFm8EK1q/q20zeuwz9LU5mhiuhTKnvyjKgz7wh+CB+iryHvsKtPx8zparNlZIlJ+dV9rqzaZYgAOHWtKw/SH/HWwz5doAphDcbOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741275683; c=relaxed/simple;
	bh=fF1aoap1wmj1lq3tuvetTLb/w//rnLel3pLltFbnWzE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=h/AU3pDjbGi1RZt2xSsePanIp0ACQK8dPPrOP6gZIDDnfad640qe47WQyD9wZVstT4MrPL6JQY+WVkqn14NThFbW4Z0SQZfO8kKO7nkWI13pW93XxXc6trQhvfEfXKXI4E1W9gU6C5hpPUz07Mh8nGdpspWa7nMMmP3PsqWqTvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJkAMwYv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJkAMwYv"
Received: by smtp.kernel.org (Postfix)
	id 3CE62C4CEE9; Thu,  6 Mar 2025 15:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C04C4CEE0
	for <soc@kernel.org>; Thu,  6 Mar 2025 15:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741275683;
	bh=fF1aoap1wmj1lq3tuvetTLb/w//rnLel3pLltFbnWzE=;
	h=Subject:From:Date:To:Cc:From;
	b=JJkAMwYvu/1KchUH9b/2f4gqpzcOrQiM2nE3f4CKCg9f5TEKHOsbdi7jcCwKJa47J
	 mTmfiaR0tphBklJjHByXivyaLkQu67fKpYbkSQnH3a/j7aR55yJf9u/zIMabo4lTHh
	 numkYlQEX0QlDIoIx7O5qWZPD5F9VLOXs/5zDkTn8IMpLMH+wAKQd6uiTRjfNrvi37
	 IqtBfu9widdHCoyD8C1/r4cGXwy4VKzQ4MaFIoCtd6lBeznmrXk8IXUeMh8S35W8Bk
	 yHxOF4U07uSxMKvd9g9IzRVwgxSNYkbpOEBhTB7mCveLxZ2r5CR5grYo4Vb1E7pcoc
	 BGIkys+dtgFpw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 76662380CEE6;
	Thu,  6 Mar 2025 15:41:57 +0000 (UTC)
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
 <174127571595.1636926.11315000266751031417.git-patchwork-summary@kernel.org>
Date: Thu, 06 Mar 2025 15:41:55 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] RISC-V Devicetree fixes for v6.14-rc6
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=940565
  Lore link: https://lore.kernel.org/r/20250305-sip-unable-d56ef7dbf86b@spud

Patch: ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=930792
  Lore link: https://lore.kernel.org/r/20250205121151.289535-1-arnd@kernel.org

Series: [GIT,PULL,1/2] Broadcom devicetree fixes for 6.14
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=937677
  Lore link: https://lore.kernel.org/r/20250225194041.1063762-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/2] Broadcom devicetree fixes for 6.14
             [GIT,PULL,2/2] Broadcom devicetree-arm64 fixes for 6.14


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


