Return-Path: <cmarinas@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBB7EC32771
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 12:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ABB6BC433D6; Wed, 21 Sep 2022 12:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E632C433C1;
	Wed, 21 Sep 2022 12:46:54 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Subject: Re: [PATCH] arm64: configs: Enable all PMUs provided by Arm
Date: Wed, 21 Sep 2022 13:46:51 +0100
Message-Id: <166376440307.3544597.3584496826142741064.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220919162753.3079869-1-broonie@kernel.org>
References: <20220919162753.3079869-1-broonie@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 19 Sep 2022 17:27:53 +0100, Mark Brown wrote:
> The selection of PMUs enabled in the defconfig is currently a bit random
> and does not include a number of those provided by Arm and present in a
> fairly wide range of SoCs. Improve coverage and defconfig utility by
> enabling all the Arm provided PMUs by default.
> 
> 

Applied to arm64 (for-next/defconfig), thanks!

[1/1] arm64: configs: Enable all PMUs provided by Arm
      https://git.kernel.org/arm64/c/120072f48f4e

-- 
Catalin

