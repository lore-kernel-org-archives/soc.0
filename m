Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527B93264E9
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 21:50:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775080249; cv=none; b=pRWYUt0ExN3ETPW3KqpnOpRt8Jzu0DolqVig1ZHOzO4dNpaNKw+nGCmMEWa8yr6qhdg1YJjdAXYt5lRaL3J7enWPXfX+ICKQcccCyB7ueXgu9FmFp9H+4ETvZdrgTDM9l+TU5Y8Am2kOA1M2ysFKsUedz1BcZ5pQhqkLuvYfN/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775080249; c=relaxed/simple;
	bh=4T1fOezC7e/GUtF6VNXKioGmDPTUycmvZ1pV1h4vaGc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oWpfjtOTHQRcYriKFlLOPBQxwzE5Mo946Vs8Vp+wmXIISZvPB6HMW+UTa7i9bBQONIZ7R2h/N2imyzvFJ/L0IJSCPEgompum3c+pufvhXVRkPhOHqOpJXZo01ULYYRo6xnpZVSffnal+W95p+mT+DbTcTcK/ze1wc5b8OPVXoVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9L1egLp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9L1egLp"
Received: by smtp.kernel.org (Postfix)
	id 4B88CC2BC9E; Wed,  1 Apr 2026 21:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 357F9C4CEF7;
	Wed,  1 Apr 2026 21:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775080249;
	bh=4T1fOezC7e/GUtF6VNXKioGmDPTUycmvZ1pV1h4vaGc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=k9L1egLpPGE58hrd4PfUm9ERopdtRs8L085J3m9ukQl2zCZ2j4+ccSxbQiZFFHeZA
	 dh6ZkdJnkl2QQFtx3/scvnqQB6+tFfOFMWJb87kKlXmDT9Yoqbr7UEmaH4I/sDs6vv
	 c5fzA/KXivSyZa251EgoRUzwh6bHm1r6dm7cK8fbX5/HQ1UXSgLAh8Wlb2FiO1gUFf
	 45VmSv61OTWQyk1VPmp6iTB14SJAKJWf/drM+/P/WpjFGC/W0l/PLkQEvqsKXvRYMJ
	 5oHSo9DOkttdIRouTq1IkuZPxBPwJVxvfTe8Rh7gLP9Ex4nfyks9AM8TfrRAsvOkhI
	 7bnRAIK6M3TUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE9F3808203;
	Wed,  1 Apr 2026 21:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom devicetree changes for 7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508023178.3876275.6579807299020012098.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 21:50:31 +0000
References: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
In-Reply-To: <20260323190239.1890505-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 23 Mar 2026 12:02:38 -0700 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.1/devicetree
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom devicetree changes for 7.1
    (no matching commit)
  - [GIT,PULL,2/2] Broadcom devicetree-arm64 changes for 7.1
    https://git.kernel.org/soc/soc/c/185fb140508b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


