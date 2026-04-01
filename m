Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68D8230BDB
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 22:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081431; cv=none; b=DG1BImt8vnEo6xM6L9ao8mUk9N5ZvpzYBSozUaax+lxoC+SgbIucAO1FCKQpG1LRXz1QPKqcdVvc6g0SDn/qaefscp0Sn+AJt2y2hK6rD5JKIn3RtRpmY4sm4wUGHg65oWQYOLHJ+DOFCAtrqaPTbmIQYWYS/aFwFFYKV0sFDQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081431; c=relaxed/simple;
	bh=Xw/l0RMTg6tUUEWRd8p70SjZp9fCTfdxS57EQmBknEI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=C1rLwQQZrW0tQYQYa4DgbYx6tk6q4ax6aNcAm8Lu7KyA1lYV4Qrpk6hEwn2nbQ1nztQNLqdHuMZOTPg5aiDY7A2ziDJjiOaZzWLjnxWvuAVV1rJJt+gt3VKXxKbG5xEeYP/To3OUTAo6/ZazdOroSoCXeOj5ujomJD7v6ljsMw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICZcNhi4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICZcNhi4"
Received: by smtp.kernel.org (Postfix)
	id 8799CC116C6; Wed,  1 Apr 2026 22:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D4BC4CEF7;
	Wed,  1 Apr 2026 22:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775081431;
	bh=Xw/l0RMTg6tUUEWRd8p70SjZp9fCTfdxS57EQmBknEI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ICZcNhi43AxZ0V+EDYudePmM+aUSlwv7aD+Vdj4rZk56YD+YNsKbSlzYZHUqGUJiW
	 4VHLRL7E7emnFqc9Trx0mq3+9TXHd7wE61d5KCmXTiHk1uzGvuQMuwpzv5xoJeSH7J
	 kUOrntFPdqdObFpgHB0Ckuh1IXG9/0135aZWGZ+La5wmezNo1BVl1/Fs3UnG4sxaRe
	 9mTbsiLZ2uounjfTQ6kRHZwJ2TYOndl2y8tAEmE1QPfSF6kIa1fYKw40Eto4WSbvjE
	 McuFG3joT8Ecz+YLTWwDSjMkCOaJ4JwIism6907hcPfXH1YoGf7Bw4BsWfO0iLewKQ
	 cW9TsbsNhmKhQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CE233808203;
	Wed,  1 Apr 2026 22:10:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE update for 7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508141428.3882930.14602342946313166529.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 22:10:14 +0000
References: <20260327131407.GA3248701@rayden>
In-Reply-To: <20260327131407.GA3248701@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 27 Mar 2026 14:14:07 +0100 you wrote:
> Hello soc maintainers,
> 
> Please pull this small patch cleaning up kernel-doc comments in tee_core.h.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE update for 7.1
    https://git.kernel.org/soc/soc/c/d752790a4bc9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


