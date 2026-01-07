Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C76C343D83
	for <soc@lists.linux.dev>; Wed,  7 Jan 2026 17:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767808254; cv=none; b=TJxpNGynWQiHbzEEgdNkJ7kHGAvrbeRibCMhzpCRXGgtQ4nWPyKVFpOJ47ahKQPgDg/kk2sso8bkcKvtPNN3Th/JVztZFxSBrOcOWtuz94LKT67dAEVClJPrM9xpAK+j/q+bbrihMpW4B5ezxLieu0wfQL4vDEsVHByo7Yck0F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767808254; c=relaxed/simple;
	bh=ecb/m0MQXKHWkflBkVgTDOPh/8ozd/GAD5pBtQ0yTLM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Dy6zl69j4FEf2MGdCy8XSlBUhVKw2aQZ/83zK39n1xHW4/0AShEZWKV/yPefYIT4CebM3zLMJbKzPaJ46TkDKMm9Lqk+uBDlTyxTOR6eE7GjeZvaMXTrHswGsTX8VuKbuhyIVyOpj1UWC82R1mc5qDs+vjOiyue+cupZM3o0NNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lkPwNfjM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lkPwNfjM"
Received: by smtp.kernel.org (Postfix)
	id C24CEC4CEF7; Wed,  7 Jan 2026 17:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACAE2C4CEF1;
	Wed,  7 Jan 2026 17:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767808252;
	bh=ecb/m0MQXKHWkflBkVgTDOPh/8ozd/GAD5pBtQ0yTLM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lkPwNfjMAWkccdNda9BWvhbd/COnhrtr/GLuchoyAf4/nxNIQKI4+0uNVuIZMQyDR
	 tgJZ5UKRpOxwr3Hwmi0f0CQA3T4/JU5yWQ0JIOaee9x4jP9AKs2JQUrzK+9LSsUl6b
	 bOvGwaW7xG0UkllGyEXe7rKHRrMDYQRrF4hHSrIWZc2zv8ailN1ryNmQ2JUgKYW9Oz
	 D8yO1FMdv1MPMR8DO+p/7a0f3I+T7abxm8CAsOb0miAzGbRJA/Y62cC/ZmnESrdpfA
	 JhNKitD9I9G2BvFqbyVo+EEKk3r19WIRvZ5knTrCAqUbaYdjL9zMZhZVDqw9CErWIt
	 BImdlx+Udv3sw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F2A593A40FD1;
	Wed,  7 Jan 2026 17:47:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree-arm64 changes for 6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176780804952.2867211.8675427151959623828.git-patchwork-notify@kernel.org>
Date: Wed, 07 Jan 2026 17:47:29 +0000
References: <20251216235649.633331-1-florian.fainelli@broadcom.com>
In-Reply-To: <20251216235649.633331-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 16 Dec 2025 15:56:49 -0800 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.19/devicetree-arm64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree-arm64 changes for 6.19
    https://git.kernel.org/soc/soc/c/12e491d4f735

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


