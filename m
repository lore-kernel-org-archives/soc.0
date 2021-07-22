Return-Path: <SRS0=PaLb=MO=quicinc.com=quic_vamslank@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02866C4338F
	for <soc@archiver.kernel.org>; Thu, 22 Jul 2021 21:16:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D6F8B60EB5; Thu, 22 Jul 2021 21:16:21 +0000 (UTC)
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
	(using TLSv1.2 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 985B960C41;
	Thu, 22 Jul 2021 21:16:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 985B960C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=quicinc.com
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1626988581; x=1658524581;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MVI8KZShZuixsP4t0NwyWEs7cc53l61P3hxD+woWL70=;
  b=MBe/3edYuo8/bHJ+jP0s3T5xIru04byB+r+2HM78RFgCEINwFLLpml14
   L2Pe4fEXX12FSeFwl0xX1xIqGjwfYPFG+yu5nP1GsguPOB5l1XKj30M4H
   dIsVxKH0eBRicz9udaBZ0vQQG0KZUUczUvjG67Z+semum7WbwKBcwfcq/
   U=;
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 22 Jul 2021 14:16:21 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg04-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 22 Jul 2021 14:16:20 -0700
Received: from vamslank1-linux.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Thu, 22 Jul 2021 14:16:20 -0700
From: <quic_vamslank@quicinc.com>
List-Id: <soc.lore.kernel.org>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <olof@lixom.net>,
	<soc@kernel.org>, <linus.walleij@linaro.org>, <sboyd@codeaurora.org>,
	<robh+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-gpio@vger.kernel.org>, "Vamsi Krishna
 Lanka" <quic_vamslank@quicinc.com>
Subject: [PATCH v2 0/3] Add devicetree support for SDX65 Modem and MTP 
Date: Thu, 22 Jul 2021 14:16:00 -0700
Message-ID: <cover.1626987430.git.quic_vamslank@quicinc.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)

From: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>

Hello,

Changes from v1:
 - Addressed Bjorn's comments 

This series adds devicetree support for Qualcomm SDX65 platform and MTP
board. This series functionally depends on Add Pdc, GCC and RPMh Clock support
series [1] and Add pinctrl support for SDX65 [2] which are under review.

With this current devicetree support, the MTP can boot into initramfs
shell.

Thanks,
Vamsi

Vamsi krishna Lanka (3):
  dt-bindings: arm: qcom: Document SDX65 platform and boards
  ARM: dts: qcom: Add SDX65 platform and MTP board support
  ARM: dts: qcom: sdx65: Add pincontrol node

 .../devicetree/bindings/arm/qcom.yaml         |   6 +
 arch/arm/boot/dts/Makefile                    |   3 +-
 arch/arm/boot/dts/qcom-sdx65-mtp.dts          |  25 +++
 arch/arm/boot/dts/qcom-sdx65.dtsi             | 210 ++++++++++++++++++
 4 files changed, 243 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/qcom-sdx65-mtp.dts
 create mode 100644 arch/arm/boot/dts/qcom-sdx65.dtsi

-- 
2.32.0

