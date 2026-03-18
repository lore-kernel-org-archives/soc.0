Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443CF3A4F2A
	for <soc@lists.linux.dev>; Wed, 18 Mar 2026 13:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773839413; cv=none; b=oV4zSRfNw7Hng1Ol+5g5fLhrET+bcbIiVEDwHujXA3bS/3xXF2vn40Zg/Ic0klAFuhCLLjtXFFK+PDaLxW2NYjvTmztBlwjR3zHdIxE8CM3l9Qc6KDh9fkYD0OJC7RgFIL+0kZpdAAvabVxs5MOv+uidMYxerk9gBRauwE4TdAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773839413; c=relaxed/simple;
	bh=zqSsRdw6zsdpe9GEIZhiaNi8VayfdEJgPtE+NBc9Yps=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qKm4D5zDCC4itXWrW6QsTsxO/WR0FFwRICXM0SQu/3+LN8gO8XVehXtS0I7RkNiyTMg9kdwLInQAUxabU9UTHlHxQW+1aiJ9l+srLDurrBD+E77ccJOyjx5ZdUY+8aCa1r7KIVumnAzjfcgINY48JJp5kQ8R4eWnZVggs0f4CiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8MLJXQj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8MLJXQj"
Received: by smtp.kernel.org (Postfix)
	id B4C88C2BCAF; Wed, 18 Mar 2026 13:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F091C19424;
	Wed, 18 Mar 2026 13:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773839412;
	bh=zqSsRdw6zsdpe9GEIZhiaNi8VayfdEJgPtE+NBc9Yps=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b8MLJXQjQKtI64xddCmsMKgplk8wVnwkxDRy7PzjbFmJbQfYwCfh91dOhSLw/h//9
	 DwYRiUwNiCf+nPlIxUCGQwQTPCxrPKAbrUN1caF+hPv2OvLHZR6NNLADDI4cPdHWmQ
	 e8QK4bmS0c8uA1Pnl98Uh0W5fPWZqmNuL/vNkH4qQqn0RMRx1RCtFRxz8HgoemN8HU
	 0MZyY5F4S8y9xbQMqAypadNCcI1yRkw1CbK2QlwZjPIXcxckkvbBNA+jthPyxIFFDO
	 lVIRblk57vxthYaBf58OvrY7fSMmYwVBBumwXeAmVhs3RVuD9hVVYbAqfI4E3IAR+/
	 NX5leVi8QyG5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CDC43808200;
	Wed, 18 Mar 2026 13:10:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] TEE shared memory fix for 7.0
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177383940429.290957.5635748572555525866.git-patchwork-notify@kernel.org>
Date: Wed, 18 Mar 2026 13:10:04 +0000
References: <20260316074150.GA2474723@rayden>
In-Reply-To: <20260316074150.GA2474723@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 16 Mar 2026 08:41:50 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this patch removing the refcounting of kernel pages within
> the TEE shared memory helper.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] TEE shared memory fix for 7.0
    https://git.kernel.org/soc/soc/c/b3315ba042f2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


