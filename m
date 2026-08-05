Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F665397E89
	for <soc@lists.linux.dev>; Wed,  5 Aug 2026 14:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785940693; cv=fail; b=IvU60HMErZpCJtCmwQE9v6zRYRnbVHsDMwAJe45IFQjt6/2AhldI8wGzdZpAMXLO0XYXhtV6HzInjBI4LJ6I7ws4/SjPvAKMGv60mYxo0WkoevusIg1DG5WLMRbZ2OsuZKL3xpH+23fEI8RdVrIuqFAzpulxVKc+cG8IZ7KiWpw=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785940693; c=relaxed/simple;
	bh=dwz8wVM+AdUTLgkcw1coCy9BSAR3iS6IxX2QURxdFXg=;
	h=Date:From:To:CC:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CFpiJrg1oQOoAzrC8mIL2aUTbhV8riD+Lbw67k0vm7UedSsDvPYNPcRIyzw6Pq+4f3ukfzrHl9kTHn3t2rGCRTsYh8AHM32gn60JuMd6zwiR85P3R3O79/LMK3PNFSiP1psnXWDBJK5tj7C4/scUXyk84HUTrnZfN24lftGmd9M=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=L1qXLhaw; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=XeDZxL6g; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="L1qXLhaw";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="XeDZxL6g"
Received: by smtp.kernel.org (Postfix)
	id 10F371F00A3A; Wed,  5 Aug 2026 14:38:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1785940692;
	b=hzFcVnuOsxc21RByjdy5/wgiaNuTMNymX6WI2Qy4uECOh9agTlI1D8JYeCyvLLeN4Ms3
	 igjP38h5tnXbNOuV92ct/rEzBWbZMLoJ2KJ6Wj3o+ieLlZgvti1c0ToKUUmlgoiGpzYGb
	 qDBF03X26Cn6mQPgI+WLEboy9nmPkKDESF0RMArM3D1TUmBFVvRhEMpjpxmBmzMAep6U5
	 SizAUO6GJcCANIf/CegZHJceRL5vrLk2Tyto9GjsS+u4mQR/FZl5glKGpucc+HKrLu6DA
	 3WlV3ES2oLUgN5jVJRmvwRjitXzH2rCtoGfwctMS9OLD6qIZaV502zzMJ6/kTBwfbFw==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1785940692;
	h=DMARC-Filter:Received:DKIM-Signature:Received:DKIM-Signature:
	 Received:Received:X-MS-Exchange-Authentication-Results:Received-SPF:
	 Received:Received:Received:Received:Received:Date:From:To:CC:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 X-C2ProcessedOrg:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-LD-Processed:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9FRHPO+BmX4UJCmN4Tc3PwSNcypPY/NF6MBIVJrXSpI=;
	b=1ylyOfrZ4fc7ZAx9opgo4llVEaBKz/x0CGAAi9mNfRhYJjxJJnbToR8n4LM2zg6sbIqX
	 pK0L/86MHr544gq5n3N2TRZKEW/uSknwv2atQC+GUVuZO6Kd9k3aPdTFaRENUgB6LHfr+
	 gy288F2CBLAJtQ1dDUEUdnMQTe/yxlVzb7mEaOUg3R4bntRx92IJNifv3jnpMJpqddTC3
	 CJG1vAViE4FO8vr1Otfo4SEC2urGNxMm9cqWMIRxvkeW4d9t5+DtqOWIOTpM+qVFjSUKq
	 dRxLDDDwsJ7lGHnSmO9C6G7Sxd7nGnR2i2IIeGhTs7ciei/tVrAe3PqwVCrd6H+sBDw==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=L1qXLhaw;
	dkim=pass header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=selector1 header.b=XeDZxL6g;
	dmarc=pass header.from=ti.com;
	spf=pass smtp.mailfrom=ti.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=148.163.150.75
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B7401F000E9;
	Wed,  5 Aug 2026 14:38:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=proofpoint-05-2026 header.b=L1qXLhaw;
	dkim=pass (1024-bit key, unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=selector1 header.b=XeDZxL6g
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 5B7401F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 675BxjmK1269776;
	Wed, 5 Aug 2026 09:38:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	proofpoint-05-2026; bh=9FRHPO+BmX4UJCmN4Tc3PwSNcypPY/NF6MBIVJrXS
	pI=; b=L1qXLhawM66DcKq0eAycGa4G8x+hb0T6+lbGwe1WqH+1UVDMJtBUd081P
	F8ICxlVpp3Xh33cN+5R+jcrUvtuR+q2CdVnkWgeBVB0DlxzvoVsGSPfldiMlyiKi
	YVefdceKTpA5nGZY/2bZRdbcLgzEWer1OnnfVyDjyJBnqyydXHXUOAT0+Nwb6xgr
	LzQBph6GkY0KM0+8ZC12/llj3AtHsaM35bR4XQwdWpW0/KAVnDouEirOtPHITSJh
	VwzZziPi2L6hC7tFYt9ZDLBIFtYteJ3d9pc65CidcZMKhuVLUA7lGulF97audF3B
	U9gNqStJCULnx3JmYmZgvw514rkgQ==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012019.outbound.protection.outlook.com [40.107.200.19])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fv434sar2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 05 Aug 2026 09:38:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKF+4tRHsSR1CbmEHZvgLwdq+IOSOao4qRBQoXVRUbyTxjDebHjAeExKwgAMd+X889GCkACwRPXx8PEVfaD6Qc6HDd2+6eQ1cDpOHqI5DcEOVYjpcseN/OS3iiminqEo2A0qkyzj/Fg5FPKn2ejMpl6orLW03wmvlp4sVxnV+NE8/rRjQ8vX7aFVHcrKZrUdgZRHpQhXL/bwPAyO0sL6h2vxo+eyPpJEL7qqd9IIRxBTxAsSLWVqrqbY8u6LybwUPcYvfQuST4Qnbz0b3JMWAoT5rTnk/p/yRU8PQ7Par6lfuZaYYveBZZnoc/fTNA2Jhx+SiNuQ/G8wc300/GR6mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9FRHPO+BmX4UJCmN4Tc3PwSNcypPY/NF6MBIVJrXSpI=;
 b=xAQrp0Xq6Tv8L0SXY2Lhbk3769KWO/ZAswznpS7SXQsrryncCiQ/aA2OF3bFhyQUvjTgqDzhSMjgctL+Nbne5/XEco8skq4zi1JlvuMQMAbty20qcyNwFfDGtB+uC54eUYrCxI6bpkKp3W7+kuoRonK9J7LncH5ISBtZHNvNaG0lW/tjnZKLo0vVwt9pa8IzhQoDiMY/pJ40cFK5oQrVEMvhg4eshLZwXXwSlfZSUXMiI4Up3i2+aVV8+POotvptdDvEsgzw4zZ9MCx1z/8wzSb5JuNNIkvj+8fmmyAhxStO0kA8rs9GPff9+8mpnl+psWWv8WWmpz096RzoGzrndg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=atomide.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9FRHPO+BmX4UJCmN4Tc3PwSNcypPY/NF6MBIVJrXSpI=;
 b=XeDZxL6gAV6PjrjOD/hTfsoaNnlGK+Ujr3cB6AeR1xNSsTH3sAGb0BrnBXuFFbRFghMsmDfT9LCti4qFb2ozDdCRb3GTgrI7guQMTeGB3p+aRWHCeOlyqsuilvb15mlE6nqtc/YZq66UuscvXr4ktvAwLlllptvVY7bmnlqUvjk=
