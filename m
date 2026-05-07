Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3150036998F
	for <soc@lists.linux.dev>; Thu,  7 May 2026 13:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778159587; cv=none; b=Ui/dT5OmhsqfM3F7M2Bpv/R0iqTYeVulIHs6vxb68iR68HxO4MW3wzifwHVqPdImy4XsWuhJ3IMqemC2mPyB9N+owlZOae07e94K+0pyzoR6tg3rCdaFVAcyTQU4U8yyLzgckLk5f7Uk4G4BrMLMNBnOtfIfGPubBFre2ZoZRLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778159587; c=relaxed/simple;
	bh=TfRDAVZrOWESAfrxX86+yYv9+OgYTDgPmPCw8U27FZQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=f7tYVX3HmaKBR09ZeKoXFbRkPPZmiCXSGLPqeqLvJ4/LwBznyYxQy/EXcXe/xFB56lrw91j122Z+DbGHnog1JG8zDiGHTTAAnYSN+ncv5OadZlnY3CAR/VppMopmbnuRPwVLNDsjssqJknGpB/rXt+eWThhkdnKl/hQAwTyvaNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRIqLWJm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRIqLWJm"
Received: by smtp.kernel.org (Postfix)
	id CA0A8C2BCB8; Thu,  7 May 2026 13:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B446EC2BCB2;
	Thu,  7 May 2026 13:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778159586;
	bh=TfRDAVZrOWESAfrxX86+yYv9+OgYTDgPmPCw8U27FZQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=gRIqLWJmu7Em4xDwE4S2xq6Bk2Azhh/L4lz3hKRUHDQ3aPhOyMaNVCgCICUeMSgVp
	 6eTYdeaQJF4wEv1BXQLog4gZRjswjpQL7Y4v3PNRdwVzxTHpc4VIZi/p/9u0bN2PME
	 0nLr78V1yri/G54RBrqOoStSyku6BZjingMfJnIOWrvud2QxddCEVPsh7E6WQJdhbp
	 ddmRqJ2c0czPOJGRKCXqczOC4Aq2bED+ioSVKyQ4JntIGHU1vIp/dZ5mC/iXcVCnZD
	 Lz1nXrlyO05nX1+VrLK/WgIHRBotgxYNTbxyFPPVXCokZnqvZkicov8Ztz5WOJ9O4w
	 eHIPVAoufLdPQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FD8339308F7;
	Thu,  7 May 2026 13:12:17 +0000 (UTC)
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
 <177815953579.3933061.4397380315199059098.git-patchwork-notify@kernel.org>
Date: Thu, 07 May 2026 13:12:15 +0000
References: <20260506194602.3474096-1-sudeep.holla@kernel.org>
In-Reply-To: <20260506194602.3474096-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
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


