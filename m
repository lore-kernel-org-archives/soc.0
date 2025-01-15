Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C94515688C
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961196; cv=none; b=RwoRyK5wSVmmt7GramT0+3f/l15BnQrxyq4PPzWf1qvBCEAsXxPtDd3w7PMqk/aRwxr6dZ600ZQpTNisjPgotNjDvfCGn8nEHXrG1++BB0RqwxIUxmNQSN4GGoW0VY1aaUZcTwcR3athYVFcoWXiS1zacKTZmWhbSg6rMCAR0UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961196; c=relaxed/simple;
	bh=8bjxD5AMuPKCQbEhryj5et6/L4jHrWYYUoWXazoLWw0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tIsurTWRH/lRRFp2o1aPegxgNxRBXzr+zJIS4GrPWwiN6Wn1u3NM8H+7EPELm9YU4ESHubVCOqq0x79F/1u6R7zrnTQxscHe6uu/2tQBTesTfk6b855mXr7e12I3bVjnrx0kublm+rIoO3uY88ASvzlpYcpJA/i3r3kvEtPDpV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1ngzf6k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1ngzf6k"
Received: by smtp.kernel.org (Postfix)
	id 61B6DC4CEE1; Wed, 15 Jan 2025 17:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C343C4CEDF;
	Wed, 15 Jan 2025 17:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961196;
	bh=8bjxD5AMuPKCQbEhryj5et6/L4jHrWYYUoWXazoLWw0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a1ngzf6keiEsAqZx3ipNh8Swg5hgzTIvKRa9UENO49aIkK+HxVjr7jiEtNJu70pVE
	 Wv5bKiSBVyZ/5fg2BOL32wvoV7luSPlsSp7OS0nsoBSlzWVgaVsDeQ23h5fjoHtuXF
	 FD5t7t/Aqvk+qAE9tYhxG8rCVy79wYFYSkDo7nF4x8dFPerF7fwSn6Nku1qB1UhYRW
	 2wbnRtcjKXnALL42kUOgBBcDBGTohz0xtoypEjf67zPGczC+p6H+t/EB4cQPKKPSKE
	 qKtl3PSGUUE6axFtbrjsa8oznRXyIrEawL7EPW4BMb9Uspjhm7vdLhM+LLfi91E5yl
	 CvtGpw0j1nm0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C4E380AA5F;
	Wed, 15 Jan 2025 17:13:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] memory: drivers for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696121898.809051.17129510118429382071.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:13:38 +0000
References: <20241231133534.136771-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241231133534.136771-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 31 Dec 2024 14:35:32 +0100 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-6.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] memory: drivers for v6.14
    https://git.kernel.org/soc/soc/c/3292e5ac4264
  - [GIT,PULL,2/2] memory: ti: for v6.14
    https://git.kernel.org/soc/soc/c/8de2819d07fc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


