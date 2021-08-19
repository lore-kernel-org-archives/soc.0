Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FEE3C4338F
	for <soc@archiver.kernel.org>; Thu, 19 Aug 2021 15:45:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 17ADF61029; Thu, 19 Aug 2021 15:45:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4134460EB5;
	Thu, 19 Aug 2021 15:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629387900;
	bh=aVoznOMjkYprKu7dQGoCF0b3hhJ7Mrc5+yaCruzBHKg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CS4vFW6cBNXgThDUSMNOexvtP3F1T3y6cRpMkfMdwuQ7jHW1rgzh3O5mnmnR+qy/G
	 tKxMiCOc950m0jDyLHc6hJEBlsDwUDhvknR5dkgVXZPLuCgrWRltpJBT2qoanHXGK2
	 qvG9DsfhlWNyzxYg/sQCRDs8LE8ipkQZAdfjIMO5b4o02ieIoLWvN1UQEyqEFRD89K
	 PpSnQTYAjYIUOAQBCE4RUdMVJUj10xNWvtWFa38i2FbN0vEDc5E+wXxiHB6nO+ZV3Z
	 QZxfLuw21rqMs7SEH2wN7SMyi5mT8R6W0dwEZ0jhceCGi9/82elLdBk0NsBA9yzxoY
	 4HeC7tK3i8pew==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Jason Wang <wangborong@cdjrlc.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH][PULL/direct] ARM: s3c: delete unneed local variable "delay"
Date: Thu, 19 Aug 2021 17:44:54 +0200
Message-Id: <162938788185.467628.13192922419725983504.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210818204422.17919-1-krzysztof.kozlowski@canonical.com>
References: <20210818204422.17919-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 18 Aug 2021 22:44:22 +0200, Krzysztof Kozlowski wrote:
> "delay" variable on line 79 can be deleted by returning "0" on line 88.

Applied to for-next, thanks!

[1/1] ARM: s3c: delete unneed local variable "delay"
      commit: 319a1b58f6c7432345f13383b26c8c10e7eb1dda

       Arnd
