Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07AFCC433F5
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C89ECC340EB; Tue,  8 Mar 2022 16:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE41C340F5;
	Tue,  8 Mar 2022 16:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646757920;
	bh=fpg+ttMf8MhcWXYOR4Se/wz6diwsQPY7g/JqZ29sW60=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZREFR75ReqlJngoL5tZq5hWzH8wZlhWcGvKSyAeeehhBucAvwPgewjUfjC6qpLExO
	 twvIA3/J/J4d9/YEYvdxRJ3KkLq5RgNjValU/9bpV6X114p4pLZ3/TXPKgSeyszary
	 CFA9XyG8eR1iMsfh3ndarXwyp5dXqKUBRTolQkGaeOcNzL86F6K6zkzYBxTk0aZcCa
	 23s2XNCXqRkzbEQuA9/HcyfbZ8XVqA8NyhJag4n6bfVJNR3TD/pfOv0qKQ8GALbB/D
	 3UJKrl8Ik5LQOByEyiGoXHDPDpRL67kpIf4zaHLHjDyP2yHyX+hD9dKp9pdXEbVou+
	 P9FeTGT/ctbdw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Chanho Min <chanho.min@lge.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: various cleanup for v5.18
Date: Tue,  8 Mar 2022 17:44:40 +0100
Message-Id: <164675781073.4163171.4537137163640184257.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220307173614.157884-1-krzysztof.kozlowski@canonical.com>
References: <20220307173614.157884-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Mar 2022 18:36:14 +0100, Krzysztof Kozlowski wrote:
> These patches were for very long time on the mailing list, but they were not
> picked up. LG maintainer acked the LG part, ARM Juno remains unanswered.
> 
> These are considered cleanups, not fixes, although they fix real
> dt_bindings_check warnings.
> 
> Could you pick them up for v5.18?
> 
> [...]

Merged into arm/dt, thanks!

merge commit: e8f022f9ecb4bb77fb9ab7afc7af03093ee83658

       Arnd
