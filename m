Return-Path: <SRS0=pBr9=CK=protonmail.com=linmengbo0689@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6061AEB64D8
	for <soc@archiver.kernel.org>; Thu, 22 Jun 2023 00:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4A5EFC433C0; Thu, 22 Jun 2023 00:05:29 +0000 (UTC)
Received: from mail-40130.protonmail.ch (mail-40130.protonmail.ch [185.70.40.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DFC2C433CA;
	Thu, 22 Jun 2023 00:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7DFC2C433CA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Date: Thu, 22 Jun 2023 00:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1687392324; x=1687651524;
	bh=IYok//eY9xuimU+KVH65Hac7c91mXkAV7BdwtpJ7YdU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=M2Sz3/y3j2LVl67KR9qTQAr9aNp308mG6JMS1PCVOREMXYL6xPhvkl7kyXl1F4DWb
	 tMdWl7mf70lCGGK3vOpUcAmjybzx2PXK8F8zHsG1sMVRISdtWA71EKmcOk3uR1ABO6
	 c3CtFdQ9G/lr/mIR7KBpbclJ7BXXUbvotCqKTIDxwmmIl4Q9wGZVEGspzboH/NaHd2
	 Z8SMOHEzg/kS53J67lH6XNUTlEpqnnA3u20srAhFFlcu4qhfyPntQ6AX/D0TziWdf2
	 BoUdFuzg0np/+5EJ4i5qXqwpn2f/0mI5sd9z7+Sa8yVHvTkjwEZda+r4c57R64nUGD
	 WBv5gQ0ZLGLUw==
To: linux-kernel@vger.kernel.org
From: "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Stephan Gerhold <stephan@gerhold.net>, Nikita Travkin <nikita@trvn.ru>, soc@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht, Joe Mason <buddyjojo06@outlook.com>, Siddharth Manthan <siddharth.manthan@gmail.com>, "Lin, Meng-Bo" <linmengbo0689@protonmail.com>
Subject: [PATCH 6/7] arm64: dts: qcom: msm8916-samsung-fortuna: Add accelerometer/magnetometer
Message-ID: <20230622000418.48350-1-linmengbo0689@protonmail.com>
In-Reply-To: <20230622000007.48219-1-linmengbo0689@protonmail.com>
References: <20230622000007.48219-1-linmengbo0689@protonmail.com>
Feedback-ID: 40467236:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Joe Mason <buddyjojo06@outlook.com>

gprimeltecan and grandprimelte use a Bosch BMC150, and fortuna3g has
ST LSM303C accelerometer/magnetometer combo.
fortunaltezt and rossa have only ST LIS2HH12 accelerometer.

Add support for them.

Signed-off-by: Joe Mason <buddyjojo06@outlook.com>
[Add LSM303C]
Signed-off-by: Siddharth Manthan <siddharth.manthan@gmail.com>
[Move sensors to fortuna.dtsi. Disable them by default]
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
[Enable on grandprimelte. Add LIS2HH12]
Signed-off-by: Lin, Meng-Bo <linmengbo0689@protonmail.com>
---
 .../dts/qcom/msm8216-samsung-fortuna3g.dts    |  8 ++
 .../qcom/msm8916-samsung-fortuna-common.dtsi  | 80 +++++++++++++++++++
 .../dts/qcom/msm8916-samsung-fortunaltezt.dts |  8 ++
 .../dts/qcom/msm8916-samsung-gprimeltecan.dts |  8 ++
 .../qcom/msm8916-samsung-grandprimelte.dts    |  8 ++
 .../qcom/msm8916-samsung-rossa-common.dtsi    |  8 ++
 6 files changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dts b/arch/=
arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dts
index 366914be7d53..e7f6df229f9a 100644
--- a/arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dts
+++ b/arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dts
@@ -9,3 +9,11 @@ / {
 =09compatible =3D "samsung,fortuna3g", "qcom,msm8916";
 =09chassis-type =3D "handset";
 };
+
+&st_accel {
+=09status =3D "okay";
+};
+
+&st_magn {
+=09status =3D "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi b=
/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
index 6d9f89446105..0436b8ccc3e8 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortuna-common.dtsi
@@ -92,6 +92,79 @@ muic: extcon@25 {
 =09};
 };
=20
+&blsp_i2c2 {
+=09/* Available sensors vary depending on model variant */
+=09status =3D "okay";
+
+=09bosch_accel: accelerometer@10 {
+=09=09compatible =3D "bosch,bmc150_accel";
+=09=09reg =3D <0x10>;
+=09=09interrupt-parent =3D <&tlmm>;
+=09=09interrupts =3D <115 IRQ_TYPE_EDGE_RISING>;
+
+=09=09vdd-supply =3D <&pm8916_l5>;
+=09=09vddio-supply =3D <&pm8916_l5>;
+
+=09=09pinctrl-0 =3D <&accel_int_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09mount-matrix =3D "0", "-1", "0",
+=09=09=09      "-1",  "0", "0",
+=09=09=09       "0",  "0", "1";
+
+=09=09status =3D "disabled";
+=09};
+
+=09bosch_magn: magnetometer@12 {
+=09=09compatible =3D "bosch,bmc150_magn";
+=09=09reg =3D <0x12>;
+
+=09=09vdd-supply =3D <&pm8916_l5>;
+=09=09vddio-supply =3D <&pm8916_l5>;
+
+=09=09mount-matrix =3D "0", "-1", "0",
+=09=09=09      "-1",  "0", "0",
+=09=09=09       "0",  "0", "1";
+
+=09=09status =3D "disabled";
+=09};
+
+=09st_accel: accelerometer@1d {
+=09=09compatible =3D "st,lsm303c-accel";
+=09=09reg =3D <0x1d>;
+=09=09interrupt-parent =3D <&tlmm>;
+=09=09interrupts =3D <115 IRQ_TYPE_LEVEL_HIGH>;
+=09=09interrupt-names =3D "INT1";
+
+=09=09vdd-supply =3D <&pm8916_l17>;
+=09=09vddio-supply =3D <&pm8916_l5>;
+
+=09=09pinctrl-0 =3D <&accel_int_default>;
+=09=09pinctrl-names =3D "default";
+
+=09=09st,drdy-int-pin =3D <1>;
+=09=09mount-matrix =3D "0", "-1",  "0",
+=09=09=09       "1",  "0",  "0",
+=09=09=09       "0",  "0", "-1";
+
+=09=09status =3D "disabled";
+=09};
+
+=09st_magn: magnetometer@1e {
+=09=09compatible =3D "st,lsm303c-magn";
+=09=09reg =3D <0x1e>;
+
+=09=09vdd-supply =3D <&pm8916_l17>;
+=09=09vddio-supply =3D <&pm8916_l5>;
+
+=09=09mount-matrix =3D "0", "-1",  "0",
+=09=09=09       "1",  "0",  "0",
+=09=09=09       "0",  "0", "-1";
+
+=09=09status =3D "disabled";
+=09};
+};
+
 &blsp_i2c4 {
 =09status =3D "okay";
=20
@@ -178,6 +251,13 @@ &wcnss_iris {
 };
=20
 &tlmm {
+=09accel_int_default: accel-int-default-state {
+=09=09pins =3D "gpio115";
+=09=09function =3D "gpio";
+=09=09drive-strength =3D <2>;
+=09=09bias-disable;
+=09};
+
 =09fg_alert_default: fg-alert-default-state {
 =09=09pins =3D "gpio121";
 =09=09function =3D "gpio";
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortunaltezt.dts b/ar=
ch/arm64/boot/dts/qcom/msm8916-samsung-fortunaltezt.dts
index f7c4dcb34bb3..0716ef577df1 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-fortunaltezt.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-fortunaltezt.dts
@@ -21,3 +21,11 @@ / {
 =09compatible =3D "samsung,fortunaltezt", "qcom,msm8916";
 =09chassis-type =3D "handset";
 };
+
+&st_accel {
+=09compatible =3D "st,lis2hh12";
+=09mount-matrix =3D "1",  "0", "0",
+=09=09       "0", "-1", "0",
+=09=09       "0",  "0", "1";
+=09status =3D "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts b/ar=
ch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
index 883f20554dbe..b0d8ac3d6ce9 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dts
@@ -20,3 +20,11 @@ tz-apps@85500000 {
 =09=09};
 =09};
 };
+
+&bosch_accel {
+=09status =3D "okay";
+};
+
+&bosch_magn {
+=09status =3D "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dts b/a=
rch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dts
index ea8a1e698dd4..f7fc538fda04 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dts
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dts
@@ -9,3 +9,11 @@ / {
 =09compatible =3D "samsung,grandprimelte", "qcom,msm8916";
 =09chassis-type =3D "handset";
 };
+
+&bosch_accel {
+=09status =3D "okay";
+};
+
+&bosch_magn {
+=09status =3D "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi b/a=
rch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
index 242cb61e55fd..39f99b5030e5 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-samsung-rossa-common.dtsi
@@ -22,3 +22,11 @@ &blsp_i2c5 {
 =09/* Touchscreen varies depending on model variant */
 =09/delete-node/ touchscreen@20;
 };
+
+&st_accel {
+=09compatible =3D "st,lis2hh12";
+=09mount-matrix =3D "1",  "0", "0",
+=09=09       "0", "-1", "0",
+=09=09       "0",  "0", "1";
+=09status =3D "okay";
+};
--=20
2.39.2


