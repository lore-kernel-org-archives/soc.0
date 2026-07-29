Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C5547B40D
	for <soc@lists.linux.dev>; Wed, 29 Jul 2026 12:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326547; cv=fail; b=EtHKcNf/g2tmUBF8upFNjg1hIQl3NwhgU/+OvfGXNiJ0Y88DZb6WTOifJeyHZ4uMe5u2s7yTqUtg6tkHC0n0GeTvb+MKTo1eZHthYO3AayrinkwiTJ7LdrmFSPtqD1I4G+e6zAdeXY8ZJTX0RlXjJz+zA+JZU4c18/7LtOOx1es=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326547; c=relaxed/simple;
	bh=EB6ZUBny9UYOhWQpSdMBBhr06jWQ+TJosHIPtW04vNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qi0ex2TxOZrvW+MY6nVsm9VcCc+N6k8+v1cix+bTq1JvpJQWo5eowCreTSjd0GGbnf4RolkaDAgR+v0+db0tQyYr5yqoJK0x1zHlh3fP3SkD816Id9V2wSe4GFLSgbozD5QgRir3H+bQve1gh2/MdvyI1zFvDnILm7YE56Mevnc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix)
	id 22A1C1F00A3D; Wed, 29 Jul 2026 12:02:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.139
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1785326545;
	b=m/Y5B9+6De5BPynTIH9hCQ1j5UpLMsTZPstFQeIMAdINK7NKCccrJjmYRBJ/zdtKIqw3
	 f5hUrgigMRftoVuglhzMLyaTxOVhetq5d6TFH3diIB7VAbuvEux+DaXyiqtEwo+xFjQft
	 nc7mLbTRM2S1lHdGTgb6Vw4ubipaJofreU3QMMiMCophiUKS0TNwVU/dQR5qlZfjGqlb6
	 a3D4R0BQtCGoAfjqzrcx9nKfVztRGCLtc66Qmu9c/ETsCTF0gW8/E2oHFKHGyH69vyUOh
	 BVWLClAbmgiiBvVnIn1HGrI1nGRBGYAPEzuMjMcH4VUIXe3y8lB/T1GtfShMVRnEj3A==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785326545;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=LkH0DVfJfa+vAtypPa0g1aD+YwprGr+V/iYqpsomwew=;
	b=Y/Uqjga6N+bNNHBK9drl1LdcECh3j7HDIl9WQSz63ANBG2tgyXUjMEiaeWPP4N+6zPsi
	 lHCfbbOjacC/DIZ1HEP3dBTtOVe603NqN0OHQOAIX/wmCQDUf09gOcv0Q5SiM/Anv/dU4
	 KZm2yrYflxDgZ3D/LFIHoLOMMmT8WG+oLQwc3+cxJvnjYKWiuk/0NeYsVHhlQUvlUjtus
	 WTZeEAeWQsLXLEO92hkycjLZKHfZx6Zim5I8aTmNmTM2pv2dB4MbHoSP2wkJTgLlLbj5S
	 N4qobwEFXyg+QgYebK7b3CZkXCnBSWn0ovWq/fItN2CDyMY+gCFLYPyiYp9MI3Crx4Q==
