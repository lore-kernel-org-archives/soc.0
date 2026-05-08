Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C970035AC17;
	Fri,  8 May 2026 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778231546; cv=none; b=J+TadEvuZ7D3VI/eG12hNtIDaJkCv1ab2bCZFeodWDqql2FJhQdt6lIwwb5fngD26LzJ5Kl87jAQoe5r8teuoC+aSWlKob8DpZ/0eIHMSIQJPpWRNUj5DLlMqfNAgjgCCNEuyoehmRyCLIoqRdZByDnFbpZUa8DqM8cZiDMyqJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778231546; c=relaxed/simple;
	bh=uBAaIsEDejWMfV58L1gweQ8IuopfSkWuoqGUO6Pl6ww=;
	h=Date:Message-ID:From:To:To:Cc:Cc:Cc:Cc:Subject; b=KsvlO3mxfXktdAXGYWb+K77+jugLvuk+EmPP+fQBG7bNa7MpL61orQADTGA6xYaWBCurO2ZVBJIpeWqW3HnQlRuCijs/sClSgTtVjStpPIceESb4LIOkMXMlxWQ5j7wvOaf3GoiZUPKAuy1ABsFNXsaOehCZHpCBqouOTKn4gZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qpyMgEYo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpyMgEYo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 059A5C2BCB0;
	Fri,  8 May 2026 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778231546;
	bh=uBAaIsEDejWMfV58L1gweQ8IuopfSkWuoqGUO6Pl6ww=;
	h=Date:From:To:To:Cc:Cc:Cc:Cc:Subject:From;
	b=qpyMgEYobhFg19aZSZpN6pBCzx35CYX0uN7xH7fOAhPTK5ljF1+JDzXRB1Tn7qnrM
	 5PdG+S3fOtOP5XiTpMzvMYo3gHqInWQwhoEX6GzGxeTu0x43yMQ0qz79CpEizKdOl1
	 RuoFkmbTdHfKE2zhKiUFNlniKxfyiSfQquufmJW0NEWI1bbtSWZ3eoD5jAQIs1t8rY
	 5VIGyns2YooIVygyAm+ZE6MPvLQWYoKHtwdEh2BcwhEwrbSNWiwKiWH9qjQvVUZ1b1
	 N4feSqc7wi1wIomOYV/1OmoGkEKm5hP/2wagl7FTUSiAI3CSh4x2zeDotT62mE4hLO
	 ha1SxES2BtvrA==
Date: Fri, 08 May 2026 11:12:23 +0200
Message-ID: <eed505a9bd38a5fd015e2d18a57fdeb0@kernel.org>
From: Thierry Reding <thierry.reding@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
To: Peter Chen <peter.chen@cixtech.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: soc@lists.linux.dev
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: manual merge of the cix tree with the arm-soc tree
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>

Today's linux-next merge of the cix tree got a conflict in:

  arch/arm64/configs/defconfig

between commit:

  f54f7979ff88 ("arm64: defconfig: Move entries to match savedefconfig")

from the arm-soc trees and commit:

  f4f1e3bdb5f9 ("arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe host, and Cadence GPIO")

from the cix tree.

It looks like the patch from the cix tree somehow partially landed in
the arm-soc tree, even though it wasn't pulled yet.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 094bb9cd8764..e5f1901ee408 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -701,6 +701,7 @@ CONFIG_PINCTRL_SM8550_LPASS_LPI=m
 CONFIG_PINCTRL_SM8650_LPASS_LPI=m
 CONFIG_PINCTRL_SOPHGO_SG2000=y
 CONFIG_GPIO_ALTERA=m
+CONFIG_GPIO_CADENCE=m
 CONFIG_GPIO_DAVINCI=y
 CONFIG_GPIO_DWAPB=y
 CONFIG_GPIO_MB86S7X=y
