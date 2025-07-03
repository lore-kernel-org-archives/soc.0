Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABB423BD1F
	for <soc@lists.linux.dev>; Thu,  3 Jul 2025 15:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751558396; cv=none; b=EPRCQKjBAk5P0FOOdudToQdeZbIGkozEg2l3iOipCDxbjLb3OM9BW2Stfu8JWj30eaUjCB1zlvTCddyqO3h+04JjlDLqXgYKYaS9gbG3ee6kTBn3DtuzCiN5a0jx9B0FyxtgJGzbR5dt22Hjfx+1dyz9nNhsEmc9b6E+lUsGJ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751558396; c=relaxed/simple;
	bh=+E7w+6pLmbQo8hP4gq92qnkDipP6i2v/kaZA8haW73o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=f+EREqR63/2go0V7IqWTBAHIwwT1mMsxhc5Y683SHsYJee0oGpF8OdyyJsm/eSxWpgB1ryUbwm9xtZl9HqxfP9ynVIJGmSFM7uU74W63m6oRD2cNRlCTGrbYojznGTlkj8uAZujyUOiywe40/UykDTzEyDib30pvPdsf7eshS4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWTjFBaJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWTjFBaJ"
Received: by smtp.kernel.org (Postfix)
	id 80618C4CEEE; Thu,  3 Jul 2025 15:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD89C4CEE3;
	Thu,  3 Jul 2025 15:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751558396;
	bh=+E7w+6pLmbQo8hP4gq92qnkDipP6i2v/kaZA8haW73o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LWTjFBaJAQQsCEparm+Sb95nt7929AU3oubPZYGyDe2en3Hg7Fi+mHqsZMo54P5Bm
	 S9GSeKyo3ATpS+Qd52hxJfsGpXX9a8H1OB+zpXNNLQk1Fbb7DrXoaMiJc83zyLDOPs
	 qzyTukOpLnkQkyEKRO+mNXtUr44yIC+cTHE9ji4CQKgr3M7oYHHM6JMv43vaUPZ0SU
	 SXezTL2XN0ByEJxsKDgPWjrac5nNaZdq3vXJT29mx1Zp8uar5Leyxy7+obONhW4Op/
	 ilK9Wu3F6FK80tF5chdN7b3txqaNFtdPS1A76pWaVqicl8VPh4bimcQnWFNMZt8eXa
	 Zp4L5zrBdf4jQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB078383B274;
	Thu,  3 Jul 2025 16:00:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: cavium: thunder2: Add missing PL011 "uartclk"
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175155842050.1537604.2700321421980007766.git-patchwork-notify@kernel.org>
Date: Thu, 03 Jul 2025 16:00:20 +0000
References: <20250609215706.3009692-2-robh@kernel.org>
In-Reply-To: <20250609215706.3009692-2-robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon,  9 Jun 2025 16:57:06 -0500 you wrote:
> The PL011 IP has 2 clock inputs for UART core/baud and APB bus. The
> Thunder2 SoC is missing the core "uartclk". In this case, the Linux
> driver uses single clock for both clock inputs. Let's assume that's how
> the h/w is wired and make the DT reflect that.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> [...]

Here is the summary with links:
  - arm64: dts: cavium: thunder2: Add missing PL011 "uartclk"
    https://git.kernel.org/soc/soc/c/0d495db1b9bd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


