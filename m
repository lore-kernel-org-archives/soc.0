Return-Path: <SRS0=DAOx=OC=healthnoworg.onmicrosoft.com=bounces+SRS=arXme=OC@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF96C2BD09
	for <soc@archiver.kernel.org>; Tue,  2 Jul 2024 01:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C9E7C116B1; Tue,  2 Jul 2024 01:14:16 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04hn2214.outbound.protection.outlook.com [52.100.161.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2E086C4AF0A
	for <soc@kernel.org>; Tue,  2 Jul 2024 01:14:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2E086C4AF0A
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=healthnow.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=healthnoworg.onmicrosoft.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GbKweLPhE5BJHoJzPWmdPknsvDfwmcx9C3Yy6PDLXrJa+Cm+w7HyeV0enCszO6d3kSiUs0hIbsrHGc2sxhdsyb4ZFTUhytxSZFi2b6M5uEw5qAXcS2xAKCw/jFRMHKLCxrJLsRwztyzZi5Qtp1OT8rgrkOEJFCohs67bZCRULmx4SMQNeSAxZ8Jn0hLPYGzb3+AvIRa7TSvxOTZ5DM+i+jhxjo1OWT8NMGe0LOroH6sIjYtlFNr+AxGL2rR/pOP/I7h3M3N5xSwGpqC2c5JH0iEeWXDG7h9JOGieigOifM4wJhKUU/zXH+Ca2ozyExMjTXY86v34jdQQZXt7THnMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jpnCOrP5uDZ/oHLuY3OIjSytRNiGUjXRZ/5IbABNkR0=;
 b=hdEiJUDEB281zn1GPNEN3d/YV/kD2rr+Cj5ageQNcskluevnBVOQjf2WtTP0Fd/Z/qZLiZCzz6X9iBTTc80f7BHG5+66rY4rQYIGRWT92Vzfv8iU1xE4boKpGidXC+pGBRY4asox+CoRNCZ7oBCAREeG8+MywOx2bcEyv85JXNbOH6gtr2QEAccMy2XDAfXZ3fpNP+/azL9P09/myPtWKTVrv5ul+ZbgjqH9uoEZQRmcQQBABv054OL3+fwsMnxIu+f1oVf65ZP0uA0U6+VnfaoxKSQPVtxwGXF1jn7IdXt/kaGGtZWmdQ5KI2o2JJOSicUkYVeI9AUspCVRrn48sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 208.81.14.32) smtp.rcpttodomain=kernel.org smtp.mailfrom=gmail.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=healthnow.org; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=healthnow.org;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jpnCOrP5uDZ/oHLuY3OIjSytRNiGUjXRZ/5IbABNkR0=;
 b=McILYQAR1CUH5AFjcj87VLNhxbreHB/16ugY2Xm+N73QEyzkNh/aGHFWw1yH7aEvv74w8Gpm25FFSOaOQ4dOV94Ce+RMGLfRmp2HO/3VrNI4+/PfuZ5GHw2quMIohOnqdUHC9zcoVv/kZieFHIBhqHh2DYY9sLzLJJUd8xVvxJA=
Received: from DM6PR13CA0047.namprd13.prod.outlook.com (2603:10b6:5:134::24)
 by DM4PR20MB5040.namprd20.prod.outlook.com (2603:10b6:8:89::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Tue, 2 Jul
 2024 01:14:11 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:5:134:cafe::ea) by DM6PR13CA0047.outlook.office365.com
 (2603:10b6:5:134::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.23 via Frontend
 Transport; Tue, 2 Jul 2024 01:14:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 208.81.14.32)
 smtp.mailfrom=gmail.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=healthnow.org;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gmail.com discourages use of 208.81.14.32 as permitted sender)
