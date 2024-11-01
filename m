Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E2B1D151F
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 20:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730492434; cv=none; b=SBHM9V9GofPmIG5zeMvRzLTHCrp3umxgZmq7AWayVSkI1FMjVbmbWNgCSJLNpYWuqSyC48QUl9wLJ9NdDhn65hXodk2zhg3orqKCBGpQw7hJoWQ0H/HJRBirX8drCRZKkmS5//efraC7u1lIl2rZzHuee1A2f78KsZPiwVhCI0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730492434; c=relaxed/simple;
	bh=jePjMqxvOvwWvSx6henE14O0a/a1NukQW6eC8sL471A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=hhA/2s3noYt7pGEFuTU2u4GLQVHVLrMN6UR9ymmusijgU+Np36CQtvgQK+rLb9g9ZUYQvPsTDQvyaIo/REQOjoCrIYXwJYFxbDC+m9K0ROmGywRd059VfgUbJS6q9/Jhs9LMVIcjSw7k8Skv2pVyv1nsGDUdqCC8FwEx/ZhFlVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WDpgKKDh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WDpgKKDh"
Received: by smtp.kernel.org (Postfix)
	id B49EFC4AF09; Fri,  1 Nov 2024 20:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFA2C4CECD;
	Fri,  1 Nov 2024 20:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730492433;
	bh=jePjMqxvOvwWvSx6henE14O0a/a1NukQW6eC8sL471A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WDpgKKDhtXqiIwjM1z78luHbCgLQauML98T+hKZH0jbQYEirXcVyKEWdc5I2akqIt
	 K75QGoXOVSF9px/ILP+MYMVHhUXtHN+d0I87pVRSNaCtruj6b9glN37CbwatKzTU4R
	 df91hq1N0S/ICG2zPO6AMWYcAkDeZspryLb3N7YhFtxAOmNyP9igm1M2Pn8/5G2HIu
	 JhC32zTnUBzi9qJzOnrDnWTrztRFNvmQlcpOLm/Ydze9Jcof3ds/rqsbqrvesxx5K0
	 28BhZQXjyScOn5hvylrDy2EqlXhSxnDXjVNNPgnhJN3Yy8FZLvCwo5KgUVP8p2y7fX
	 CHE/7fgIJFX7g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEE53AB8A94;
	Fri,  1 Nov 2024 20:20:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm Arm64 DeviceTree fixes for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173049244148.2836087.17419566280659341745.git-patchwork-notify@kernel.org>
Date: Fri, 01 Nov 2024 20:20:41 +0000
References: <20241101143206.738617-1-andersson@kernel.org>
In-Reply-To: <20241101143206.738617-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  1 Nov 2024 09:32:05 -0500 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.12-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm Arm64 DeviceTree fixes for v6.12
    https://git.kernel.org/soc/soc/c/566064e57066

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


