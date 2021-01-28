Return-Path: <SRS0=ZyEH=G7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3ABC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 07:59:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55D5964DD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Jan 2021 07:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55D5964DD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=me.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZcBEzmAaZzf4NHz4ygMJlSmiKk7/Rl7lTdBtwkOi7+o=; b=wvmBpjGXt8zyF5zUPbHHIY6XYg
	iW7UWlAKQpobGnaVPt3i8akOhCj0FLdBGafNX9ftRX57ra65o4PhtcgQpBOUQQJg9pTjpat1Szxu7
	2AKWozXfg/64nMgPDkwMQRP/yshaAHchZ5TqzNjFW/+EELbkC6UwSKFeRYSw2dKo7DkDINmYJdmHM
	fMVvOAf6aGB4EdCqLCUERutqYPczUEfDOehN0j0VPZhIRakQstXBxMt+QxwP6folAkGJYJK/odVSl
	akErYz61ayfI3JFu6KNJHPxQaZ0W4tm6IYpMIWOxuC3YYZagjXKPNggPsD5HrTns/fejzPOvW3WZk
	Jex4V6ew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l52C3-0005Q7-9M; Thu, 28 Jan 2021 07:58:19 +0000
Received: from st43p00im-ztbu10073701.me.com ([17.58.63.183])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l52C0-0005OV-Oc
 for linux-arm-kernel@lists.infradead.org; Thu, 28 Jan 2021 07:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1611820691; bh=LIfpvi/CeAZsNwLDcOcpd47eJbyY1m6zbqe5JJoe9sU=;
 h=From:To:Subject:Date:Message-Id;
 b=z4xoQzQmFfGosBgPnU500zNFp04pgs2MRBqSp392pK3Mh7eOMXSUyMKge7Zg3wAUu
 CcBSTGTR2HdL37kn7WQfocE4zTaPKkMDuojeOVFUebRuAC8wr3LNODbE2GK08xLt2R
 Auy2T09DIXINGBmcORvY/39RkwsFt5FJo5sZJNuVJi77Mh+XromKE2YvAq/Yam5zhM
 oF0y5BGP6UAKFZYjNtL4nnvMghCpcJrsUAaCKrQU5xMJea9QZWby+5tOUIPcYxAF0z
 BWCL5SmjZXvrUjHhz507pu1f5NQXYNd+ljFE3DQA7Od/gS7mq99YXXXzEvhznfzqFl
 Vh+CRO7tLuRFw==
Received: from localhost (101.220.150.77.rev.sfr.net [77.150.220.101])
 by st43p00im-ztbu10073701.me.com (Postfix) with ESMTPSA id 8477F4C040A;
 Thu, 28 Jan 2021 07:58:09 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: sti: add the spinor controller node within
 stih407-family
Date: Thu, 28 Jan 2021 08:58:06 +0100
Message-Id: <20210128075806.10318-1-avolmat@me.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-28_02:2021-01-27,
 2021-01-28 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-2006250000 definitions=main-2101280039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_025816_849941_FD2DE0B0 
X-CRM114-Status: GOOD (  12.79  )
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
Cc: avolmat@me.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

add the spinor controller node within stih407-family.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 arch/arm/boot/dts/stih407-family.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 23a1746f3baa..21f3347a91d6 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -616,6 +616,21 @@
 			st,lpc-mode = <ST_LPC_MODE_CLKSRC>;
 		};
 
+		spifsm: spifsm@9022000{
+			compatible = "st,spi-fsm";
+			reg = <0x9022000 0x1000>;
+			reg-names = "spi-fsm";
+			clocks = <&clk_s_c0_flexgen CLK_FLASH_PROMIP>;
+			clock-names = "emi_clk";
+			pinctrl-names = "default";
+			pinctrl-0 = <&pinctrl_fsm>;
+			st,syscfg = <&syscfg_core>;
+			st,boot-device-reg = <0x8c4>;
+			st,boot-device-spi = <0x68>;
+
+			status = "disabled";
+		};
+
 		sata0: sata@9b20000 {
 			compatible = "st,ahci";
 			reg = <0x9b20000 0x1000>;
-- 
2.17.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
