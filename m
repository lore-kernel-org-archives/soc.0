Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC34182
	for <soc@lists.linux.dev>; Thu, 31 Jul 2025 00:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753920593; cv=none; b=U6pR089ZBVhf1vQ+L2NA0U4Xai4pD+YSZZNkhx+oMlRRJqU060FOwJceNYW2CNCzvbgZ0e4ZH/4Wpq60tvZm1jVAHcrJ+oz5Pl2rf0AWXmHrk0QtogaJ0Rq3r5ho9CdAej35b3y4maJOOYHrfzkCa/zLSkNI1VODmWG24yHm9qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753920593; c=relaxed/simple;
	bh=o1zRDAjncqmMAOoKHPKtwhIo1vx4yu4OuUfdQrX2bNM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YNVQpHIn2Omd4KWeEnCYO9EGRzpRa/r2blJhJ3FMw8IEJ4EPWQPAIgzV2gHzA+DACQLV5PsCnJP2AQWyb+S+ooHytkq0u8SaDbkSAp+hGzL+fCauQtDQC0OiPBKby1AEAjOLrs2yxzjTAYMP2Ce6PqOfJfTDvrQaXzerCctiuXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l1yTrhH0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l1yTrhH0"
Received: by smtp.kernel.org (Postfix)
	id C5BF6C4CEF7; Thu, 31 Jul 2025 00:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB2F3C4CEE3;
	Thu, 31 Jul 2025 00:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753920592;
	bh=o1zRDAjncqmMAOoKHPKtwhIo1vx4yu4OuUfdQrX2bNM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=l1yTrhH05XdNsSb8+GcamBU4PJ946pcqknBThRJHX5jD6fuOpkJUO1BocQ6VFuj6/
	 YR2UhlESlEpo2AJ5OXBpxi6KKuJrovuqzfgk0knmIn8KMnA3+UT0WMOXtKi8DY6iLF
	 GDxMA5nnS4ZuwFDOIuf1tram1XfbMIe/WF3mzDTDInydP47TmFOnSEIBco4yCL5nzq
	 8ZFkGqch/04KGk2SItWmVLGTtHoFVwRiRzPNyLP8H3kRTmZObq5JVH9tXn2h9fYnFt
	 GHMoJn0nI8igFneeYOOPIOzBD8+/dRKXXQZrry2DhsgEbilKN9w9MLRho53SkjIvWr
	 k88w3ZGhrCS/A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id CA1BB383BF5F;
	Thu, 31 Jul 2025 00:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom drivers changes for 6.17 part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175392060875.2546419.7490348431521933119.git-patchwork-notify@kernel.org>
Date: Thu, 31 Jul 2025 00:10:08 +0000
References: <20250730205754.3465896-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250730205754.3465896-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 30 Jul 2025 13:57:54 -0700 you wrote:
> The following changes since commit e3ce7b897388339b407d57969acaa26063e38209:
> 
>   pinctrl: rp1: Implement RaspberryPi RP1 pinmux/pinconf support (2025-06-25 12:08:56 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.17/drivers-part2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom drivers changes for 6.17 part 2
    https://git.kernel.org/soc/soc/c/9f9d41d64322

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


