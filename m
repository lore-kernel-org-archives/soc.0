Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBC2200BB5
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424905; cv=none; b=RkAHb/T++xhf3ZoEjnf/kPSsx5FkwUMcXHatWSRC5GkI0dzHiCBvW2TrG11w+SQJkY7FQJMwnzDBXPrLKpz+VXvekAAOTPxTweJqfH11NIe8NuUDva8W0yeSLyXfn4ZmgzoTPN67vne0/8K6rTuSYl0bg1hnR1fWWgREc0rzzkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424905; c=relaxed/simple;
	bh=w5UpwcqA8/lrw9ON2mFwgtCNRzVc+lfqkffSTyJyV5A=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ZGbt2R/9rjh76HqYLbU2FhJu3JPDGReXDP9j/1qe0/DmcKj6mw4HPax2J2mr5lqqKg1QBnDip8zG7DhE973z4DT/kGymbxkVMP35Jhvhgk32fe/tEGhasq8RGM+vDgtyUaBIj+mdnYysGQL/Su06AWzq+oY82F9Z2moS1MWwV7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NryxeO5R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NryxeO5R"
Received: by smtp.kernel.org (Postfix)
	id 31004C4CECD; Tue, 12 Nov 2024 15:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0AEC4CED0;
	Tue, 12 Nov 2024 15:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424905;
	bh=w5UpwcqA8/lrw9ON2mFwgtCNRzVc+lfqkffSTyJyV5A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=NryxeO5RD+pw9goq8s6EGuugbXv8CjHpb/QwSRofMSVRwrbLQzRinAfaMDNDoSQ3T
	 Bc3Cqf6W7lXtbkE6tbDfO0/F+I3E4DDBzos8T3HGleiBnGBIs3CmkR4O0Zlt5LlRew
	 zPF157VCAcHpEqaNj6qWj8+lRW9Nbv75GA2wX3F9zh8yJorR8rnZ3OcIfM8nswO0Er
	 OGRMul66K3sgPOhikHdR5hYgF6Wkx1+0eXgSJBjdtF0hepKIop4W/mpeaO3GrfrH15
	 0s7YHS/v52aLo+a3jbSZXKUT8wBYjEk2Q6EU4v7lUjCYDpMBna4ruxj8A4yS411wSm
	 I5l3SVTkUL96w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7184D3809A80;
	Tue, 12 Nov 2024 15:21:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner fixes for 6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142491525.562452.5898430349047536847.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:21:55 +0000
References: <ZyuRCalH2vhHXm0Q@wens.tw>
In-Reply-To: <ZyuRCalH2vhHXm0Q@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Nov 2024 23:53:45 +0800 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi-fixes-for-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner fixes for 6.12
    https://git.kernel.org/soc/soc/c/d62c9c5c4cbc

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


