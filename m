Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FF120ADDC
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450705; cv=none; b=TUJFq+6rEp5XTbvh5l3OvB430zqYomiqP37NjkTPzdBbJUXgM+AgSbg7MtZG0JMcJ583gFbvoq0N05JM25EDx10h94yDqm3BeQshtSqrLl28ubEO6WLMR2JK4zWA2vZ4PveeJENra80Kydh5fOAR7Q2uC6dcBOMV8+yRBLg/FPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450705; c=relaxed/simple;
	bh=MgtJu38R4vswG76J2y8a2XhCeJgCU+QDCBGCqgiMmik=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=e6sdyqhCEJEi/BHRfMzob8/SDyq3iCV+TjMmZKussJdFlY776EuRzDRE7XF+YHDAP+97it4SzNkHiad4kOPZzmX7YFWR8W206/3HzlRjYvi7CCxzswDYPKL+SkbAcQzxfjImSMh+gV766VzLPBHjCj14wohah2sHoR/+ChJHDgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLCInLKd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLCInLKd"
Received: by smtp.kernel.org (Postfix)
	id D115FC4CED5; Tue, 12 Nov 2024 22:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB20AC4CECD;
	Tue, 12 Nov 2024 22:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450704;
	bh=MgtJu38R4vswG76J2y8a2XhCeJgCU+QDCBGCqgiMmik=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WLCInLKdtrUq8nO6VdtIwmHaalMi4oC2rDGxCLB4SQ2A9tSKgegbZiVZhvK9aD852
	 Az8b2KTKAop75cG3NHMra9rPtMhI+VRcG7bPlcIboN9qWILGO0c6DdJ0+6NBqTmlQr
	 Q/q9pr0Q7O5IOiiU5vE2OcsAXkIN+3rKV3ksKUYDXZ0x93lmsZZJD42s42BdScvdt2
	 0ZztP5LrATKCxmTLzEh9gIBeswLyvwD3JxwOQvEHc9riFBMtVDQ3hd3zk8+7sOhSeg
	 VCbWyphBv3bz+xqa9XMaxuetk/dM5svKzJ+5KqfqU6XNCNTCeWRXy4a2mK7x2zEdly
	 49Jl1Ps2F3NCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D313809A80;
	Tue, 12 Nov 2024 22:31:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Allwinner device tree changes for 6.13 part 2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145071473.694695.9263460300922820023.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:31:54 +0000
References: <ZzC-OF57MT_yCeWH@wens.tw>
In-Reply-To: <ZzC-OF57MT_yCeWH@wens.tw>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 10 Nov 2024 22:07:52 +0800 you wrote:
> The following changes since commit fcfbb8d9ec584c256c0a6e1ae3174a21b007f399:
> 
>   arm64: allwinner: a100: Add MMC related nodes (2024-11-02 19:32:40 +0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.13-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Allwinner device tree changes for 6.13 part 2
    https://git.kernel.org/soc/soc/c/36255ab49361

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


