Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49363E122B
	for <soc@lists.linux.dev>; Fri,  8 May 2026 13:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778247659; cv=none; b=YV1E4d2J5mXa+awDczlHQfZJjkB1HglVTY0eyLueOIiOVVW5oXGaUaqHvDgqEsxnopjQIpIwQGCyLsKpdF3KL6qn+QboZeWsCPe3aLxFvs+sXW/qF3XX/4UkF3Gcr8h0+UPeCtp40SSPMRk/YqL/RjIj7GEqUbQwxcp1gOED74o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778247659; c=relaxed/simple;
	bh=XGsDSOQrnrRJgpEzklIhQu6C8l+qtKlw0j18LNdm29s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=nKz7zGgxOMUW9oV2p97YdgTJo+j2ixz8+j+WWLp57/0IaQOaE1IeZdwD26EZkoVVbnYyotRJfh3h4e8hoXPsx5UBUazupNJwlxZ5+Q22OhfNDDuPO6rfRwHsVjpgkB9T2QM78P1u16fFmGXV/Y8viIQGQtklDKEYpNj7vd8xk+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8n4llol; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8n4llol"
Received: by smtp.kernel.org (Postfix)
	id 06CBFC2BCC7; Fri,  8 May 2026 13:40:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E564DC2BCB0;
	Fri,  8 May 2026 13:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778247658;
	bh=XGsDSOQrnrRJgpEzklIhQu6C8l+qtKlw0j18LNdm29s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=H8n4lloltIa5lrIL52hLzFCA73owMIY76/000+TlMOGFyAihGmWB1gM7FAfYpcZFN
	 LWh9Bc2UxMgkkbhkZnLd58+Xu347Q99824tnPp1o7pm90O06MUzOnMpivitdXF5TsK
	 AJfbpf+RVolrvJ/yYQelxtxF1LrX5JHN98TTp9AtHV992JicIyvJS4DI71gmeFiTFv
	 EtpUUOaeZDU5Ly/c77t43gN0WXwh/ViesNB8fnuI2myzQJbe8vY2sIN0gdw6jz64xw
	 JeM4vtjXFFKOMyhqD9zzra86AXiozCLKOaZxIYQFUdMb0mcMaWu5NIfnd5+rnFShSf
	 IBu6kmB+d3hjw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9D20381195E;
	Fri,  8 May 2026 13:40:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V devicetrees fixes for v7.1-rc3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177824760729.686902.14031312472413430574.git-patchwork-notify@kernel.org>
Date: Fri, 08 May 2026 13:40:07 +0000
References: <20260507-blush-secluding-aae99d404f6f@spud>
In-Reply-To: <20260507-blush-secluding-aae99d404f6f@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 7 May 2026 18:54:08 +0100 you wrote:
> Hey folks,
> 
> Please pull two relatively minor fixes.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V devicetrees fixes for v7.1-rc3
    https://git.kernel.org/soc/soc/c/1fcf4149418e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


