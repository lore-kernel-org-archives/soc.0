Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85523E558A
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 03:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033825; cv=none; b=ow+j1oms1SdSQjF9q06pR2p6Of9vtjdnNRdeum0zGP/Wc5JWZHS1TgikHB1k5mYDE5BpP9IiHJLHknNVDOozxKf4z93ztt7GQ6sRzVe+/M8uwpEf7jHPyXbSyQvTfe/MQ8WoWJizrCyAhIhmuMTDkVaYCvRJwDED+3qS2HoAi2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033825; c=relaxed/simple;
	bh=F61ZYrpL1qPfLAEGtqKlrNKSTIDEeTm8F7Gvv8sQ/rE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qCnS35G/3wAangVqvGEuQyaHeSnqMAce5/cELMH+IiF3KwUCT5LNAhBjkeywjj7+RNsOVZX05cRNJubMLUid6Ofyb99mQmt+dNgSn8b2XeqKYWijLeqQVcWe50uc+44QZrvYtEhCN+Rb8gc3Xe8qYeAaWQEe8CcNEgHeL6uW1Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F4gHv/ms; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F4gHv/ms"
Received: by smtp.kernel.org (Postfix)
	id 1B63D1F000C6; Thu, 15 Oct 2026 03:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 054E01F000C4;
	Thu, 15 Oct 2026 03:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033821;
	bh=fttTEXPBqfw+687GtnkOoMt2NjXk2UTv6MiLlwuWc9g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=F4gHv/msXb02FnVzXLK7kYQ9q79lOFnGCYyhkyVTEHOMcLv+jIhxXrahIba08XQc0
	 ESSAK4uMLTiJe018WLbgvS0bM53KSaO2Zkpa5zQPl6EKDnD2Vdf01+R0Rmi+WAJVGz
	 ayMi8DGzmr1PSN6999VOJEXjiz6rnPN3YfwBtEmUfxOH6+YVC0IdUNgIBi16NP8wyi
	 Y9c/SumASqrvx7oAZv802odDm6iinY9LKdO6H34P4gifkpSWXdK73nTf3Em6v7SlBO
	 vH83HrAr2QqRFviFIkMUvKmjd5M2s5Yj5wdwcrS9xsUZ2rZ+BFUFXcYV+6it7xegCD
	 FMw2CcmycGMEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F166D392E992;
	Thu, 15 Oct 2026 03:10:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: google: New ARCH_GOOGLE for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179203381977.3155468.555430907180343658.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 03:10:19 +0000
References: <20261005101657.34571-2-krzk@kernel.org>
In-Reply-To: <20261005101657.34571-2-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Mon,  5 Oct 2026 12:16:57 +0200 you wrote:
> Hi Arnd and SoC folks,
> 
> New SoC platform, in the future this will be handled by Peter Griffin.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: google: New ARCH_GOOGLE for v7.4
    https://git.kernel.org/soc/soc/c/42d6a93bff56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


