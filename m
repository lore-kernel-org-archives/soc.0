Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A573644CA
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 20:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786393911; cv=none; b=pNHL6KXtmKSNbRCDUmrMVpCbxfNtme1ztBd687g5fQsi4z0aHD/fUvDguwVNAAjIuWJLygPuK5c1KNmiblxNd2L3bcJrou0xu/5vG4qlqi81A+7tUxX6v04gP0v2aBQE5aNPHQcDC3Sb6h2tJmxfild16nCxN1wfPPjtGZx4yPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786393911; c=relaxed/simple;
	bh=L3CvvABFL2Hy5FkX1RNkdZzqKFjmp/29TQ7zBcj9CoE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GmIDgk12SEg3WzuRxTfBDTLAW2mPZvlO9IjzKDiBVybU0wj1CbcAvluOoLHLeUkY90k/JlubXzquXAKEu8V4Igqp4sXObvAX+YtKFJS8tR1DGe6UaRs8X7uJALwYlKXSUUsuvqri6VQ/lqDbNHHwBRYTTBBf1nMsA/4lc7gi7Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXm4B6q3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXm4B6q3"
Received: by smtp.kernel.org (Postfix)
	id 193911F00A3A; Mon, 10 Aug 2026 20:31:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032641F000E9;
	Mon, 10 Aug 2026 20:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786393910;
	bh=h2vsZP8uw2B09DjZDmNB3p8nwADbj/inocS7ztU1dEs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=mXm4B6q3pjRCmf4s2/WQDscRZamyckSe8FM8bqU7czwiwazDIHfR9Ekrw03/xVhiy
	 ZZT72f8HdStd6pWeMoMqAfV/S6ZTUNQsUzxDFPbu6E4anlBON0a6M2p+UZx6clmnZa
	 RnWDufHGZlGxGwJnFhxIMmROBLJjwmb3+twDwBnK1j5onyh7h+QxdnReaX3R4MR9cu
	 q0oX1BsPky8R9hFkHk3h/h8P+6AZpkLyleYB78i7tAX2HAcbgcDS0LmP5kctMtP5fm
	 gecXasv/sWLRiXUb1n9U4UuRcFQAaiZI0zZnAG+j+pd0wEqyZtFpFPImUb3dqvB8kN
	 sQZcbd8GXimUQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AD0392625A;
	Mon, 10 Aug 2026 20:31:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] arm64: dts: samsung: for v7.3, part two
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178639386639.202926.7261538756984717689.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 20:31:06 +0000
References: <20260806081903.165005-4-krzk@kernel.org>
In-Reply-To: <20260806081903.165005-4-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu,  6 Aug 2026 10:19:01 +0200 you wrote:
> Hi Arnd and SoC folks,
> 
> On top of the previous pull request.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] arm64: dts: samsung: for v7.3, part two
    (no matching commit)
  - [GIT,PULL,2/3] ARM: dts: samsung: dts for v7.3
    (no matching commit)
  - [GIT,PULL,3/3] ARM: samsung: mach for v7.3
    https://git.kernel.org/soc/soc/c/acf1efa9485f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


