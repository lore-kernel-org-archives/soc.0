Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833D0DDBC
	for <soc@lists.linux.dev>; Mon, 21 Jul 2025 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753111913; cv=none; b=MMH44A8LZ615Vxuk25ISI+oRbzLmc1yzDv804M6mhKo+3fSCIvC9L6p2wUSgCwx6y/xcwsmCT8TfX4M/OLZhc2f8nr03D8MLfyr2UOSYKJLkEWn5gKtQ0tRkrLcpLKmKy8+eUg/JTv7pp6Nog+zhklH5UM/UByDJmeIjZOd9XWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753111913; c=relaxed/simple;
	bh=d+/q/oJyTv52OGmscb6VeWTtPm2sx5W6gZQCk0gZYAo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=PNzblF25wDgpeyb1L0PJu5GHG0qyR8rRf8/w7mch0tESed7dlTUjeNFUde3+IhAzY3PI2CDCOfH4VCIWvCQDezXDi377Lu/kRl7LqEuvBY2kxYZhSMjtuFXpFFrW+Ts8cfdc+3uRQjg0b+KEhb3rKdmjmNw3whlUveyvNTR4hu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uHxWsnGm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHxWsnGm"
Received: by smtp.kernel.org (Postfix)
	id 7A2E9C4CEF4; Mon, 21 Jul 2025 15:31:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6505EC4CEED;
	Mon, 21 Jul 2025 15:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753111913;
	bh=d+/q/oJyTv52OGmscb6VeWTtPm2sx5W6gZQCk0gZYAo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uHxWsnGm5sROCj+mDK8KITS186QVKttkAIMQNd4FlGDg/r+szSIwaYqdp2POK/km5
	 kkNbUDIx9XVlFPUxg2Q8vyegocOvT3I6kj1acB/pDDa79zGAJE0gaalA90wuTBfvd5
	 tacpNmWix27yw01iHRKWSf4JooZKddPvnAbpbkDp9MheKaG1/PeSem4CMznn5ZvWM5
	 EA0fZz9cmKjrH+ZPLRg1oyo6rOXe90IetBd7/TIps4mqxicHwfEBj9i6Z+szMLDnNE
	 3tSJAIumzjfaTy1lQhzPh5cd/hDwAfoQxuMIxc5ZxMVi11O+ETq8RjOlvUwJFKrBXD
	 wAjLrieRAOJlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70D95383B266;
	Mon, 21 Jul 2025 15:32:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: vt8500: for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175311193204.94241.11273660209439922324.git-patchwork-notify@kernel.org>
Date: Mon, 21 Jul 2025 15:32:12 +0000
References: <20250709184800.168462-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250709184800.168462-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  9 Jul 2025 20:48:01 +0200 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-vt8500-6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: vt8500: for v6.17
    https://git.kernel.org/soc/soc/c/43af11e1923e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


