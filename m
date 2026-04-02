Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F240360722
	for <soc@lists.linux.dev>; Thu,  2 Apr 2026 21:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775165439; cv=none; b=c8rXZFblRhHQ4M7Ng/9ufyzy90TVEnM4EPO19ub8dBD4pYEsq3N6YB2kxnHe5DJKHrAhkWtUVM6noh7l8VrYb3jj2WLbyBRt/l/CeYCfkjv52FuEHhlD0gunDXjw4/p9OMsPZOTj82xU7QE6k0zDn82u/dVge+xupBZbXv2WSM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775165439; c=relaxed/simple;
	bh=4zRinVX8eY6w0r1uPKhFV1ReddXd5Z6FG0WAOVNCbGY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AB70ZFxF7MuSez37NWn5c8NwecO3PoP0nju8tXzqCLhdl06uFeZDAdsOB3WyRnDFhzSnBaXlOjs9jyyd2MclV1pMwubZR17RxZC/J7od9l2m4g/EaxXUEuOmkz0I7W8MgarYrV0J6P3fwts1PnSD9MX+OcTmbka+DZUYep+dERk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=airF3YJW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="airF3YJW"
Received: by smtp.kernel.org (Postfix)
	id 272B0C2BCAF; Thu,  2 Apr 2026 21:30:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119E4C116C6;
	Thu,  2 Apr 2026 21:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775165439;
	bh=4zRinVX8eY6w0r1uPKhFV1ReddXd5Z6FG0WAOVNCbGY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=airF3YJWHBNRQM9qnD00+2GBR+hWeEMtmGMKYtsn+PxId7zGG/gV7Noo5B+KxTyL2
	 wHzRlPre9XoZhoQ3n/E3hMketAP66/YQG+UB9kA6nRO7SZY09OfFcgf1G/Jvem9Zfw
	 3cMfQJH1tutEgsWnHBX3iKb3ZmVJCSxhdu6McsmlZ/e0qG2SVTFqh/a6AMH45Qosj0
	 XIzmhV8+TMVU9HAimaqciDheOy/+6VvsUSfJTo4qW5B/fnBeDyrqGGniKQa+cCQZJb
	 Kpuchck82XK56EL8T4s2XuWr0nWF0cUCx7ipewN3yykQp5392d7D+QWq//SBIFpy0e
	 8t7zWnGJVjmyg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CD0E3809A09;
	Thu,  2 Apr 2026 21:30:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig updates for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177516542128.623252.14913787701785078962.git-patchwork-notify@kernel.org>
Date: Thu, 02 Apr 2026 21:30:21 +0000
References: <20260331215521.968341-1-andersson@kernel.org>
In-Reply-To: <20260331215521.968341-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 31 Mar 2026 16:55:21 -0500 you wrote:
> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> 
>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-7.1
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig updates for v7.1
    https://git.kernel.org/soc/soc/c/ba5d247871d2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


