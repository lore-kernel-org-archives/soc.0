Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0452C433E0
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:05:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9588C64F0D; Thu, 11 Feb 2021 15:05:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3BE3D64F0F;
	Thu, 11 Feb 2021 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613055937;
	bh=I/5Q/e6BHb1/9fibOCuBhGE6Y1n2vsVcAp9mskbW63w=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PVIXBsG6V1HT9d7izASphi5eRmpClqDTlFc6cEeTt6twftVE9NU//zutlSB+W0RV+
	 SIhrdTM/Z6QljipZDPw8+cMhPRztLyUHCyBHYKrPl/CJOv7uEJpoxKkuVxa7CWiIr9
	 EljkElMqcsRrz6NTm0FNSuGLyMmMahYwFEKN1m2zUQAU2ZuFzrJDB+5yCC14iJ97Yx
	 QdGh810RWZmtGU11ZWZoPBPG1WXkK/W3jLGXu0ZmvOaCuoIKrDHYphrUxhYW/BxhtM
	 LI17TxthS0IoLY4wW+R27BRYoDh01YddCX8pzCPmuHELgdEY6lcqc/DFh6P6LLWKN8
	 Kc4UE/II2FHiw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	arm@kernel.org,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] memory: drivers for v5.12, part two
Date: Thu, 11 Feb 2021 16:05:31 +0100
Message-Id: <161305590358.259551.4480087919881218357.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210211081829.7317-1-krzk@kernel.org>
References: <20210211081829.7317-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 11 Feb 2021 09:18:29 +0100, Krzysztof Kozlowski wrote:
> Second (and late) pull request, on top of previous one.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 50fc8d9232cdc64b9e9d1b9488452f153de52b69:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: f464252181dc146220e0fb80b08b4fb4e4093288

       Arnd
