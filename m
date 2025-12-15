Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11AF30E856
	for <soc@lists.linux.dev>; Mon, 15 Dec 2025 20:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765831531; cv=none; b=uwL1Vo2Oul5giH6argYYmevAi1muF1/VQnYwYJkHmPrSaw8ODt0z+0NYJHE2LXKxIY9Ln5xPmRxVkOYFnHNDN+YwX2J/w0biuxncwdEV+acx1FCXkpD/MNhHobx6equx2jxa8uRADCMLPlOMgjwzBUoT8KLVHWeEBfn5sSZCMYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765831531; c=relaxed/simple;
	bh=ffQT5cT61rJ5HoHi7PMrdCP32CvXfBrKhJIJBA5/xMs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=usc7sftcu0j/EdfQgJl8myu/TpyTQKKyR7X1ze0iadTFNr+9LiRmvNSs4P45iddDQWbh6lPEl2ED+IQtW2Z/ttVfNWmvpN1gZDlBmD3G+9N+F2jKTwta0YJuPa4taDmf9TUqhzr5wnBP50zIqRmA0hw8XX7HaSqE54fa6Vtf+TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TxXpee6l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TxXpee6l"
Received: by smtp.kernel.org (Postfix)
	id 98E8DC116B1; Mon, 15 Dec 2025 20:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8313AC4CEF5
	for <soc@kernel.org>; Mon, 15 Dec 2025 20:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765831530;
	bh=ffQT5cT61rJ5HoHi7PMrdCP32CvXfBrKhJIJBA5/xMs=;
	h=Subject:From:Date:To:Cc:From;
	b=TxXpee6l1fOwzJqhq8JSx9HuvFTWNJrDpy7GQpDNG4zEDHAugBoqv6NLSCUgziblZ
	 binrv7Jbywm6dW+dZxiKd5P2tVM2kEr51sd4tZQAyvowYmDSSaLFZyNpIMM3iVr2Me
	 1Awr4fc6C3TpA4+bmkW/L+MG5BstIwANqzihN2x4XQ5RS7O3N0tW/ziJjPnU18TE13
	 Cur1LrNF9nu+d/XgQQDHC6ZmN4j74V+sPNuseL2pVtMfyo9RJcTd1IV0QXJWWKwQEl
	 +sfVnapNbTnEJOYYnrMB6VRLqx3x/gT3jYc/6XAX1si+DfzujhxHJ05SBIMaek+r35
	 ZiQh1DzrO+O6w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA385380AAEC;
	Mon, 15 Dec 2025 20:42:22 +0000 (UTC)
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
 <176583134123.289481.10353622716856575209.git-patchwork-summary@kernel.org>
Date: Mon, 15 Dec 2025 20:42:21 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: ARM: dts: ixp4xx: Fix up Actiontec MI424WR DTS files
  Submitter: Linus Walleij <linusw@kernel.org>
  Committer: Krzysztof Kozlowski <krzk@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1032323
  Lore link: https://lore.kernel.org/r/20251211-ixp4xx-actiontec-dts-fix-v1-1-97af8e79d474@kernel.org

Series: [GIT,PULL,1/2] samsung: drivers: second late for v6.19
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1030196
  Lore link: https://lore.kernel.org/r/20251203175942.296554-3-krzysztof.kozlowski@oss.qualcomm.com
    Patches: [GIT,PULL,1/2] samsung: drivers: second late for v6.19
             [GIT,PULL,2/2] ARM: dts: samsung: fixes for v6.19

Patch: ARM: omap1: avoid symbol clashes in fiq handler
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1030418
  Lore link: https://lore.kernel.org/r/20251204095355.1032786-1-arnd@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


