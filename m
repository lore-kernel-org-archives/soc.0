Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CE3349CEC
	for <soc@lists.linux.dev>; Mon,  1 Jun 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780303033; cv=fail; b=MV2E3Wgi8nqORwEPoExGRUlab25YfMNDH+fHwxESvxfsECUxkwoACYtCPM1Zh3uh9LK0fdPZjkS9SW+Wyz/+QnCtJSnox7fEEGKV2WShsRGFhnYRvkOPTXV+0Wu6W/5rrhJ46fHN6S2OrgkTwAz7JmTvvG1IAcKDsMDJOYmfD4E=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780303033; c=relaxed/simple;
	bh=N7oW1GiFYdIRahWuh/MDQRa3VXzZVzYOJ5iOkz29nME=;
	h=Message-ID:Date:MIME-Version:To:CC:From:Subject:Content-Type; b=nTDDBZP/LWsIxW5wVVE+qfVbzfmr1759SN0HZp3wqYPNRsKQU2LoQ2OLyyJjUCLgYmQsgd11JnNTig0q3zFcqg/nIzs8l6H2cGBRkrnGNXA59bEcz8teEgam4vmZ3vN46NLHn4QsSweT+b/4LBbTNHGEh4k/U9MGjGwvGuY7Vkc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=iF0qyXVt; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="iF0qyXVt"
