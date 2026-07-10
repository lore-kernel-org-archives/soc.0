Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB7E42F6F2
	for <soc@lists.linux.dev>; Fri, 10 Jul 2026 14:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783695032; cv=none; b=ac6H4VOYiY/nu3jEfNvUJArEMPheVYnWKRr99654ZIjnKHEg7yE/ZdA7bM2gvVGI2ZPsNRfo57AiDobTbBHdbGOLHiFlpbSzKrt3K0wEu3UVFAaFfb2myRGisdta1YBW7eEzCSIiIwO+DCU5ntApGfkinqnUMCuOQVQWAXZb2M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783695032; c=relaxed/simple;
	bh=WvYONj9bcS7YwVtyg7rf+s+edW1MHV2stC4p2NX0cu4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:To:Cc; b=ncnUzLqC6ZZJ3FCD9qiPEsI2hhNxqC6UGqThnjiwmq9Y9WEZDz6RzC5WqOzs/tnCi0/IBqXs+VlL696iYTJQqyNqQ/Z6yrgktLLIvfr2hfUAdM1go0eFPDQSe4HlIq6jqwjEeusAOcH5TZnOWZg7A38SniF3pFCR90BEj3HiqHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vvz/YMGk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vvz/YMGk"
Received: by smtp.kernel.org (Postfix)
	id AEAE91F00A3A; Fri, 10 Jul 2026 14:50:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9930A1F000E9
	for <soc@kernel.org>; Fri, 10 Jul 2026 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783695027;
	bh=rLszwEK9XluAOc1iAlZjikO4G9ytL3V7L1dr85dhHm8=;
	h=Subject:From:Date:To:Cc;
	b=Vvz/YMGkrRiAdeKoKskvmlml/CbLKtzb/B0Hv8SfdVGzovSdRZCPl/TCzkcywlFKh
	 tWMMQh9QhujftX7qQROa7pWTrLeInnx+UvJ8rAAVrnHNnENjN3vsfIyMOiUeYbVP4f
	 m11xPu61QBDVunWNxhYYkDIyekuRSLIlO8b/2MWMX1iwMKj8eDZd3JHyjwBlPdg5G7
	 +L4ALc3LOQ/bRBZEY1dzOqK2bYPbK1/R5xztjmorxISQWZlIizAruZv7L4NUgMidHa
	 uqex+GEhUfXJgsRh5qH7VUayBbYQlN7lliWvgZsTuQF0v/lBw786Tq40qc7g1yYWg2
	 33+/WqKfdwpdg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 960B73924F9B;
	Fri, 10 Jul 2026 14:50:06 +0000 (UTC)
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
 <178369500514.720071.5699284113867341037.git-patchwork-summary@kernel.org>
Date: Fri, 10 Jul 2026 14:50:05 +0000
To: soc@kernel.org
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: [1/2] ARM: dts: st: spear: Correct indentation
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=1122274
  Lore link: https://lore.kernel.org/r/20260706101823.341230-3-krzysztof.kozlowski@oss.qualcomm.com
    Patches: [1/2] ARM: dts: st: spear: Correct indentation
             [2/2] ARM: dts: st: ste: Correct indentation


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


