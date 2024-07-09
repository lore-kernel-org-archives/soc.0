Return-Path: <SRS0=i6yr=OJ=outlook.com=unicorn_wang@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDFBC3271E
	for <soc@archiver.kernel.org>; Tue,  9 Jul 2024 00:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8A723C4AF0C; Tue,  9 Jul 2024 00:39:42 +0000 (UTC)
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01olkn2095.outbound.protection.outlook.com [40.92.102.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EDD28C116B1;
	Tue,  9 Jul 2024 00:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EDD28C116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=outlook.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=No66V0CAZMOAm/1Zy8Q1K8jWq6KFLlQnaYrpOVdUnvOQU2pHJUYvqdH+FnmZEPA5gv7cSgbEK9pN1sUtfTkHCSiUVXFUlpywm/iB2qFPIYr2+1i3X04u3FzScAgthwCdI5Px/cc6+oSZLZy7gfFVMFyWFzo5T1o2fDpwMQ78P5c0vOmkNjySSPdiPzWziyQAP35nk4X/aL19708pQjwt8HzsKX7A34Cjt2CopjDeKU8u5ELDxG9qzZfDHNN8lF6v4chRgfOMuBGbnbM+1sK3t8J6qciriSBv1Ho368tdZpgdeL0ndRHN001/vC3Qs4pSIGxOPc90WxmJVr/LubI2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qG2o5ljPTihO7gz3s+pylEdhEQ2uZ627BSUHS9W5EpE=;
 b=P4qgXUdM+O0VUjgShvzXnWxz1q0rhLrfSJ+bHaDenlASeZ692k8JkTtKKeNCaaoGCoiKYh5N4X+Gv5xni/icm9hmnq/gqb/1ezmRiqxDidVg4i2dWyvFMcvWpTkoSj33YnAofEsmEaLksr3WAK7qr4re5MS21vGSxrB4n2EBSTAcgm5Bser11qTYPOniFKx/RMxp4tlaiFQfSs4HiT3AeaThgKS+A1PizU5OlGfy5jO7pjdpPyDHqbVabPYP+Bz18Y26PYTPuTOhA2ElZ8F66H0tMVwl8pn9aBbxEn/pBiPGcHV9Gu2o5WDWb9clqiu8s0FpVbt5svOLkONhKOo7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qG2o5ljPTihO7gz3s+pylEdhEQ2uZ627BSUHS9W5EpE=;
 b=Y0SnmP9xSHOqtiWQjs2ogHlBk5pNBt89cF9ThMjrYOSEIZwb8KnQCv5IvngnTO7Y9RzekkRVC8MbZrBBRQXkuvNiiV+zi+UPUM0pTtAcE+W5v19fcDPJbl3xr85irj9YYmSPZrfsRtb2CjVKz8Ji9ZlipdOs02s4hB2ddIcgpWCuDBgom8ovYKLaTTShPcJmQQ554nom9PPiTKiOQGjq+khzW+CCpnSCjTHOKo1fyJFlXLvSTDlj+MolDabB68Dub73d5+Sa8iFIW8UQPCG3xk12fquwxdQI0J++6SqKNJo8F+skqDtDlxjcKfbRyHHez2C7gSt3PpA+NsJU0X4npQ==
Received: from PN1P287MB2818.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:214::7)
 by PN2P287MB0191.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:ee::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:39:35 +0000