Received: by smtp.kernel.org (Postfix)
	id 8BA241F0089B; Mon,  1 Jun 2026 08:37:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.43
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1780303031;
	b=DPayRWHUkwMBtyoGVUTmktoYUeBsfjCWo1vi/sl4E/hkk7geNrMAr2K5TjvWq1mxEfwk
	 iClOV5bLKGo2niojA57Oj5zAkC22H+fkKJKTVC1Z4S2n5kZoxDBOFyBJ/C/lk/Ee5jRtd
	 RMQ9eNC/UrcGyI66AVm8CpS/TTgPGDkcdPlX6B/xSbisn2YLQugn0Vdz36BSafM9Ex/qt
	 mOl3C5KEmPlfFQeB2Y9hu2scHn+1/MhP7eV/+m9MuBAd2k5mQVDOphhm6dJAkZCnzkEdE
	 HLNWscnkxAq4a3VTtkGb32IvHJHoUiy/aM0b05dwNtnGa5oc/B19Jzli+7TzoX+dEVg==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780303031;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:
	 CC:From:Subject:Content-Type:Content-Transfer-Encoding:
	 X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
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
	bh=Y6tTEa2oLYwRstok30decRqOUDGO6bNbpjTQaPevAcU=;
	b=kE9P4LZYqz5TvB2mKVhzE4rQ9Kz9XoG5adB+hRxhBx6IbplIQRswub3rSpTDlO3N1bQA
	 2/u1fsgvTaoEhvyvDhl72n4pNY4XnO0GJddC5e+zQ/hRYn0m+m3Xglx5QdaqaKqlbKbcW
	 AABFRxCS9ONOmmK9uP4g5XFCKdM1YyaGDn4n4L4KnAVRfoFHfcCNB1ti2ObDuPU9CJe2O
	 S44T5p92auK5ZQaiRttiDEvtt1winwxL389piopn6LmhuUHeY+xLpXfeeync2uSLEerx3
	 ng8dTp/kD9mnkkCfO/WduECwac5DvG89MqyKqFv1fjRFS17ppJ/RNC7oofuESvF+sxg==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=iF0qyXVt;
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.72.43
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013043.outbound.protection.outlook.com [52.101.72.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B65801F00898;
	Mon,  1 Jun 2026 08:37:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=iF0qyXVt
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org B65801F00898
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=foss.st.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivtYY59XfvWKFeowSC5qER/GIHx/UFF0tCdweaCQT0kF9qda+cEuKSD0UXQdFZtLBvTxNkGuDrlDBkRlJCXtFapB+hKi9XZcXV6z9p7jHjS0IAze+gGDnZtBqXDnNvAk1ANiXZx6HarcY+QGQ2alFk26znluEAfZw9gU4rq0ci5eNTsGVWFSjDgHRHA7jfVhDs+qlW9Hc8fUERN0P/pz1BvBYYew+JRKjh+3nwB5MfjXhfAQnKAH90Vg1XHWG5Tjsrb/EjuBw/Ssk1GzTm7oIFoB/MB72SMEVMG8owQmyn1EiOGGAunhKS1W+0/6lB8XXNe+G8/6f6DU/XZg1TY0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y6tTEa2oLYwRstok30decRqOUDGO6bNbpjTQaPevAcU=;
 b=LF0k0sHMCzCZ2NkQNd5D9d+C1KQXgEQXPW42/IVMqij0OEVZ8PED9VSKC+EwajteupeoXkp1KvBwpYkm+MOSUSe2WC9xdz5LQda/IbqkttWziImGobjRLY0892GOo86aY4EYkAWEPZArIL1LyqHBIoKuuOBJ0k8JYQMHWblGcoesYw3rDUzObFN9b/puB27df8QpVHevKuAfPbE5Y0sRw/N57n5+8sOHN1ViFodOoceco54JVzxb5t7XjhHt5vN5GdgkVq1En4gCGBfbmpcKsrdZ0+l4cSBxllxIP6y/EL/LWqxqfSMF/WHNVz3PolmbODyj5Z5rpPtvaT66PmXofA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=arndb.de smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6tTEa2oLYwRstok30decRqOUDGO6bNbpjTQaPevAcU=;
 b=iF0qyXVtVh9Ln73e1jWubKiUNddAo+6znyKNVNXb48c8zUpljND2txiP1xQcDC6/IeyjU5G4j0TgI6qev6XzS8aBErokKq1/W9jj5slCpNDQH0glGVyE68AR2qrl7cGE8nfg1iDz253n7XZAi6vDiCC8RmYapsQrpKx7RJVDRsPt9Lfx/3eWvoDboCEoIZqZ7U0f2eNehCyDcsm4R68c/VZzhgks8VXUeCM3BDKthdHJeP5HeC6ESxx1IGrgyCqvaY5wCBIw4abAkDMFaexOjbZwiElZa3QennF/KTJuF/TF3oa9UjnN+ryaXwyQ/ePjXMidhTIGTBh0f/LvNLBzdg==
Received: from DU2PR04CA0247.eurprd04.prod.outlook.com (2603:10a6:10:28e::12)
 by DU4PR10MB8832.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:560::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Mon, 1 Jun 2026
 08:37:01 +0000
Received: from DB5PEPF00014B96.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::68) by DU2PR04CA0247.outlook.office365.com
 (2603:10a6:10:28e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Mon, 1
 Jun 2026 08:37:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B96.mail.protection.outlook.com (10.167.8.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Mon, 1 Jun 2026 08:37:00 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 1 Jun
 2026 10:41:09 +0200
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Mon, 1 Jun
 2026 10:36:59 +0200
Message-ID: <5f52acde-00e3-4f9c-97bd-9ab068320bc2@foss.st.com>
Date: Mon, 1 Jun 2026 10:36:58 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@baylibre.com>,
	<soc@kernel.org>, <arm@kernel.org>
CC: <alexandre.torgue@foss.st.com>, "linux-stm32@st-md-mailman.stormreply.com"
	<linux-stm32@st-md-mailman.stormreply.com>
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Subject: [GIT PULL] STM32 DT changes for v7.2#1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B96:EE_|DU4PR10MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: 79669a22-8081-4d06-c081-08debfb8f34c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	RpEoVmU9UFIJr1e5QjUX7sLWPEvfPJRFlFkH79Hh7TzZGYSgatfOJ1s3Sznsst8OJbL9hACvrApsLWkocuyqmsY8MRVff7ULbDBeQKfI5RGjXB7dEz1ie105TopBPnCCMjjSxLPG2+LdeXLUL2EGyloOCXPa+v6mfTtiybUjpYwdnwyLc7Ed8GwIAz1lmGB22kW2x9E2xGjYK22wfFGBQ8jq5ofAhWL4pxKSWKh+R5OTZ8Kw9GvkpINB70EnttUsCRNY5TxYhrU2xqoutxNGXtnTc8w2w9Icgf+3gNFaCiOLr8i+Us6o1FKHpbnkaCPUjcwYM1ly06F2DbrPizZh9+slRHs4NOQQbaetCKdGX58j10m6HOxWhMN29Yh1pFxgcWBsn4pGIiPxpBczdtpRmcxNcnlmGd/PuKLmjiOAc1ONmiwGjG6hoOTMhVBveYWiXYUEEDrvCoCBWKy6bTdlHV1edKthFk0NrlMATmnigCJWG+eIr0yyK4QoWFscVf/98k6r6CQ1cmsRQvm7uTHAxL+ooEHQd9R9B1o7QY6aEytNSi0utMWIueuZVoHveFtGDTCA2LAjC2uQ4N6dlhxclDWz0sIL97vU0PkNjwE9sFkOMt6gduCxF7fIKgu+pOOX219tOEO4IvJUC8UWijKgFh0rlTV6fE/vx7uW2qfZdg0f4t746yb/vKA5722st6BHzWauTzSmYaCymsaK4zaa+HYNMjap8R8zkiO7xUWvj14=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	G1NizXP6zIgqdIdWzJxdcJrF+UIgKaL1zqpslXrZ/3Cfa8sY5pwLXA1yEbzf1bZU0WKRSRzjeOf1sVHjCZ8S0eyc8YWr5hNQYTsPuw4ZXnRRImoAFgM/+UNlRZkumj1iE3E4gwyN44fO8JJj9QHf6W09CGu3lQoN81P2l8IMy7A+XCBfW6ZNPTWjykVW5NiIOq1lWcAFO3ZcFXIGeDuY9p7rCOt+6xGCANxyecnDopNqSjp2zOxS6Bej7l5KwNxBpvUF49d610zE30JuwNIQmul4ZGoawDgASiuCOsNh9ARQq0rDV0m4vW/6/kT57c2aI/+EEpaVge06PfGS/zt8BkoPVAQy/xfL2QpupXrMGAgimX6uP6kkPHnPbgt4v0OmR7gqXIWxiBh2+3BzgC1s5U1dZwqBmXw77vXz0XS3bgWOLWQZGt9Sn8rA9F58Q611
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 08:37:00.8848
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79669a22-8081-4d06-c081-08debfb8f34c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B96.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8832

Hi ARM SoC maintainers,

Please consider this first round of STM32 DT changes for v7.2 cycle.

Thanks
Alex

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/atorgue/stm32.git tags/stm32-dt-for-7.2-1

for you to fetch changes up to fba4a31a7f3b6b29b01c83180f83e7ed4c398738:

   arm64: dts: st: Fix SAI addresses on stm32mp251 (2026-05-29 18:53:11 +0200)

----------------------------------------------------------------
STM32 DT for v7.2, round 1

Highlights:
----------

- MPU:
   - STM32MP13:
     - Enable PHY SSC (Spread Spectrum) on DHCORE DHSBC board.
     - Add board pin documentation stm32mp135f-dk to help user.

   - STMP32MP15:
     -  Protonic:
       - Update MECIOR0 ans MECIOR1 boards:
         - Define ADC channels and GPIO line definitions in board and
	  no longer in common file.
         - Fix ADC sampling.

   - STM32MP25:
     - Fix SAI addresses.

----------------------------------------------------------------
David Jander (7):
       ARM: dts: stm32: stm32mp15x-mecio1-io: Enable internal ADC reference
       ARM: dts: stm32: stm32mp15x-mecio1-io: Fix ADC sampling times
       ARM: dts: stm32: stm32mp15x-mecio1-io: Move divergent mecio1 ADC channels to board files
       ARM: dts: stm32: stm32mp15x-mecio1-io: Fix GPIO names typo
       ARM: dts: stm32: stm32mp15x-mecio1-io: Move gpio-line-names to board files
       ARM: dts: stm32: stm32mp15x-mecio1-io: Fix expander gpio line typo
       ARM: dts: stm32: stm32mp15x-mecio1-io: Move expander gpio-line-names to board files

Marek Vasut (2):
       ARM: dts: stm32: Enable PHY SSC on DH STM32MP13xx DHCOR DHSBC board
       arm64: dts: st: Fix SAI addresses on stm32mp251

Uwe Kleine-König (1):
       ARM: dts: stm32: add board pin documentation stm32mp135f-dk

  arch/arm/boot/dts/st/stm32mp135f-dhcor-dhsbc.dts |   4 ++++
  arch/arm/boot/dts/st/stm32mp135f-dk.dts          |  28 ++++++++++++++++++++++++----
  arch/arm/boot/dts/st/stm32mp151c-mecio1r0.dts    | 128 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp153c-mecio1r1.dts    | 144 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  arch/arm/boot/dts/st/stm32mp15x-mecio1-io.dtsi   | 146 ++++++++++++++++----------------------------------------------------------------------------------------------------------------------------------
  arch/arm64/boot/dts/st/stm32mp251.dtsi           |   8 ++++----
  6 files changed, 320 insertions(+), 138 deletions(-)
