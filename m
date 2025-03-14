Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEC02045B5
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 17:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741973404; cv=none; b=W8WwLauUVVTyiCCERC74AI9uBy9efBpSZ1WW998N2SMkLjqRCrLeHmanMRKx/eZWZMlK3BPH/hUDWUddy7f7rbrYYrLY3lvX1QGk83Zqf/55D6xCLI+9Lnl3PcHt7Ar6/I77jh/XSyyi9M+nqSdiOWHjBq9p60HKYrcJ9XTdXfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741973404; c=relaxed/simple;
	bh=iS2bbL4H64caHuAsi1ZwkfPxqDEWU8x0yGfdvpdVI/s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=n5RdbMLQUdflm74QaVo+ALwBzjQvIB7fXkSIQpcFLsnT2PJdqqV/8OZXXsDB5x076KEeec1HiNr63Te4oJJW/Fvb9vSAqGFPPgQ89Bjv3kKo56ORjzATXfGbSsZj0AoOe4dyqlFdQpoH9ZTXfp1y2Y6F7D8Y53+FMyoz0dioDZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UrG7fkFC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UrG7fkFC"
Received: by smtp.kernel.org (Postfix)
	id 51109C4CEE9; Fri, 14 Mar 2025 17:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A231C4CEE3;
	Fri, 14 Mar 2025 17:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741973404;
	bh=iS2bbL4H64caHuAsi1ZwkfPxqDEWU8x0yGfdvpdVI/s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=UrG7fkFCxEInOiGUlQKjhFLKZadoPwV2ly8U6wOaixFJq0bqg2rTMx3uKDoMyayyD
	 uEMhQCVW+yaPdKNcdMS36OkCft6oD7K2oGKtTJIhbKAOYRPyL16eu++GErm8kDP00o
	 1hOlnZqwhzF2ov0Zq9qQwVD/UMK0xeXiZNOU8GSA7KYqnUA+nSMhJ5xD7lYON2Wvgd
	 vYq26bLoLv52nr4ljXv70Jw+hDo+R51jDNT6KGQlpIuXAnvAAALa6MmB4DroM9G0fU
	 xLqDIgT850JlUg2o5mkJdiCcwjRAg2tOhAW0SbtUGxo69LkkvNJXOthx3EjEGnezZY
	 1Zqw6ZrRWkutg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 345BF380CEE2;
	Fri, 14 Mar 2025 17:30:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC MAINTAINERS updates for v6.14 / arm/fixes
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174197343876.2324103.2604497354052605325.git-patchwork-notify@kernel.org>
Date: Fri, 14 Mar 2025 17:30:38 +0000
References: <20250309194926.51824-1-sven@svenpeter.dev>
In-Reply-To: <20250309194926.51824-1-sven@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  9 Mar 2025 20:49:26 +0100 you wrote:
> Hi Arnd,
> 
> As briefly mentioned on IRC we also have updates for our section in the
> MAINTAINERS file. We're adding Neal Gompa as a reviewer and I also picked
> up a patch from November last year that got lost (ouch) which adds the files
> for our SPI controller to make sure we're CC'ed for any patches.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC MAINTAINERS updates for v6.14 / arm/fixes
    https://git.kernel.org/soc/soc/c/8cf3310fb6ec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


