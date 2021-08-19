Return-Path: <SRS0=soWq=NK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C62C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 14:07:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD36A61100
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 14:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD36A61100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ziswiler.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qq27ytbRCoWtdj9Xq1+IzSLKOg9mRuBkvIs1zCBY7jk=; b=1neLxZRLiyIry0
	gJ3VTQvxVH480MbTE5LH4faYNchvmUOSKZpH/fFf1YU9K2hRsyjmh8N5JzM77N1i/CVcF3Bo1liIU
	IsohuAco0JGVsG0Uu3VG8G1Kk5bgxCWaqUtbfFmjItGsPQwg8HU++ClBYBFAaMGt4w1PWUCTytDU6
	xZoRAhA7RPAq3C4lOilorOg0li9g5KOSbR2Erk1+ePAiRhDaay8NUHyp4uNRouDkFk1UrkP4Zrlzo
	gaChPF1HoWLwBGfjqmoZHZMgbKUVm4QHE79Dew5rGf7R8OH/TlbwoWRDJtqHaJKRZgoP44jQKesVi
	0HMTiq3subQYtteRW/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGif9-008Y4P-17; Thu, 19 Aug 2021 14:04:55 +0000
Received: from mout.perfora.net ([74.208.4.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGieu-008Y1R-80
 for linux-arm-kernel@lists.infradead.org; Thu, 19 Aug 2021 14:04:41 +0000
Received: from toolbox.cardiotech.int ([81.221.236.183]) by mrelay.perfora.net
 (mreueus003 [74.208.5.2]) with ESMTPSA (Nemesis) id
 0LyX1k-1nAJXg2X6E-015upF; Thu, 19 Aug 2021 16:04:19 +0200
From: Marcel Ziswiler <marcel@ziswiler.com>
To: linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Arnd Bergmann <arnd@arndb.de>, Fabio Estevam <festevam@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Olof Johansson <olof@lixom.net>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org
Subject: [PATCH v1 7/7] ARM: dts: colibri-imx6ull-emmc: add device trees
Date: Thu, 19 Aug 2021 16:03:45 +0200
Message-Id: <20210819140345.357167-8-marcel@ziswiler.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210819140345.357167-1-marcel@ziswiler.com>
References: <20210819140345.357167-1-marcel@ziswiler.com>
MIME-Version: 1.0
X-Provags-ID: V03:K1:cGQ2OQwWXLChEXAfqbJIkrTXASzWSHIbnhPFXtF8s3yQNJtYj6b
 FhEz6pE8zeZfuPwOQO97T0Hj+9Vridruvq7Y+ABF87zv6O16egNoif/KO23Ywy9/2m3wW2s
 4iRG/rwDKf7GyWg7qTS+RiolrKy7zZYb68LCqXg6gCKP9pOsSyPSF2lyvqHcNw/b68zRZJp
 meXbRnj5RrSsQL2m9DCPA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rddw+ANkEWw=:G6NMGSMV8s+YCJymE6JlJ5
 fjATqRYhcx+sScOAkgD1FPM1NwbKedtQ7ZwEGuIAN3xO8L8CxwFjk2Cf70vC/Gw6+611m8Yj4
 VS8AdJUbtkEDkthqPpIfzcFoEAMc5pGV6pb/kKjq6YrFE07laULLM+meJMQ2sTltJBPXfzKXx
 qZ6fAv9YgN67RC05k/wac30zSsThycDlp7VyUlqpN9QEiz/cOPxx38WMWswnGpMtSr+QfRBRY
 8gFvL3raG7mecPJCnRvtT4ugCKo7csy7x0ww5pOrchd7HqY//C57Di84Hh+mbuXNaMFmYgP1x
 LhiTaDWb7bZN6BUOPBDE6gVJHRlsNmtDO42f0GoQAfuW1VlWQriU0ARctMGecYifvSpfevwJN
 xadFYqSEF5/bLfRVq5AaJghweea5OrsSWQGzgb+flWUz9AER6RT73+xeXgkVY3CuIJAClfHfV
 5RS8oLyziovzcD6SdPYv79ASCyrrr8DeJP038h937TTC0n4KIwCAzb2H7OcG/Cu8GCMsJuaA2
 vXOUATKb3U7aB87+fgvT4SaGYpKw95+OTtbOHzMDaTicxqs0YLccbboxsxUZ26MECXUgGuBng
 iUC6kBw5fKAm/QuSBC90RKRtFzHLaZGzSAZY2iz2nDyuc8OOgCRPZsaU49rulH2d27rVKhTKe
 koghys+lU77lGmH2BK/LNTQldspC8DAANoJDWnrCelW+BrITowxbrkMD/jhCrUoHQjlTzLZuU
 TeD2CMmFJGUZbFro9TCTFOEDOLF3mEQJgD4CvN4udQx/RQeUataumwdzHqDDkD0mZJMg3vnYi
 SmYtbr9LxiLuQGZgfFCGyjCUtd8+1ORvIS1kTa6l4fhhjZtWU7ja393zAs1d8ywhTP9NHFX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_070440_421590_9A230735 
X-CRM114-Status: GOOD (  15.64  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Max Krummenacher <max.krummenacher@toradex.com>

Add devices trees for a Colibri iMX6ULL 1GB which has a eMMC instead of
the raw NAND used on other SKUs.

Related-to: ELB-4056, ELB-4058
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

---

 arch/arm/boot/dts/Makefile                    |   1 +
 .../boot/dts/imx6ull-colibri-emmc-eval-v3.dts |  17 ++
 .../dts/imx6ull-colibri-emmc-nonwifi.dtsi     | 185 ++++++++++++++++++
 arch/arm/boot/dts/imx6ull-colibri.dtsi        |  30 ++-
 4 files changed, 232 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dts
 create mode 100644 arch/arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 7e0934180724d..f88ddcc40b6ac 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -671,6 +671,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ul-tx6ul-0011.dtb \
 	imx6ul-tx6ul-mainboard.dtb \
 	imx6ull-14x14-evk.dtb \
+	imx6ull-colibri-emmc-eval-v3.dtb \
 	imx6ull-colibri-eval-v3.dtb \
 	imx6ull-colibri-wifi-eval-v3.dtb \
 	imx6ull-myir-mys-6ulx-eval.dtb \
diff --git a/arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dts b/arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dts
new file mode 100644
index 0000000000000..70104a6c5bac9
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ull-colibri-emmc-eval-v3.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Toradex AG
+ */
+
+/dts-v1/;
+
+#include "imx6ull-colibri-emmc-nonwifi.dtsi"
+#include "imx6ull-colibri-eval-v3.dtsi"
+
+/ {
+	model = "Toradex Colibri iMX6ULL 1GB (eMMC) on Colibri Evaluation Board V3";
+	compatible = "toradex,colibri-imx6ull-emmc-eval",
+		     "toradex,colibri-imx6ull-emmc",
+		     "toradex,colibri-imx6ull",
+		     "fsl,imx6ull";
+};
diff --git a/arch/arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi b/arch/arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi
new file mode 100644
index 0000000000000..df055617e51f7
--- /dev/null
+++ b/arch/arm/boot/dts/imx6ull-colibri-emmc-nonwifi.dtsi
@@ -0,0 +1,185 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright 2021 Toradex AG
+ */
+
+#include "imx6ull-colibri.dtsi"
+
+/ {
+	aliases {
+		mmc0 = &usdhc2; /* eMMC */
+		mmc1 = &usdhc1; /* MMC 4bit slot */
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x80000000 0x10000000>;
+	};
+};
+
+&gpio1 {
+	gpio-line-names = "SODIMM_8",
+			  "SODIMM_6",
+			  "SODIMM_129",
+			  "SODIMM_89",
+			  "SODIMM_19",
+			  "SODIMM_21",
+			  "UNUSABLE_SODIMM_180",
+			  "UNUSABLE_SODIMM_184",
+			  "SODIMM_4",
+			  "SODIMM_2",
+			  "SODIMM_106",
+			  "SODIMM_71",
+			  "SODIMM_23",
+			  "SODIMM_31",
+			  "SODIMM_99",
+			  "SODIMM_102",
+			  "SODIMM_33",
+			  "SODIMM_35",
+			  "SODIMM_25",
+			  "SODIMM_27",
+			  "SODIMM_36",
+			  "SODIMM_38",
+			  "SODIMM_32",
+			  "SODIMM_34",
+			  "SODIMM_135",
+			  "SODIMM_77",
+			  "SODIMM_100",
+			  "SODIMM_186",
+			  "SODIMM_196",
+			  "SODIMM_194";
+};
+
+&gpio2 {
+	gpio-line-names = "SODIMM_55",
+			  "SODIMM_63",
+			  "SODIMM_178",
+			  "SODIMM_188",
+			  "SODIMM_73",
+			  "SODIMM_30",
+			  "SODIMM_67",
+			  "SODIMM_104",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_190",
+			  "SODIMM_47",
+			  "SODIMM_192",
+			  "SODIMM_49",
+			  "SODIMM_51",
+			  "SODIMM_53";
+};
+
+&gpio3 {
+	gpio-line-names = "SODIMM_56",
+			  "SODIMM_44",
+			  "SODIMM_68",
+			  "SODIMM_82",
+			  "",
+			  "SODIMM_76",
+			  "SODIMM_70",
+			  "SODIMM_60",
+			  "SODIMM_58",
+			  "SODIMM_78",
+			  "SODIMM_72",
+			  "SODIMM_80",
+			  "SODIMM_46",
+			  "SODIMM_62",
+			  "SODIMM_48",
+			  "SODIMM_74",
+			  "SODIMM_50",
+			  "SODIMM_52",
+			  "SODIMM_54",
+			  "SODIMM_66",
+			  "SODIMM_64",
+			  "SODIMM_57",
+			  "SODIMM_61",
+			  "SODIMM_29",
+			  "SODIMM_37",
+			  "SODIMM_88",
+			  "SODIMM_86",
+			  "SODIMM_92",
+			  "SODIMM_90";
+};
+
+&gpio4 {
+	gpio-line-names = "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "",
+			  "SODIMM_140",
+			  "SODIMM_59",
+			  "SODIMM_142",
+			  "SODIMM_144",
+			  "SODIMM_133",
+			  "SODIMM_146",
+			  "SODIMM_28",
+			  "SODIMM_75",
+			  "SODIMM_96",
+			  "SODIMM_81",
+			  "SODIMM_94",
+			  "SODIMM_101",
+			  "SODIMM_103",
+			  "SODIMM_79",
+			  "SODIMM_97",
+			  "SODIMM_69",
+			  "SODIMM_98",
+			  "SODIMM_85",
+			  "SODIMM_65";
+};
+
+&gpio5 {
+	gpio-line-names = "SODIMM_43",
+			  "SODIMM_45",
+			  "SODIMM_137",
+			  "SODIMM_95",
+			  "SODIMM_107",
+			  "SODIMM_131",
+			  "SODIMM_93",
+			  "",
+			  "SODIMM_138",
+			  "",
+			  "SODIMM_105",
+			  "SODIMM_127";
+};
+
+&gpmi {
+	status = "disabled";
+};
+
+&iomuxc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio1 &pinctrl_gpio2 &pinctrl_gpio3
+		&pinctrl_gpio4 &pinctrl_gpio6 &pinctrl_gpio7
+		&pinctrl_gpmi_gpio>;
+};
+
+&iomuxc_snvs {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_snvs_gpio1 &pinctrl_snvs_gpio3>;
+};
+
+&usdhc2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_usdhc2emmc>;
+	assigned-clocks = <&clks IMX6UL_CLK_USDHC2_SEL>, <&clks IMX6UL_CLK_USDHC2>;
+	assigned-clock-parents = <&clks IMX6UL_CLK_PLL2_PFD2>;
+	assigned-clock-rates = <0>, <198000000>;
+	bus-width = <8>;
+	keep-power-in-suspend;
+	no-1-8-v;
+	non-removable;
+	vmmc-supply = <&reg_module_3v3>;
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/imx6ull-colibri.dtsi b/arch/arm/boot/dts/imx6ull-colibri.dtsi
index 0cdbf7b6e7285..f432fc0a6a530 100644
--- a/arch/arm/boot/dts/imx6ull-colibri.dtsi
+++ b/arch/arm/boot/dts/imx6ull-colibri.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
- * Copyright 2018 Toradex AG
+ * Copyright 2018-2021 Toradex AG
  */
 
 #include "imx6ull.dtsi"
@@ -345,6 +345,19 @@ MX6UL_PAD_ENET1_RX_DATA1__GPIO2_IO01	0xb0b0 /* SODIMM 63 */
 		>;
 	};
 
+		/*
+		 * With an eMMC instead of a raw NAND device the following pins
+		 * are available at SODIMM pins
+		 */
+		pinctrl_gpmi_gpio: gpmi-gpio-grp {
+			fsl,pins = <
+				MX6UL_PAD_NAND_ALE__GPIO4_IO10		0x10b0 /* SODIMM 140 */
+				MX6UL_PAD_NAND_CE0_B__GPIO4_IO13	0x10b0 /* SODIMM 144 */
+				MX6UL_PAD_NAND_CLE__GPIO4_IO15		0x10b0 /* SODIMM 146 */
+				MX6UL_PAD_NAND_READY_B__GPIO4_IO12	0x10b0 /* SODIMM 142 */
+			>;
+		};
+
 	pinctrl_gpmi_nand: gpmi-nand-grp {
 		fsl,pins = <
 			MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00	0x100a9
@@ -533,6 +546,21 @@ MX6UL_PAD_GPIO1_IO03__OSC32K_32K_OUT	0x10
 		>;
 	};
 
+		pinctrl_usdhc2emmc: usdhc2emmcgrp {
+			fsl,pins = <
+				MX6UL_PAD_NAND_RE_B__USDHC2_CLK     0x17059
+				MX6UL_PAD_NAND_WE_B__USDHC2_CMD     0x17059
+				MX6UL_PAD_NAND_DATA00__USDHC2_DATA0 0x17059
+				MX6UL_PAD_NAND_DATA01__USDHC2_DATA1 0x17059
+				MX6UL_PAD_NAND_DATA02__USDHC2_DATA2 0x17059
+				MX6UL_PAD_NAND_DATA03__USDHC2_DATA3 0x17059
+				MX6UL_PAD_NAND_DATA04__USDHC2_DATA4 0x17059
+				MX6UL_PAD_NAND_DATA05__USDHC2_DATA5 0x17059
+				MX6UL_PAD_NAND_DATA06__USDHC2_DATA6 0x17059
+				MX6UL_PAD_NAND_DATA07__USDHC2_DATA7 0x17059
+			>;
+		};
+
 	pinctrl_wdog: wdog-grp {
 		fsl,pins = <
 			MX6UL_PAD_LCD_RESET__WDOG1_WDOG_ANY    0x30b0
-- 
2.26.2


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
