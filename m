Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA86819F110
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644362; cv=none; b=gPw0rqmj5XZOTVM+EeRubGw4FThT7Va7PYPLiuwX9pynVabDl9+HIXXaqf1tqAJK7lJOFtVSzWDAfAqsqQA0hDwaHnEnwy8oeD3M78xwp3V1sXKS0tlrlSWuGTrxdn2YZdGKYohTL4o6FVR3EW2AETJNtJ3YE1QR+4Kwwx1H6eI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644362; c=relaxed/simple;
	bh=FbYFBza0ugfyh7BuASIyEuMA+skWtpS9kCdoBixSbDw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mYIMiD3MlBUyuOBlmbWkeEAQTotLtByr5mbdIAavc3vyqa+ubAX0ZUMupTITjuRjH1RJgnRj8iCeeeakNy5i0H80YRHiSmHUMfxu2iVfz/mdaS9E2X5uaHmrx9PWrX0XijflZhuQl9COSo26mA4zk/IrPvp8Kt+pUDKVNNP/4QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T4wCjv2K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T4wCjv2K"
Received: by smtp.kernel.org (Postfix)
	id 50BDFC4CECC; Fri, 11 Oct 2024 10:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3512CC4CEC3;
	Fri, 11 Oct 2024 10:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644362;
	bh=FbYFBza0ugfyh7BuASIyEuMA+skWtpS9kCdoBixSbDw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=T4wCjv2KpLPDQEqcSDBWXvVs2HlaNvXYyfErKNZajYHkrMP9B+QCYYPhrKhCEJoVt
	 1AdPCgKyjuGDSvykqyxXnJ/cEJgE2IlVSTfLNDZuI2ZXNKrkBCJrYy4KCA7+erMYqK
	 GyBSuCeshgsxcxClnuk2YEdeW0PNa5QaGtFsTMkmTbCUYPvgyWimr7aFgdMHSugw49
	 qBDY+Q2BDP9Dze40HbCe0Wy2ElTXwEDYeDsto/GQBFClHqBcVgjNXnt1Cz74YXdhwR
	 rwBAzNr7A+9eu8qSZvtn+D/9+STw5tZBLuaMsqyeDJ3ZbaxrdCxPxVPihVDPCvUtyP
	 ykaBlZWhddOlw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EABE73822E4C;
	Fri, 11 Oct 2024 10:59:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SOC FSL for 6.12 (retry)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864436648.2676212.14541997254560672162.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:26 +0000
References: <326d9a7d-7674-4c28-aa40-dd2c190244dd@csgroup.eu>
In-Reply-To: <326d9a7d-7674-4c28-aa40-dd2c190244dd@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 3 Sep 2024 08:36:41 +0200 you wrote:
> Hi Arnd,
> 
> Please pull the following Freescale Soc Drivers changes for 6.12
> 
> There are no conflicts with latest linux-next tree.
> 
> Thanks
> Christophe
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SOC FSL for 6.12 (retry)
    https://git.kernel.org/soc/soc/c/a0e199ecf935

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


