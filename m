Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC4D39A805
	for <soc@lists.linux.dev>; Thu, 15 Jan 2026 17:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768496761; cv=none; b=LdxMFGvrfLu8OiTlrTO1F+HiNeGTJ/Cb3A4Rloap2O+Qqr28N8Qowcii3TAPUwyXQRTSr4x+v6vN/qL8q91oJKDUZ0MLZqCIZbTboyrQgKDsFJBCd5fnWE1bHeDhdIGxDeSWtb0ySuanIbJ5F8WEDEWtiuj0iUmHFHtO86ZUWcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768496761; c=relaxed/simple;
	bh=HpMU12w/dqNXaQpD9DXlCVQp2R5HHQK7p0OmHRGXJ38=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=CciSkk+KBUkLiGz03YTCwm3LMAknTDcMIekaPN5n1RYyIjSSu8lZAAGxQ2pTavdGc1OZIOk/zMwCHnT0ssWQBWD/W6V0R7Mdi4N8vY9TRCYfKlxgFZ8eiXnTDxbGxqcw/DptM61sZyfx8ylymef18nb3KAlb7KehWUNLibGhMVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqMH9dsF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqMH9dsF"
Received: by smtp.kernel.org (Postfix)
	id F25CEC19423; Thu, 15 Jan 2026 17:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD713C116D0
	for <soc@kernel.org>; Thu, 15 Jan 2026 17:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768496760;
	bh=HpMU12w/dqNXaQpD9DXlCVQp2R5HHQK7p0OmHRGXJ38=;
	h=Subject:From:Date:To:Cc:From;
	b=AqMH9dsFoNQJLVi5RXP4zEwDL846kAN9xk0Qut+WNWRdOeUv8zSBA9Yt3Bq6/2EfY
	 OGxoOPGK55ZGwYCyYOOyjsFYeAl20TFZq2//C3xemD/H4LLJoOTi3U+XWCm4umI3rG
	 Yhi7noTIAE/VnClZbDqh+da6YydrlPC1BrX+th1AuxIQKNiRNUe3R0ZdkGSqjveIzK
	 7/gvhONYHjWyJVgifCO5IOnyHvbVRdf65UKv3f0plRNZpq7OGHdV3+oBsNRWLQhbEX
	 oCECc+WXpWouCQTZ30RrQvn30q9XC3TAHGr36KuWRNR8k9TIT6iTDyhd6j+OurMZ20
	 7MwhUT6tuDMKQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 411CE380A966;
	Thu, 15 Jan 2026 17:02:34 +0000 (UTC)
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
 <176849655274.4073327.1960245978233203479.git-patchwork-summary@kernel.org>
Date: Thu, 15 Jan 2026 17:02:32 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Rockchip dts fixes for 6.19 #1
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1041825
  Lore link: https://lore.kernel.org/r/17171017.hlxOUv9cDv@diego

Patch: [GIT,PULL] Microchip AT91 fixes for v6.19
  Submitter: claudiu beznea <claudiu.beznea@tuxon.dev>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1042259
  Lore link: https://lore.kernel.org/r/20260114104207.2033174-1-claudiu.beznea@tuxon.dev

Patch: MAINTAINERS: update email address for Yixun Lan
  Submitter: Yixun Lan <dlan@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1042567
  Lore link: https://lore.kernel.org/r/20260115-11-maintainer-dlan-v1-1-64bb698da846@kernel.org


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


