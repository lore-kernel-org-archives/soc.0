Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022131.outbound.protection.outlook.com [40.107.75.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65511FF1B5
	for <soc@lists.linux.dev>; Mon, 11 May 2026 02:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778466463; cv=fail; b=KKwOGnXwWhRlnj3yZGsaw39oZGm3f7Ox/BKykW9YYBtZxp4095BhrQAYzZvLvPOlH/QRr9G6dUFWFgMw3zc4gM+o07vHgdMP+mEBYwK/yb7lvvEVEllB+LgoV6v/DGfc0uJ764LdARQZh8kNzvpqoO+QDuo1qnsP57AvcTh3jbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778466463; c=relaxed/simple;
	bh=PFg+0i6e96svtpAYT91X9ATUyVOco87NITsnGE9Q5II=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VsX8uWHgGlP5Th2LzJhU3FtNDD9jv9HcwbaQSui9+AL3+A6VdaJhdVMcLI0nej4zIcdGx8YYZuSwocwkDAd+W6t1/VI+o9XPQUbr77pZ1enPxH9c/lYnARAw5wxoHLp5zLTpZW4K50BY9t7bZpysn2mMpI/y+LizlEN4ijVNq44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PsaWfBB9kmSK2wHX27wwzF/fk6eJS7KytQfvc318XpTbLXTcDr0R7vYQB1pDvkaCPl/8iYJhkFDRP0ujN8CZMyG/fkvIY3HePlyt1z4RmL38VJ3X5w07gJc5KT0oQOPtC1fQjX8TKGiNf2J3PvLpkgXknwchuRLasU6N6qj6MsGLvLyKM1F1U0NwDnlTXRmWdPqxnYywYQviQj4Q/oElzsIRxDtlXO7hOsBK7KHB6IH0A+KirZLcYsDuhTpS70txtJzlgL+fwc7OAzAA3JqUKJYJ/CS/DjDEPMYtkchjM2ofbuoiCPZaali2u3oimhHwFREtDdeAB67Z7Mg383Ks1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTBmpvUtnOLcZqHGkabZtIRYEOZ0e8kUDigRX6YvFp4=;
 b=OcymDRGYmGt8ybbkQPSGy3E4x1PwtlHLcN4hj0yQklPCrIEj+gZNgWpIw1x1aQKTPH7ntDgoPGf77BdG6ccQv+f2Vo0qemdFetdrzPj871rQl1eJKKCJlGavxSXLjU5GeEgGxS3St+DiFejv1+f22r5lWhI/2/Eg6TCPCnY7463imvKUspitrv1XKeOK7tj5xZujrSY3uvHzMo7hZZxaYDUHugRcWM+1WF60q41IX0NTVx82yO84zMVHzk0+ETNE8Vxf/2JeC5KF1nbSY+bO0prpBQL9CsBjxFti96Otd3AhdA9Tc2sVxzg1L2O360leChHQDf1oYFDvqD3zZL9C/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=cixtech.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4PR01CA0001.jpnprd01.prod.outlook.com (2603:1096:405:26e::6)
 by OSNPR06MB9003.apcprd06.prod.outlook.com (2603:1096:604:49f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 02:27:37 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:405:26e:cafe::b4) by TY4PR01CA0001.outlook.office365.com
 (2603:1096:405:26e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Mon,
 11 May 2026 02:27:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 02:27:37 +0000
Received: from nchen-desktop (unknown [172.16.64.25])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 4BC0B40A5A01;
	Mon, 11 May 2026 10:27:36 +0800 (CST)
Date: Mon, 11 May 2026 10:27:35 +0800
From: Peter Chen <peter.chen@cixtech.com>
To: soc@kernel.org, arm@kernel.org, soc@lists.linux.dev
Cc: fugang.duan@cixtech.com, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: [GIT PULL] CIX arm64 defconfig changes for v7.2-rc1
Message-ID: <agE+l8yT5a48G4XT@nchen-desktop>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|OSNPR06MB9003:EE_
X-MS-Office365-Filtering-Correlation-Id: 8743d5c7-7028-4a46-d276-08deaf04de19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NsGBBfoAtpgMiQnMVwz4/rOVXsaxpcKwo1ftZai9h9+5RVU11J6sXYyt6+PmzyNf5oV468QhKQBJOCB7CLxWG9c2FU7SBwvNbnvK8PHCJJvIspbx97FbWfjy/6K5GS2HdlbealER/+RHfi/nHJXpoVVDpK/I12lQ2q03yCgjIpuNEUSdJfIU3nkEN7zIaQrBgZsUIPYtK0h9PsXcXzip11VjuI+rZ6jlDCPRvBGpCLJBpgKf9jQD0qthpozMrHhNymai7YAsefVEg7EPt3S1/6ftjaMKZtXV0h2HOacRA1T+iBUP/D7GFDVcqKBjDTSwftoo6doh10SATWNfZkHGBhrlNWXEmo5ic4SjDRNeJBViDduNwu9XqXsi7a7dOYNAabv17QDmxn4pCuO4GXrHhvpVI2ufz2PT2eRGfBTzCrKH2bp/OmWo6KnD4VlF37WDF07Zw1nxBbpWPBnzWop6XQm88IkDwPezGHWjMKkji1glDiVtIdMyFNgTx6i+Y4LQtPCtU1KH4Rong8M7i5E73rb2ZSv+qWAJt27H+FdfPL8nmd0aYwyBIH3ILDhp1qQF0dyPiE49mlv/71w4pELYqjJgkFzrfh0t6/0LUtAmteZQ2/tyPv7RXCJ7mAo6cgfACS2XyRCqZ9hpNnu8MlARa5EFl+sbOqNMkxBrJOmL/5wbkjcFP8F44WONT2JZC4yWIVstgq3N7Ckm/4m46GIun5/VG8RwhVSYmnf3d4ZAQ/s=
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BE3E0+roQR4+h9sNKPD8OgJ/er/oTvByUh5hul19bo5kDgxxacLkfPWzZVEuNItKzb3q/fQesjd2UxrK39jS0YwsSqibPDDJvG0SalJexBttpiMiXjjBg/R4ILoBDAieDIvhq9IpjtdeuMiu5oEHQDXbZpNHKMBaf4rZFISKXwiVh0cpnQKso3RX12jOHWwzYJhyiV/Kzby55icjdHSG04bO8Cc+KCaPM1S8lLQy2hnxu2lz8fW3L1ZG+5Ecp8o2qqb+z8wjRkya3Hmc3PdWR6TiHH2CShmWtEcSIevC0UFovfsAmv9Ve4kptobkYLpyFFKepZSNMBlNhWq+lugIWvv6Hp4utOiW/sQb99IhFD8o4/1HjBObQvvH4lOFW+YcB9A3pPsrIfSWDqPtFOJI1oVrEeikF9l2lYZFtweKMlls50+zrg7+wTNP3J4+2WQB
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 02:27:37.1762
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8743d5c7-7028-4a46-d276-08deaf04de19
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB9003

Hi Arnd,

Please note: it may get merge conflict with soc/defconfig branch
since I got below merge conflict message from Thierry Reding at
May 8th.

	Today's linux-next merge of the cix tree got a conflict in:

	  arch/arm64/configs/defconfig

	between commit:

	  f54f7979ff88 ("arm64: defconfig: Move entries to match savedefconfig")

	from the arm-soc trees and commit:

	  f4f1e3bdb5f9 ("arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe host, and Cadence GPIO")

	from the cix tree.


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git/ tags/cix-defconfig-v7.2-rc1

for you to fetch changes up to 246e37739f24b00a5559535dc814a315e7774639:

  arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe host, and Cadence GPIO (2026-05-09 18:15:49 +0800)

----------------------------------------------------------------
- Enable CIX Sky1 pinctrl, PCIe host, and Cadence GPIO for CIX platform

----------------------------------------------------------------
Peter Chen (1):
      arm64: defconfig: Enable CIX Sky1 pinctrl, PCIe host, and Cadence GPIO

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

-- 

Best regards,
Peter
