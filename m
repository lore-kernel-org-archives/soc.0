Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E135C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Mar 2022 16:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 461CEC340F4; Tue,  8 Mar 2022 16:49:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9511EC340EF;
	Tue,  8 Mar 2022 16:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646758160;
	bh=a1n/SiR53Xh24Sv6hn5qQI0CCxFrvEnrUps+EJOtSFA=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lSQyEHFIOU00025xem6XAfXZjZkh5St+w5nbPTMARFYuItzLIdiPyhIObRPt2IDwT
	 LuNmhASV4ZVhoWCn5uxZjW3PTN/iSN42iNkRhulNuYzXNaOlQrz9gq76liexzrHdzZ
	 IPrF1xxT5gmbmrUKmjpfEk2YCO+/dG+JQUrINAb1Qrm879Nd4IS0tQDVbXf8LwG6k6
	 rCnD494FIqXpV28dpCAqzh0YHDTugxH6XtWNBBa7pigC561UNJLf0Wvc6NsA8cwpaX
	 XCzUZV3o4p/WTJXbdxWLwRB8dhU7ZTox51qy5g6RSceTcQ4EDiKnGD3U2We9HPatTv
	 wxfvCkYHuH1pg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: update Krzysztof Kozlowski's email
Date: Tue,  8 Mar 2022 17:49:01 +0100
Message-Id: <164675812274.4164061.2176150830401955260.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220307172805.156760-1-krzysztof.kozlowski@canonical.com>
References: <20220307172805.156760-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 7 Mar 2022 18:28:05 +0100, Krzysztof Kozlowski wrote:
> Use Krzysztof Kozlowski's @kernel.org account in maintainer entries.

Applied to arm/fixes, thanks!

[1/1] MAINTAINERS: update Krzysztof Kozlowski's email
      commit: 5125091d757a251a128ec38d2397c9d160394eac

       Arnd
