Return-Path: <SRS0=mpRk=HM=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20B6AC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:20:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A46FD64E7E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Feb 2021 17:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A46FD64E7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NcTsNjZKKC0Jj2ur7xApndrSBLCjI/aazurt/HRBtXw=; b=R3FMzxvn67qcYQAhOF6sBf/oE
	JaywleuwRVt5ktk7GO+B/ubgSrd1ZnAgMn3mMFOrQVSkXOzcwXBnw6vWsMp44nfLso60UXzXBp8rH
	+KcKIjrqr8NV/+X44LORjvF8niHFoxyLykLTSsg+f26FdeHtqzT3y+vVn1Oxe0fhd/p2Rl9Pju8pu
	t7+D65eSNUxnj7vcKS9oqSH3PKbUDm/jcy6/FziGWa/gA635rqDMh4BGNPy5jqbPnF69QWL3WakaO
	SEzb1tqmDeqDpagEQF1oERV/oXWhUHf8CajNy9ykedeULRqWjuEI1Kqm0mhyG6Hq9ptfRKAhItIZo
	6gi3knJaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9t97-00087t-5N; Wed, 10 Feb 2021 17:19:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9t8u-00084b-LV
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Feb 2021 17:19:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36E4164EC6;
 Wed, 10 Feb 2021 17:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612977547;
 bh=c/Ax+KU4DL5JozYwTOkjNe1K5hw5XVOa51fa//wHaxA=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J7twu9oruKBFHatLyOM8x1cg1lnIeAvQMkeWMxdW8Gi0yfefNN+W23FnELWHQr/Bf
 g+gKio7xoxnGayi6PvCzaLK5Ye47K22iBS19pc0cS85eW8xwL9jMNWVAM90ycSdPS4
 37/6A7MXJDyZQ79e+kW114NVT/eDjGFNLsj3JfuO1TqBtisAHbywEnFhi0ByomBzq0
 kDJ09W45kn6CALhspPGWbGJ5vpxDdgz0CiM2WZjwHvGaDGQ/mfTKEtkY12+CDnUY7Q
 piPSxgvbFeoHUy7E9Df7dkGbAsluPdKlM4dYb0ixz+lRyxGG0gKL09FoV7ta8raPh3
 y0dsd+DIAsFlA==
From: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org, soc@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: [RFT 05/11] arm64: dts: intel: socfpga_agilex: move timer out of soc
 node
Date: Wed, 10 Feb 2021 18:18:17 +0100
Message-ID: <20210210171823.333802-5-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210210171823.333802-1-krzk@kernel.org>
References: <20210210171823.333802-1-krzk@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_121908_847985_ADFA20C8 
X-CRM114-Status: GOOD (  11.99  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210210171817.O4EcrocMs2rfcrnPbN22GUMZK6JceOjeLAZRkGslRAs@z>

The ARM architected timer is part of ARM CPU design therefore by
convention it should not be inside the soc node.  This also fixes dtc
warning like:

    arch/arm64/boot/dts/intel/socfpga_agilex.dtsi:410.9-416.5:
        Warning (simple_bus_reg): /soc/timer: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 12b6d208e236..30dcf9978067 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -115,6 +115,15 @@ qspi_clk: qspi-clk {
 		};
 	};
 
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&intc>;
+		interrupts = <1 13 0xf08>,
+			     <1 14 0xf08>,
+			     <1 11 0xf08>,
+			     <1 10 0xf08>;
+	};
+
 	soc {
 		#address-cells = <1>;
 		#size-cells = <1>;
@@ -406,15 +415,6 @@ sysmgr: sysmgr@ffd12000 {
 			reg = <0xffd12000 0x500>;
 		};
 
-		/* Local timer */
-		timer {
-			compatible = "arm,armv8-timer";
-			interrupts = <1 13 0xf08>,
-				     <1 14 0xf08>,
-				     <1 11 0xf08>,
-				     <1 10 0xf08>;
-		};
-
 		timer0: timer0@ffc03000 {
 			compatible = "snps,dw-apb-timer";
 			interrupts = <0 113 4>;
-- 
2.25.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
