Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2802140BE0
	for <soc@lists.linux.dev>; Fri, 24 Jan 2025 13:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737725407; cv=none; b=CI/9iHPrNrch9Mrtj7itu30dX7lMFkNdiTnCrNkMlCmmHGHW51B6MCXVoRN4d+NqCYGUyYFF3kFeM7VAojEkVTDeuruWHKnhy52RqRotQOhqf5CmvtQZKD+kmNLtw3kV4yJcv9ssxG6pFi1a5q6uGGrRk0+49N+9zv+KEzWhMYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737725407; c=relaxed/simple;
	bh=O8xgzT6xM4VKJ8BSC1x17dhYO9+yWT6Soye5Iz8e470=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=W5zz8v2dqm8mnTsh74mjisexyVB6Hbq1uLnaUX1lXtJl3NKT/qxTBhkIcXj8tcqPViw/ELYueORvq1Yfh0yyuYvgN9JBq9JZoarlUlBc/mUqfZs8dNq/LeCNnCegSs8rG9j15IZRrTsXayc1/NmCLZZY5/5q7+hlwHaq/wxye+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lLqR+tgq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lLqR+tgq"
Received: by smtp.kernel.org (Postfix)
	id 7DA15C4CEE0; Fri, 24 Jan 2025 13:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E3BC4CED2;
	Fri, 24 Jan 2025 13:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737725406;
	bh=O8xgzT6xM4VKJ8BSC1x17dhYO9+yWT6Soye5Iz8e470=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lLqR+tgqxS2W3pFM1VgJDQ2N8pJ998TUWlAxfIydUdybMwsxWx+IbMuO5bESemju6
	 gK8Hfeo3ewOoguxS+b9XeSAwmsxShCw5yd50Kg3cT2ZV4HsuwwGwWYow0zFqzEMi2D
	 bruwc3Kb9penEj1SmfHwn04hL1NbNyk8oUjhwwB2a8T+4/xaMNrYdLxNnp9tAh0lJv
	 nbNuS+GJdHG3+mzjmMEOAO5EkXqgbjJSo01wqRPqeVnY3x46UnuyrXCc+ZslAypvOc
	 /LpkdXQey41wf9qgVqkWEci6p4xbgfhTHhDDuCJooKNg8xT1eCBp0vcLs46QF9fsIY
	 03iWPnxia7dOA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 710EB380AA79;
	Fri, 24 Jan 2025 13:30:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] LiteX updates for next
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173772543128.2032962.1944842639731820744.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jan 2025 13:30:31 +0000
References: <Z41PgCffqPUTyxkE@errol.ini.cmu.edu>
In-Reply-To: <Z41PgCffqPUTyxkE@errol.ini.cmu.edu>
To: Gabriel L. Somlo <gsomlo@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun, 19 Jan 2025 14:16:16 -0500 you wrote:
> Hi Arnd,
> 
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] LiteX updates for next
    https://git.kernel.org/soc/soc/c/9ec80025030b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


