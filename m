Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC0619B5A7
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758254; cv=none; b=VJWAo1uspnZ1UEioctI3QQuYA4eFIVmUTb6sTWakDCazZHsgsNPwnR+sWC54gTJbQbzZbaPidpYc1TKa2CgQ2U+tqKB6diPfOoR4XGAS4HDoOU91kjaWLTYLYOstOpLZFCg9bjutt6rCiUPCbr3yOxM6BZ0wvZ5EmDRhZuY/jvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758254; c=relaxed/simple;
	bh=GZGlkI/PArIOFQYpxZ/O70D8HRAskNUfWt4RhKBeqPo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VbPDKgO3BYdXWHaKCDUhvYl8NJ7/hnjx7uHEtJ6E+awTuRKG2VaRNtKIUk78X6yko+06CD0LwSMkv0diIA6SRrNLL0aHxpukanZ8ap43JJLQJEil8cPeI7tTHvoIxpDleFQX6HoBTX3RoqbH8rWCUAOH7JLx1En+rx29NpY80aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4uOUDYk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4uOUDYk"
Received: by smtp.kernel.org (Postfix)
	id 79CC1C116C6; Fri, 21 Nov 2025 20:50:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64458C4CEF1;
	Fri, 21 Nov 2025 20:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758254;
	bh=GZGlkI/PArIOFQYpxZ/O70D8HRAskNUfWt4RhKBeqPo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=X4uOUDYkM5sg19NQh2A1qUc0QXLZ3sBRnv23sJUTsInoj7ZjnXXUZ9uFyZ6V98hNc
	 heHpPn7ydxw215iZ1WWTtlAdbi3umXYkyL8Lqcgp/naGwr490muIUgCE0BP1S0/FZ/
	 2zfTqJQCXmgrgm5dnJwIw+rj33JP6Xy04BRB3ZYw4bkzfP9SreLa5tNZk1T81mq1qT
	 SWB33lIhlsGN6I8lT79MXA/wwkV32ruQ978Fx5mVP78rYU4xWGiTzwuiAhDKvKdXzh
	 MHHbFJJwydI19HLh98/oWDnLOE3xl2LD+3FvZt/dcvnPl+crNbtG8eF8wNpA3ghxkK
	 j84ShyGCAs+ew==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 340603A78A68;
	Fri, 21 Nov 2025 20:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 1/4] arm64: defconfig: enable Exynos ACPM clocks
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375821874.2580769.3344112334245105428.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:50:18 +0000
References: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20251110121344.120785-5-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This series was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Nov 2025 13:13:39 +0100 you wrote:
> From: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> 
> Enable the Exynos ACPM clocks driver. Samsung Exynos platforms
> implement ACPM to provide support for clock configuration, PMIC
> and temperature sensors.
> 
> [...]

Here is the summary with links:
  - [1/4] arm64: defconfig: enable Exynos ACPM clocks
    https://git.kernel.org/soc/soc/c/38c8787f1b81
  - [GIT,PULL,2/4] samsung: drivers for v6.19
    (no matching commit)
  - [GIT,PULL,4/4] arm64: dts: samsung: DT for v6.19
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


