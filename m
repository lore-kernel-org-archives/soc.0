Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A617253939
	for <soc@lists.linux.dev>; Tue, 25 Nov 2025 13:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764078669; cv=none; b=l+7qkvIP+RUGBgP0BksLl3CyGhltFp+evczeN481UY2XjY7RYDK+4XgKwYucietMXZ8GRQY4CmR5yBay3kag8IONYr3lEkIA/OlOaGgI3rwg9G3sQu6iMQBDW5o8Pmw9ofxeI7UIXXvtLQ41VDp+xuac1zUrKJOLe8sQxBiArns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764078669; c=relaxed/simple;
	bh=rIUQZCbIgGgd41kQ4maQJMv4hNk/NgjYci1qlsdnKw8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=TmCU6vnzQqjiZHrD6eXTqhEXUvNyHzcw5OS2YmBPIToO9xMd9+ZHaIG/th7gKPRHxZ/cB97i7zIry6B2jctLxtGkAyrEWd+VBL3ir+/pdwsrmZrR3RvRdpaYT0Ak/fDZNjMuKs6e9xFw5qz+LQl7bs9iQPsNiUWvqXZuVyBzSW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rxz64xlF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rxz64xlF"
Received: by smtp.kernel.org (Postfix)
	id 0B8FFC19423; Tue, 25 Nov 2025 13:51:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9940C4CEF1;
	Tue, 25 Nov 2025 13:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764078668;
	bh=rIUQZCbIgGgd41kQ4maQJMv4hNk/NgjYci1qlsdnKw8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=rxz64xlFHK78A7R8ru0VNd4tINxQVixMjHkPSoo3MOog2M0Q66iiGSdkNteX6qBDI
	 qqMm+c5tFiJUWq/RXO9nit//NSysXITVOS3kiMaUeKIQp95EuaKqRR62gHKI7OHJNJ
	 jSbGj3FP7XIcZRRHWNxRa8NzHcYWAuzY+FJhwJjN+OFheml78yY5qA5G1/uyHsMqMm
	 E1sbqZ6JnhM85Zx/ahnvaZjhQbGITg+w2PfQnG6rlLmsWCmE489UzQK0CL5/dbQpJs
	 xQ9AT69HSeCT3hrDRbMlZ/uE3469ODOIYZ/2UosNwyop3VZs36YiJiylWHJSP6wFVz
	 xSloalpPeFUTA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0373A8D153;
	Tue, 25 Nov 2025 13:50:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176407863124.736376.8292253595332847296.git-patchwork-notify@kernel.org>
Date: Tue, 25 Nov 2025 13:50:31 +0000
References: <20251117200001.3169354-1-andersson@kernel.org>
In-Reply-To: <20251117200001.3169354-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 13:59:54 -0600 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.19
    https://git.kernel.org/soc/soc/c/3d497bf8efb5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


