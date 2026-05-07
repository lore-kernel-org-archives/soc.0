Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982603EAC82
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159213; cv=none; b=Sjt2dJ6qUKU5WOzyXqzh4Xd+7yHFzlSoOVtdhdweaAH4TzMRRxAT5654lnx0yr5JIpONaexH5NG11Ounjo3AXEGo+gstdzpBW+5cZ/fjUeFTnp2RM3+rNn2ji3kZomE9K6v1q/J7hmtqCYjKveVvrVFMyPUE2P2Kz0KCNoBf6qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159213; c=relaxed/simple;
	bh=6Mp0oXIPD7P+V7v9zFxmocTR6++05Wdh3uZNUQKiVjU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mA14ZiV64RulGn5lIAG9w7PZ53ZU5dVGwkzDKBTc7ea7m5lV5T4IX71it6/9Jvw3un59d68VHxykwRAynHhIHbg6Nf5xjEL7TLCBDaoUSkReBUr0Vj2VaY0PDJMq/VGybtk55ZVfg6BOnFjkhk/GWOM5rVzEXtlkM2XvPqHwTgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5GneErE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5GneErE"
Received: by smtp.kernel.org (Postfix)
	id 56E98C2BCC7; Thu,  7 May 2026 13:06:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407F2C2BCB2;
	Thu,  7 May 2026 13:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159213;
	bh=6Mp0oXIPD7P+V7v9zFxmocTR6++05Wdh3uZNUQKiVjU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=U5GneErEgEajn1Cd0tiaqE1SOJQyA/DKdVLkcFZ+tZBxqjR3tGZlV0+Yau20xxpgD
	 hRa9cbUygd7D0sbE+wqABlwy3N44khlrv9RBJEqRTOFIJtThGuw8bbbshHLA7A7anG
	 bj08EZgHDfj6Up2qUVRXuzP6L2/Y8GpPndQLpOwrCiwbR5JEXGRLtAiFFLdWL5Mlxz
	 7zUSqBElQMrkopFjk6FaakK7c8y5B1zBOwvjl2qq8NHIm+Fo3psnLN4XcoHkWhtkLb
	 W6ebZ7itykRdb7jhCF7OHCSpkYLGTHtkaqjipZFK0uxH4jr+I072Jly2I/Oqnin1Dq
	 Whye10icAADkg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9EE739308FD;
	Thu,  7 May 2026 13:06:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] ARM: integrator: Fix early initialization
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177815916228.3933061.12051407083802172344.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 13:06:02 +0000
References: <20260505-integrator-fixes-v1-1-56ab9aac59db@kernel.org>
In-Reply-To: <20260505-integrator-fixes-v1-1-56ab9aac59db@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 05 May 2026 21:15:37 +0200 you wrote:
> From: Guenter Roeck <linux@roeck-us.net>
> 
> Starting with commit bdb249fce9ad4 ("ARM: integrator: read counter using
> syscon/regmap"), intcp_init_early calls syscon_regmap_lookup_by_compatible
> which in turn calls of_syscon_register. This function allocates memory.
> Since the memory management code has not been initialized at that time,
> the call always fails. It either returns -ENOMEM or crashes as follows.
> 
> [...]

Here is the summary with links:
  - ARM: integrator: Fix early initialization
    https://git.kernel.org/soc/soc/c/90d77b30a666

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


