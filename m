Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 233B82147F5
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422309; cv=none; b=LnVBE33td0gU0WMT30mhsDqRXERcKniLdYIRzHba98qwpEVuyEEKHC4/RM00Ctlx0OxGdkAsOnmNcXu0xuo714KykFeE4CXmNAMbp+nVIPLGELXxEGMq3nRyZceOz35ddXk4tXGZUngexntdzQXkUiJqxukanw04s6cSqWWqIxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422309; c=relaxed/simple;
	bh=Sn4MbwMAfy4YQp6wivOkb3v3lIzl1BAOuF1iSb1lkW8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=do7WIOm9fYCwZyO1Z1U40mL4Zs/D+pXO6RTs7L11eZ3sWN2Zsi5pTNNkcL2ZAxc487KVN0a9Y6aze1jQzIoL65yt0NK35Baw3L58Z+nWGPir8qsURkD9A/7xEbrIls2RagHknaX0MHncfPuB6KxRXwhWW2v0o8wP+XWkX/SZP2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CPdL+EYm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CPdL+EYm"
Received: by smtp.kernel.org (Postfix)
	id 17CD5C4CEEA; Wed, 19 Mar 2025 22:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02598C4CEE4;
	Wed, 19 Mar 2025 22:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422309;
	bh=Sn4MbwMAfy4YQp6wivOkb3v3lIzl1BAOuF1iSb1lkW8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CPdL+EYm+K4KWt8LthdeyqAv9P84BnMzjVTzNW9/lMf6qBFGd4UywW0iXZWinhTby
	 LUQ6aQsQY8XkSY5GM+Uk7X12U2vVR3kSanwkfH4ApET+yT27s0K0LCfzZid1Rzw5a+
	 jOk0vrY5C7fNhf9rqjw7+oI2a8QrUbaErXk3iHGQkbP0yBFk9yMYU9oeDkfuJ0NKra
	 bh4DomtPf8bOvUH5dbDqnidTl7M585JDc8vqTdzxGQ+X15Q6ApziuJuOsi180vluCu
	 lBzexI3epqoLHGg8TsDoLo1zrqb2/noUxW2xIe5RgnygofeY9IQhc5fDLck3gOrMRD
	 z0iGEL30vmqNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAD273806654;
	Wed, 19 Mar 2025 22:12:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] samsung: drivers for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242234449.1211847.11376919611303388201.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:24 +0000
References: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250309185601.10616-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  9 Mar 2025 19:55:55 +0100 you wrote:
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.15
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] samsung: drivers for v6.15
    https://git.kernel.org/soc/soc/c/7bb0db29a5b6
  - [GIT,PULL,2/4] arm64: dts: samsung: DTS for v6.15
    https://git.kernel.org/soc/soc/c/56beaf14443d
  - [GIT,PULL,3/4] ARM: samsung: soc/drivers for v6.15
    https://git.kernel.org/soc/soc/c/af6502eb6519
  - [GIT,PULL,4/4] arm64: defconfig: enable ACPM protocol and Exynos mailbox
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


