Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA503C1966
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 23:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106432; cv=none; b=R1cWuCty6Wfq+DiIOvarVDZb6r18BvbItQG2yHg1VbWctzoJrnrkq6RJYYXocM4d/TViWN7s4GI8IHYGHvEpKNeQWkLIzMyjoq+XfWZrfbXRWrizUf6wpsfHLoB+0Vuocnxa59hiz6WzX/bsohREbKQd08kkiV8La+i46/Zz9/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106432; c=relaxed/simple;
	bh=n0Qb6xysUzc+ToS6K7owSC6zqwyiND9/Oazmkkq1e1M=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SgBWCyMHU+mUse8Y/70NCRers66fNxdQERgqwvVUmYxmVPUQ7XaavQa98tkqJmU0bl/1Neqk0vZ7qYP5ldJMuHET8VqUPasGyqfreOGZi+RdlU8AFEz3Cr+KRKVB6nHLN+RsY0a3KDhT1lY84NFSnkFxczTp+xX2RRKF2EzKqHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QB+F/Vq7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QB+F/Vq7"
Received: by smtp.kernel.org (Postfix)
	id 1CE181F000C5; Thu, 15 Oct 2026 23:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D901F000C4;
	Thu, 15 Oct 2026 23:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792106431;
	bh=Yk3JbeYnWdBvnY1esfku39kKo7tWecDaMn4pRHNg/84=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QB+F/Vq7RI057qcBqXC+mJQq146jnuHUR4s2ibh5KQLeNiWjZeaz50hDgof3tQgvF
	 mqzDkT0CBgAQ1/Hti+OzmZYegs6Dk7iv7inE7jYD6c6hEqQ2MxShM4Tl/uCpW2Tfym
	 eZfwPlYAR/heKa6Zl04hnj48p2JFnI/gfsF4SQK/GSz5XUODWHFYB4XRj2FHoZ7qv+
	 VSEv+1S0DZZo0/9c2WC8T2WT1oZUc8nsTqIe2+DYBjAAhmpozufCBsHOOcgTbrLGpL
	 IKCKhem3aTosKdqp3+yEHIu4kO0ey59k6MQZUArD+ugScoHhowOxHy1hEPlUjlpN4t
	 7i5IgHPuWeGtg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14443808209;
	Thu, 15 Oct 2026 23:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 2/2] Broadcom devicetree-arm64 changes for 7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179210642951.4150336.5204288689998527204.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 23:20:29 +0000
References: <20261002195046.364682-2-florian.fainelli@broadcom.com>
In-Reply-To: <20261002195046.364682-2-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Fri,  2 Oct 2026 12:50:46 -0700 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.4/devicetree-arm64
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,2/2] Broadcom devicetree-arm64 changes for 7.4
    https://git.kernel.org/soc/soc/c/7aedafabd3db

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


