Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA6C1C2DCF
	for <soc@lists.linux.dev>; Tue,  1 Oct 2024 11:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727782520; cv=none; b=Qnj81NEA4ebZ5ooJy6tYpmMUa+JwKQV5la9wc23ssLGRDRw8RFMsHEFrrfVgF0bpVHGChCgI++p7NeaIzIS/WUa6wqDIhU07fqx5B3Jrl/jfwjQxNSaFTrzNE/inoBHSNrDDjI/bEuRg8ir2RhC3XjVkNFcZRIEAF/Efspw06oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727782520; c=relaxed/simple;
	bh=0ZFiVCrmS9naVpaACl4Ktl8cNQxxn0tRk7utNPinZeQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KVJui/jDZ+1J/Ben+IvtUEkSBAG6f/xm2cDJVGYV1+7jegwtwkjrtQUNMUI9xSMl+cIypszS+yTfv6bS07vRb6R/33R52SVE4DK4qKmgsN6gurbyL1EknKt6Evi5gw4XfcHk3q8PY16PEIguQCMJwe7u0oHjTnNGF+K5gfVgmpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tvBeCh6Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tvBeCh6Q"
Received: by smtp.kernel.org (Postfix)
	id ED363C4CED1; Tue,  1 Oct 2024 11:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7ACCC4CED3;
	Tue,  1 Oct 2024 11:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782519;
	bh=0ZFiVCrmS9naVpaACl4Ktl8cNQxxn0tRk7utNPinZeQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tvBeCh6QSYdEebeQSSxalYM9wCp8HDT19xOKQvlYfuJqBy7s6mobTBDNiwPIkBfMZ
	 qmw1N32peSDTgQNpjgtik5LJUf5fec485ugWknbHwtZPq6/eKKaw345dEwPA+eVdEv
	 8/IOmN7sFegmkCK4Hv6CfuscBQC8qAeM0YboObrtB+nNOfeqQRrmMPJHWrFpro1M6v
	 mTXaXOp2kTKUhIhDJtxJPuv5zEtwpz9ZUmD/buj/vLY8qZpmU/vfuAecUhw7RnBnlh
	 TL0CuQyF8EAQfQKSuYf6XE1uSljHCZOJ9qfAVQifWKqd1Ao4KgIomd8ofJ3AVftiiR
	 VDtK6eS2RBXsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33DEB380DBF7;
	Tue,  1 Oct 2024 11:35:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V soc driver fixes for v6.11-rc6
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <172778252275.314421.12651797029685769171.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 11:35:22 +0000
References: <20240828-fidelity-almighty-18d5434aaef0@spud>
In-Reply-To: <20240828-fidelity-almighty-18d5434aaef0@spud>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, soc@kernel.org

Hello:

This pull request was applied to riscv/linux.git (fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 28 Aug 2024 16:26:40 +0100 you wrote:
> Hey Arnd,
> 
> Please pull a single fix for 6.11, as things have been rather quiet on
> this front over the summer.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V soc driver fixes for v6.11-rc6
    https://git.kernel.org/riscv/c/3536c01d6577

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


