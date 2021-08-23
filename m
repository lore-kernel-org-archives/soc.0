Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8CCC4338F
	for <soc@archiver.kernel.org>; Mon, 23 Aug 2021 21:50:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BCF9F6103A; Mon, 23 Aug 2021 21:50:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A6F77613CD
	for <soc@kernel.org>; Mon, 23 Aug 2021 21:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629755418;
	bh=TFpB16TJjUx75EGmwSFHnW6+Ox7cmX0BoqrZWqWCDgk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ERVSJ2GxrqTYShpPYiEbJ9qWxw2sry62CE0ItWfxLmB+UqZdyl9MK/OVMKUOaaT1V
	 mUzPUECLUxEhb75IabrHadvD4qfk5U/X2Miu14kdgAbs8k0xlrdcVAl+UTqhrIpc5z
	 G7IdDgUgNdLae/vAvmVqNS9vkJiv8nJpinVyYjwb16ATE2CoogNGDsRmA2SeYgbLK7
	 N1VXSxSFvj/hrJcguiJkQEqoWyqE09afRIa0HjZh1Qon+Z5YqERcffykT4EyuSMYN3
	 JJTTapWUU7pYUDLWeSfCoYDOB9BRslGlpZMTLHXfXH3pf8Kl+Dl8nPRxvEzyLJKoDq
	 02TgXf22yXcpA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 914C16098C;
	Mon, 23 Aug 2021 21:50:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <162975541853.28427.17260278676252455779.git-patchwork-summary@kernel.org>
Date: Mon, 23 Aug 2021 21:50:18 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (refs/heads/arm/fixes):

Patch: [v2] arm/arm64: dts: Fix remaining dtc 'unit_address_format' warnings
  Submitter: Rob Herring <robh@kernel.org>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=536023
  Lore link: https://lore.kernel.org/r/20210823165126.2320910-1-robh@kernel.org

Total patches: 1

--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


