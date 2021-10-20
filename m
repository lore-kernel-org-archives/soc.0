Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4672C433EF
	for <soc@archiver.kernel.org>; Wed, 20 Oct 2021 14:50:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B90276138B; Wed, 20 Oct 2021 14:50:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E19176137C;
	Wed, 20 Oct 2021 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634741439;
	bh=OoyZp+OyuybYtUVOajvIwZlh0dSL8n5F2waTo6cWpsU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JOKyVpyKQM17DHSIhvBFJCRDK/g2dZtz2Wkb/4OFIbEvEpaTfzKUVAcOiGn1gf+EQ
	 XCDkXScxBElZY5rxSIskGJBgUjJsVE2Mq9hyz5fSG6e0nj9mwJ1ovLqnKhLUdLNc7Q
	 9kkU5imSfwMPgavT/U0YTNMpUbQqAlyM0bTDouwdYFwHcIASIr+FBQY0WfFs9s8N9E
	 GKOZZqCQ/DPMvyRFs4vlGopEJstOTHTgoBnAl8KN0niBCm7IcS5RGwg7oMEOKdop0L
	 8jiEsHaiGZBdDGrRacoSjO+ygwEE8FmPaxxTIGPBXNB+9UeWah7Yp974yiKx9woWXw
	 btQTTwEjQktSA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/2] ARM: dts: samsung: dts for v5.16
Date: Wed, 20 Oct 2021 16:50:13 +0200
Message-Id: <163474139765.4099414.3378403941949760165.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com>
References: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 13 Oct 2021 18:24:17 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.16
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 54dd38340d762620c216d15388b8b3b32f47b6f7

       Arnd
