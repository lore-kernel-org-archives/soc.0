Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F533EC832
	for <soc@lists.linux.dev>; Wed, 29 Jul 2026 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340846; cv=none; b=VHCKzGvPdcuVxQ3ELRhLrKeODejGS6i/rQix1svb7eaV5mFj3j6KwU3Sqhe1z8sV5bqwU4sry/lhpL8DQohpFgwS9XhHP//QrgGOzU/HVcea/ZfTK14BHQY5eGZ9zpRp5DZno4N9y2x/qx1rj9E/ilPqqjmkH9L9tTIE1A5lQGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340846; c=relaxed/simple;
	bh=OqhB8YXgQM7a8s1a7UEKkr8nTMHKK0IkcX0bh/lKN5g=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=Fn7BqqZwm81ac1fRQZXVVSSk8wmf4VFNdSiH8dQuDPkCdyb1BovcHZcrcg7nz9BaVDz1xsZC1Pnt8UySFNSsuQBEriQ781+Mk1/3KXC7/mxzw67cbXEmV8hiX+2stb8UBwsrgg4ecjlpzJdeCHlsa0GqMmtbjs4wc6f27u1q0jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CyZ+INp/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CyZ+INp/"
Received: by smtp.kernel.org (Postfix)
	id C08AC1F00A3A; Wed, 29 Jul 2026 16:00:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB0281F000E9
	for <soc@kernel.org>; Wed, 29 Jul 2026 16:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785340844;
	bh=bk0lA88qC/vs8gJJLHZziDOCpOVnrvQq/5Kqsvvgw+I=;
	h=Subject:From:Date:To:Cc;
	b=CyZ+INp/WlgwzznF7yly9X+gDqmThMZIFHvOJtNUxMY+itGlYVqkzua6eMQ09Ct7Z
	 4uwx+Wsahi8XJLg8EG19ePav5oJ2N57TJ+bnX/snUlzKnAnAfYaecfviy696y6wb0M
	 V0JK91P0GW/vGXv+SJ/SHaTbcQCsugwIRIRBblkf0GFL/yHMYEYqBawsyvg5p+XyL1
	 npJnHrsLQMjdvC0HBcKUFjR0kA4uK1awb5KjuGjjhaV6ikNDmss4sNLgw6c8ts8Nox
	 huAlZn+KN8HOQMy7o3D5U4HYbKDPsBouvFnh3vW9MVcvnZrBrrHiJcPvnZ28Pydwbw
	 X8ILo0CBIEJiA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1C95939253CF;
	Wed, 29 Jul 2026 16:00:10 +0000 (UTC)
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
 <178534080883.3143403.14124482681774563291.git-patchwork-summary@kernel.org>
Date: Wed, 29 Jul 2026 16:00:08 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [GIT,PULL,1/2] samsung: drivers for v7.3
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1135380
  Lore link: https://lore.kernel.org/r/20260727190010.404981-3-krzk@kernel.org
    Patches: [GIT,PULL,1/2] samsung: drivers for v7.3
             [GIT,PULL,2/2] arm64: dts: samsung: for v7.3

Patch: [GIT,PULL] memory: drivers for v7.3
  Submitter: Krzysztof Kozlowski <krzk@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1135383
  Lore link: https://lore.kernel.org/r/20260727190758.406132-2-krzk@kernel.org

Patch: [GIT,PULL] RISC-V T-HEAD devicetree changes for v7.3
  Submitter: Drew Fustini <fustini@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1135481
  Lore link: https://lore.kernel.org/r/amfoPMED/cB4zinU@x1

Patch: [GIT,PULL] CIX dts changes for v7.3-rc1
  Submitter: Gary Yang <gary.yang@cixtech.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1136620
  Lore link: https://lore.kernel.org/r/amnryOEOpK4PMmxS@gary-System-Product-Name

Patch: [GIT,PULL] arm64: dts: socfpga: updates for v7.3
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1136332
  Lore link: https://lore.kernel.org/r/20260729032308.1359743-1-dinguyen@kernel.org

Patch: [GIT,PULL,1/1] arm64: realtek: Device tree updates for v7.3
  Submitter: Yu-Chun Lin <eleanor.lin@realtek.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1134989
  Lore link: https://lore.kernel.org/r/20260727090933.908156-1-eleanor.lin@realtek.com

Patch: [GIT,PULL] Rockchip dts32 changes for 7.3 #1
  Submitter: Heiko Stuebner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1136032
  Lore link: https://lore.kernel.org/r/2102545.PIDvDuAF1L@phil


Total patches: 8

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


