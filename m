Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1AD237704
	for <soc@lists.linux.dev>; Wed, 23 Jul 2025 20:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753303195; cv=none; b=YVS3YcOKhRKgK70TxEixvbWrjjkfIW/uEPU83TVLAExYw/xqOsRyNqctcUKicqDzfr6gmCYdNyrFDSozxVERIucTuwdTerk7Qd7bB/ymtDZcAaY85SPbQ2k8eDw9oUQ5SIRRk4A/m0idJF0zdZlSeMbrTDQT3zv5LKVzbKvBo40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753303195; c=relaxed/simple;
	bh=3tZdlTgMlR+c8TdR/vqRFyUQU4F/XjoTXAiaAlRY43o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mDPL8vbdAFH4vbH1c5GO5nybqjmdyCWKZD5iAPhLravF9tUj6KW0YA3Q8j8Ct8xA+qA2gDLnXPtwryg62hP2jU/GH7XMezkQAedLyV+OaFeaYpjQuLb59bVWZMs9OObVwh3BGrch8Rg7MvZm18jNSKaY6p5o4JB8SEoRacdkyjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJCfS42m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJCfS42m"
Received: by smtp.kernel.org (Postfix)
	id A85B5C4CEF5; Wed, 23 Jul 2025 20:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 935BAC4CEE7;
	Wed, 23 Jul 2025 20:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753303194;
	bh=3tZdlTgMlR+c8TdR/vqRFyUQU4F/XjoTXAiaAlRY43o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IJCfS42mD/YVt20LPx2cxz/8CgT+8hWC0KLd0ZbI7kO0Asbv+JU4TZlS8i0Jxn1jJ
	 +Hp47dHli1ZDKFStgluY1idVp88pUkWdDWhaGtpnYiF2NERwQNyWLmlRK1la6VLR2S
	 cOzEEa7H7iMh+MYtc7YZ/5EPOboeP9veLP+wDbZ/nzOMcBnjf5ab5PPrwfMDKTh0cW
	 bZXrpessXZVwntE0H4oVf512i6an1m/DGaHYexFjjvxlYaxVLOnFV04kM7tIvNnTqf
	 cOGkH2SHpA2Vre35YuBvZ9z5FXwEkV8MY9WciaBNmckKvyB66T6p5uvl1QYEcY05yU
	 oMlpB7eIfJDwA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB1C2383BF4E;
	Wed, 23 Jul 2025 20:40:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.17 (v2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175330321242.1775141.8164861381607838983.git-patchwork-notify@kernel.org>
Date: Wed, 23 Jul 2025 20:40:12 +0000
References: 
 <MAUPR01MB11072115B8D6E3F2354840F5EFE56A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: 
 <MAUPR01MB11072115B8D6E3F2354840F5EFE56A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 16 Jul 2025 08:31:49 +0800 you wrote:
> Hey Arnd,
> 
> Please pull this dt changes for RISC-V/Sophgo. This PR is the
> replacement of the old one [1].
> 
> Thanks,
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v6.17 (v2)
    https://git.kernel.org/soc/soc/c/11949d263a56

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


