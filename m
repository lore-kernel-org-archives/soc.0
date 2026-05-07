Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B553AB262
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159215; cv=none; b=KA/U8N1Xohxy66qfYq13YGK1yKZlIIFH13cE0abOzHj2KztVkiXDrOW+lyUR29Sbs/vynHdxZacge7DwtxViHceFWWg2G6RXcwZygO5GNFT+VK5Z+eD3LuiG1SypBmYUVKTfjkmQO17R3gUFECc1Mx7wfBrG5Q1aNyM/CORRCLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159215; c=relaxed/simple;
	bh=cmkpN1BmPQ2PLVszZbJlOgHDAzueh//FKPGP6MPv3Dc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=SL0PUjEPCSbkH/npptrbeGsjuPhPkr0c4wFcTEK922Yajvo8tcmgYXHdZ0CCO4Mxl7G1WtB4Clcps54s/uK0HmsOnu40I5wu+HX+4xU//bf3HiYpO+xu9LeV+wUIude6JIYXAGsPU2C0kIkGmoS9mpBG+w+XCRYAmmW+snjkCyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3ze2Rv2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3ze2Rv2"
Received: by smtp.kernel.org (Postfix)
	id E5BE5C2BCC4; Thu,  7 May 2026 13:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF90FC2BCB2;
	Thu,  7 May 2026 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159214;
	bh=cmkpN1BmPQ2PLVszZbJlOgHDAzueh//FKPGP6MPv3Dc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=k3ze2Rv2JeEIJGkFEJ1XVcy8Wa42J5aQJM0/IRVLM2rPB6QUG1WQFcfykIkk5Pt5/
	 bGrdNO+t97jh7vLbh+C4NW0/tQpxIUYaSYoUR8IWpcJ4wPVHMISQoPyugrI8GKu2bB
	 r2DLfd0bJZy5nUf6Z6njyfkDRSrcZaX/kJCanXXE5TF5IxaKCD1l4QTQ+zzFo0IOxd
	 Jx1N5ZpBlhp3eT9Dyg85axjj09QS8lBWADfDmycQzx6WEmSd6xg0ArkVKmkATYk2tY
	 495LO6hQHVZRNrLPFbxBS6IaqBjnZIQ94pbkI89Yvat+KJXFRHO+QQAMC9uBoRbRbc
	 o54pbJA/xn08w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FE8739308FD;
	Thu,  7 May 2026 13:06:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_ffa: Fixes for v7.1-rc1(Round 2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177815916379.3933061.3370621804562525611.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 13:06:03 +0000
References: <20260506194602.3474096-1-sudeep.holla@kernel.org>
In-Reply-To: <20260506194602.3474096-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  6 May 2026 20:46:00 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Most of the issues addressed are found by sashiko and other AI agents.
> It all started with me missing the report by Sashiko in [1]. Each round of
> fix expanded the AI scope of review and unearthed more issues.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_ffa: Fixes for v7.1-rc1(Round 2)
    https://git.kernel.org/soc/soc/c/d1f29ea139b5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


