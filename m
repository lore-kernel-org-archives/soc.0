Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF5130F92E
	for <soc@lists.linux.dev>; Thu, 28 May 2026 22:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780006205; cv=none; b=mM6fCl3Ffy/wfOU6q9SsGt1DKGm7s+kGYNIuaWQCL4FNbGDJ8VHvRMGVTfmu8oHjmLj3HrdmJQysYurfHp9SjWPxXHAqbetM/zrzNGR0IdJxkO/1nuPySxlou0mu52iBYE6Ule9KppeKEr6UYurdFZwfUkbW+11PuwfEINvFFrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780006205; c=relaxed/simple;
	bh=RKhbuNigYMYmnjPyBYrG5WjuCaB6xp6yKZNOZiYkfQE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YkJcUGKJvWj28rPwNecDH9FHA1ZxVsVLqS6Y+CRiq0SbpCNt07lpBhuysOXs3ySp0HxXw33u89Y3Nms2FB4zrikEX0EVybinwubAGcChsjUjq3faeAMfLBOsBMcGTTVU98EYx1OisXG+VX8WTrzLZlAx6er6bBnWNjwvEF2e9HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VnmW1ss+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnmW1ss+"
Received: by smtp.kernel.org (Postfix)
	id C6AB81F00A3A; Thu, 28 May 2026 22:10:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F1A1F000E9;
	Thu, 28 May 2026 22:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006203;
	bh=TvdEOdDM7zTRSHCXt8We2cBeRzygx5qTc2OLpd3IIBs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=VnmW1ss+/yWr6h6mO2tr2TaOUPeVrAbiGIjhD8g4hpLva0bS3Ydp/aYzNgKnHfzEn
	 /eff81xSNVJXKGnfJ+MS4xvugi0bldPmVsXiHdAADsrSVLnVYWmZlcpmzVrWYmi88l
	 nWLwCZNEM6s/1hU5/iY79sWk+MOqXdhHWKNukxEd4oipPEPzkBpbAQ4Ib4LjCUYIrt
	 cINqdKQNkKr5jeKCWmS22WDDqPjEF/oB6FdN3BvXgdt0RcD8gbtzgTLudPB0FO7CSV
	 q82V4nUzd1x3BLSVyKOKNl/fScLGpGgHQ/vW6prj5Mnmt9z+dj9hb+NF3djJ1MyfEU
	 epzh6sLHLE0Qg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19AF13811977;
	Thu, 28 May 2026 22:10:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178000620791.1533055.1268414367064638293.git-patchwork-notify@kernel.org>
Date: Thu, 28 May 2026 22:10:07 +0000
References: <20260521141410.GA1708231@rayden>
In-Reply-To: <20260521141410.GA1708231@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 21 May 2026 16:14:10 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull this patch fixing a use-after-free race in the OP-TEE driver
> where a client exiting prematurely could free a request still being
> processed by the supplicant.
> 
> This is basically a resend of
> https://lore.kernel.org/op-tee/20260316071210.GA2470832@rayden/
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for v7.1
    https://git.kernel.org/soc/soc/c/56d582972068

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


