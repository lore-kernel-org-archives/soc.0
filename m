Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017609;
	b=AMaMlOQnIrhD4UI6b8oO8nbufNmvZ24hiZ1lQRge2QEdvkfq/ewAR08mDU3TpJdlIzBy
	 7pouz9wVSEcyVXuRNSI/OCRCbJfHKfi4W+2MWWav0OZdyR5c2HJh/n7D2ImYwC+wCogjy
	 mvAzVgY8qkLgZBwWqokFUlm5TP21e/Zoz8b0dQ7N0zGTztBzRYf6SmGNZuQYb8CkJbCFL
	 ApWOHt/2yqKpuoYLnsdZfanB5pVK50TDxp6a3yHaNJ9sAjRtTkDRjaTh+24/+lkyxDZtE
	 bARKOd0b7kewFvhRDzpR3LNsqSP76zlCitS6ZJhs+66QEnHF6NyuPeWxLNWtn/6lkRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017609;
	h=Received:Delivered-To:Received:DKIM-Signature:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:Message-Id:Date:
	 To:Cc;
	bh=uq0xpGmvrrFHsOvnTCczMoWT+4xAf+ez2Q2CpQRJmjM=;
	b=Vz2Qg3nQMaU0SzMw8TxAdqqINXXr4LSLctV/f8YYlPH/zXodcP9+AvmDTrlEWhMoUhdA
	 njnWl/begr1MtYG4b6+6OjZhZTb6nb9ZzwAHivN7b+Yh+8rNck5MIGOrrQ0eOZQyNxLrw
	 rL6T/kvpgc0Mpx0XuKCVLJvftaelMqv4Dk6N8zcpqCJvGojgfEKqBtAp/jZUx94JngSFc
	 V2O20Q5NHnWZySPelBaojxOcqpHKUrME0lcNHwckLGg1+AqsWMQIeVEzB8BsJ6TOTgHcF
	 clE353tumjWZolNZB8DdUAnzK5RSkeXVGBjdHwoDlTmh78u5N161d8vUpbnq9ER39Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f4H8uh+2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AA3606A332
	for <soc@lists.linux.dev>; Wed, 18 Nov 2026 16:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f4H8uh+2
Received: by smtp.kernel.org (Postfix)
	id 893A21F000C7; Wed, 18 Nov 2026 16:00:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71F981F000C6
	for <soc@kernel.org>; Wed, 18 Nov 2026 16:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795017609;
	bh=uq0xpGmvrrFHsOvnTCczMoWT+4xAf+ez2Q2CpQRJmjM=;
	h=Subject:From:Date:To:Cc;
	b=f4H8uh+2v0fIbvANaA1n8/AeQoZaUQD9EL6FQp3JgB4alyAo4QnbRiDTtd2gT3E+8
	 YTdPsNGACfazK2773qxxuhe6txBnruEe1zB0G5qcpWSEMkCFrV1aoADiTLHpTTHfkV
	 TDum6GiJYVr8BVFMpZ/DuXF/BtGxAH/PzUtbQPpxThf0H9T1/CxxDkIRr2gPLDueS9
	 +zXVCdMwYZdf+2TK9ms5qi7i3DmlekYPoaE0sCWJ/lmV1+yAXVojBU+kfeuJVB4GL/
	 mXF0tzwQW5kYqUr8miIQFJZDPnKYTFIHcnfFug5IHIZExt2pGsK+JaYZD2DFfcGjad
	 tl0i6NFFRF+9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4E10A3808210;
	Wed, 18 Nov 2026 16:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179501760790.1802028.9531263303162493501.git-patchwork-summary@kernel.org>
Date: Wed, 18 Nov 2026 16:00:07 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Renesas SoC fixes for v7.4
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1204034/
  Lore link: https://lore.kernel.org/r/cover.1793960114.git.geert+renesas@glider.be

Patch: [GIT,PULL,fixes] ARM: dts: samsung: fixes for v7.4
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1210230/
  Lore link: https://lore.kernel.org/r/20261113071751.14775-2-krzk@kernel.org

Patch: [GIT,PULL] firmware: arm: Fixes for v7.4
  Submitter: Sudeep Holla <sudeep.holla@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1199361/
  Lore link: https://lore.kernel.org/r/20261102175440.1063545-1-sudeep.holla@kernel.org

Patch: [GIT,PULL] iMX fixes for 7.4
  Submitter: Frank Li <Frank.Li@oss.nxp.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1213036/
  Lore link: https://lore.kernel.org/r/20261116174947.2957972-1-Frank.Li@oss.nxp.com

Series: [GIT,PULL,1/2] Broadcom drivers fixes for 7.4
  Submitter: Florian Fainelli <florian.fainelli@broadcom.com>
  Patchwork: https://patchwork.kernel.org/series/1211156/
  Lore link: https://lore.kernel.org/r/20261114034550.878760-1-florian.fainelli@broadcom.com
    Patches: [GIT,PULL,1/2] Broadcom drivers fixes for 7.4
             [GIT,PULL,2/2] Broadcom maintainers fixes for 7.4

Patch: [GIT,PULL] memory: fixes: driver fixes for v7.4
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/series/1210242/
  Lore link: https://lore.kernel.org/r/20261113073632.34241-2-krzk@kernel.org


Total patches: 7

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


