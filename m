Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C1F318B86
	for <soc@lists.linux.dev>; Wed,  7 Jan 2026 17:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767808250; cv=none; b=Gz319YZMOvL96eByRWo+RqUptfgmjf9apA8rU5qss82Wc528e3eg2UXxKJj4ppLOo64PP4HdGXByQct57NCs1Ry3u5usDQ17kfoQ032U3sYkSHdBufRHShYCRWBcblVEuXz76A0AZLNw9N52eEhJkALUt0KhTr4liM5rsm0lAr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767808250; c=relaxed/simple;
	bh=QSqXMqM9z3sdxBOy3GhpkkrH0VzWzKszy3bX/2kqzeM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=Tqfgj60eB3r1BubO4dd8/2LxaR4VGgWseAw7gqGRVcjfeS0heEUqccmHi0aKLrdnDt2NOhxyuTt7fVQJ4D/m2Mgz3CGubQ/VW7rm4bgy8nkJeoxLkzgyYYerfiAhGt3yi48oH51MAm1otWmPgCgOxaT/0ohc8UKbL/IuQ47eJAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvy8Sdue; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvy8Sdue"
Received: by smtp.kernel.org (Postfix)
	id B02CFC4CEF7; Wed,  7 Jan 2026 17:50:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AB9AC4CEF1
	for <soc@kernel.org>; Wed,  7 Jan 2026 17:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767808248;
	bh=QSqXMqM9z3sdxBOy3GhpkkrH0VzWzKszy3bX/2kqzeM=;
	h=Subject:From:Date:To:Cc:From;
	b=jvy8SdueUbtu9ZXJ+fEZaJPOIzMduVmla4sFU5jJpxSuNE76SVfQAmQJKRl+hCQ85
	 Rr9U2h8tX/5cH/knxvGi8P/iYOZ6rG3OZW9Vs4+MFVxOJ47p79i5u0t83SrHW7cJJ8
	 0Qo6R0ak4Rl4UaNXTGtvoW3yLStJ1dJSybz3kHWqux94/5DqncZ0zt649sqLKFKmK4
	 r4S43tYWeQtNK/eUU1TzxGcVxv9Oq2J0kFRclhz+5jntasyMdT+8kl7UTqIMS5M26c
	 SxMVrRLtowJL+cAOgTKkLAzrCWMjuCwjgLHotXod8fNPn1TV+ntfZRiYKOcnYYY7ao
	 4Gmspcjukp2vw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA7A63A40FD1;
	Wed,  7 Jan 2026 17:47:26 +0000 (UTC)
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
 <176780804529.2867211.12231723778782905245.git-patchwork-summary@kernel.org>
Date: Wed, 07 Jan 2026 17:47:25 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Renesas SoC updates for v6.20
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1038602
  Lore link: https://lore.kernel.org/r/cover.1767628163.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/3] Renesas ARM defconfig updates for v6.20
             [GIT,PULL,3/3] Renesas DTS updates for v6.20

Patch: [GIT,PULL] aspeed: first batch of devicetree changes for 6.20
  Submitter: Andrew Jeffery <andrew@codeconstruct.com.au>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1038325
  Lore link: https://lore.kernel.org/r/4ab756729c4e26f7e544156c8613e839a9a9bebe.camel@codeconstruct.com.au

Patch: [GIT,PULL,1/1] Broadcom devicetree-arm64 changes for 6.19
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1033955
  Lore link: https://lore.kernel.org/r/20251216235649.633331-1-florian.fainelli@broadcom.com


Total patches: 4

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


