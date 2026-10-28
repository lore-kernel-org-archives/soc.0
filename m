Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793216216;
	b=Ry9MF0qC/+dLd8pOickf953jOPvaZDVxQygPwxHc2P+kvkpRfemuZ748Ea8kPywAs7ag
	 jVV9VuIE8iY3nRd4rpxpjAUYsw6ZWOd8h/ouIxuHcz6A1WOA438yRtfYUYRZdeh6dKKEw
	 vlUB23a9/oxwzDe4EgXhMicVgfQVj/GMj0e8ockyaKLh5A60DIn3dRXkP32iDmFUJv0Hz
	 GWU7bB3Q2lSWQabZjd+JSLmXy+XlThY3tey4lm6TUMYgpGacheT+Z1U/r0ZsHwcLb755i
	 ehmH6DJ/xsQ7pmXoKf1Ns414gymE/GwjLUsN+moHLQ++pFrXyXqypY5iQLGqaZUW79g==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793216216;
	h=Received:Delivered-To:Received:DMARC-Filter:DKIM-Signature:Received:
	 Received:X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 Received:From:To:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yPMdXhrkVsDgU0CG3yAL/+E1FrHLSRjibkPMaHjchH8=;
	b=AqLbnUJUG+CkmVpD6LcF1aOtNTN9Qs77L9GwD26mRxJe3MCO3mIUCv1P3ukbwXZ8ghCW
	 pfqMkUlaogAxV90QOFjq0NiBZ8lwC3GArHQlFG2Yma3gST4OuTA/3trIOOkgMzRgZKNUt
	 d/utWXg6jnSldbmMikwvNNmwQfLAZGLy3MwicIzKgcYGSDDlzZLZbQDNexw9OOvhMaCXi
	 TJktnhzhTA7DISmXhBxhjqtL4OgLzrl8i0r1kzm3MMAf4Gu1fJ5ktZTHvZafbV/yoXiaA
	 YvysT9hLfOsQQ+xfRxLAjkydK7cIdjpBD/9v9K+PN7bV8bamFR71R/1QHrNvi+yPuFQ==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=JLr9VliM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E80606A31C
	for <soc@lists.linux.dev>; Wed, 28 Oct 2026 19:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=JLr9VliM
Received: by smtp.kernel.org (Postfix)
	id 16DF61F01829; Wed, 28 Oct 2026 19:36:56 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.91
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1793216216;
	b=rKSvbInCwRM2FkKPhios9p3XKIaSAkoIAeso1HvaS1ZYi1CrnJVyEdZYlxCV48uXs08r
	 zfLC03cGm6jQsRGU2k5BFb7CuZch7avdyMIyZE19FXBHWgaVJDbIPQfxXTzLXpQiO0jwu
	 CesattTcmsMTqH2oEQa6GZE09MbzZl7j0BSa4XQEFeK83/CWFsEcRPsnYC+zHad3y3CSI
	 GAKpyqkbOSgbw9XgM2p0ufkKT2SyW8UqT/Nuy6g0GUFuQZWNstEK5miuuH3UWDYHsMli0
	 NTbsOlsBVIspY88zfTwbWVETDXBQaxYgpTyJBrXfatHdo01LJwOO9Os7V2qJXiM5xJQ==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793216216;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 From:To:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=yPMdXhrkVsDgU0CG3yAL/+E1FrHLSRjibkPMaHjchH8=;
	b=H9YKfqMgnG/TT6aofun4zxPDy6CSy8nIB5WB5kGmBGXWXK5d6JfNQqP15OYFfRMUwdc2
	 jczI+IKJJLbNasU3DoQSp42eKfEWhk4TAQ80puX99eVHQ8FARCbVoHOQU9y188ILN65BR
	 luAgKVJIu5OAXL6sh+J6vfro4iG2oaXG2WT3q1wpAMbYyvinYFP/wtyx7cTmFwLmTSbXI
	 KI40fbTd5XBhkCJ3v9KRN84Xy4PX1zXKDCngMe8tqvVGsboIxbm96HZZ5L7fJvr6eNmQE
	 84uvQySD+pTu6GCePInaRsfQ+pC1yD/LX5pVjMvnfeF6rD5235w19mdhPXgS1QccyVA==
