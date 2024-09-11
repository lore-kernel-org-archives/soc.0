Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C946EEE49BD
	for <soc@archiver.kernel.org>; Wed, 11 Sep 2024 15:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DD8CC4CEC7; Wed, 11 Sep 2024 15:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88311C4CEC0
	for <soc@kernel.org>; Wed, 11 Sep 2024 15:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726066832;
	bh=8/cx4PprSaFhbNstnXIp+bbY5iwgwytme6HnPINf0Oc=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=gqtTxxM/JLBf8DmQm56m83RVZ22Ijh/StlHbkvmMmYxTZigxRfcvDj49Z12dJywPE
	 I+B85eJeD4qB8H2CVHj3FvSutCAj8R3w/4s3RO6MW9EsMJaT/ip+wV1hK9PmbjKVsF
	 JF/vplzhfEMO2fVaEWpHTsSNXor+YblbJDSQi6H1swy74wlzCkm7zPZg89M5Fus9GI
	 qCSYmTur1d0z1x5Fh4Z+6XInP48NfISCNXLRLh+SaqdC4N1z7q5WZjPTkcTNy5GsNX
	 QrR9ppfFuBq3FXHem04OcUB9PIctTU8VUyHOJ0VL5daQOX5ZktAqcF8U30Ygdp3/2T
	 GPcftw/c1zlwg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B48EB3806656;
	Wed, 11 Sep 2024 15:00:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172606683316.947400.14937956310382433553.git-patchwork-summary@kernel.org>
Date: Wed, 11 Sep 2024 15:00:33 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] memory: drivers for v6.12, part two
  Submitter: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=887776
  Lore link: https://lore.kernel.org/r/20240906140859.71712-1-krzysztof.kozlowski@linaro.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