Received: from PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
 ([fe80::5a8a:9e40:a4e8:3e2d]) by PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
 ([fe80::5a8a:9e40:a4e8:3e2d%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 00:39:35 +0000
Message-ID:
 <PN1P287MB281861EA2B1706B430D2FA3EFEDB2@PN1P287MB2818.INDP287.PROD.OUTLOOK.COM>
Date: Tue, 9 Jul 2024 08:39:29 +0800
User-Agent: Mozilla Thunderbird
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org, arnd@arndb.de, linux-riscv@lists.infradead.org,
 inochiama@outlook.com, xiaoguang.xing@sophgo.com, haijiao.liu@sophgo.com,
 chao.wei@sophgo.com, unicorn_wang@outlook.com
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo Devicetrees for v6.11
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [VP5tBzbNW9uApk1/Eznifzi3/u2BMPvE]
X-ClientProxiedBy: SI2PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:195::7) To PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:214::7)
X-Microsoft-Original-Message-ID:
 <93944853-9fd2-4d31-a04e-6d2c6ad8ffd0@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN1P287MB2818:EE_|PN2P287MB0191:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ee43d21-d8f6-4665-1952-08dc9faf9aa4
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|19110799003|8060799006|461199028|440099028|4302099013|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	an/VZ7ih0lhm/A9NDyxFhwMYjDOF4Zd+b2iKYfKkAvnTX/0OH/x/KXb+I0hzHqvChtb90/MUWUi7gvXmSmAqiILHftmqjvqv3/T4ADO8wiYuYj6SVjqOO4aAkBMEkI9cEyaSxKv2apSNpkLOJ1rIpwCiEEgQFyg2kdMs3sclMFWPAaG50OBABPMp0r+lF88bQrIYpbcHPHxQeXUm7NyuNAJsCfha2SinnCT5V4EoU4XaEWMNElZ/gWfR5FFJwfd8BKAahHqFxhu58gHXoxNuufqWebfjrJcqb5/FxW9Us0rTJsjiEZVGO3j+YoelG/dmLAlWTD3sK6jsTrP5DwfHmSO/r0yCzBSvRalziBNyueZ6BWyqg4el43l41ttdoh428WbCBDB7lu8FiKZYkRgKpiuewpTolAiu1raq1FlgAjPPh1ygiX/5i9yDNnvEsTnoS11BvelzSb2FdnFqJ5DK4S4e0S2QqNg6DdIXlQATfm59O8KaIkEI4o4gQzxt+URYCZ1VU7pr66dN9ZhyZyXoxSI1fGP6spCngjxdCXINdJg8mGEvXqRtvn+mAa14iIrwzjsovqFTtrvexJBMxqbXH5d9hC4CwXBf9/v/CTAIrPxbuuzIkR4A9tsW/7C8G8jhluQvpGqV6XfzqeFifWxo+oo8TkuyXeEaTv5kL57aEj15FxlxiyZkW+0FQ7W3SlFWteE3Y8CVcWqsf2maVZN+cQwqPm7edfLUgw5MY01Sr78ffhRjv7sLUoyYqUrbklTmzg1l2dhsuuvyfrByBPBXa0IMtAXi75bb46SKaOkrAnY=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y3lOM1pvZEVzRCtYWEJLellrUWxkRUl2eXk0ZWxXYXVGQkgrNm1GTjBEQVJO?=
 =?utf-8?B?MG1YemZtTTUvVUVZLzdQcWh3WDZNYmx3VWVobUJrTHlrN0ovWHJoaTZVQWNY?=
 =?utf-8?B?bnFNWDI0UlZpb3BzdVpMVGp4bm9xL1FjSC9FTUtjM0lJNUI3VUVKVFduK2xZ?=
 =?utf-8?B?TjkvZFVJZkxxMGJGL1FRaVNqQ3FiN1NIOTFReVJJL1l5OGdGbHRkdmNEV2xj?=
 =?utf-8?B?eEdyUUdZdk1kTk0zMEFRUE1qYWQyU1NSK0NaVnU0WUxSU01WcUFRcEFxYVpG?=
 =?utf-8?B?ZGdXVk91S2VhMlIrenNGQS9RMnVLNUU2L1p2ZmJFaThXclhqYnR6anhia1Nx?=
 =?utf-8?B?WEhDS0xFU3NMaDAvYWhaYWtCamJkSXJLdWMwaTI5MGpEeWNnVzZwazdDMEhN?=
 =?utf-8?B?MmRTVUpBMVVueUg5NE5LWVV6WWh2eVRMcEM5UUxHUGlyazZpZ0N5ZnVwNGd4?=
 =?utf-8?B?UktFdlhKbkQ4dUZoUktSaGg5Q1NGUExxaC9LbEJ3aUIxMGg4UVNJaE95eWdt?=
 =?utf-8?B?WDlLSjlwaEZkOG1obk1INElyUTkzWWxCdHRQZlg0L3RZelZXbVNnM1ZvUW53?=
 =?utf-8?B?RU9lL3dCS0wxdmNaTnUxeklybmlESWJXK3ZtWElYd0xiZVgrM0tJNjExTUo1?=
 =?utf-8?B?LzgydWxNMGYvMkJUR256cDNyUDZtMC9STTZuV2crTDBSakQ5WkpIeVdXSWVz?=
 =?utf-8?B?STBqK0pwcTZ0c1JlMWdVSU1hZjZscUsweUZqTVhiaWQ4OHoxUlBZM2VSc2xI?=
 =?utf-8?B?WlkwajJiUDk5QkxsaVZKR0ZicW5WMFBUdUswZE1uUS90Rk1OSURuTjZrUVNx?=
 =?utf-8?B?Z2tpenBjRTc0TUlxdGtaMW55M1c1SFFpcUl0VUtWQjVER2JkTnptUC93MDkx?=
 =?utf-8?B?eHhyakMwb3dKQU5HSi9wYi93NDJOWENzKzVLdVE1WVMvRmgzaFZWeWl1WDhi?=
 =?utf-8?B?UDU5bXhQM3o3R0JSOUNYN2g2MHBZQWhhUkowZFZtNUMwOUJKSHQwdDAwQzQ1?=
 =?utf-8?B?cUI3eTgwSXBZaE1KM0ErbnE2V1I1d1BSY2h5YVhwSWM0d0U3U2pFSFQzanFv?=
 =?utf-8?B?VVpSN0xZN0tKZ201MkMrWkg5SStERDNiZlI3cmp0OGZrU3dRbUZ6YUZsNUkx?=
 =?utf-8?B?UUZTTCtETW5KTVVFdTUyb1dSb25xMmxoUVFzZXI4Z2p2UjdIdnRtN1JIZENt?=
 =?utf-8?B?bk52OXpEV2hUUkloWG1YVXk4MUs5cWY1eTUwbE5VZE50WVpReE55Nk9OMUVt?=
 =?utf-8?B?aHVoMUNuS3Yzc3piQis4dWloSnhHS0dBaDlKUnpWbTQrQXJRZWVBTFdBRktw?=
 =?utf-8?B?RDBVM3ZZQXM4YU5hMjhHQTRteUV2ako3blBXaU9NRkkzbTk1MTZDR2xHcUJy?=
 =?utf-8?B?bDk0bHFVamJMcHhQSHRZUTV0WlI2eElOZk5GeEdMeEJ5MGYxK1g1cGU4T2ta?=
 =?utf-8?B?WUZLZmYzTmJybUk0ZHVGb3ByUWN1OHlEM05vQWZrYzFHZUxCZ2tTdWtqNmE4?=
 =?utf-8?B?QWFsKzR3NW5qK2MvZWNsZVhuRFRmeldYNWNmQnJ3NjB0dzdpcEdadFozRzkx?=
 =?utf-8?B?N2lPR1RpMzlUV2o0ZVd1KzNzNkg2OWJLczd3OTBmZ1M3WUEyNHZmWUVFZkZJ?=
 =?utf-8?B?eG5rN3JsUzgrYTNhL0p2eitrbmlKTU5IRXd1VEJjL2lETjdIY0s2VkhIRUM5?=
 =?utf-8?Q?FsRbL/IoZwjf+AIDhmh8?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ee43d21-d8f6-4665-1952-08dc9faf9aa4
X-MS-Exchange-CrossTenant-AuthSource: PN1P287MB2818.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:39:34.4865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0191

Hey Arnd,

Please pull dt changes for RISC-V/Sophgo.

I hope this PR is not too late, because I just got the message today 
from Stephen that this clock driver part has been merged into clk-next.

Just FYI: 
https://lore.kernel.org/linux-riscv/b8dbdde2412d974baa24611b16cda5f7.sboyd@kernel.org/


Thanks,
Chen.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sophgo-dt-for-v6.11

for you to fetch changes up to b1240a39511b9206293b82ac372c5114d6e15821:

   riscv: dts: add clock generator for Sophgo SG2042 SoC (2024-07-09 
08:19:52 +0800)

----------------------------------------------------------------
RISC-V Devicetrees for v6.11

Sopgho:
Add clock support for SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Chen Wang (1):
       riscv: dts: add clock generator for Sophgo SG2042 SoC

  arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 12 ++++++++++++
  arch/riscv/boot/dts/sophgo/sg2042.dtsi              | 55 
++++++++++++++++++++++++++++++++++++++++++++++++++++++-
  2 files changed, 66 insertions(+), 1 deletion(-)




