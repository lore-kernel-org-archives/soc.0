Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08297376BD2
	for <soc@lists.linux.dev>; Thu, 29 Jan 2026 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769680318; cv=none; b=q654G2cYBuIQgYsCEQ3ulbXaoNwGqK/RUv2ZAXyHFNyq+JVv8YL4c/RpODmRwlFomvxvZCyZzb5cUdzZxlN/M61MQXiqAcvYXm2rzTWeTa3xzKAtWDG6zZRbT3oYIi0yyG9/jfWvrBuGTrxdM9i7r/3yaAl0aofqpN5GW87xbvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769680318; c=relaxed/simple;
	bh=nDk6xYIF/J6VdxJc0CbtKL2v4/vIZiBswJnLUVpfjkg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=d+ZvACmorV6aJp1wkHC4Cf/XaHeV2elBX100yCGa0POfCLMWZl1uwR3r4sJJmxO5YBnY2k+LxCqr3FQBERLVuUHXvQNg1Ucq2biUdKXYOAft19aiezFW/818aXXgwK8v9ulgSqQff7G2cyO7tbBO+9IsLH45cLVhUdeOuRgBFU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tiDggGaX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tiDggGaX"
Received: by smtp.kernel.org (Postfix)
	id 98DD2C16AAE; Thu, 29 Jan 2026 09:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 834AAC4CEF7
	for <soc@kernel.org>; Thu, 29 Jan 2026 09:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769680317;
	bh=nDk6xYIF/J6VdxJc0CbtKL2v4/vIZiBswJnLUVpfjkg=;
	h=Subject:From:Date:To:Cc:From;
	b=tiDggGaXffjMWP/jNwxmeH+2HLvZNHJPgNCCZxPdB+0bW2KwH/TibX+t8kivuk2FH
	 TY8InsgX9+D/iCfkVcUvBzC89GCco0vZx76CiE8RR6GMBXBtttgJQOuPiNlkFN7eLY
	 hVv/Vtv2PM+uxMsIIHjjTMoQ0DlMaQLxyznYP/t/TEdJOUlsMmd7pCIqS08sZljVKe
	 xtQKX5++Bde/NzDqQc4YBBnpDm0nf5PjbWE+ORg9Jxom7JL6zjAhX4Z32MTyGa9bZy
	 nn3DTG8Zzc3u8sKM+JAwc+eIDifNtB7wLbUGJD7zWx3GmxQHKMGJlPZC3HfIJJWK2q
	 VS4ChXVERxSIA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id C8B6E380AADF;
	Thu, 29 Jan 2026 09:51:51 +0000 (UTC)
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
 <176968031048.2433421.17905535193040374086.git-patchwork-summary@kernel.org>
Date: Thu, 29 Jan 2026 09:51:50 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [1/2] ARM: defconfig: move entries
  Submitter: Arnd Bergmann <arnd@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1041279
  Lore link: https://lore.kernel.org/r/20260112153255.795553-1-arnd@kernel.org
    Patches: [1/2] ARM: defconfig: move entries
             [2/2] ARM: defconfig: turn off CONFIG_EXPERT

Patch: riscv: defconfig: spacemit: k3: enable clock support
  Submitter: Conor Dooley <conor@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1048236
  Lore link: https://lore.kernel.org/r/20260128-sitter-crazily-184c1a7606db@spud


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


