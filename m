Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF33486623
	for <soc@lists.linux.dev>; Mon, 14 Sep 2026 15:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789398670; cv=none; b=F+qqnUSyEBjTgdvnAUfqLN0gI7mwzoE2+DXpZVSnTatHoMmwVNFbxHPGUcoW3e7xzSpUU7uNP8xREbpuG8NqGPv2Ge1vaa9Lqni6Rsmkbi6lRkborAPRltTtMW3A5eGgwC2DHgmPZsrZ4TLi4ar4YyPbyW4knFKwxFql2lE2etc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789398670; c=relaxed/simple;
	bh=ZKXuS4Q5PORp/BQg73hd1eAQtc5f7TbO23uzF161SWg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=Qn9tfK2PvRpSUciK6zOT6Q7nmhiPd/hYZB6XrgOD7bDiR8qTnPPeSCbXjZL5DSM7ELPM3OTbsrtaD5VDZZfnZ12zy6BQCJA9tk3IX3haK6tBZ2/hKtZnU5ggl2KAjk+rg71fjiY5xjeaYvILUHVSJaDNsIxw8EufNncdNjPMfGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgtWjxN7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgtWjxN7"
Received: by smtp.kernel.org (Postfix)
	id 298831F00899; Mon, 14 Sep 2026 15:11:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D661F00898
	for <soc@kernel.org>; Mon, 14 Sep 2026 15:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789398669;
	bh=YjbnXQRaizPMFizNzGMI/25e3OKcrsZqpBezd0BZi5s=;
	h=Subject:From:Date:To:Cc;
	b=AgtWjxN72tjMLStzho5Qz8rWQhJFgguEOI2V2bwEyAFn6f5bGSTkIEIQQct8PP/Es
	 Yzyuk0TkVygLqz0pagJZp5bSHIIUOWOrKXPBfm20WNsNx9Ht23Z8PPNvLWEHp79lbz
	 xLwRDEj1+cwVh//oQMIYrOCiG+tP90e6GDrOtQ3OFzSewKcs7+U2+RcSmFg8GQtcwl
	 GibsXzrcOYGmRhdo/pos4LaqxBQa0W6k4glGIAgt8qQAP+mEtjkV+ORd+2ePfBsuGv
	 RgE8UexQxO/jtkIzuSilzBTPEfpN84niWTTb9jXNofYBmLGJXToD6OFmLBY7+bwsDh
	 Ohw8W/zNP2VLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 58F993924A6F;
	Mon, 14 Sep 2026 15:10:05 +0000 (UTC)
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
 <178939860385.630437.13165435712405928119.git-patchwork-summary@kernel.org>
Date: Mon, 14 Sep 2026 15:10:03 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] arm: socfpga: fix PL310_ERRATA_753970 Kconfig option
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1159902/
  Lore link: https://lore.kernel.org/r/20260907161952.1148669-1-dinguyen@kernel.org

Patch: [GIT,PULL] firmware: arm_scmi/ffa: Fixes for v7.3
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1160823/
  Lore link: https://lore.kernel.org/r/20260908201216.2993544-1-sudeep.holla@kernel.org

Patch: [GIT,PULL] Renesas SoC fixes for v7.3
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1158100/
  Lore link: https://lore.kernel.org/r/cover.1788527983.git.geert+renesas@glider.be

Patch: [GIT,PULL] arm64: dts: socfpga: fix file access permission
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1159903/
  Lore link: https://lore.kernel.org/r/20260907162016.1148705-1-dinguyen@kernel.org


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


