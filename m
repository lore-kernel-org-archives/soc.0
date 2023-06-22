Return-Path: <SRS0=pBr9=CK=protonmail.com=linmengbo0689@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E0EEB64D7
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 00:00:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 51B1CC433C8; Thu, 22 Jun 2023 00:00:53 +0000 (UTC)
Received: from mail-40138.protonmail.ch (mail-40138.protonmail.ch [185.70.40.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BD2F3C433C0
	for <soc@kernel.org>; Thu, 22 Jun 2023 00:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BD2F3C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Date: Thu, 22 Jun 2023 00:00:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1687392041; x=1687651241;
	bh=woxRHx54bL276MtNal16PQ45VdaC3OFmLaUw4jNYEoc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FNip5Xb7W0zfTA2gP5Bi9lkOSxNebYjJj31a7MzBfn4f6J2LzE+co4XObiO57+YJL
	 28c7CBVQkDOjDEZh1tEwa3NlvX8XuOr5/fTU4duXzlNFlYz5jbZAj7blcVwPdjkpmx
	 4Uv9wgnTfU124YQJcpdcNd293lJr9Yngt9gqH+EBCzibMHkkFF1GStQ50MWAbzwyH7
	 FBrRQDm/l3nTYXGBdyfVhhibOrZA7VU8XifGXcXtnEjI6QJ14GU9TWEh1z5o96a9Np
	 aMu1S1/LUOpkDTBeZMbmAvw+lpeS06elqBCVM+vli8WvDgvAsAjyyhDOm4ve/UpS/y
	 PX04P+SG037zQ==
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, soc@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 0/7] arm64: dts: qcom: msm8916-samsung-fortuna: Add initial device trees
Message-ID: <20230622000007.48219-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Samsung Galaxy Core Prime, Grand Prime and Ace 4 are phones based on
MSM8916. They are similar to the other Samsung devices based on MSM8916
with only a few minor differences.

This initial commit adds support for:
 - fortuna3g (SM-G530H)
 - fortunaltezt (SM-G530Y)
 - gprimeltecan (SM-G530W)
 - grandprimelte (SM-G530FZ)
 - heatqlte (SM-G357FZ)
 - rossa (SM-G360G)

The device trees contain initial support with:
 - GPIO keys
 - Regulator haptic
 - SDHCI (internal and external storage)
 - USB Device Mode
 - UART (on USB connector via the SM5502/SM5504 MUIC)
 - WCNSS (WiFi/BT)
 - Regulators
 - Fuelgauge
 - Accelerometer and magnetometer
 - NFC (except fortuna3g)

There are different variants of Grand Prime, with some differences
in accelerometer, NFC and panel.
Core Prime and Grand Prime are similar, with some differences in MUIC,
panel and touchscreen.
Ace 4 and Core Prime are similar, with some differences in panel and
touchscreen.