Received: from mail.healthnow.org (208.81.14.32) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.7762.1 via Frontend Transport; Tue, 2 Jul 2024 01:14:09 +0000
Received: from EXMPR02BVWA.healthnow.org (10.130.146.23) by
 EXMPR01BVWA.healthnow.org (10.130.146.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
 15.1.2507.39; Mon, 1 Jul 2024 21:13:59 -0400
Received: from [178.215.236.233] (10.8.129.249) by mail.healthnow.org
 (10.130.146.23) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 1 Jul 2024 21:13:58 -0400
Reply-To: <unitednation.kerrymorgan@yandex.com>
From: Holley Lisanne <holley.lisanne@healthnow.org>
List-Id: <soc.lore.kernel.org>
To: <soc@kernel.org>
Subject: We have reached an agreement with the European Investment Payment
Date: Mon, 1 Jul 2024 18:13:58 -0700
Message-ID: <20240701181358.3D5809D7ABC85E2D@healthnow.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-OrganizationHeadersPreserved: EXMPR01BVWA.healthnow.org
X-EOPAttributedMessage: 0
X-CrossPremisesHeadersPromoted: CH3PEPF00000017.namprd21.prod.outlook.com
X-CrossPremisesHeadersFiltered: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|DM4PR20MB5040:EE_
X-MS-Office365-Filtering-Correlation-Id: f8d1017e-bf0f-4375-4cea-08dc9a344698
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|35950700016|366016|82310400026|7093399012|3613699012|17110700014|17130700016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bU91TFBsU2V3ellveEtJTnVuMzBwNkZ5MloraHFnWDR1N2NuclFwWEtwTUxl?=
 =?utf-8?B?dTNBckFxMzNJZ3g2dVJvWDQyM2pHZ2llS2RINmhoV1NnNk94akgvUk9TbUxJ?=
 =?utf-8?B?NWVKK0tYbzhhOVMvKzBsaTh6YTdMeHVvRXNKL2RlWHZiZy9TQm9HQnNzWXpr?=
 =?utf-8?B?UytqbUtDZmg3VStJR29LSlZUMHJpWHhEUHJ0TWZSZ3pqMThIb3hqZ1VzM01T?=
 =?utf-8?B?NVJpSXdYMmNVY1BFRzFuZDdWZkFlZGh6YWtQV0VubkJEMG12SjMrRFFqdXFO?=
 =?utf-8?B?WS9FdE05V0lIQVFKbG9lSWpML3FGc1lZWml5TDV2RmJFQUJYY1B6ZHlpbGp0?=
 =?utf-8?B?bHZPbWJZbnM0S1FCZk1FRnhYY1Vhc0IvY0VXcEZwdjNWbjRJckNidzFvbzFR?=
 =?utf-8?B?TUlIaWc0RVNBNStiMXgyMm1NRHFYQWZRVDU0QVE0WXBlczJTdnJIelJSdnln?=
 =?utf-8?B?dlNPSitKNEM0K05DSnUrRURtbERVSXp0aEF1QklQbENEWnlqZ2VHNjZRYlYv?=
 =?utf-8?B?SFA4cUZaem5VcCs1SnZyWEV2ZVd4SFZURWlxQVBXbGF5SUM0d2pvd090OW1h?=
 =?utf-8?B?eHhSbjdsbVBmMmdDWkxiTk95QlBtbFcyMERybk95OHNRN3RHOXVDWStXVXhq?=
 =?utf-8?B?WjkyazhWeU5nQ3ZiZUZNSnZkWlZBalExbHBpMlVMa1B3Vkk1Z3ByYktGRFJ4?=
 =?utf-8?B?UUlDOUcwWis5V0pzbDdhbUx4b0p5L3BnUTJ3alpyM1IrVjVEQW1pZWlIWm9O?=
 =?utf-8?B?TnVmeTFMRmxpK0poaDNFWUtUa0I2UEpQRER5RDRwaFhXN2RIWURaSFd1angy?=
 =?utf-8?B?M3JDYkNSVzNmQ2g4anZOaWloaUQvVTFMblBlY0FCQkxsdTZ6aWRNR01JWFdl?=
 =?utf-8?B?eVpjMEZ1b0JFZW1EbHovY1FlTFFhQ2hMbmFsZDd1Sks5N0FyL2NLR3lXU1M2?=
 =?utf-8?B?K3lPUXlibW5oS2xTSUtqUVhCSkJVbFJhU3V6cEd6SWlHN3ZJVHJkWWx3SXFl?=
 =?utf-8?B?a0pESTExWU5YdnAvM25zNElSN2JnazFTT0VoOFNNZyt2QTJMNENrcG1iTE5y?=
 =?utf-8?B?YytUSHdGWnpleWo3RzBzakM4VVJuY0NFakUwd2tyeFVvR1F0ZVdEN1V2OHFv?=
 =?utf-8?B?dDU4MzBqQnk0MzdNbXpNSERMN3lUbG5kT0R6S250Z3ZhNXJFajV0RWFzeHF2?=
 =?utf-8?B?UGdRb1VTQzdvbW1wSUJrcnBBQXp1U3hVaVAzYjBRb2swRTRSaU1YTVp4M0Vk?=
 =?utf-8?B?MlQ3RXdSSUR6Vk1BYkNyUnRZUk9uRWlwMGVUbTJGNXlIQjh1aE1nMlFud0NV?=
 =?utf-8?B?NTErbUJvVWFwYjdSTlp0dVFpUDNYVjBldlR2YWxZT1c4c3Z3VUFOWkFCK1VJ?=
 =?utf-8?B?azFiUjlLbTRsVEtqTDltN1lCdDR6QmRYUEx5TFFLOTNiZmtqYXFjNGlnQXVw?=
 =?utf-8?B?UENJOFExL0E1WnA3L01xcnpqeFQyR2FFNzh1YWw0Tm9UVmFkNjEwNHBJOVky?=
 =?utf-8?B?MXR6UWFJK1J0RndKK2pmeVZxNE94SVk2cEJJUHZEYkc2aEw1Tm9tQzFaczFz?=
 =?utf-8?B?NWZXOUVrSUs5aGpPTVFjMFE2VXpLdzl3VVVXYitSWnlJL3kreXBNT3BiNTh2?=
 =?utf-8?B?TDRVR3VxcE9qcEZJNm1ZMis5cmdtTDVxVWFUMUlVQ2E1elRFUEhNRE10WjdR?=
 =?utf-8?B?OS92WThQOFRoUVlXYWRrN0R4RTJIRnk2OHJPR0daaDFwTmRiM0VWS055ME9q?=
 =?utf-8?B?KzZsdnhFb2pVYmR4NGhNaytVUlo2TlBoKzYxSCs4Qis4ZWJ1N2dqSXllWURY?=
 =?utf-8?B?dGZyVjJCRWIvdFJZaGNTYkpXcDk1dGxYaysxTzFVQnZJcUNIMEJmckplVW8x?=
 =?utf-8?B?c2lURmRxa3I2Nlk4Q2ZuaUR2YnQ2WXNFYUdabm5TN1NML0FGcjJaeWpDOXpC?=
 =?utf-8?B?WU5YWU5wRHBVVGtuOEpaTS9WT3U4WmF1ZjFEVVZIeXFpOHFoL0tMWkx5dHJE?=
 =?utf-8?B?bks0ZTVnd013UUl6VFV2djA0MXFTRjhTWElQejhkMFpJOEZKdjJBN2NZbUsr?=
 =?utf-8?B?Tk43VlRPVmR1ZFMwQ1o1anh2c01lNXhRS3VQY0tNK0xYTXFDVzRmRXRldW8y?=
 =?utf-8?B?YTJOLzgybnU5cnc3ei9jU2ZJME9iVFBmRFZ1VW9DREhtUVNlWWNUWlVXSStT?=
 =?utf-8?B?MW1DZDRQMS9vVURWTXpGcW1BS2FmUXBqd01hbUhnKzNDR1NVanIzUWFGZE5K?=
 =?utf-8?B?bGQvcEdnQXYzR2duTi9tWXlManRqRVBCWDlVbWpLSTFUdkphSGQxQ1UyOHdD?=
 =?utf-8?B?RXRVQU53Q2dLWFdqcWlDWnU0b3dJT2h2TGNCUU9FbU9vV3A4RGdFYWpjT3Z6?=
 =?utf-8?B?TEVydmdWYmdqM2pHbUw3U3dxaTRrMUN6UStWTmJVajJpSE5DN3M5WUJYSW4z?=
 =?utf-8?B?KzJXSzRmbXkvNEUwNDVCVU0yakhqanRmelZjNXpwR0ZFcGloNThIeDdsV2Zx?=
 =?utf-8?B?VWNIUW5xdXgvMm1HWjVlUWgxdm5BczRXQ3BUM2JTaGJQcmxUYmkwVzBkRzY2?=
 =?utf-8?B?My91L3I1NmtjLzZhSjZQTjBpd2x2bWs2UGx0c05td0Nydk50bUY0N2dlYjNl?=
 =?utf-8?B?WVVvNFFmR002bGdpTEZPRlozbE0yN01xd1llWThxRlkrbGxzaWZIdFhFQlRH?=
 =?utf-8?B?OUw0ZVRJNERlSkV3MXlMYjVLUmNsNG1SNFE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:208.81.14.32;CTRY:US;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:mail.healthnow.org;PTR:InfoDomainNonexistent;CAT:OSPM;SFS:(13230040)(376014)(1800799024)(35950700016)(366016)(82310400026)(7093399012)(3613699012)(17110700014)(17130700016);DIR:OUT;SFP:1501;
X-OriginatorOrg: healthnow.org
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 01:14:09.2505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8d1017e-bf0f-4375-4cea-08dc9a344698
X-MS-Exchange-CrossTenant-Id: 480ee22c-5ff4-416d-bfa6-99e16833d21c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=480ee22c-5ff4-416d-bfa6-99e16833d21c;Ip=[208.81.14.32];Helo=[mail.healthnow.org]
X-MS-Exchange-CrossTenant-AuthSource: EXMPR02BVWA.healthnow.org
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR20MB5040

Dear Beneficiary, 

We are writing to inform you that we have been authorized by the=20
European Investment Bank of London and the International Monetary=20
Fund (IMF) to investigate the cause of the delay in your legally=20
approved funds. Our investigation has revealed that your payment=20
was delayed by corrupt bank employees who attempted to divert=20
your funds into their personal accounts.

 To prevent this kind of fraudulent activity, we have reached an=20
agreement with the European Investment Bank and the IMF to manage=20
and monitor your payment. As a result, we have received an=20
irrevocable payment guarantee for your MFI payment. We are=20
pleased to inform you that the European Investment Bank has=20
decided to reimburse you the sum of =E2=82=AC3,500,000.00 and transfer it=
=20
directly to your bank account via bank transfer. To ensure a=20
smooth and hassle-free payment process, please contact the right=20
agent, Mr. Kerry Morgan, at the email address below: 

Email: unitednation.kerrymorgan@yandex.com 

Additionally, please feel free to provide us with your WhatsApp=20
number for easy communication. Thank you for your attention to=20
this matter.

Sincerely, 

Mrs. Holley Lisanne=20
Reply: unitednation.kerrymorgan@yandex.com
