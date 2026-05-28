Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AEA348C7C
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006212; cv=none; b=SuwWIky1vSh/5AVTp0sy9noAHe50C4OoxhlecJhnLuggS1yAzDIiI9xBWfeoeWQvrlPwaYCP3T/pgQ0IHFnEv8FWGpT/0XjV6gLHIJPZ+dAlQ8R3OOi37BfsqId4eweuYKFlxv6a/Gmp8v+Yma4rD3Rmvq8FOtnN9i2bdEAMpQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006212; c=relaxed/simple;
	bh=l2uqXQrzembAAApnzfkUfzpQ2e0vQItB/pCvZT19cjo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BGfaqT/KDmkwfaF13FjNaC8fxkvxVlM78R57GBuMHJZnUQ8Ktf5Wnfar43cB6IiEGukKXRdjUF2T4OpO4Ed/jXRXxPG3UlKFKxKqeTR1pupM0YvVqK+gVTlMh6CxYTuBkovihEk8HRlRj5puygSyeF5lCjozJhrXKeJfAijMVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gUadFnCJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gUadFnCJ"
Received: by smtp.kernel.org (Postfix)
	id 3FC951F00A3C; Thu, 28 May 2026 22:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A6021F00A3A;
	Thu, 28 May 2026 22:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006211;
	bh=/g9DmqRwqKhq+5/rMsPRCGKGrlaIxoO7JDPC7ruw5wE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=gUadFnCJo0r5zNYqwcAcob277TL/y/+7sL1kV4gvJXCXxCMlUthkad+fPmcUHpM3u
	 JzJYBwzCIRHpuZrYRSmCv+HUOh2iRKEYAppY2VtQC8pUK+mbVZXVq9+cBKuULWJBm6
	 rvCLuUG6uGWGA2TetMzRSem2Fj0v6a+h1xbZoJ35xlME3ytLcD974dUd7TQ8n8sYOE
	 j+ZbKWJFq6rHqdcbIKSvpOYygc6YUmYoP91PklqKnC+ZHEUtGMR/M7nO3Tj+VcJ/Tw
	 7VL7RsamiR5FuUOqueKl99HFNACsWph7IJrDzwb5wj8bK2QqzUMPReRcHUEXWkMwSX
	 OUSZUCztaaIXA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93ADB3811977;
	Thu, 28 May 2026 22:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] QCOMTEE fix for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000621514.1533055.450585109700095137.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:15 +0000
References: <20260521141522.GB1708231@rayden>
In-Reply-To: <20260521141522.GB1708231@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 May 2026 16:15:22 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull this small fix for the QCOMTEE driver.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] QCOMTEE fix for v7.1
    https://git.kernel.org/soc/soc/c/c6066e3295fd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


