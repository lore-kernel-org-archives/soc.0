Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A93A22B8DA
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043296; cv=none; b=UFQKsW06a9xP1rwuG4nMGTd1NIPRq0LKTmbnvIaRQK/MUyK/wnLDOVNcN/k7MjNB5dOAP6y4Bj9fo/YDoht469mEWE5OK57y7RTACWqm5Xqaukl/ong2VGeVuhy3z1F774i1g9CN5LX5pVRF88E494gEJ15RIHjs7Sv8OkirWoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043296; c=relaxed/simple;
	bh=LM0/vbe/bmi8FYRkPZelLtsbkoStg/gkNQWGiKZwTkM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=NtqkY6v/kExxC4J1rGzTWpdjwO8bSgIHmzaxqi8hxtdiwSa1ACjVjr+sDeaZy8DTpWJV9eM5Xw+Bj6kYJSO5gxiq44UklvURBoPJ9bgI7pm0uoPYhq/Deo+czdnoD/gjdA1D3LN7MTagiM0gK1Mp/6XYDGOR341YbDmkI7zU5BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpwexbHN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpwexbHN"
Received: by smtp.kernel.org (Postfix)
	id 365C4C4CEE4; Thu, 16 Jan 2025 16:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02A07C4CEE7;
	Thu, 16 Jan 2025 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043296;
	bh=LM0/vbe/bmi8FYRkPZelLtsbkoStg/gkNQWGiKZwTkM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SpwexbHNYRt7NPX8NS5lLinGLz1UfQILFOHNXEuNye55IjsCF3SV1Wh9sRAx15IIM
	 J830ZMqBtTdjGYkav5N4qgn9z2o/husLXwI06EjR57gx8ohC5JBmHqknXP4WHr2eLY
	 pYegNkOMxjvCj2z5H02iRs+5Uvv7NCxFlpxrn0la1+crTWmHGiIkYZ3LuRC5wIGA3f
	 fLv0YIuyesB40igmY/mlJvczRgt4OtQLgTiDqFFyE8+ijxRagIc911+OMbxZczvXH8
	 vu3HWphCYtrGS8xcB98T3tFsBoUfHpsrg5SWCdqjDblj7zDPSR0E1yGarwvbAxkhjR
	 4xcVg6xk37zCw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E24380AA63;
	Thu, 16 Jan 2025 16:02:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] arm64: dts: hisilicon dts updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704331898.1501791.18246303604944642159.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:01:58 +0000
References: <67767DCA.8060902@hisilicon.com>
In-Reply-To: <67767DCA.8060902@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 2 Jan 2025 19:51:38 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: dts: hisilicon dts updates for v6.14
    https://git.kernel.org/soc/soc/c/596f35f9d3cf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


