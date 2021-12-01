Return-Path: <SRS0=jpUF=QS=norik.com=andrej.picej@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACC7C4332F
	for <soc@archiver.kernel.org>; Wed,  1 Dec 2021 12:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 28F47C53FD4; Wed,  1 Dec 2021 12:53:40 +0000 (UTC)
Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93364C53FD1;
	Wed,  1 Dec 2021 12:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 93364C53FD1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=norik.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=HAAqevlSyhhUK7PXaqdxc+kJMIISEYQG+9JTs1Nsa+o=; b=AwoUyUPUDgWFgbA5MsEqHdPuEE
	5NE5jJBrBvGUKZN5RpAFMefgOryXc3KyweBz9KyF0ctTk92tH5IZQmvvnRzupfhxjFboSOXdRnZC/
	A22myFrFQWnaJa9FFPyurSmlUzkyLCmDdsQSSchCDKJttNeRmnBLZn7FBq6PLDBuHgnyYBheoU5An
	SGXoNTv8nXZdC8Wp6yUNwhW8DK3hThy2Gn/PTcMYeWiphYaowu0zaHXPWJqwHtHxZJk0wC7+X0bZX
	I8mtUIvrjlLfPc8j9ewXa03dgy0W6G93Fwycatbx9YxiIGnJl2GiEe9iUCXHqJVvy+lxuRAmTK0Gs
	qoV4zYUA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:37890 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94.2)
	(envelope-from <andrej.picej@norik.com>)
	id 1msP76-008Rde-MJ; Wed, 01 Dec 2021 13:53:32 +0100
From: Andrej Picej <andrej.picej@norik.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	soc@kernel.org
Cc: robh+dt@kernel.org,
	kernel@pengutronix.de,
	shawnguo@kernel.org,
	leoyang.li@nxp.com,
	krzysztof.kozlowski@canonical.com,
	linux@rempel-privat.de,
	festevam@gmail.com,
	arnd@arndb.de,
	linux-imx@nxp.com,
	andrej.picej@norik.com,
	y.bas@phytec.de
Subject: [PATCH 4/4] ARM: dts: imx6ul: peb-av-02: move to 3 cell pwm
Date: Wed,  1 Dec 2021 13:53:27 +0100
Message-Id: <20211201125327.3704500-5-andrej.picej@norik.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201125327.3704500-1-andrej.picej@norik.com>
References: <20211201125327.3704500-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cpanel.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Instead of changing default pwm-cells property, use the default
"#pwm-cells = <3>" and add the third option.

Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---
 arch/arm/boot/dts/imx6ul-phytec-segin-peb-av-02.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx6ul-phytec-segin-peb-av-02.dtsi b/arch/arm/boot/dts/imx6ul-phytec-segin-peb-av-02.dtsi
index 7cda6944501d..6ce534a896ef 100644
--- a/arch/arm/boot/dts/imx6ul-phytec-segin-peb-av-02.dtsi
+++ b/arch/arm/boot/dts/imx6ul-phytec-segin-peb-av-02.dtsi
@@ -11,7 +11,7 @@ backlight_lcd: backlight-lcd {
 		brightness-levels = <0 4 8 16 32 64 128 255>;
 		default-brightness-level = <5>;
 		power-supply = <&reg_backlight_en>;
-		pwms = <&pwm3 0 5000000>;
+		pwms = <&pwm3 0 5000000 0>;
 		status = "disabled";
 	};
 
@@ -91,7 +91,6 @@ lcdif_parallel_out: endpoint {
 };
 
 &pwm3 {
-	#pwm-cells = <2>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pwm3>;
 	status = "disabled";
-- 
2.25.1

