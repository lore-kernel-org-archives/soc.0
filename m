Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A0C34678E
	for <soc@lists.linux.dev>; Wed, 20 May 2026 20:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779308997; cv=none; b=Zu69wkhA9MO6fqvkhmGfqxG6XQQ8yp6ID2xbr4XYyhQehVmoIKd2oCSc7N07wHd/0eZvCq1HCZ4gp3DrseMUiHnVw6xg/fZh3rguCrc5wIjnxpFqlZ4XenIhoCPcOWvpeEqnjw3wYLJhsSe57DOrjzS5MIg62o1/rD8EKLJFhiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779308997; c=relaxed/simple;
	bh=XxU5ersYy4Ez5ovltuhmDkTC+U2ax91Re7EVDhgnWFA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=E5ctMo3FcnBHx3rhNhTfE8CRvu7qzE+rN3t6XFfFZt+zBk2OxUuwzHmssLVcJMvaFubfPtKOqAzx2PpV/LmxJ0OyFqyrAOFuIc0Tmj9lgPDwOiVgCn8bdDlyNee1A3ubNqg3Bq/waHPT2PUrg8FE77dx6xVYhrRnokAo0qp24ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mm+aS35F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mm+aS35F"
Received: by smtp.kernel.org (Postfix)
	id 9BB5F1F00A39; Wed, 20 May 2026 20:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8480E1F000E9;
	Wed, 20 May 2026 20:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779308996;
	bh=bfDWNryQOzhaM1nbD3Qb0k/NO7eX1quigLEywAnJy6M=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Mm+aS35FjXiOaazGDtrDpY1cBMUBffrN+G5zwzDpdf5vx9Q3VrisrMF/5acLExAgW
	 rkI49jSA+BxJUVGdg4tWqxZaDjHsRd1N3qQ+353q2GRPPzXo9SRk1aPEB5VGfhq+ks
	 7/mJtg83XEJQqSYJyGlqQbjfd607CEpPkw31FYDY6D5kIl3PrwKpeI/cL2H0EtT8fX
	 K4xKLbsWnuNzaWUJFS4TnjGK128tuf6AH8kIpzMKSHynpHK92WoiU3HSEbUyylYGFm
	 5mliaIBUhMutuUHVx8LOhYBQFfzhgIrbF4WlQMraQloCPi5luxXXs5wwPmXPQNvAUc
	 Rx1i57mDJ1iMA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 196F63930BB7;
	Wed, 20 May 2026 20:30:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM: dts: zte: Add ZTE zx297520v3 for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177930900688.3744642.2053223521953676749.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2026 20:30:06 +0000
References: <24423793.6Emhk5qWAg@strix>
In-Reply-To: <24423793.6Emhk5qWAg@strix>
To: =?utf-8?q?Stefan_D=C3=B6singer_=3Cstefandoesinger=40gmail=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 14 May 2026 00:20:47 +0300 you wrote:
> Dear SoC Maintainers,
> 
> This pull request adds a device tree board binding for zx297520v3 boards and one initial board (D-Link DWR-932M) that is based on it.
> 
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:
> 
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM: dts: zte: Add ZTE zx297520v3 for 7.2
    https://git.kernel.org/soc/soc/c/e8a53f2d9c36

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


