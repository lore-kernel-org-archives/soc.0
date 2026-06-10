Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB1C331ED7
	for <soc@lists.linux.dev>; Wed, 10 Jun 2026 22:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781130018; cv=none; b=sP9rEuvjmVhlIAVP2zFcU/FhwR84O8ViGhYofkU2nCOvlaSeJqSgZSv/XPi7j48UfHPVG3//IN3yVmJgg45++94qXfPqpE6LUnD8kJEqpAvVDg/E2dXY1mgr0VCcDFVO/S/e924qyL38LYPJCRaQhGo4lfxaEoOUjsZeXdljFxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781130018; c=relaxed/simple;
	bh=YlnRFlThh/Ms2TkvyIwA72CUZCWqLJo5ptGWKJig2rA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NmvG1vUJo1JxWf+BerYoPN28n8zkqciOrfSOeitWHwZBPHZsePwVosP9VwI711753xRPGRCCCqYfNo8TiB7JAzDWDkZuZD314O75wpLTB8wyhYNx4nMGhXpfuu7hQaW2SmNTO7njFjWwmoqGNzhmHKppvERINmh6meJ6QAgtZKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aa7p0+uW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aa7p0+uW"
Received: by smtp.kernel.org (Postfix)
	id 010E31F00898; Wed, 10 Jun 2026 22:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF67B1F00893;
	Wed, 10 Jun 2026 22:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781130017;
	bh=BQQRnNc6CS697z51VdFnXFrJJx+tZYb/qXuIZlDehwg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=aa7p0+uWusiZgtint4ldzh+o4l/fShkxOC5a429O3NXKeCfAMhVpUku8L6/OOHChc
	 rqvVkwBVixP+6UyK8ufL6n+BfjZe4jl1GbmNXHxAs6OtZivzoMMPbU22LVOnzjbQ6v
	 8QlDaUz44IwulepvX/OFLra5B8uLpVuhxUyjlVB3YCldbfvwETXAjJDR27PCImzTUV
	 R8sHfHfP+S99kn3pOUp7KtbhpAZXy6YeDZi8xlp/Nx+NNOTT6AHpfSk4vJ3pq858l7
	 8D+CEiUsCxh/5sdQ4B8qHNk8yxz6qwt2qv+On7oQrKjHpDho18DbHTzTlSbs1NxZ9O
	 niZFNZxoxG+cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D08F73930DFC;
	Wed, 10 Jun 2026 22:20:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] i.MX arm64 device tree changes for v7.2 (part2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178113001538.3654873.10932533313163672420.git-patchwork-notify@kernel.org>
Date: Wed, 10 Jun 2026 22:20:15 +0000
References: <20260610154001.609755-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260610154001.609755-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 10 Jun 2026 11:39:59 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit c10cfc952215644956284a42fa7b7860dfbcb5f5:
> 
>   arm64: dts: imx{91,93}-phyboard-segin: Add peb-av-18 overlays (2026-06-05 13:21:22 -0400)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] i.MX arm64 device tree changes for v7.2 (part2)
    https://git.kernel.org/soc/soc/c/aecab2dd6155

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


