Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BA4265CBD
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662446; cv=none; b=o3WP8xHGUnNKzgvYDfI8/ktcB/m5c93m2bqlndMR4O/W4iWUDE4BvnKbMnaQqgqTd1El2q1t/o/Jkw7ZR0todvlzvKN8YpwIp/VLFfVpM8pxMFHSNXRkHA8mLzyM/Q02JTj6WD/7m/Scy012Wcj8TNa3cOvBT+MqSBWNXDSQ0o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662446; c=relaxed/simple;
	bh=FVxzQDaUgINeKK1YuxbF0tYKllGiIU/2FQXmU3KOFaU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GkPCPuoKzF3L1+D7KA+9e9LSrZCVck1B3JJ8pIcYtCOoXpd+6I9PnVC4RQ/HoBllDkKIdRB8+qbPWSl8nfoA8pS3dgCJorcnGO8bOdmCgGpzEX3zv7C5r9N4p1oMoUI57aPuO4PP2Ss7bTB1gSHBpPQKmLJpRwSkgKn0+9KIDM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jKmDvvHc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jKmDvvHc"
Received: by smtp.kernel.org (Postfix)
	id CEC08C116B1; Tue, 23 Sep 2025 21:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F5DC16AAE;
	Tue, 23 Sep 2025 21:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662445;
	bh=FVxzQDaUgINeKK1YuxbF0tYKllGiIU/2FQXmU3KOFaU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jKmDvvHcWxLrG2r6vlwPEXWS4RGWvxo10Ng6sRBUvm+pdJqDBanMqyVFF910DyYJA
	 TUoE05GHNdZDLZ4bi7jhpruR34OzOyXekHKX7IsTuztlyEXn3/YNzBP+ONP2et1+U8
	 /ZfIHxxZBiKaXnYZfB8pSBAiR9SyjSK1cU9Kevw7CDZwfE94vGyBCKB9+cRAV16RSa
	 oMK6aVsyGQLsMCyXC254UEBasp7XK22PnPOr5NVw2f1FqMsH8BodR/CNgNDyKrsLQ+
	 pwLbKzPqrCQQZ9rnCg9s8FwrsQAWgdGIhjYi+zosADoN+Falf9r2Q6z2lqkk7Ymhij
	 Rpu276AFRVuAg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB28C39D0C20;
	Tue, 23 Sep 2025 21:20:43 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualocmm Arm64 DeviceTree updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866244275.1926563.4757618056073891071.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:20:42 +0000
References: <20250921022346.598294-1-andersson@kernel.org>
In-Reply-To: <20250921022346.598294-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 20 Sep 2025 21:23:44 -0500 you wrote:
> The following changes since commit be6f43c64ca0f7929904f31c2a034c81093eb5c0:
> 
>   arm64: dts: qcom: x1e80100: Update GPU OPP table (2025-09-09 11:52:39 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.18-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualocmm Arm64 DeviceTree updates for v6.18
    https://git.kernel.org/soc/soc/c/5ab67bad49fa

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


