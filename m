Return-Path: <SRS0=nxGl=X5=protonmail.com=linmengbo0689@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CFD8C433EF
	for <soc@archiver.kernel.org>; Sun, 24 Jul 2022 09:53:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 539A0C3411E; Sun, 24 Jul 2022 09:53:30 +0000 (UTC)
Received: from mail-40141.protonmail.ch (mail-40141.protonmail.ch [185.70.40.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6EB0BC385A2
	for <soc@kernel.org>; Sun, 24 Jul 2022 09:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6EB0BC385A2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Date: Sun, 24 Jul 2022 09:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1658656401; x=1658915601;
	bh=G33IYnAXaeNcisAWSd3I3CheqUJ739+CZjVoPSdZkbY=;
	h=Date:To:From:Cc:Reply-To:Subject:Message-ID:Feedback-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID;
	b=vx2VD1ahXy44r9SHT8nCxiY+59BLNhd1hBpQhoIWSPontKNJBl/V644NaraHKiqm6
	 xDRwTnCQA3WZJTKXnELHL0TCco/V6Y8L3mCQX5+R5CLx3cW1M2PaA+sgpV7Xqv8sW/
	 CjizhWhDFhKX6smh9zqWw3zJgg1Pl2yWV1msRlk+lemTBJkB3XEtg7/sfmFpYOFDWw
	 oESWThM4bAyTL0aQJUfqnfTkK0taJ57o8QIuZSUyEvfI3IdINKJ678sw2n+s7nJVO/
	 +/JeYOwKppp+p3UlkgvkHjqSHLBiYH6KHJzuJnW8VQnZxSEeCeehPseB7K2aWkE++/
	 Sc9d171RdgdBw==
To: devicetree@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Stephen Boyd <sboyd@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, soc@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht
Reply-To: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Subject: [PATCH v7 0/5] Add Samsung Galaxy E5/E7/Grand Max device trees
Message-ID: <20220724095039.13568-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

v7: Fix incorrectly squashed haptic patch
Fix email in Acked-by tag again
v6: Rename touchscreen analog regulator for a2015
Use regulator haptic instead of GPIO vibrator
Fix email in Acked-by tag
v5: Fix Error:
arch/arm64/boot/dts/qcom/msm8916-samsung-e2015-common.dtsi:36.2-22 Properti=
es
must precede subnodes
Restore Acked-by tag in the dt-bindings patch
v4: Disable i2c2 until lis2hh12 accelerometer is fixed.
Add GPIO LEDs for Grand Max.
v3: Add a cover letter and changelog
v2: Add dt-bindings documentation

Samsung Galaxy E5, E7 and Grand Max are smartphones using the MSM8916 SoC
released in 2015.

e2015 and a2015 are similar, with some differences in accelerometer,
MUIC and Vibrator. The common parts are shared in
msm8916-samsung-a2015-common.dtsi to reduce duplication.

The three devices (and all other variants of E5/E7/Grand Max released in
2015) are very similar, with some differences in display, touchscreen,
sensors and NFC. The common parts are shared in
msm8916-samsung-e2015-common.dtsi to reduce duplication.

Unfortunately, some E5/E7/Grand Max were released with outdated 32-bit
only firmware and never received any update from Samsung. Since the 32-bit
TrustZone firmware is signed there seems to be no way currently to
actually boot this device tree on arm64 Linux on those variants at the
moment.

However, it is possible to use this device tree by compiling an ARM32
kernel instead. The device tree can be easily built on ARM32 with
an #include and it works really well there. To avoid confusion for others
it is still better to add this device tree on arm64. Otherwise it's easy
to forget to update this one when making some changes that affect all
MSM8916 devices.

Maybe someone finds a way to boot ARM64 Linux on those device at some
point. In this case I expect that this device tree can be simply used
as-is.

