Return-Path: <SRS0=jhSe=PH=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4697C433FE
	for <soc@archiver.kernel.org>; Tue, 19 Oct 2021 14:13:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A60E161212; Tue, 19 Oct 2021 14:13:13 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89880611EF
	for <soc@kernel.org>; Tue, 19 Oct 2021 14:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89880611EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lj1-f171.google.com with SMTP id g8so6452793ljn.4
        for <soc@kernel.org>; Tue, 19 Oct 2021 07:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xOf0sXy4r35p6gXgfs572/QVIu+3RqyjsQzstLELFKo=;
        b=xOzg9dDLFJ2rIaTnWwrjon0eSXJL9XxQdU0uVA3N6jx041/RkHqwl2YULEw3kckCHk
         tpoxMWz5/sAEs0hRLL/tOLiDIgtnUOmhF2mSfmhnenpwaMowoiLTioQBJMWsrzPT9p+S
         CbhJXTbaM4u7Ysf5W8W1hublkFZH2AZFWWCEGw3EnTnqoHxJN6ieozBRhOEm81yDwRZf
         GoOvQsmRfAV0kh4aYI4GPaAwH8F0l5k2hm1NyvjnwMbM8fmnJ44spbnr3lhIpv3uK7ix
         bNs2AmFZ4TVfQjKuGJRABruNdp0H0T87n+UFDj/HjbnazX3IzjLYzEDnWs7cJtizQVsM
         +ilw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xOf0sXy4r35p6gXgfs572/QVIu+3RqyjsQzstLELFKo=;
        b=YRRNr8zHPXtUPyAkVitdBPqqhe22rmLhaY3gA+m5WG7U0ctzK5mJgh9tZUbOJ4ty9r
         mSc4MxkVpqUulRAhcxeL5YEX7JT6rRjICwRv9NEbDCN0CfUnoRhtR25lCZZ+HfEMiDrF
         otsr3UhUnDqHwTq8jlmWQZN+U+m31xKVF1gUAED2WOWOJnX360b9s3l1elu3eOXe+rZT
         gWIuIIMFUrKYmm0M42HjUDKi8S25OEf5h7O37mup0wxbqeNsR3iOSa1nyeuIcJHDGzyi
         Dj86Qhefcig1L3J61J3ewKTKMfvOCMPUhkdMhs8j8PevfDOBz+QPbIrxOa9K6bTvNoDW
         APKw==
X-Gm-Message-State: AOAM530LvsI/vyWKxg5zQe+kbmPLVt61rgZxGx+8jMJJ+BMbOCoj3APR
	qWoZ4eVZmsKEWOUzswkyqvs1YA==
X-Google-Smtp-Source: ABdhPJwB5/NUjhIzDhmdfovwpekqaEGkErkI7uh6Y4F08p8/rAjaHeGJTWShQGEc56ngqQAFoTpCZQ==
X-Received: by 2002:a2e:9b12:: with SMTP id u18mr6952241lji.447.1634652791875;
        Tue, 19 Oct 2021 07:13:11 -0700 (PDT)
Received: from grasshopper.googchameleon.semihalf.net ([83.142.187.85])
        by smtp.gmail.com with ESMTPSA id d24sm1957805ljc.2.2021.10.19.07.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Oct 2021 07:13:11 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: dinguyen@kernel.org,
	robh+dt@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@semihalf.com,
	mw@semihalf.com,
	jam@semihalf.com,
	ka@semihalf.com,
	tn@semihalf.com,
	amstan@google.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v4 1/2] socfpga: dts: move arria10 aliases to socfpga_arria10.dtsi
Date: Tue, 19 Oct 2021 16:12:27 +0200
Message-Id: <20211019141228.1271617-2-pan@semihalf.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211019141228.1271617-1-pan@semihalf.com>
References: <20211019141228.1271617-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

socfpga_arria10_socdk.dtsi declares aliases which will most likely
be used by other arria10 boards in the exact same way. move these
aliases to the parent file.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi       | 13 +++++++++++++
 arch/arm/boot/dts/socfpga_arria10_socdk.dtsi |  7 +------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index a574ea91d9d3..26b1662cc00f 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -10,6 +10,19 @@ / {
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	aliases {
+		ethernet0 = &gmac0;
+		ethernet1 = &gmac1;
+		ethernet2 = &gmac2;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		i2c0 = &i2c0;
+		i2c1 = &i2c1;
+		i2c2 = &i2c2;
+		i2c3 = &i2c3;
+		i2c4 = &i2c4;
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
index 7edebe20e859..e9bb56ec15f1 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk.dtsi
@@ -8,14 +8,9 @@ / {
 	model = "Altera SOCFPGA Arria 10";
 	compatible = "altr,socfpga-arria10", "altr,socfpga";
 
-	aliases {
-		ethernet0 = &gmac0;
-		serial0 = &uart1;
-	};
-
 	chosen {
 		bootargs = "earlyprintk";
-		stdout-path = "serial0:115200n8";
+		stdout-path = "serial1:115200n8";
 	};
 
 	memory@0 {
-- 
2.25.1

