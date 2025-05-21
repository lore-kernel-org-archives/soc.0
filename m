Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B56221732
	for <soc@lists.linux.dev>; Wed, 21 May 2025 17:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747847999; cv=none; b=kQw+xz633cUQtlo2WdlDPWP5SVN7SqZYD+HtAppIRQho/9pRfLHUnjzKJInUFYFAW8OjiyQu1j6yQOnELC/TqcKjhO4vyO+LivPcY2a3F+T0MI13pSwZQcOS2oo+cxy0II7MnCtEck91oSEGTiST9/rgapZvVfeuZ85IRTOA6mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747847999; c=relaxed/simple;
	bh=6kC11dTsu9EmgNVIHPzLsQZds7keq6Bxf6O/AiZs0Zw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=kiuKb28hJUT6RdXhTKOWKhW02xXq+fXH9F4hUmXUysABYguQEFjQE/Tv6FAdeDRydD5dm6fLWw82vBaz1AjYxGeWMXHP4WNf+8TzNdJUVaf5laGj0MDeajEE5JMWE1Xb/NRghZdfveGuF6OADw7MP2/GdVsuHyMN8Me+SaROdhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z8eS+5w/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z8eS+5w/"
Received: by smtp.kernel.org (Postfix)
	id 75561C4CEEB; Wed, 21 May 2025 17:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60285C4CEE4
	for <soc@kernel.org>; Wed, 21 May 2025 17:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747847997;
	bh=6kC11dTsu9EmgNVIHPzLsQZds7keq6Bxf6O/AiZs0Zw=;
	h=Subject:From:Date:To:Cc:From;
	b=Z8eS+5w/UYhqx/2TEIdijTqEnKCeeh4QOp0WHkS7JwJZG8U8tk2Er6o4oVd/C91Jd
	 ChalY/U9+++L10eCFp58NqljMca6asiQhDGCd+H/D75SUyn6EVkDFg83cgAy6geobF
	 boTj+CX81Ip2vmzOC3yK4CC9CgTI9U7ZRCMYV/reNoQBfDLdr1JQz7RpeAsGPw1VGN
	 58CCsZSxDpJBjXXDDLvWblpjbqy/heCEmMuqlUt7UrwTQrnYwCMbaoL0ro2OnD7qDt
	 D7OG/pEQNaZw96FU941Qbh/uK+7jXtu0EE9qyKJbZLuxeJBkFD2VvgUm61ukWlbbPl
	 5lm16Ioc70hAA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A0F3380CEEF;
	Wed, 21 May 2025 17:20:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174784803274.2163178.11755625990760745286.git-patchwork-summary@kernel.org>
Date: Wed, 21 May 2025 17:20:32 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Series: [GIT,PULL,1/4,fixes] samsung: drivers: fixes for v6.15
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=962366
  Lore link: https://lore.kernel.org/r/20250513101023.21552-5-krzysztof.kozlowski@linaro.org
    Patches: [GIT,PULL,1/4,fixes] samsung: drivers: fixes for v6.15


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


