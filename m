Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E3B3370EE
	for <soc@lists.linux.dev>; Fri, 17 Oct 2025 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760712515; cv=none; b=mGV06grn5h9TDm4t81yhR/Mt99oj6osn9LDFRu9a4b5qGcpCTCv37jI1pQJko+ilM6UJRpteJg5bw981jVoJG5qGH5dRdPJuwxyl8URue7IeEugIzMrY0Nlxo3DHBzMt2Ur2Db5I1lgUk5pYyF7seqcnB+EwwFyBcFO6Zo82KPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760712515; c=relaxed/simple;
	bh=pXCOM/wWHuxL4BLo6HN9Dl+tmAWyFQiPDaayQtK7Qi8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=g5zkzWA/XpgDitPGm96cdbP2r6trFYh8TzMmatY32GwuUREt6GL+E9VSk0Nb+dL7qsyv2fRvng+M/2KiHkS3Tooyywh9BY8nWCfILEePTXW4QVfqHzAcTMmcIMgPftuSJavIwbAMw9JqzyLIhTW2tHGAPYEwjpTrh6e8Pe+ALXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ck/I47mY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ck/I47mY"
Received: by smtp.kernel.org (Postfix)
	id 5B4E6C4CEF9; Fri, 17 Oct 2025 14:48:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455A0C4CEE7;
	Fri, 17 Oct 2025 14:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760712515;
	bh=pXCOM/wWHuxL4BLo6HN9Dl+tmAWyFQiPDaayQtK7Qi8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ck/I47mYqLpQjrmZUYmLtPtR4jxwzBMAU4syTLJEm4V4tuJP9TsV7HTgMNHfr+eO0
	 wTzQ+f3wXT9edtQbfaPwa3TqiicLV2VigAqAQIgpZnFYsOmn3hTbaATS9fXqzh3mNF
	 vDo8kxOByiI4wzobN3RdaZZazy0RAjbuS910n+vbaA/wToOOESf3NFHRasQlUK4mKL
	 ufXSICFHw/6pjiQGhO3MEjVL7APgAqy6jZKb03ArXH9YgHSl+0AG+qPrDIjLq1RVVM
	 /qvE8On79L8zQrJRLdQ7dCsWpin8txM9EhtyS4ck6OJvWpmd2OoB3UesPGKrSuxjEH
	 EvaEtfCymmBPA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33AF239EF976;
	Fri, 17 Oct 2025 14:48:20 +0000 (UTC)
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
 <176071249873.2229063.18446677866843367258.git-patchwork-notify@kernel.org>
Date: Fri, 17 Oct 2025 14:48:18 +0000
References: <20251016093448.945198-1-sudeep.holla@arm.com>
In-Reply-To: <20251016093448.945198-1-sudeep.holla@arm.com>
To: Sudeep Holla <Sudeep.Holla@arm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
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


