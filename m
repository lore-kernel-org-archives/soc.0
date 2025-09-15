Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D352015B0FE
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 14:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946622; cv=none; b=VtK2e+em+1GX/iYrj366VKXiVk3KzeTjzwQhTgBOG5k1DIUsFBHwVoxVV0jSOa6h06N5jsZqFcocdxKP5/CYttCsX4O9gLG+SFblHz2kY383HHeR1hM5nzvQCTWd1q1xhrKbdJBNSjKKSyxvQW26DQqJ3mpIotSDX0sIJ4MocpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946622; c=relaxed/simple;
	bh=HgHbhPxi4ZjSplMGtDbP5Bm5mCk+tYApxO3EVBB3VY0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XlfrSSSwMjGU4oAX0XJ+OTWs+PtBV+GhpnJ2ot37d2w2VMyP94KS0Zv1BB77OngyePLdyRSn8RMXr8cNfPt6OCF/rKMzQY76ZDaIBGHqszRCLhlMlQGatjL982sAxDR7UKOjDON5F3IuUNmeEqFk5BMIN/O8MWk9qJnFu+bNfa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTIloswy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTIloswy"
Received: by smtp.kernel.org (Postfix)
	id C911AC4CEF5; Mon, 15 Sep 2025 14:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3541C4CEF1;
	Mon, 15 Sep 2025 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946622;
	bh=HgHbhPxi4ZjSplMGtDbP5Bm5mCk+tYApxO3EVBB3VY0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oTIloswyemB+7tvhJWLbqnRGgemS5fPnUmnne543p8etPEPO/8kb0fYdpd9md/+N2
	 JH9/dtgp6E7eF0p2Rx1TsFyRoY5Qp7D72os+TUPE/fCKKjmeHeddAwggQH8W7U7YRn
	 yzMtGsb66YJ8sHe+NH4WpKgRmKWt0kpQ4HF9M/4timSUPVGJg6NLnaFronvHoPMl+N
	 +ljd9KK3ErTp6uUKtOOezSGJyBZ93T8uZWblCH4h166oFbFMqP/jKvy5xr9tvF/5DN
	 Z0WReim9QujLZ5hY4v6Eie0tMk0/CFsiRb0qP2rZg44OJFzCOPCU1bb3Zu5uI5V3Wl
	 XCuOAgwJ266Mg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CB039D0C18;
	Mon, 15 Sep 2025 14:30:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] samsung: drivers for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794662423.4799.8688277278318826950.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 14:30:24 +0000
References: <20250912135448.203678-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250912135448.203678-2-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 15:54:48 +0200 you wrote:
> Hi,
> 
> Samsung SoC driver sfor v6.18. This should be my last Samsung pull for this
> merge window.
> 
> Best regards,
> Krzysztof
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] samsung: drivers for v6.18
    https://git.kernel.org/soc/soc/c/7b1349bd47a2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


