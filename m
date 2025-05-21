Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3991D5151
	for <soc@lists.linux.dev>; Wed, 21 May 2025 22:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866669; cv=none; b=ViP1I478fttnfu/J0v2muaFuvglzkKMQnGLULUyPJbLQ8Bwwd4L5Fo7UppVvKiATavqtWPMvKY97XhbKiavWu7WzGP+/eb1zEOMqeXeKs9+1WRTFAC94343KsSMrhFORqV/tor74xG/oodk79Ardy0jdoGNn47Ldr3JeQg8IClE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866669; c=relaxed/simple;
	bh=wP1ALFJqE5U1jBb/YRekpkqX2pckGvOKhF/e9j4+A+Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qrP3OEIxn5Nt20E52Ps66lSFf/8VJ7l4X+jUPK4cqnvoGNaSGFT7lJeR9h2Rr6y4VOcx/4NaxF4rSg4vCAIQeFrbchaT/+P1rK6dt8Adcc5ewLmXaRHPwau7QsT2z5ykQSNGpAAknLnnLFRgWAdoY49M1JZhtZgesvu0LjZGzPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVCSf7Es; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVCSf7Es"
Received: by smtp.kernel.org (Postfix)
	id 6D4B0C4CEEF; Wed, 21 May 2025 22:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57AE5C4CEEA;
	Wed, 21 May 2025 22:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866668;
	bh=wP1ALFJqE5U1jBb/YRekpkqX2pckGvOKhF/e9j4+A+Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rVCSf7Eszs10hKsDIvIVsm1fBvvG+ElJdIeb6WuWvvhvBuXOTs6VHr80N93iSYMml
	 S8tJuHivthqyMuSgVunPB4dG9D7KSEhBuGilVavuVZLUoO5QoPBbYW9m7vKlxiqSzR
	 ShCCX0XZNVOktyVLqQHzfbDtDbdahXs+AKS4QyW/1LYEblptk5y19v+LH4wxE2wUaF
	 mnOhuwvYKz9nh4v4pjuGmHFQeHklmVO0MjvP4w+Xzj4ELnptDwwaxSsU7z2nSxjzan
	 hXpp3N8VyLdzi5lzDFXxqAMZ3y82A2N4t5l/ZnMk2CN+xtHrlaaq5RiPTpjfmvbGoo
	 hM9QjevWWD0Kg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33AB8380CEEF;
	Wed, 21 May 2025 22:31:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm Arm64 DeviceTree updates for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786670398.2299459.9723218528529581778.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 22:31:43 +0000
References: <20250520024248.38904-1-andersson@kernel.org>
In-Reply-To: <20250520024248.38904-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 May 2025 21:42:47 -0500 you wrote:
> The following changes since commit a18226be95c7ae7c9ec22fd31a6124bef5675c64:
> 
>   arm64: dts: qcom: sdm845-xiaomi-beryllium-ebbg: introduce touchscreen support (2025-05-11 17:34:23 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.16-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm Arm64 DeviceTree updates for v6.16
    https://git.kernel.org/soc/soc/c/12a75f2d9f73

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


