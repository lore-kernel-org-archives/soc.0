Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450F43164B4
	for <soc@lists.linux.dev>; Sat,  8 Aug 2026 20:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220501; cv=none; b=M89tV0Kll4rXHRxvsg2js2A1buSiWL5C0bjUCnoOXf4bgbYHltEqnCIiad4ie5JKkuUnswitDPWKXkaVP8t2DspjVeDB7qJRR41ilcTJU27gMuwcwXlUX02iPFe8hPBztd9K4TVEpiAVjq4Gco97hlcG9RVc7of8aL1FUYIVcpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220501; c=relaxed/simple;
	bh=LKO1C657ffOySy+5f2UwYjApk/qraZ73Jyhrf5mTOm8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=L1bagxBaxi1zkF9MPGMvlhrYa4TJPU+ERtghuj+HMIgR1Cx5FiD0RJoszbbMeJn+hOuCWnwWkb2h8Lw9e3axWfyxXW3eXABgI0w2XUYNS11yTsQN8pWFa165vQIlGRxcd8Eje4ReVKoSKD41l/WoD6N9rWQrkuUKZVP8sSSO5xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajTvy8fm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajTvy8fm"
Received: by smtp.kernel.org (Postfix)
	id 0DC8C1F00A3A; Sat,  8 Aug 2026 20:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB7331F000E9;
	Sat,  8 Aug 2026 20:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786220500;
	bh=iFldeerSlqeneRJzW34d4f7rqBHATHN72m1/ebCUr/4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ajTvy8fm0pBGrpvYo53ZxKYYhyjkXRYWwLiPAc4TxaOm5Na+an/wyoU9fYUWLVh5C
	 IzQV82KbXvUJ9SyUahH3p8lEIZTgNQRTWboltV9i8HFhnI87bFoeO+XlmN/ydXiO06
	 4w357Q9wW7EM8UbT9b+w+/Y1qZ8dnupMlZfPz62a3A6QC33gz+X/eatVFP+f72jMgn
	 +c9xXLVr8/FR0Oqf6qMON8vBHfdz31A58apZO3X1UqILyL+K+dPj9wcBRGXvDbOPU4
	 4gq9gk2BdBBuHCmFz0smocSFVyvfMmqG7awci8aJ6vutb68FXN0idP/fDFNiNqtzOD
	 nxLENaXO/scNQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19856380CFFA;
	Sat,  8 Aug 2026 20:20:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: First batch of ARM devicetree changes for 7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178622045763.2748994.14545855881362123122.git-patchwork-notify@kernel.org>
Date: Sat, 08 Aug 2026 20:20:57 +0000
References: 
 <a0dbb1b1642b5d30f01adb5f48c51e426414dc90.camel@codeconstruct.com.au>
In-Reply-To: 
 <a0dbb1b1642b5d30f01adb5f48c51e426414dc90.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Tue, 04 Aug 2026 15:06:05 +0930 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: First batch of ARM devicetree changes for 7.3
    https://git.kernel.org/soc/soc/c/2cd4d47c7225

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


