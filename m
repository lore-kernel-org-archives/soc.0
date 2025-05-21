Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6136C23BCFF
	for <soc@lists.linux.dev>; Wed, 21 May 2025 22:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866670; cv=none; b=TajyIP9D1HRapY20vLybVMIkcezW9Ovjb24sHKdYWLZ0FAWuQ+kLrzQq3ZcQeq66b835JQzfreMq1Al82QhIkYRNTIZLP+BeTvnMAy3ZY+1Q4cO1Zsrn8XNsnzwURzmCQ/D2tfVdzKegAm722bYPgOOinft9dSooITi6NpV1pFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866670; c=relaxed/simple;
	bh=geO7NLH9VM3SbfuajR2Xt1BxYdo7H8fUkaVGCivneL8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eLxKAdx7P7jPCfCxUQYVAv36BGSP4tx86lcKof8pUO1I3zuqPNtpWRIHTzUqKomGgFkDIIWbyWNed+TpXOhB+6jbP5WHzASfbE7iqVxnBoC4uSNR9Lv54NzeXKf2J9rJwOdKnwrN8dZYTN34WjPV62sPdAOA5GHAwd0FJiUIMS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bVsceUKl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bVsceUKl"
Received: by smtp.kernel.org (Postfix)
	id DF133C4CEEF; Wed, 21 May 2025 22:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D13C4CEE4;
	Wed, 21 May 2025 22:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866669;
	bh=geO7NLH9VM3SbfuajR2Xt1BxYdo7H8fUkaVGCivneL8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bVsceUKl+Qatorf3EnsQ75eWc57DRmM94aXPTOxbrRKttesoGnTuFLphy5jkawI3C
	 nA2qGzKdG2C43BoKp/jR+pcCXiu+auo2xPlEImrMxyjwa7/YjTnQUh9n9aSXCfrNJC
	 V/Yw50/VLHSl/S5zKUp4emktVri7zMIZcuF82xkoOkAvif9vjWLOOxDSXGLzzvWDvK
	 p4HQl3NSMMrQOyq15Rr39olxq1JLqkyafMuUZW68sstiIbIdLtaiYC/l+6Ldfj6veZ
	 734dUPvsT0vL9d2mRjFLDiZq0wDHujIJwaQbRLtB1r/01jedCooIL+N21Nrh43a3ih
	 yx5G9kWNVYC9g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE4C380CEEF;
	Wed, 21 May 2025 22:31:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] arm64: dts: Cleanup DTS for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786670523.2299459.16473600079638439636.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 22:31:45 +0000
References: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250513104216.25803-4-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 13 May 2025 12:42:15 +0200 you wrote:
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
> 
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.16
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] arm64: dts: Cleanup DTS for v6.16
    (no matching commit)
  - [GIT,PULL,2/3] ARM: dts: VT8500 for v6.16
    https://git.kernel.org/soc/soc/c/2b183108bcbd
  - [GIT,PULL,3/3] drivers: soc for v6.16
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


