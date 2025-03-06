Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025E820D4FD
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 16:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278707; cv=none; b=Ji8Wg8d+0s1HFdDdM46uxe/8+MQH7KhBoghot8LKfxe3RH5/bh+JPhRltNhni8Mt++296DamCW0lddMBpQd+Mnlu7A1098wLVZ61i6Cm9Lvavq8KRhXpEZ6lnXhJUkz7GwM55G0KzEJAWifYPXSVMlUmlIO26kj81lutjitOC6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278707; c=relaxed/simple;
	bh=JGzrs2fB1mScxTt3mZP9Zve+55ayNTjtQCYMJ0mhkFU=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Rn2IGnp5vfRScJHQbQ3aoMEBNrjkjSR9aOCxswNt9b/rtO4/ukG03ZKn1PbUUEU6PP5EeElPcatoDw/JFqF+oSiGfXvj4pBljsTK8VMuC+JDimxkpQQii/6d79npTHyzuQdD7UDw+pgt5cS6IQ7bLhlBPtCkdIul/fyxiCVf35o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hm5feTHu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hm5feTHu"
Received: by smtp.kernel.org (Postfix)
	id 8A986C4CEE8; Thu,  6 Mar 2025 16:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7434CC4CEE0;
	Thu,  6 Mar 2025 16:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741278706;
	bh=JGzrs2fB1mScxTt3mZP9Zve+55ayNTjtQCYMJ0mhkFU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hm5feTHus2VJe958QzQN7MnHVPO6JHd4JchmNeGnBGl3nQUgYUyf6kLfZkMS2si9K
	 KLkElH3WKAUg/bECCsepQKACf4Qi/6KpY8ayfRZ//4FwMbLaLRLti0ac1ke11/QDpO
	 JzF2LKR5e4WyHPNsGzlBD1vbw1l4BjBJc3RViPBjoqjsqKh7OjBvfMhqHrVAUqHwc/
	 jKvNbBtZzAlo5q1myWQ/54Ji4hyGugLY6JQlI8isK6Urj972yOZKruZjXbcm9GblPx
	 bi50Gce/PUaQ2ZOSr+r/YcEy9nKHpbjdpEtdSW9kzRjSJoiTxwjOodyiy4eWXjd3gl
	 uEie90fRc8UcQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAC0E380CEE6;
	Thu,  6 Mar 2025 16:32:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Apple SoC RTKit IPC library updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174127873974.1655995.4519446340313481044.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 16:32:19 +0000
References: <20250302113842.58092-1-sven@svenpeter.dev>
In-Reply-To: <20250302113842.58092-1-sven@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  2 Mar 2025 12:38:42 +0100 you wrote:
> Hi,
> 
> Please merge these Apple SoC RTKit IPC library updates for v6.15.
> This batch includes a bunch of minor improvements and bugfixes mostly
> required for our downstream drivers (e.g. DCP) which we are planning to
> upstream in the next months.
> There's one API change which requires a single line adjustment to our
> NVMe driver as well which has been reviewed by a NVMe maintainer.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Apple SoC RTKit IPC library updates for v6.15
    https://git.kernel.org/soc/soc/c/c33995672737

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


