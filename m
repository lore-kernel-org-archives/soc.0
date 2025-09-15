Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE7372639
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 13:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757944258; cv=none; b=Rryh9iyC4KF6IZ7iezwiLJa3RihtjuOZjjqTsgb+Yqziy6BdkDuUpDF6njp3SR3Tto3YSirx4+nzaND0qjmohTaF+78I0AWQfPz6edD12XTqqSUkYK3HlrdunSKu3dOvNYitQS38vfeJ7AO+B41K86TbhHu8KrtA+5idHYQlmPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757944258; c=relaxed/simple;
	bh=j0MxOMcw9ZMlQoqtpDNW0+RCcVgeVwQm24SmZKvOD7w=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=VYp77OJ0XMyyQF4tz+w87rBxfK7FfS4bUTotQFXi8/zt5N1xCGZUQaVr576e1U0fiMRZnAHUPavlx74OhtAPUMsOazjlnfsipqj3BA9pJ1sK5djmzEs+qEAHJhbVBYJN8iXsuljWaU+US16OLQuIPvJfQnY9QWhbawrkiZE1QBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tm0rytEx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tm0rytEx"
Received: by smtp.kernel.org (Postfix)
	id 8159CC4CEF7; Mon, 15 Sep 2025 13:50:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BED0C4CEF1;
	Mon, 15 Sep 2025 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757944258;
	bh=j0MxOMcw9ZMlQoqtpDNW0+RCcVgeVwQm24SmZKvOD7w=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Tm0rytExY7Ht+5HQEiD8EGXqjNX4i83tqjNW8Qcm7ZsFzwRxJl3Ea6wgB7LfNAFc9
	 QjLwxjE7IvzzjGYOyfX7Gs8C+E0aFL034yK2/h8w3QQSM/e/+xQgqyhaXRIVG2pLmp
	 mMy8Jwv7hBwVRvxXm+q9COzzpgbPVdtQvHQT5hadyvlRfXVR1QU99hZgvpTJnyCcE0
	 qP+wjVn1hH6CHLyWRSrcJM8ngauUv2b0JorINDWaJQHfZHomC9qIWDxMVzfeGmaxkO
	 vvGsdM80dRjkRcKp7jYHFfHVD/RgAwc+MjRh+fQadWv2j3m9CWayTSu+GCJeCA+9/P
	 Ry34J7Lh+dG9Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3412239D0C18;
	Mon, 15 Sep 2025 13:51:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL RESEND] arm64: ZynqMP DT changes for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794425973.4179625.8235373287718292838.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 13:50:59 +0000
References: 
 <CAHTX3dK6if9f+-DW5ZEnfSO4=K_Zje-WH-fwysTY77farsSS9g@mail.gmail.com>
In-Reply-To: 
 <CAHTX3dK6if9f+-DW5ZEnfSO4=K_Zje-WH-fwysTY77farsSS9g@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Sep 2025 13:38:12 +0200 you wrote:
> Hi,
> 
> please pull these changes to your tree. Pull request contain description for new
> k24 SOM which is placed on kd240 carrier card. Also new kr260 carrier card which
> is using k26 SOM (as kv260).
> There are a lot of changes in versal-net.dtsi but just because of 16 CPUs and
> cache hierarchy.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,RESEND] arm64: ZynqMP DT changes for v6.18
    https://git.kernel.org/soc/soc/c/e3fa766a4de9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


