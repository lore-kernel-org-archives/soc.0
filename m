Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CDA2F236E
	for <soc@lists.linux.dev>; Fri,  4 Jul 2025 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620184; cv=none; b=DKOiXD3hsqYjfTn3VkejgOAuKcW6ycQMJDjp2X+dMjCG7NZZjAoKFc/swTW6UCFrBxhCCcwfIMMkKvwaFBxJRyUDniN3+Z/1r7qQ6ZxpWfv7Uc39BYWaLCJBTuMVJp1w6lAA1A53/K3+0Dgw84q/w33J8WAk2BgXL4S4yf9bn7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620184; c=relaxed/simple;
	bh=ItrBackJiXq1+kT04bBj9oIMekxgjzBWio+qFM110bo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=Z1N74GBexwO5XgM5TV7nmytb2w1Xzjbo50DUlcG9wCyuHirA5/b1A0YEPLkOxrMGhNnImnObAPle3UcVLDx6NyU9dHDjc0IXrnuXKFjNE33vWvIjht65fhYsiBYGdF1eGihxm0764v1iW4bz/fwmjU2noeheHwqEYCIp5HX+Tbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ho+hjoMK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ho+hjoMK"
Received: by smtp.kernel.org (Postfix)
	id 7788CC4CEF0; Fri,  4 Jul 2025 09:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 581F7C4CEED
	for <soc@kernel.org>; Fri,  4 Jul 2025 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751620182;
	bh=ItrBackJiXq1+kT04bBj9oIMekxgjzBWio+qFM110bo=;
	h=Subject:From:Date:To:Cc:From;
	b=Ho+hjoMK5wrexCMLlz8mUIqCfrcuVHA2ihoCTr3BLFENnweDd1E7Dms1NtbacqbaO
	 f2xXG3gsRkWpx0bs9lb+ewHPJFvJUIAVxt1gef3yZviejPmNepjABlZrIOyjEnjaBV
	 PS3PjhqAYJfy5FjCZN47TtYKTFucC/5NAyNolsXphytySaDaHH1hs//rsJb6ViOHGm
	 2z+8jAAV0zeyFyU76hP75xkceZGLVCtnxfXuCdaPiC4LZH9WlAPJgi7slDUgp0psHV
	 /nW4k/+FvZbnSzK6g4GAOTcqSTC3hkvGI8jHK6GdhqOV4QdVtf6v0a/y8P4i1EeLzv
	 lDom6+5vhNXgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 761DE383BA01;
	Fri,  4 Jul 2025 09:10:07 +0000 (UTC)
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
 <175162020618.1782818.10106163282865103141.git-patchwork-summary@kernel.org>
Date: Fri, 04 Jul 2025 09:10:06 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.17
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=977453
  Lore link: https://lore.kernel.org/r/20250630190216.1518354-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/5] Broadcom defconfig-arm64 changes for 6.17

Patch: [v6] ARM: Switch to new sys-off handler API
  Submitter: Andrew Davis <afd@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=975410
  Lore link: https://lore.kernel.org/r/20250624184245.343657-1-afd@ti.com


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