ARC-Authentication-Results: i=2; smtp.kernel.org; dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.127.139
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023139.outbound.protection.outlook.com [52.101.127.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C24F11F000E9;
	Wed, 29 Jul 2026 12:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org C24F11F000E9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teFx5ydbtmtdbnJWLn7SJ3JGLKIGGhAtTcVt5G3RJQGyJpU55B1fodjThovbVsqQfHvgyRCcN52wHPK91jrgZ9ji7luNGB+R9Of9LE6Ow90KfJPnyQ+csTc0w5I0muKURJclf8LntFQDOJ/zxJrbKivfGlpEhrBcfle3u36NDsO6eiOYdrQO1v5D7w5zt+E1JDl5IbcAAXwRdwdhhCzEEi/3udFJpSup2/Hb7w946gdjxfba3dH+z95Rx1sZt1dozIDHb0/at5P+6HUDueHvoabWpNUdWNzhd/3feI0uncXXb4ak1Mp65lmDh0QA+jZ17ptvGY9jul3RpooZXMZovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LkH0DVfJfa+vAtypPa0g1aD+YwprGr+V/iYqpsomwew=;
 b=UqOvNDGrxGYzlngxCBLYAen+cuf+5petsO7XBq26cDqJPGYryAAxesGORGWaw01IFH9prxHRCUyZRYt9MhNnPrgDDwBxMH6H4sVieCsNCQKVJ6cN1eAG0S7wJi4wGAkHNnYlrUlTD2IKjozo6eggsv3yBfrKjCweRjvKvIIZsXjLy0n1FUXkemf7XBnG48UDzNIdZEsfeiyPg2F2rlz6pVN7NQmoBUPziVnolOOvr29V56Y1neVdxn7q5L8FlrT4JwRI/z9DOPUzeVakbG7ONauht+ozPiARGb4I+d1rq7V6czIFoYP9dlgicLs1hUrxnfKOq8tKVIK7JVBG9emJwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SGAP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::27) by
 KL1PR06MB5922.apcprd06.prod.outlook.com (2603:1096:820:d0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.12; Wed, 29 Jul 2026 12:02:18 +0000
Received: from SG2PEPF000B66CC.apcprd03.prod.outlook.com
 (2603:1096:4:b6:cafe::1b) by SGAP274CA0015.outlook.office365.com
 (2603:1096:4:b6::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 12:02:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG2PEPF000B66CC.mail.protection.outlook.com (10.167.240.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 12:02:17 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 42245427CEFE;
	Wed, 29 Jul 2026 20:02:17 +0800 (CST)
Date: Wed, 29 Jul 2026 20:02:16 +0800
From: Gary Yang <gary.yang@cixtech.com>
To: soc@kernel.org, arm@kernel.org, soc@lists.linux.dev
Cc: fugang.duan@cixtech.com, cix-kernel-upstream@cixtech.com,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] CIX dts changes for v7.3-rc1
Message-ID: <amnryOEOpK4PMmxS@gary-System-Product-Name>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CC:EE_|KL1PR06MB5922:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a1128c7-e48c-4462-5e30-08deed693cd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	atNi1uVNjJGAwH6IIhfcamcJijvRh8PokyFcBgmxqJR0FsAvtOQvlKR4gJKA4Eq1BL8KqBMrIaNV9TXJoGxZQZIw7cs4NHZTZ/F/SYh3y341YibJKXfbXRElbwUAWIhblFZ9/qxfQ9cCReHWCueJLZ/qYBXyaGulAKDeN7GJiQ04hxohSdqPaQDFeVt+O3WYP0iCdhCtgCVf9bRQRI2zSHpkPSeTFjuDw0sov35nj5DINzuGCN1k9UcVoUF3AkiGnSfW3kj4r4BgSuyrzXQNupRFnhhh7/aqDElB3b7WsHYiKTpWNe23PPheyfXXdWTkBycQBODTvkB6HDPLAolLQvJuodJSfDas5zuhHJWBd29SulA5ckeqI/ManwLicDZl54rTAJSkpwMU8TtDE0CpAhKKHtPkobMPJqBuocMAFh7ZfzbXoTFzHEbqX/AvR8BV8JecDv6Mmw8GKEg0G7dMMoCFwNodkWYf/c9nm3UOYXA3I4Pkkz1t44tLXdEUolroc6Tyf2eXuFRHQOvQ0rM+tCwIjbQirIUeUdRNsnnQ5hYuDUfuSJX67es1Z8LMXngcH5hWY5l4ESYQMfbQUa4b+dW4porH2+tSAu/PL5H13AkwcvekVJxHjk6kEH2hr7ljFbrblrqvd7VdJReXAS1p7SJ7tuAFPmmCNWrDHfY4RHkqSrvv/2bkSq6bAhJ4yTyjdhk0P3e1KuoSLir2deyu4w==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cAjm8aXsheXwOxwzhMUWD7Ut2uR+Js0p4KJFG6CXXHqAdobjtdZqn+9/+8SpDggEB2sl4Qk7ENTGV+dsOSekdZpnTwiO/3MzsAaVMQy3+9H5eqh1+/8Bxwk6+DGp//9sLAI9Yc5ZszH4TpTPEj1b4nhPoOBSMHFTpNaTrwnNQjH+y7TiPiXswg6Cjnt9d9Z1nq4bpZiRjRzYlyXNzFxvRuUDSMIo2Q7q0+PpSfmpsSndZdIa6iOZKtAXeAX0TgPaYpB0sHFgChqrEqpUTnePfI3d6D2MHvJW4LC+uGyjsVvcnXie8dYFgwKrnVkHYa3O0xzDqAhde+kmT9GMfspTGTsdCHJYuYI5mFTcezxm2SKmT/U/NjrQ8FyCbb3EAW/TmOe2pCfy9+0lXogepXU91PfxJ5lg8d+Pq3zOBoQeuNTHeW1VLY/XbEogu750gG6N
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 12:02:17.9247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a1128c7-e48c-4462-5e30-08deed693cd4
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG2PEPF000B66CC.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5922

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://github.com/cixtech/linux-mainline.git tags/cix-dt-v7.3-rc1

for you to fetch changes up to 23ef479b60e2da14d227ce488583ab31e3ea190c:

  arm64: dts: cix: add sky1 DMA-350 node with channel IRQ entries (2026-07-20 11:19:25 +0800)

----------------------------------------------------------------
dt: add DMA-350 support for Sky1

----------------------------------------------------------------
Jun Guo (1):
      arm64: dts: cix: add sky1 DMA-350 node with channel IRQ entries

 arch/arm64/boot/dts/cix/sky1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
