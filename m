Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F03343AA1
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424223; cv=none; b=J4hX5V7tvWKQLv9B8q1MJ1h27n1Unf7hxiMliqkOeNFSKSxwMda6kZHmuqSpVmdTdPvD31tamHMtmkeCOcDFs1ZkgPDMLheZ0oQzeB84uH9PSSZU3u7Sc9xHSdnRb8JTM+xARPCNDeSoRpDQLfoxJYDtEXxapYA5iu01LKu8KYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424223; c=relaxed/simple;
	bh=hCXlWcMA+z9gup3smO+UbY2JXWAXl2DhyCjpf5vdeb0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QGlwii7/sgLG5hTeQJQkyxxv/cUm74w9owbof6NVIdo1h5bxGTEDq6kjML3WwkVd4Pb2N4zKGhYJORRI9LDmagmco9SbdpdbR5IvxWKGOo7sAEz0dkF3Gwxjux0czYxc7ZFK3Tzaa6pJynaoFRGPkP+kwwT5fwqouseLUonoLd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ss3V5s0T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ss3V5s0T"
Received: by smtp.kernel.org (Postfix)
	id A5F1FC4CED5; Tue, 12 Nov 2024 15:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FBADC4CED0;
	Tue, 12 Nov 2024 15:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424222;
	bh=hCXlWcMA+z9gup3smO+UbY2JXWAXl2DhyCjpf5vdeb0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ss3V5s0TehduOr3f3HZ5GnU5GaPTnQZBm4Bkp7b9eX2u00sbwyxO3eRpIfuYJfao9
	 koHoeON/rUrDgxD6UfX6dIGsukJwn4xC0sBZWtit37IrEQSBbKKrijYNAOMN2Z1dpH
	 1SEqBp2nyTExRup+pVFsmJrz63UCi/+/ZDtCYULEPywH5QOj1Aao5ZNJzMiFjerkDm
	 BlHuT40bgj08cHl3lewBnYNxHCtu+a1gvoQZ0w33lDqOH9jv+ge3nHoU1iPyIIcJG6
	 yiWvAxXHJEtQtjglUVdF5EpphhMf0nx+wNtyYZS05vaY/ujMyRhYsKTeLoFFEpYHoY
	 nAvw1/0Kj7Gkw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACE43809A80;
	Tue, 12 Nov 2024 15:10:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fixes for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142423278.559138.5335288295605177631.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:10:32 +0000
References: <20241101161455.746290-1-andersson@kernel.org>
In-Reply-To: <20241101161455.746290-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri,  1 Nov 2024 11:14:54 -0500 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fixes for v6.12
    https://git.kernel.org/soc/soc/c/bbfbb5795863

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


