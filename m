Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4583DDDDB
	for <soc@lists.linux.dev>; Thu, 15 Oct 2026 23:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792106420; cv=none; b=QxTgDCVvGNwXioLv1myvu57aYsT9cq+HJAfWasAGyQPinFYs7lvTtysI5B9+ZQEAPGbTPHRZJmq/G7lTj/946CA4N2wD69OCLrty0OUQ4iUlQVa5nyPEgydvGCI1sUYft5CXy7vGJf9pJeQC31Z1yfjgKPHFNpmXrQWL0eO6PQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792106420; c=relaxed/simple;
	bh=xg+MAunFktphpaUnq2ZV0a2Ig/dWdoBK1jeEphe/eeQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=rrun6IAmHeFQfXSwd6AZN5qZgt9LcEgLoAdYJZjrP1c2fQ+aQJWrmf3a38m2WIuNVrHNODorn9rmqkiBy1NA4+zUAAYFBau08MUAwNmDQ819BqXdGruI0cvuK4PZj6V31uz+C4bf/hORQYNLSSikpKqwKrIIln1jvhX/p7Y93kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbH+hsgK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbH+hsgK"
Received: by smtp.kernel.org (Postfix)
	id 1D2E31F000C6; Thu, 15 Oct 2026 23:20:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074391F000C4;
	Thu, 15 Oct 2026 23:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792106419;
	bh=19qrt0vGIBbX7+D8jz2ECsoWfCM3LFZhUdqQaV4w7iE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=QbH+hsgKzyU26y5/SyBa2LRYRr/BmAR2COvlx6c+FXm25Ky/WVN34P+9Xtgq2ucLu
	 AIny2w59kBBeXslk//itiH5bL0n0EQjpBZ9eNEwefMYCEH0E44/Y+bOa/wtO2n0IMT
	 N2mZhGE9LxvTgc7abqGYndSdxq7QagKo4EQ/+RAKL4IlKkqC4ku8+W3N1mCB1FW1i9
	 vxmzJAvSvLUCQd7YZqR1Nqm8iMmE9odfR+z6x+YI2JuFIGc8PpYEYvuTrAl7BDqXkR
	 yPXTsoJ72u/BvlYX08r86IbcvauP097BUIe5KGUtcf72XE3W9SIONheCivtC/Nlu0s
	 harz4rZsNVrRQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F14223808209;
	Thu, 15 Oct 2026 23:20:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM64 DT updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179210641777.4150336.16196433627528997105.git-patchwork-notify@kernel.org>
Date: Thu, 15 Oct 2026 23:20:17 +0000
References: <8987c69f-5576-4358-92e4-e9e3b4f4f2dd@linaro.org>
In-Reply-To: <8987c69f-5576-4358-92e4-e9e3b4f4f2dd@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Alexandre Belloni <alexandre.belloni@bootlin.com>:

On Tue, 6 Oct 2026 12:59:55 +0200 you wrote:
> Hi,
> 
> Here's the Amlogic ARM64 DT changes for v7.4, containing spaces
> indentation fixes, MMC/I2C/MCU Fan features for the Amlogic T7
> based Khadas VIM4, clock measure nodes for Amlogic a4/a5/s7/s7d/s6/a9
> and finally changes to properly define the NOR flash on the Odroid HC4.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM64 DT updates for v7.4
    https://git.kernel.org/soc/soc/c/bf9d743af5b8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