ARC-Authentication-Results: i=2; smtp.kernel.org; 
	dkim=pass header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=JLr9VliM;
	dmarc=none header.from=axiado.com;
	spf=pass smtp.mailfrom=axiado.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.195.91
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11022091.outbound.protection.outlook.com [40.93.195.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4997E1F01825
	for <soc@kernel.org>; Wed, 28 Oct 2026 19:36:54 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=axiado.com header.i=@axiado.com header.a=rsa-sha256 header.s=selector1 header.b=JLr9VliM
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4997E1F01825
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=axiado.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=axiado.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fq7UpYFZtd916UTWmYd5Z/lWK+m4XdUSIC2kXgq0FK20EeZaC8c5v70Odpzl4hNUs3q2fzDbgOF+qPGkPoNti2rIgIap/4JS6f0vOEGkB6ehuzxzFQTAzs2UxzucEzZ0GIcFr+g+vkK2UzBW6RoaSWnX2XzOdaPUQRqztKg+Vy8P7rvuWdLJifkWQQU/+BATGnqag66cLUFIb+UsRhgz+3o2UfNVmNyvglRDE8FCo58cfNCUHCgh887arNXv/ssmnk/NbwJjPWMM1S7UQm0GJ4vYjR1R2O6UsT8XKMhpd6i0I5qFDRJbyFjeyi2Pi3lnJK91sbH5xL1oiTdfAksD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yPMdXhrkVsDgU0CG3yAL/+E1FrHLSRjibkPMaHjchH8=;
 b=X0yRaCjDtkNvVWL4tSv14HTgxjlQR8hl7n9P3OO3mcha/hQy2GQvyQkxq9voAQ1BS0YI4mmuCjNikYNjZ2I93U08G5ZPg5tpVXmLBn1ClKn4+hyzcJs+9r5LvPCvhnW3jGD04bFBCEGD0+QaDYBt+YivmpQq82VcDCTYSGV+EBm9O9cGMsAKrPAAFdPfPDH5wdcqkLn9RD/EX5CgpauymxZc9HypP/QDuOBYrjWSyZlkTdcGCrUmX1O0/p8iNT/lQl2nESIP3lIqjfEmuXHUakadEPZS2zEIh63tZwoj6G7P75C/iimTtcosL9+FtlzpgWuIbIlDCi0dS+XeahjCfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 64.62.143.114) smtp.rcpttodomain=kernel.org smtp.mailfrom=axiado.com;
 dmarc=none action=none header.from=axiado.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axiado.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPMdXhrkVsDgU0CG3yAL/+E1FrHLSRjibkPMaHjchH8=;
 b=JLr9VliMIwNO35rTZZ3O6+Xjg1yTGU9ta35j6aKR5osGgGb3McIS0qLR9lWVtC5fcm9dWU0evgUk60IZ9COekQdQ/ii17wyc6gRaFDHTFk4r6PF5xa+ktGa1ftOFd8i/UN0HC0ZhxTnI7u793DV/jw6t+ON8FGd6KPNcRAytWX+20cfrd2Y9GGaUjSB7XKt22j6CbvzQmFyvGwL0jNq+G5iP4MuYZOzLwUDlRED3fp9fOoqHxp5PbFyUZ34lkeFyEgpox0eU4boNxwJ9T/IbcjdO9es6Rc8xZcuxBCmNDq4pid0j11q1fDvAr/wfPNZ8gdLuquHbM7Yn7aqPWgP1Bg==
Received: from CH0PR03CA0296.namprd03.prod.outlook.com (2603:10b6:610:e6::31)
 by CH3PR18MB5891.namprd18.prod.outlook.com (2603:10b6:610:1d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Wed, 28 Oct
 2026 19:36:49 +0000
Received: from CH01EPF000BE94E.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::9a) by CH0PR03CA0296.outlook.office365.com
 (2603:10b6:610:e6::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 19:36:49 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 64.62.143.114) smtp.mailfrom=axiado.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axiado.com;
