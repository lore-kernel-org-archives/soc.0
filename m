Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FEE2045A2
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 17:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741973407; cv=none; b=T/nnWYxlSEJzoMV7YEp9iB7N3D8RLsfvifSjbateWULAnwOX3T9z5FaobY4N/T5SyE5ic9mpPLHEYFvzir3GQ79KnWOKY9lM7Umc8XkKyuZWdRjrhdOmt/f6h+s+RvDWqqtOJYEmUdWImQVp5BmPHOsqOTsSx23mxqYI0KeOLW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741973407; c=relaxed/simple;
	bh=8bA0PHzhWOFJEzXLJYFYZAjFEeePHA3hSujdW43546I=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=btf/g7K3X+/wVbsJKgNSA+gnq0aSBTsUHGP/aHKFimGpdmZl8kas2pl6QEGvQorj9sRNbo5myfB3KySE86PBaODyQloVbDyXOUFvzXKXu73SatzSGYkgWvyfPrnj9jR7OKL/69R4NpzjSiz9IolJa9mVta62ysmqlii1nUZvYR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eBOKJtrK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBOKJtrK"
Received: by smtp.kernel.org (Postfix)
	id C0A06C4CEEC; Fri, 14 Mar 2025 17:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7FD8C4CEE3;
	Fri, 14 Mar 2025 17:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741973406;
	bh=8bA0PHzhWOFJEzXLJYFYZAjFEeePHA3hSujdW43546I=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=eBOKJtrKhPTgk1ISN3TH5+AcIIHjVN1BBu4gJgkITS0jjnynYjmb0/ejt+qz0AccT
	 8RaJ0RGXIteBkLijyIKfRHdjsppgpkGAuv90mqx1vMOZ1FtHMqBroMEo64UQjYovh8
	 AyrqWHPpC/7XTWWfZ+vr5S74EjnM9Y5jvjwLDsp4VCdOpebtJLUPq9HQM2RWMdAgqm
	 B7jybXKMtid3xbCjzyQE+2YFknoErXsI6qc7e9utqWXrBdy5eNAfJwQyXvvMSkeR8D
	 yI9i0FjcKJ0StqAaHbUOE9bUeohjcFw9DxUukbuwhtsAPxmIjtXhFhrV+n833uuSSD
	 o5fhsdB7Tq9Gw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADC72380CEE2;
	Fri, 14 Mar 2025 17:30:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 Devicetree fixes for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174197344148.2324103.2438905640831175281.git-patchwork-notify@kernel.org>
Date: Fri, 14 Mar 2025 17:30:41 +0000
References: <20250310191409.1208520-1-andersson@kernel.org>
In-Reply-To: <20250310191409.1208520-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 10 Mar 2025 14:14:08 -0500 you wrote:
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-6.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 Devicetree fixes for v6.14
    https://git.kernel.org/soc/soc/c/82645d8a34eb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


