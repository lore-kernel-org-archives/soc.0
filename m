Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFF6367F5B
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006215; cv=none; b=N0dmXDCCGPv3Vl0+KZMwHjKikhLQ7Ok0Mr97cBrm3nDQPSoDEJrTRV/lsfmWKkg/sfu5BKccDE7kbcEhAy0IqgJgZaxg4enuOpYUtHzx/gkVI1TNJeRnRlZ4Lsg56nHDuBX6D3FVzMVzCGcdY2o3yNWgfTraIPILXb8yoxzIB9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006215; c=relaxed/simple;
	bh=DxnUWzck2zln68PDWsDUH95YxdggMP+Te9IQwCWWGjc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NMO+NLiRE5niUB3ph2FDB7cpkFvpT9o7suwqKNUFiNw8vEmX8t8gDB9lD2jRnOjsKy53JhB675pMu41NpKoIJ3UlQH7FW2YMs1LIj/HGcJgT6Cl+cMEcVuRqrLcg/prii4tVcl2v6KGaHsgOpKGt+PkXG0GwleKiozEFMLABgTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kp7N5amk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kp7N5amk"
Received: by smtp.kernel.org (Postfix)
	id 429281F00A3C; Thu, 28 May 2026 22:10:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1891F00A3A;
	Thu, 28 May 2026 22:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006214;
	bh=O8K+ugw2mHjzIwO65hjWN8EvhmDRVYnCO6Xv6TWdojI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=kp7N5amk9MMdKBwdt8NZh6L7ETkr7PQ4ZtJG3N8GBGEvrTnVlJLihpqKXPkaZ8Q6R
	 fZKwRFyiUF3r1t/p2baiP5uTRovTM28+0geq7mYUfvkY3Ncow1PJv+yrVTsLOjNtNJ
	 kV0YaiTe3R/ih1iiOeIDfLLnUhPgMRG+36lJDXUrJLJ2zxTZ2m3uwJZr8sRnD80jup
	 3AtjpIERx9pbyABpg3UoBO12fbl4jSZMehZN0TZbrs/QALkVogyh2glif+2ns5jDgE
	 0eWjSSunKyIy2Ze5WtOcx2kk7mKPyDyl90Pz3uYOuhjWBQOVtdtaATK81zXQ3LE5tq
	 rRcbmKAjE7Ibg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93ABB3811977;
	Thu, 28 May 2026 22:10:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig fixes for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000621814.1533055.12187175308481274879.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:18 +0000
References: <20260526145839.3800-1-andersson@kernel.org>
In-Reply-To: <20260526145839.3800-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 26 May 2026 09:58:39 -0500 you wrote:
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-fixes-for-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig fixes for v7.1
    https://git.kernel.org/soc/soc/c/acbfa4ed973a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


