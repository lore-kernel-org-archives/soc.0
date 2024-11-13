Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633C270835
	for <soc@lists.linux.dev>; Wed, 13 Nov 2024 17:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731520222; cv=none; b=RiSeGCvrkEsU/bSG3QS07zTV1Rgw/xjOcFovjgrPKbTGl/hMFw4niKo+UkHX/drSchgh6+a7B/51mw2huGlLeKcG0d0A2sUEhboA7DVu9zyfbKe5S6guRYTw2PqST0h9upS4biOX5hWPaNyLzQgt53f/9JyNl//jyFldqIPyCoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731520222; c=relaxed/simple;
	bh=UaIkHlq+2L/W7E7RWEv8csCe7klwaSAT06IjVqkHaFA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=KslPkrOGXAkpHtj6km9uispIScvfWeZuQTAcRS5eVa1ZJUWy69URmD76CONbcDrzvOIJaQVKzWJjyEvMziz3mHOPUhO1yq2Z7N/Qz3AOKD+a2ZFIgIX9kVcL4F4Aaj5j8xAfJ5FZbH99fGeInsqzoUE/JgFRFaAXDu/urKC4wWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ceVdz7py; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ceVdz7py"
Received: by smtp.kernel.org (Postfix)
	id 08F02C4CED0; Wed, 13 Nov 2024 17:50:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E342BC4CEC3;
	Wed, 13 Nov 2024 17:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731520221;
	bh=UaIkHlq+2L/W7E7RWEv8csCe7klwaSAT06IjVqkHaFA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ceVdz7py03g1rhM+cQ2H/XYtEcIkQ0eCX53TOmG5UAUuiULcWGrb3UiZRsdOrgb3C
	 6tBqcnovon0QbV2CRgM73tgNmfykVbYAQcC9QzHQ1W6l4WOH08oIqSdnsyFzjOFKZY
	 jQ+pgXfh01g8L26ND1N+3aS26/KB/d26mgUnJ3T0iJ6ugJNfAC0tZjcFrw3nmMG9JN
	 fJkAd9mHJ3gtWeiHTvQg4JNvmGNTAdYbKzHfI/0WEnREY+sW5hSrnlEQZy+WJGJbv3
	 hcObWAfNTqV3a8Ld4JGyCAMhCflNkU9JjK9tjtx85g3gVEJKXpF5of7LixuQYiVTrQ
	 bv2gFoMVtGoug==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 726BF3809A80;
	Wed, 13 Nov 2024 17:50:33 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] A few more Qualcomm driver updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173152023226.1302612.17045060846184010670.git-patchwork-notify@kernel.org>
Date: Wed, 13 Nov 2024 17:50:32 +0000
References: <20241113032425.356306-1-andersson@kernel.org>
In-Reply-To: <20241113032425.356306-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 12 Nov 2024 21:24:22 -0600 you wrote:
> The following changes since commit d088afa7de3cbe689954dad49e7058d2c4b8944c:
> 
>   soc: qcom: socinfo: add QCS9100 ID (2024-10-29 15:09:02 -0500)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.13-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] A few more Qualcomm driver updates for v6.13
    https://git.kernel.org/soc/soc/c/1876c788bba1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