Received-SPF: Fail (protection.outlook.com: domain of axiado.com does not
 designate 64.62.143.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=64.62.143.114; helo=smtp.corp.axiado.com;
Received: from smtp.corp.axiado.com (64.62.143.114) by
 CH01EPF000BE94E.mail.protection.outlook.com (10.167.244.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.4
 via Frontend Transport; Wed, 28 Oct 2026 19:36:48 +0000
Received: from http://axiado.com (unknown [10.14.1.22])
	by smtp.corp.axiado.com (Postfix) with ESMTPS id 4FAF04186B53;
	Wed, 28 Oct 2026 12:36:48 -0700 (PDT)
From: Tzu-Hao Wei <twei@axiado.com>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Axiado DT updates for v7.4
Date: Wed, 28 Oct 2026 12:36:48 -0700
Message-Id: <20261028193648.73841-1-twei@axiado.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE94E:EE_|CH3PR18MB5891:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ec7b5e13-f087-4f3c-3293-08df352acf26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|34020700016|42112799006|82310400026|23010399003|36860700016|376014|1800799024|18002099003|261028144727099003|261026140227099003|13003099007|10067099003|261026121527099003|261009223027099003|56012099006|261021121427099003|261022105027099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	TX08SXCrv7OwyXoqBHVfQsrLz+J4NuE1M2NWrgCOIailQFXO/hcrbdHlMc5UJJ5nzKE7TQyTRlf3MfwbqoJwpXxJ/MFISrky68I7itU9dx8KQgbcZNL9ALoztY7wUOr+INv/zsKqfWLhAkCPhYBaqkRBvWmRDoyI1fMu2ID11UPNqvkgBkIPHjjw9SvZIt9d3hsVWclTDgkvd5pdxg0u9N2CTB4wJNC3g8u4XWzJAQ9imXLsjOLq7T2cWA+eyNQBEkS/cr/sHCNbxuQ7T6dzKscWvnUPSxGDWm+v7PVLEwC+M67OQ8KLevMOCr0RgscY49Fn+YtLe5RBWDxROe1QVtD8Sz/y64XbDb2K4+ljuupPE/0cqORgOWWPksI34+iViAvIEtcA0O8AHOR0i8cNv/N3gKUbj9bS8WldHxP4BKqfQifIsQSg/Vvjf3XKv2kGxtN3Sg1iPr5bjk8lPQcniXynbNsnWadHdjJ0R+OjLzCGuxcCDBSULSqiE+xhVaJx+9sWR0fE4QtW6+fr9SzGQZtPxjF5KoDvc0c2yhapovyjsqMZZ7KRYz7aIjTaHRFLDFxW45ofp73GFIajPOEho1V+v+8coyqMDzNZoDDw9V+tlF82Bq0TLrCWFQ4UNeTmvPqO11n+NeAJ8DgHcETWPpvWiUFK56vdNzZX+F2hHqvk7r0WS/K2IQwsC98vJ9W0PPn9Fp7VEkbgolvsnqxfgQ==
X-Forefront-Antispam-Report:
	CIP:64.62.143.114;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtp.corp.axiado.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(34020700016)(42112799006)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(18002099003)(261028144727099003)(261026140227099003)(13003099007)(10067099003)(261026121527099003)(261009223027099003)(56012099006)(261021121427099003)(261022105027099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2HymePvVl4i20e+SpK08vfnY/tAdg3hriu/m1BDn9sosF+osrEz7Gribs7oR5ONpQG3jJR90Cw+y4zImqYce2TYgfZjqRTvQ1by9O34AtVnYJI/6ulAcbJC4WSUg7GRTo7PreS+UwRUg+OH6hGRpdDYFf6VzESZ33BhrDAnQDYk/iqRw5Skuqqr5/Oy1K4J3hZGHe3mTlgWXSzNlg4Ums249FvVU9QUbu+n48UwKcS0Xc3kn3/DCd1QYqAcL0a/dg938HkdZ+lmXV2/26x6gR8kUGPQLMpifqDT87oIhqym8Fy8dk1wcD5mCL6qghmPIIZL6ZGGxLgtZX/if+xCEP7NovM69HigLIgrNZTfWsFgFXbszEUW4MrmJ6pm3QHp3VkR4BMpyCTcZQ4pbUrxl/pXGgAthCSQdPVYxJ/tVNslepRpalr7q5utrI/kOzL0q
X-OriginatorOrg: axiado.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 19:36:48.8797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec7b5e13-f087-4f3c-3293-08df352acf26
X-MS-Exchange-CrossTenant-Id: ff2db17c-4338-408e-9036-2dee8e3e17d7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=ff2db17c-4338-408e-9036-2dee8e3e17d7;Ip=[64.62.143.114];Helo=[smtp.corp.axiado.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE94E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR18MB5891

Hi SoC maintainers,

Please pull the following Axiado Devicetree updates for v7.4.

This pull request includes:
  Initial Devicetree support for the AX3005 SoC and evaluation board.
  AX3005 EVK compatible string in the Axiado board binding.
  Minor hexadecimal formatting cleanup in the AX3000 Devicetree.

Best regards,
TH

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://github.com/axiado/linux-axiado-dev tags/axiado-soc-for-7.4

for you to fetch changes up to e728a5b8d68e4b567ea9420667450456121136d0:

  arm64: dts: axiado: Add initial support for AX3005 SoC and eval board (2026-10-27 12:25:28 -0700)

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: axiado: Use lowercase hex

Swark Yang (2):
      dt-bindings: arm: axiado: add AX3005 EVK
      arm64: dts: axiado: Add initial support for AX3005 SoC and eval board

 Documentation/devicetree/bindings/arm/axiado.yaml |   6 +
 arch/arm64/boot/dts/axiado/Makefile               |   1 +
 arch/arm64/boot/dts/axiado/ax3000.dtsi            |   2 +-
 arch/arm64/boot/dts/axiado/ax3005-evk.dts         | 327 +++++++++
 arch/arm64/boot/dts/axiado/ax3005.dtsi            | 844 ++++++++++++++++++++++
 5 files changed, 1179 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/axiado/ax3005-evk.dts
 create mode 100644 arch/arm64/boot/dts/axiado/ax3005.dtsi
