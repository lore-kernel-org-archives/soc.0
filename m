Return-Path: <SRS0=pBr9=CK=protonmail.com=linmengbo0689@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D59EB64D7
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 00:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8FD3DC433CB; Thu, 22 Jun 2023 00:04:50 +0000 (UTC)
Received: from mail-4319.protonmail.ch (mail-4319.protonmail.ch [185.70.43.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 52BA6C433C0;
	Thu, 22 Jun 2023 00:04:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 52BA6C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Date: Thu, 22 Jun 2023 00:04:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1687392279; x=1687651479;
	bh=7io2nYrzkHD3aXlPybSWf16LW6ApjJS6Dz0Z07AACno=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=J3HGnhIZuW2c0V617HbLENla7VuW4MpttI+pL/EhcZ8Mr1eOBgMbLIJj+1K67zdZl
	 Hacf+Dud6NyVDwsZzt93pIoBg0p+uh6TLqcWg5mSoem5VR01qHfBDGTtFgiyMhpv4h
	 hdWlex33whlRhAPD9u29aSiYinmwuGBzCMbHSwHgcUSXT8eGBEQkkDkSxcn2rk4b6B
	 9EFu0ggCqS4+ZKwmNMBm/WgwGNDimLKhjmoYK/Bfzgzt0bapLh/bynklunTvYFsyAx
	 QgWuLf+SgkKuMY9Im5b2U22TtFzK2lynIkOx3yTuqmYpL5AAXt0gHf7E43PetSMzJ0
	 336O4ySxkjuoQ==
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, soc@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht, Joe Mason <buddyjojo06@outlook.com>, "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Subject: [PATCH 4/7] arm64: dts: qcom: msm8916-samsung-fortuna: Add rt5033 battery
Message-ID: <20230622000338.48315-1-linmengbo0689@protonmail.com>
In-Reply-To: <20230622000007.48219-1-linmengbo0689@protonmail.com>
References: <20230622000007.48219-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Joe Mason <buddyjojo06@outlook.com>

Like the Samsung Galaxy A3/A5, the Grand Prime uses a Richtek RT5033 PMIC
as battery fuel gauge, charger, flash LED and for some regulators.
For now, only add the fuel gauge/battery device to the device tree, so we
can check the remaining battery percentage.

The other RT5033 drivers need some more work first before they can be used
properly.

Signed-off-by: Joe Mason <buddyjojo06@outlook.com>
Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
---
 .../qcom/msm8916-samsung-fortuna-common.dtsi  | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi b=
/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
index 40c8edc795b0..ca147310c27a 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
@@ -79,6 +79,21 @@ muic: extcon@25 {
 =09};
 };
=20
+&blsp_i2c4 {
+=09status =3D "okay";
+
+=09battery@35 {
+=09=09compatible =3D "richtek,rt5033-battery";
+=09=09reg =3D <0x35>;
+
+=09=09interrupt-parent =3D <&tlmm>;
+=09=09interrupts =3D <121 IRQ_TYPE_EDGE_FALLING>;
+
+=09=09pinctrl-0 =3D <&fg_alert_default>;
+=09=09pinctrl-names =3D "default";
+=09};
+};
+
 &blsp_uart2 {
 =09status =3D "okay";
 };
@@ -127,6 +142,13 @@ &wcnss_iris {
 };
=20
 &tlmm {
+=09fg_alert_default: fg-alert-default-state {
+=09=09pins =3D "gpio121";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
 =09gpio_keys_default: gpio-keys-default-state {
 =09=09pins =3D "gpio107", "gpio109";
 =09=09function =3D "gpio";
--=20
2.39.2


