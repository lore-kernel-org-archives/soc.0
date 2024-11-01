Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E97E1369B4
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 15:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730473321; cv=none; b=pa4NpGF8YPtiHLrFsGZpFGSBc1LEMRjwwlIauwssHWfb7xVF2dO4x+3iFWeP4vXcPUQDGlRkcoYhey2hGinzRQxWAXQqk44TzjSkn/HdPBMZJ5X61E3sa/DlN145vEcBlhHrrKDWy8Rfk7wTTovnXTNwGww7GEc3sI27OS59ZcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730473321; c=relaxed/simple;
	bh=IkJrbQcV1tz5H7zdIGozOk3cUykCErYUiPlTFcQuERw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=DNh6Rfr25eOHCB7K+GJyp+DNm8wZlsf/t0v+kxuqgXXM9DPZpn1m91DxofC/dYKM4AdJNCh0/8kd8k7IcCx8u4N7GJPfmkkG6JY6BoxQENJo3jQgRfzg9PonquLvrF/2aWDYRPIbtXz8Q55AQ7a0NxTfDKji2kM0+h66Atu3LH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tI7BWXHd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tI7BWXHd"
Received: by smtp.kernel.org (Postfix)
	id 12B36C4CED4; Fri,  1 Nov 2024 15:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBECC4CECD;
	Fri,  1 Nov 2024 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730473321;
	bh=IkJrbQcV1tz5H7zdIGozOk3cUykCErYUiPlTFcQuERw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tI7BWXHd0/zeHdHKY4G6Buv0nrpPaazBpT3j5CcPL2MZt1ziUCWXAH+ER8BaRq0qc
	 RhL2EzTN7qw2BrlwtXLNdCa7R3KB+fWVU8Ov5Rpx6jsIVdhHFgsgC7gdRJfzspK/4U
	 borf0uFzkTSoO4htoaNS3I8lHV3KiseqthlymXsQgOaadk/hD7COZ1PWIm1Ow4W6Pe
	 HXaws2TDdP1QTqDBq11jOunvvfGx5xZdf+sZarrIMuJPFQEXB9Gu5U/J03uxCg8ZVR
	 xwD9DjtYJqO46Pw1UFUbDNsgpmah+QMm4WAqOs+agkBrndOqN4NEZHbvUcjGVjhgs+
	 5ESP3Ftiz0ZpQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33F0E3AA7F36;
	Fri,  1 Nov 2024 15:02:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees fixes for v6.12-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173047332899.2666840.6071874604985197457.git-patchwork-notify@kernel.org>
Date: Fri, 01 Nov 2024 15:02:08 +0000
References: <MA0P287MB2822A17623C51A558DB948FCFE482@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2822A17623C51A558DB948FCFE482@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 26 Oct 2024 09:30:59 +0800 you wrote:
> Hey Arnd,
> 
> Please pull dt fixes for RISC-V/Sophgo.
> 
> Thanks,
> Chen.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees fixes for v6.12-rc1
    https://git.kernel.org/soc/soc/c/e29c29343a89

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


