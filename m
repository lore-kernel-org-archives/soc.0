Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0056360722
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 21:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775165443; cv=none; b=MOxBllwDu1c9PR52F6UNqiwOGAXMe00XYqlTEdiADIOb+32Ks7if7ko76ReiqiuABHoDrBM/Gj0QwNAI0TG+6RLu6gWYl0i/AbtcCbndx5hOEpOCIvgA0Qu9w1Yy0yrKjwvTlMGfmVYysl+h/66LzC7cfAdtzkdrbsOVJCfDjiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775165443; c=relaxed/simple;
	bh=5g1KHKk4UCTqNdFDvP9xjneqc7GBFcKNQ1EIrmaEezI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pOD/8VgDREG5OMGvWMwVkc9qxnXKyKBEHmcBnhaY+t3gXBI9bEXxo7ehYuE+zKK88UfL1Dqn9XlFzXad4kHdAmUP2OuAa4DaxxLJVFgJ04WAgmf5GD5+I+uNBSguIebvGt+oMbAGHa1geoDEQPjP9F3O/ZHDrn1Zoo4ZrTYhJ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ttFvSBXD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ttFvSBXD"
Received: by smtp.kernel.org (Postfix)
	id 62203C2BCAF; Thu,  2 Apr 2026 21:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C50DC116C6;
	Thu,  2 Apr 2026 21:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775165443;
	bh=5g1KHKk4UCTqNdFDvP9xjneqc7GBFcKNQ1EIrmaEezI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ttFvSBXDkAYEBdIH5YlBh7aU5sAt4Bp74SVhU7uItF06umFwaIEIxlQtTmcet8yWz
	 DbOYGEGOqL1DxE0lchAg8BtLr94AtAbw6FBnO2uqccCFFSTBBAQugtU7tnjLi6HQYy
	 bQnJbCqyzU/b4p2yz8Y0YdKAr+v5Mb8evu5EoC9Wg3thcczyMyqMd3j64Dizl2cm4h
	 bqIYA0XNRH4Ed5hMqLIeAhMWfswGIrq0Wy+gvdk8x5VWShCaa9frEPkif+uUQ8leXQ
	 RSUvAWY0QtK09H1giu6QKO+P/UzTimisKBpaQeTR4rnZlKoEl66/yXNXD3B/zLEiy5
	 1nFTOVdOoMS/Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B9E273809A09;
	Thu,  2 Apr 2026 21:30:26 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: soc/omap updates for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177516542553.623252.16985664970233700691.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 21:30:25 +0000
References: <7hzf3mtloi.fsf@baylibre.com>
In-Reply-To: <7hzf3mtloi.fsf@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 01 Apr 2026 14:28:29 -0700 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.1/soc-signed
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: soc/omap updates for v7.1
    https://git.kernel.org/soc/soc/c/16695153f8af

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