Received: from PH7P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::7)
 by PH0PR10MB5893.namprd10.prod.outlook.com (2603:10b6:510:149::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Wed, 5 Aug
 2026 14:37:54 +0000
Received: from CY4PEPF0000EDD1.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::10) by PH7P221CA0001.outlook.office365.com
 (2603:10b6:510:32a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Wed, 5
 Aug 2026 14:37:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EDD1.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 5 Aug 2026 14:37:53 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 09:37:17 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 5 Aug
 2026 09:37:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 5 Aug 2026 09:37:17 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 675EbG5p1573533;
	Wed, 5 Aug 2026 09:37:16 -0500
Date: Wed, 5 Aug 2026 09:37:16 -0500
From: Nishanth Menon <nm@ti.com>
To: SoC <soc@kernel.org>, <arm@kernel.org>
CC: SoC list <soc@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        "Tony Lindgren" <tony@atomide.com>
Subject: [GIT PULL] soc: ti: Driver updates for v7.3
Message-ID: <20260805143716.gbr73pwvengxycr2@cabbage>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="53qpsf576eiodqg7"
Content-Disposition: inline
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD1:EE_|PH0PR10MB5893:EE_
X-MS-Office365-Filtering-Correlation-Id: 930390c4-0e3b-4b19-5eca-08def2ff21dc
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|13003099007|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZaaUq43HmxbAl6vDAYTSlxOSfeofA+wKoFxZzczRJ8pmhZf2wucDGVIMj6zBRMluXzVVXkeTc+1njkUGb2V7qVnOIWfQpg2ZwI/xB5UN5kTrL8UxjRMq9rYS3w7vQlF/01f/Oy4v/rlpkKmhXni9OzxvBT3VoBzBKHxzbDE2j0j0+a7GEgRqa1lH4mpRPSjGS8++oaoWZ1ipZu0RIPr68pidtlR0eJl+caUan1s5ytUVtzIw4JUmBAZmOiDPCoyRSizPZH+J4lfqLEduGJX+jZ2wDHBI53P47JPlew1ORgNz3AfY71cAdsQXoLgin42QGAdvs3Hingi4mRl1iEs6CZUBYOu7OEveWJsTxt3slGKRgiBLHxMy4gMN0seDTO+/fRvDcMdoQltSAJPozyCmk9+3QgOfyRCMHpZYAp1/ysxT5tRGfaSfpesBONpA0G6pKPai+afr2YatkfWp4CCDDEM8FEBNMr/x8uj6B5atGju1FSWKbhPDcZwyaTuf65gGqVX0zP99M7Fvi84DJddwFfWZSdD//aM/nNCYkFkBFoMQEvqHHmFz8J7vZn8ZDxFnpHC045beG2WXvmFCdk8XjKLrZoLjBffQe2MweSoSAK4kg9Bd1/N754/rGEJjXjkJRK4bfRfRpSmVptjhJbhjHNaK8QaObmnyGdT4UHvdWjy5MSYucSw1s0itsBqVtlYYnT38KgbjrbkqQ4o8KLLbQg==
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(13003099007)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KGq+BmUqCQpIDIHL9kTwoJHFCbp33ljgQWE+4fNfV71VWBJ/HRq5JpG4+5E3lozaGi38RdBeKkXOaCoigNGyh+yybq8BVxhBiLruNq1I6CKAl3fDTDwIq+cdMchi1CNuPOi7JjwT1e9E62Sq24dMKzgSPzMNukkgPI70P0HwHKvsFB1/0dn7eeJN7oQO36H4DkARFDGsom3H3qod3H4kDltVPcvMJa4RMYoIDwKx5pD7LVSB309WQGP8n7t0KO75YwaJrWdo6zT2KdAezgz22HKgjlMEKCQmSwMBkfd8N7BqqvzqXm7JgvC8pu1ujEUHg6JtE2jr6lhj5+VzP89ST1zB+TYNrZj7PekxSZW32QxwSoPc5lWMaBLYDni90jRAw5PSIGzxYCmateDboZX5aPXpTZTiBSw3ralw/VWviIhrlrYEj9eWQBO9TIJMKh0f
X-Exchange-RoutingPolicyChecked:
	a87wnCwvmV6VIJZsVJAMOV9sCGmCM3NB1vPQBMeceXEQNOEoDukn3kyz0tE8A5TyCRnDDKw4K/MSqvtqjVFF/Po5jR4cF4BXmq44GaxVYXmi7F9hqEwAY2fQSyEy+HF7MznluwkU5qz9JM8POYDGEfIWYwXUA4TcT8DZBZB6gK8VtFWXvq0zYhMv+KIu42fprIZ0/5Q46/73lic/1MNy9FIMir2Fp309O7KwfvuQ/syZrpRMwmX7+hlV1mLM2HGKLCZTrBLXveBuqWgKietJ0+1QRe1/qtbYtJEFhszgVayRUS5Wg0oDpARnGDWuwPktg+3Zr6hYRiRp/3i3zTwxRA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 14:37:53.0931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 930390c4-0e3b-4b19-5eca-08def2ff21dc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5893
X-Authority-Analysis: v=2.4 cv=IbG3n2qa c=1 sm=1 tr=0 ts=6a734acf cx=c_pps
 a=jJxBgQE0Gv9vBhouG1T1Tg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8 a=5nXWgFptBgo4Z40EvlQA:9 a=CjuIK1q_8ugA:10
 a=YU97IdcIghu6H5AM4kMA:9 a=FfaGCDsud1wA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExOCBTYWx0ZWRfX5TJ99KtzO3Za
 oveYqq6vJ+diefplgv8gyHTIiZRMC8Jsv/MTynE8CpI6NrNrZn1pqF4mPhFGT/DfUjpJm9wZbEt
 NISSwFNj8i2xLmr5Vr1mt8NjsCZPnTQ=
X-Proofpoint-GUID: wvoKbVmAwKipyjyxHQYnj8Bbmpj85WGQ
X-Proofpoint-ORIG-GUID: wvoKbVmAwKipyjyxHQYnj8Bbmpj85WGQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExOCBTYWx0ZWRfX+AKgC4XbhmXK
 Q3Yj56EDh7DRgGGdmySWw6Y94Xf5ZQbVJNvlyFDMvsG1SzHW4DgW5NXwCaxnS0cV3nuMvrvSGTi
 O49tCe9zxbuy0DGFI9pNWFRiMFQixrI6Y6ml9WQ1y3Gq8WV21BpPa/zYNjbHkJZO5zNOwFXU+uU
 xqwXUkoyZilpEeT/KZxip1opVNFCXsGVNmWI5aWctNfx2ezPM48yus4y1lKaRNbGdh/LWrbcmqB
 K5I4e3dzvrjPD74YiEBBbv5URxE9+LXv06i3pjkhRi4SKatOeu9XD+CpwgoswGKUCWREvqgFPQZ
 vIf8ee6XmGpMiL9xR1eILqgSsfK0pYL60NetyxvMkO3fN04tCPDE2ZhZE01FXIOz+MYRb6Ir7Jm
 5iDIVPcM8YHBC20eclR+XzHpbpAUgduNTz5GPtwBLOZZO2Bj9EnqLcUCv+aSLEGisLMPqzhL7ty
 Qbsv40Mq+RhlC+S3e4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011 spamscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050118

--53qpsf576eiodqg7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Please pull

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git tags/ti-driv=
er-soc-for-v7.3

for you to fetch changes up to dce7afe3efe485a99200a59dc78738539cbd133f:

  soc: ti: wkup_m3_ipc: Remove redundant dev_err() (2026-07-24 11:35:08 -05=
00)

----------------------------------------------------------------
TI SoC driver updates for v7.3

Minor bug fixes and cleanups across TI SoC and firmware drivers:

- firmware: ti_sci: Fix a resource leak by undoing list publication when
  device populate fails, ensuring proper cleanup on error paths
- soc: ti: knav_qmss: Remove debugfs file on teardown to avoid stale
  entries and potential use-after-free scenarios
- soc: ti: wkup_m3_ipc: Remove redundant dev_err() call to avoid
  duplicate error reporting

----------------------------------------------------------------
Pan Chuang (1):
      soc: ti: wkup_m3_ipc: Remove redundant dev_err()

Pengpeng Hou (2):
      firmware: ti_sci: Undo list publication on populate failure
      soc: ti: knav_qmss: Remove debugfs file on teardown

 drivers/firmware/ti_sci.c        | 4 ++++
 drivers/soc/ti/knav_qmss.h       | 1 +
 drivers/soc/ti/knav_qmss_queue.c | 7 +++++--
 drivers/soc/ti/wkup_m3_ipc.c     | 4 +---
 4 files changed, 11 insertions(+), 5 deletions(-)

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5=
 849D 1736 249D
https://ti.com/opensource

--53qpsf576eiodqg7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE+KKGk1TrgjIXoxo03bWEnRc2JJ0FAmpzSpYACgkQ3bWEnRc2
JJ2axw/+OeYULAqpTLuUqU3d9npoZjk2w00LLBZUpTohXqwvNwmb4Q7pCgXFezPP
mlFb1Ug/08WUyng9ZGXN7H5i8M3K2xyTKAR2D74YciYlEyNSrLa31Mau4ilfVsCy
6NW3DJ6jtQWKWcFmW7kO612yR1gyawTzttn5OqIF45GTOKyYq04Ffn0ATjf3QoOG
SXCoO+JiHm7eTqogTf9+wWPUsJEh8veEnjRzQoXHFDxje9bnoUyX/3q8+ZMarN5b
TiP+olGUd2Qat6mkmKavhouLGgvm6Mc2Ijnvxrn4P8xe/h9iWAPhd/A6Lk7bnEo/
myTq7VFaSVKRJfaDQ1Czf4s61oXh7uVNauSoflICrcrMaSnR6hMXk33byb8Vf/TF
el+8gsKPyLxy4V363nEh5SxucH+bpaHbDzT68UeLN2HT/WB32nVxBb2Uuq3yV2bX
JQb6WGKOoKfhfW95sMr9hYBj3dVUfnxbKGdLqK1AZhXhZGcehPP3DzC+aH1+J7hF
DOc7R65w1XSyWxKMNGXn+XYE5oe0hrjyV6O/Vpcf/nh7Qj6MOqtkWEpjvZFksE58
bSGWBpSj6ganwQAGVPOeM3aRUd2+v8ibVIivj39ZNMcUcxi8Ez1LE7+QPg/a7QQd
C4PtzqmeQ+6+sWJQ+UtQtHOAYA/SkNMmZgnBlueYu6F4FA1LN60=
=yJQI
-----END PGP SIGNATURE-----

--53qpsf576eiodqg7--
