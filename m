Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB3B3537FF
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 21:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977822; cv=none; b=lApS1tNmKEDMZVL6niY6GCM1zLy8zUfOi3Gq5xTxXyQdPBCdl4mjns+K1lTBghMnXFoViwFhne1oq+aAh+5TUgk55qrIoJzlp3Zf0xE1K3QEGp78kBn51l8WLRxiTy7XN0+xdqKKPPFSsq500+MfurVcb4cBB0jrJk7iZoZKx6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977822; c=relaxed/simple;
	bh=0B1iXlvePoRi1dKEQKSq9+xTWQFBizx7ONcIMtVHajA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=L05558UBvX9L2A7L3/RQmwOeQjHabght+Jt00/mpzaTSTR1jtd8Y/EYRR6R8LVakDLIZdA+YchrWqs5rY+CmGZnAvSuKFZI99S6IKkHNYJpw2KEcl54HSrRtysXLf7EyxfQmqkzVvetNTYcw1JvQIQFPQZZmeGHH9WNWPxmYHAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZpT3Vir; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZpT3Vir"
Received: by smtp.kernel.org (Postfix)
	id 018DF1F0089A; Fri,  2 Oct 2026 21:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF7ED1F00898;
	Fri,  2 Oct 2026 21:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977820;
	bh=9hcDRnTTHIwvNYvTT0xYjgumVBoJYZzDNNCjKLmqlCQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=NZpT3VirOsX8And8yw2ESrsOBkkaOmsos6IpBxZYGcPvb4AHqu+8fo9H6TiBYqFrC
	 qJ/otKlBXiRBkJaPdGkFHUEOPXJUcf1j9eYB5g2pa2sHBzfX8Kf/IgKYC8+t4ddvvv
	 VI8ruzK5LJwhODSNeM8P+qbIDpDcG0mgBhMfKXGKgl1hQotd+WrFA7mgyia+2n/Y/4
	 /NBPZdjECBzdIK0FxYxBrMjr01YAR1ytUXIMFI1Q4K6voIqI1C7I0JEQKkJ9hfg0qi
	 EEstfr1K5R+9l83cpLvgK8Mt0RjlgMdLJwpp43z4oAZdPBRdo1TCZxuybzO4zha6xC
	 fhzxtKvcjl2cw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D57373811A72;
	Fri,  2 Oct 2026 21:50:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree fix for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179097781952.3602058.1152065218926050583.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 21:50:19 +0000
References: <20260922132018.358932-1-andersson@kernel.org>
In-Reply-To: <20260922132018.358932-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Sep 2026 08:20:18 -0500 you wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree fix for v7.3
    https://git.kernel.org/soc/soc/c/26fb480bee21

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


