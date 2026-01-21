Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB092846F
	for <soc@lists.linux.dev>; Wed, 21 Jan 2026 16:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769011219; cv=none; b=E9p8IHQ+ewjYHs5MZ0qXQ/dyLTHO4s/bZ2dMoKum+SDofDPsS/QDLMhxiJWtxfFinD+NQo6wA2mBbQjQm9j1qKfCaThV0j0ZMdzmRdxlfAm+m7n/1Jq0fKyWbZ4SPNXVJ3EgpJg8tTxzTdy68IM5WQZIc81nIh8v4iNWqfX15Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769011219; c=relaxed/simple;
	bh=hzx+cz16H2Ee4jLHMSOsi+dUoTfqokoyjoOtwUG8nUE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QzAtTTA79PzwUbAgvJFNw94rEQAfHsVp9oq5302nD2nS8JEzFQSIMu3aBFx2GyNzua649mDUlLL1wpZbmw2Y40/OqLWFJKLqdztEojOMo/ZAWYHTRTih3PzgqGXusCljp49af4ocSbJ3/lKCGoePRcEY9XETyktusslBHVPyphw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uGWdoc6U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uGWdoc6U"
Received: by smtp.kernel.org (Postfix)
	id CC5ECC19421; Wed, 21 Jan 2026 16:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70C6C2BC87;
	Wed, 21 Jan 2026 16:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769011219;
	bh=hzx+cz16H2Ee4jLHMSOsi+dUoTfqokoyjoOtwUG8nUE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uGWdoc6UWGZ3jJgFCruVCnpRJYRIKfLNP7WVCuhb45bUUk+IGi96eteNIcPxF2P6I
	 /cCmSeJe44nSilNd7TTk1vg5PpDOT+byGNeqC4O16q+3hiupqYO0bo/baDZef20VND
	 vhooMHv2KEmGbIwOXtSIzkYVOZCIiqLJmxy5sINOTvNA8od/0ft3wcvsAb4cEHtXmi
	 Tm2XQP7OBNQKgE4TJklRpLvhSXoVTY78dyO4ctAtj1JVJf35dtV4TPD0CisAHYhu9m
	 PoiaADSMPwm+FRRdReqSxVhG/T/gqGOkuZywbWjqQhOEaESooTfpaoNY3lVi17G74z
	 feH12hWOIyzSw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 11C353808200;
	Wed, 21 Jan 2026 16:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] arm64: AMD/Xilinx SOC changes for v6.20
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176901121684.951664.12312689354151202791.git-patchwork-notify@kernel.org>
Date: Wed, 21 Jan 2026 16:00:16 +0000
References: 
 <CAHTX3dJOkqMPogu=HeBtQuVCK3_-73QPVNPco4dxh3AaOOXUhg@mail.gmail.com>
In-Reply-To: 
 <CAHTX3dJOkqMPogu=HeBtQuVCK3_-73QPVNPco4dxh3AaOOXUhg@mail.gmail.com>
To: Michal Simek <monstr@monstr.eu>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 19 Jan 2026 09:42:41 +0100 you wrote:
> Hi,
> 
> please pull these 2 patches to your tree.
> 
> Thanks,
> Michal
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] arm64: AMD/Xilinx SOC changes for v6.20
    https://git.kernel.org/soc/soc/c/419a620dc452

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


