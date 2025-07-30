Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516FA7262D
	for <soc@lists.linux.dev>; Wed, 30 Jul 2025 06:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858637; cv=none; b=rsS7tfBcwanXh/66OEZvEZOpJFxIlMAsAK745KDl5g6SSUMEjCG24E7ig8TG5ntLr36a0BTDMHPXTUiETrMgqGPSWUaGQPC8+Qksi5FMPXN4AXAbQpVNuwl1XwJ+pyfW+NbWtJ/JXdv2vXhcB92BNRuYJSHiwApGfpHYUwNgCE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858637; c=relaxed/simple;
	bh=+s8fp1Y7040cCdmZs+OEB1Ml3f/VAdM9x/MOG7wJpks=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XGA0sgV1TeJV3piwCI32ccYU98mT0kjEZQtKULLMJhizCrr9BAOo9ejSF5l+YF/fpJQrTFpDb2ylp8SZymr2yPWHf9aBTcqcVwxvWEO4nPNWfyNv8TGy9VOBb39QpItZfj3RyhqpyHzhQ+vcQ5yFHtA2RcHlqKpfF0xon36TSpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5VeJ2o/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5VeJ2o/"
Received: by smtp.kernel.org (Postfix)
	id E9D41C4CEF5; Wed, 30 Jul 2025 06:57:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3DFAC4CEE7;
	Wed, 30 Jul 2025 06:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753858634;
	bh=+s8fp1Y7040cCdmZs+OEB1Ml3f/VAdM9x/MOG7wJpks=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G5VeJ2o/N5NBIYGzGjb7OV+AeOlhFvQ+5BW8i+GiHOCNHSNm+6rcyS9y3RRS/ZDlN
	 9ghsEBnQDEctcmDSGW5WG7zWyxPE3uh3TP/k8sn4XNw8N2Fmt2eS9LdO+r6sVZY039
	 DCFj2k7gdInRn3xGaXV6biklCt+HJDGH+FdDCWERq6b7tHBSTPBgDUtLY8xQTNb2vg
	 3bALPUp57NsA37nlp8AjLqEmnrCAkQecn/CuguqBW9h2vVWILThiyrU+SBM2wZ70VD
	 BCg+5CfWAh6EMnw/aUFtyRl9Dax1FGSGaIa4wTcZfEieGN1w/qs+I9Qm1JYID+nT5e
	 Im5yH9edjONKA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C35383BF5F;
	Wed, 30 Jul 2025 06:57:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree fixes for 6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175385865099.1808741.13566258626336282949.git-patchwork-notify@kernel.org>
Date: Wed, 30 Jul 2025 06:57:30 +0000
References: <20250729205711.3393417-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250729205711.3393417-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 29 Jul 2025 13:57:11 -0700 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/devicetree-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree fixes for 6.16
    https://git.kernel.org/soc/soc/c/388d739369c3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


