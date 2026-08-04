Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D383CC324
	for <soc@lists.linux.dev>; Tue,  4 Aug 2026 20:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785874864; cv=none; b=P+i10aFYK5ZnATM26+qScTCzORJe+cbkUOXrWMpWUyh/bp6cutVqqa59f5SUko5ep0+pQbJEMrKJHeJSjvCAIlhliOLpaC5iSkkVmfUhOhmhNDkkc37b8IVo3i+TTjRTBcJO/+QmZcagaVTbvRUtCpbuapkRqQMjg8Ap7Dk4Gc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785874864; c=relaxed/simple;
	bh=caHzUjQfFJecjaeNZp1lR6UbWET3NamvquwM2mdwXgM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=EwTrW1w2GhFWuMd4AgKRwTaeB90CaI3Gn+XKLI9IbnXVJW7AyBq7WuthCUSZWDQNyWkiw+PhyH35RgBO3fartMpWgtM9tkS4K0RpymJbKj3CY5sbmV07QYx3VqRBj6VT+D9FUF32k//6/UPNkxe2yrCv+4fFW7aSDknvow8F8PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=np77HjF8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="np77HjF8"
Received: by smtp.kernel.org (Postfix)
	id 507B01F00AC4; Tue,  4 Aug 2026 20:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379751F000E9;
	Tue,  4 Aug 2026 20:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785874862;
	bh=PQUUPLDPA/ikK3IoAmT/EM6+X1N/4sfTbHyYQR+CWhs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=np77HjF8rDb+HD79Nz4hKYZwsdojmpaUFi9Kl1G2yWSd3BhE67+eZbkBAhi6AJcXv
	 fT7+wtoru9CBcDad3kMvqTU4bIJaOV7EJj9x2tn1QO6fvqW+U9QR0KVbstzCcJkj7B
	 +x6B2HLTjuRYUyzKhAprfqa6lPvoxtoPMWxKq7xgJ+uQ1+YPiuNt4m4XrvIYbimCwp
	 8y9yudXzixXqYYOxAcHn5TFPQTcRBu33/4dDwjIvHUB8j4loyL96VKXn9VkKkV7s+t
	 0WlQ/1657SC3V7cLb01NpGnm8c+eyr0wg6ST4Z6IbS2G9KJWpuOL5HGQBs9NYyNR8w
	 MnpqPx7n2MV/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09D239263B9;
	Tue,  4 Aug 2026 20:20:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178587482238.3769923.16948617044189304823.git-patchwork-notify@kernel.org>
Date: Tue, 04 Aug 2026 20:20:22 +0000
References: <20260730164947.177468-1-andersson@kernel.org>
In-Reply-To: <20260730164947.177468-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 30 Jul 2026 11:49:47 -0500 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig updates for v7.3
    https://git.kernel.org/soc/soc/c/dab25da95ac9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


