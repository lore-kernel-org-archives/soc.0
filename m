Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337F419F110
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644349; cv=none; b=AHqeF6udNgC19DxYr9NEjdVvBvKJxT+1alOqj7AfB9JSI10XvfexbbyLI2WRBA4tM6KsJOIgOFmDhbb5ycZbcVccx8WN2/ddES9H8sa3XlpobVUQxFcERjnzYQhVc9h8e1YXMPwkfkeYGtksVEzIjkwyYNU9NClGVeBsPZ8xUOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644349; c=relaxed/simple;
	bh=ks1KHMN+8sx7f+wnMlZfvm4wkaDfzb3ZtxVa2fTLwL0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=t8BTQLju8gZN9Nt17ba1ir5rRKGp7jClcnyqz0FYA0CBkGFf7o7BcKJpqg7rNQ3xNxB56BW+wPhWJ+vkhPM1yNQTZpT8sZuIXYpV4wY5/awkdOQWEeb2hgqUyZdGOw17QTsNNECi1iyv8o3buPpX2j1xblfw1GmGVGUjDLwoeAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hlozK9DD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hlozK9DD"
Received: by smtp.kernel.org (Postfix)
	id C3B69C4CECD; Fri, 11 Oct 2024 10:59:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBD1C4CECC;
	Fri, 11 Oct 2024 10:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644348;
	bh=ks1KHMN+8sx7f+wnMlZfvm4wkaDfzb3ZtxVa2fTLwL0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=hlozK9DDTRQwkv2JBVnTl3vHeSbHphhaz4/npZIVLpyDmLm06vT8PDuJBXCnhvIpk
	 QzQ6CFTL5GhH/pexfPfUeVHim4ZfA4boNtBImGJ+gw2aYLgW13xbwc6wXwGNyMHQYn
	 2E28gMesE+NywcExKo+1CDa272FBwri7MYIpBHJoLICbFzHtwP0FRloRUm2LGftB57
	 9k1ZiFg7kWRdKlVDT8UBQ8FbB4fLcyWY9OV1aR3HJ8yfuJgDhASF3R92/F2nierX6t
	 RcKIfvidb/hLwIQS7x1FpQziC9BCQFNr+z2pxjtUZ5uGQ84gLwkR9GxpZgY+mbvcNF
	 1N2xV/XHgFsqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C563822E4C;
	Fri, 11 Oct 2024 10:59:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm32 DeviceTree updates for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864435298.2676212.1206814647086792500.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:12 +0000
References: <20240904193228.15466-1-andersson@kernel.org>
In-Reply-To: <20240904193228.15466-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  4 Sep 2024 14:32:27 -0500 you wrote:
> The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:
> 
>   Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm32-for-6.12
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm32 DeviceTree updates for v6.12
    https://git.kernel.org/soc/soc/c/a77498a43345

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


