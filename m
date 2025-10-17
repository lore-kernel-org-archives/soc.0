Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B06146585
	for <soc@lists.linux.dev>; Fri, 17 Oct 2025 14:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760711745; cv=none; b=EgxpzNqNSb+sEX338AlOsQYqqUcrUYyQVzxnAL4+nfPpIaaaBE2UP+KhZImHWHOhLRHo/H1V7hejpQ57ktjcqzD+lzJ6Un3WilA9sBuac75GSFAAmQVp9Jzep7H4Np6SmOv04JHpHOACeIh7jGXpW106sPLuvxh68bItWpc2zE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760711745; c=relaxed/simple;
	bh=swXgGLZX2ORObfnM4beDhgFEzdmIPzCY+q0hpDVGJXc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HjWuiuE0Itp+ms0cb9PsGLJt5rYWEWXYpbvxGwjrwW9kOoH1Qv1AH/H6eRoRoES4nQwsKZ8NkJnLHi8k6afqPsZhAG1RFOP1Fs6zZiVTcYvE0im0GQ6i1ydxN+JW3XdYZflpwMpEQGKS5EDMAqjFH69fINWA4mRKPAfeTee+kZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhqLrBaQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhqLrBaQ"
Received: by smtp.kernel.org (Postfix)
	id 8F525C4CEFE; Fri, 17 Oct 2025 14:35:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7969CC4CEE7;
	Fri, 17 Oct 2025 14:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760711745;
	bh=swXgGLZX2ORObfnM4beDhgFEzdmIPzCY+q0hpDVGJXc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HhqLrBaQnxjkRosp2lMTDjR/DRgfpwdqS1Q5i7+yzNxhXEyaTUocM2QKnuK62VOiV
	 +nI7pxBXqaGjwEN62pX1MFbCNubArQx3EuSnXTKJMF8lTIGW2nSjtuZsEWsv0Z3th9
	 wuMH1hJQJ9EncWtYtb1lDEvtPvdlqavmiMWiyyhsDhqH6/Tn7fCxkxZ3D4Ukheqd68
	 XmbIisKHs2BCf5xi22QvLdlo5kIh9yLTqoFnmRQ2TBr00piPrH0XSungrhuR0Pi4fy
	 PU5dy9dKK3Fqr8Pw/I3uJwcXo8ICYNeaMCeH2JZ8URwerjLFPaXR1MStlVi+cvSBKj
	 XJBrF6b5qHQnQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70B4639EF976;
	Fri, 17 Oct 2025 14:35:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Fixes for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176071172899.2229063.1504386492647317916.git-patchwork-notify@kernel.org>
Date: Fri, 17 Oct 2025 14:35:28 +0000
References: <20251016093448.945198-1-sudeep.holla@arm.com>
In-Reply-To: <20251016093448.945198-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 16 Oct 2025 10:34:48 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Fixes for v6.18
    https://git.kernel.org/soc/soc/c/b508de521165

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


