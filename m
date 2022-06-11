Return-Path: <SRS0=o5ea=WS=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CCAC433EF
	for <soc@archiver.kernel.org>; Sat, 11 Jun 2022 15:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7F915C341C5; Sat, 11 Jun 2022 15:15:55 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D268BC341C0;
	Sat, 11 Jun 2022 15:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D268BC341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from p508fd9f0.dip0.t-ipconnect.de ([80.143.217.240] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o02q5-0004vU-TT; Sat, 11 Jun 2022 17:15:49 +0200
From: Heiko Stuebner <heiko@sntech.de>
List-Id: <soc.lore.kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	devicetree@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: adjust whitespace around '='
Date: Sat, 11 Jun 2022 17:15:45 +0200
Message-Id: <165496044123.1951281.6460473932416038547.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220526204218.832029-1-krzysztof.kozlowski@linaro.org>
References: <20220526204218.832029-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:42:16 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).

Applied, thanks!

[1/3] arm64: dts: rockchip: adjust whitespace around '='
      commit: 41d97397d08c83ebbac7a48ce31f6e2f5cc4de79
[2/3] ARM: dts: rockchip: adjust whitespace around '='
      commit: 4b076db78db48c67263ebde810a4475d9503713c
[3/3] ARM: dts: rv1108: adjust whitespace around '='
      merged into the ARM: dts: rockchip: patch, as the rv1108
      also is just a Rockchip soc.

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
