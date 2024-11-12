Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1B01FEFD9
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450697; cv=none; b=V2Ix5h9BzxGLG8RDbv3DzycpgxMfSZG75Xvb/XyTE3ieBH58wA0fEqdgid8s0oFIMBexFCnPLFJ9C2gu0UMW75+gEIrqVj+YYXnSB3Pj1T8JMVvebSWKH3zpRSmj9LVVY3rxActVUwMTiivMHEzrTeOBt4EcHvr5xpLgDTrGXzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450697; c=relaxed/simple;
	bh=hWE7dCc2c7ZEokXxQxr37xSm/oD4vkCksfCcw/9LFC0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LrFi2h2mdVSEb3YGZG0ms9LRVMgCMMX7zkOc3wY/MxrmDmJuVkJFjUG3EcM7kuVbVRg/7eeMzw7NsSsVopYiBdHGdJ3QqLneH7mP8MLptCjmTYu2nUceHYPgUSatu26tclc+mLcUXQfOr6sGgVA9JHfC2OSw6TFTwTz8K++4L04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETwwoakQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETwwoakQ"
Received: by smtp.kernel.org (Postfix)
	id 4A059C4CED6; Tue, 12 Nov 2024 22:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34B6CC4CECD;
	Tue, 12 Nov 2024 22:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450697;
	bh=hWE7dCc2c7ZEokXxQxr37xSm/oD4vkCksfCcw/9LFC0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ETwwoakQCi72mBwKCtbh1+sLWPEMr702Nl4Nc9/1Lgjh6PNwvF3xN9MYGpS2IDPtd
	 J6AkiE8m6LqCrAD9KikR5Uu6i6kfjyAbG12dLWP4JpWdWWmK1WiafL1xVpZdDz90pb
	 abXGaqCuOVd2+xQ/PKy6D2Ju3IdRHqjC4dsQ0WFao9Zyk1nde2xTM/2DJClnJJpaBK
	 K+ZbcNwsH3tevUfHYvUf4dK8iTOSTmdY5y2mV/qSxZs7LPZmI6FGtMHz3zZfY+LhXJ
	 f9H+1soF+e9g8QWdJ8gVEfrLTmFcWZ6i8EKah+tQQqqwIZjwyRUPKMksODIwnfPaF4
	 hnUqcT8EmF4iQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE3D43809A80;
	Tue, 12 Nov 2024 22:31:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] amlogic ARM DT updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145070723.694695.4076616549857379270.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:31:47 +0000
References: <ffaa3755-8c5d-4fc3-86bf-9129d3889bff@linaro.org>
In-Reply-To: <ffaa3755-8c5d-4fc3-86bf-9129d3889bff@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Nov 2024 14:44:09 +0100 you wrote:
> Hi,
> 
> Here's the first set of fixes towards fixing all bindings check errors,
> this set + the dt-bindings fixes picked by other subsystems fixes most
> of the errors.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] amlogic ARM DT updates for v6.13
    https://git.kernel.org/soc/soc/c/bf7626089a62

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


