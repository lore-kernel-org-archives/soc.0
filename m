Return-Path: <SRS0=2sVo=C6=wiwynn.com=Delphine_CC_Chiu@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10502EB64DA
	for <soc@archiver.kernel.org>; Wed, 12 Jul 2023 07:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EEB41C433C9; Wed, 12 Jul 2023 07:38:14 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (mail-sgaapc01on2047.outbound.protection.outlook.com [40.107.215.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8A26FC433C8;
	Wed, 12 Jul 2023 07:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8A26FC433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tc3ZbXLSRomcssE9erEDik111eHQbLAbJZoVixxFn2DJArLZMtSeBRJ4gMNB32Bs0r/4bSNmbe/1h3VmADuFiyvGFnxe5hozzIAcXVmczPSpZslTVkWeQ3Ymy1aXyZxCFBi35+vDxEahUC1E1inym+WRqR6intJsPFqsE1J/0Za24NvijFmbS3cmlPi7z4RgEddp9cFvhVGL3sQVVezCb0VqC8/xNquDygjaqx3ut50v1au14caEC9FgimnKyW9Z1QdV+kroMiioOIHf30EE5v9LxL5FDNImqcYMsjTDb5Oa0H38gq7riU8Xpx8KutyZmrTuhUla98qK+aw2G8owDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvwKzWDypqFoyT/5pNg4W+cTRPm+3P1A9+KTXwD9dYc=;
 b=PX1G7NiNPOFo3QDdMt1eSedQINOxQCNoTN2inPEvw3Q3fJ2/sOOpBs1u7XiNM5ygaEsGBEJoa009ju11JCiKVf+BZoPbTeM7Jg8HWEuCZXcWi5Rp1b5aRsuMRXPaYQBLyrwL2l8FE2nSDeixjDcpD1wfsxkCvPflJTjQxk6S5TrOfgxQRQsZS1Gh9aHCNWzd4vCoglZazlBauafSFrIUsMTZ1JVfgnX/aaxex5LwvKAg4QN1rTFFZmUC2itJD0vRRiLCiwzifVt5hZzSt4H+ln5InBUZJdTQaNTaK4533ZZAmmoVIvijLqsqYUSKjRKP6EC3PMhuN9SE6tIY1kcyrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FvwKzWDypqFoyT/5pNg4W+cTRPm+3P1A9+KTXwD9dYc=;
 b=JS0rLzpCw51h2WlG6lPG57jExA9USLaGqvkSMpi7B+DbYTjgHNtiHnR1GxTyjpqNdDXDnPG8HpLpQ+A8FqZ2rbHeK8gweWfH1C9cORUZjX2GecoezgUMj7pI+otwMyAmePCNDGzKeioKXXcuJ3LwBK84ACsyJsWMNdD3Di4EhdP38QL2eyMhvdxT9wnCzyacLkZO8n6IhBrFNyCuCbXEk+g1oKTIyc+h/hIkQnQKqlylJ47qbzcVQwU7L0NbMyNw+/QGGfYZx/q5s+o/xOhO61bi8ehAfus4FBNejPAca+5KcaIfwZihKptkB03NfWKx9lqiBIloK0yafhQgOhYXyg==
Received: from SG3P274CA0023.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::35) by
 SEZPR04MB6705.apcprd04.prod.outlook.com (2603:1096:101:f3::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.20; Wed, 12 Jul 2023 07:38:06 +0000
Received: from HK3PEPF0000021C.apcprd03.prod.outlook.com
 (2603:1096:4:be:cafe::f5) by SG3P274CA0023.outlook.office365.com
 (2603:1096:4:be::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20 via Frontend
 Transport; Wed, 12 Jul 2023 07:38:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 HK3PEPF0000021C.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server id 15.20.6588.22 via Frontend Transport; Wed, 12 Jul 2023 07:38:04
 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>
List-Id: <soc.lore.kernel.org>
Cc: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: arm: aspeed: add Facebook Yosemite V4 board
Date: Wed, 12 Jul 2023 15:37:49 +0800
Message-Id: <20230712073752.54624-2-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230712073752.54624-1-Delphine_CC_Chiu@wiwynn.com>
References: <20230712073752.54624-1-Delphine_CC_Chiu@wiwynn.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021C:EE_|SEZPR04MB6705:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e78bad10-1d8f-4b5f-ad3a-08db82aaee0b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bwV+vCtsfnCRKG3UqVlCy38H9rQz7DohdBls88DT7BgPduqvho+64KVb7NPEbTGFXivNhDHqlYmgf0IyGZBr1wA6raa+KaWgDcEWc25UH2PRaz0CcXQjDR5myk7Jo11xdKa+c+iNg65IhiiyMaygk45QErigzPchLozppoIdVN+EaNpV0f4fGqslnqqqCzYwVcnVO1rLFv803GoRr3bf4I709RdposDFsg76HB6jHtbPSuSrNagSiRulsSem+UolpgW7Va71RBMF9kwskCojCwJ4aFaLFkr2s6wiM6Bx5UYU7GJtPufkxwQWN4yePxsPkwEnN2YUTua1J+FTrrv6ko96sQNBoPZ6LibCZGN43Kyq6XJxEy4tjS2fiADOv5lWFTqVVoNW1dOZ0HeZDGxA/BTY46DbWfvziXOeUOpXg8emZ5VhLRPIr9NI5c7NGUvuNnIclDrcH296fE/6gRMQimP38AlJtBIL850gNancKrGPeHMd2/vJo+atxsUU7MvGuWpIv8e4/EvhkczQj0Fbsrj1sFg1xWXr7SieUDQfsJS0OrX6NbcViJjL72ZEuUOu3h4ZvzQzKHQgNxWSynTFoQXUUUI3cjFzzz+Ow2YfIl5v9Hi7Mb9Gcq7FOXgmI5eN4uQy1MwXKtE7gBsLIPJAwGFGJGKKbqJu+Ie9TlwmkHtA/snvTosRjFp9Rrkwrgb1++ggdydPwlIoHP471E2lwA==
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230028)(6069001)(4636009)(376002)(396003)(346002)(136003)(39860400002)(47680400002)(451199021)(46966006)(36840700001)(336012)(9316004)(186003)(40480700001)(2616005)(956004)(110136005)(81166007)(54906003)(82740400003)(356005)(5660300002)(8936002)(6666004)(6486002)(8676002)(86362001)(478600001)(316002)(36860700001)(41300700001)(36736006)(2906002)(4326008)(70586007)(70206006)(4744005)(7416002)(1076003)(6506007)(26005)(6512007)(36756003)(47076005)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 07:38:04.9726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e78bad10-1d8f-4b5f-ad3a-08db82aaee0b
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	HK3PEPF0000021C.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR04MB6705

Document the new compatibles used on Facebook Yosemite V4.

Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
index e0eff4c05879..2ef6821e3648 100644
--- a/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
+++ b/Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
@@ -79,6 +79,7 @@ properties:
               - facebook,elbert-bmc
               - facebook,fuji-bmc
               - facebook,greatlakes-bmc
+              - facebook,yosemitev4-bmc
               - ibm,everest-bmc
               - ibm,rainier-bmc
               - ibm,tacoma-bmc
-- 
2.25.1

